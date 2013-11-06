require 'spec_helper'

describe ExperiencesController do

  let(:employee) { create(:user, :employee) }
  let(:employer) { create(:user, :employer) }
  let(:test)     { create(:experience) }
  describe "user not signed in" do
    it "should not be able to go to create" do
      get 'create'
      response.should redirect_to '/'
    end
  end
  describe "POST #create" do
    describe "employee signed in" do
      before do
        sign_in employee
      end
      it "should be able to submit a experience through create" do
        post 'create', :experience => { "title" => "title", "desc" => "content", 
          "experience_id" => 0, "sdate" => DateTime.now, "company_name" => "company test" }
        response.should redirect_to '/experiences'
        flash[:success].should_not be_nil
      end
      it "should not have success flash if unable to save" do
        post 'create', :experience => { "title" => "", "desc" => "content", 
          "experience_id" => 0, "sdate" => DateTime.now, "company_name" => "company test" }
        response.should redirect_to '/experiences'
        flash[:error].should_not be_nil
      end
    end
    describe "employer signed in" do
      before do
        sign_in employer
      end
      it "should not be able to submit a experience through create" do
        post 'create', :experience => { "title" => "title", "desc" => "content", 
          "experience_id" => 0, "sdate" => DateTime.now, "company_name" => "company test" }
        response.should redirect_to '/'
        flash[:error].should == "No access"
      end
      it "should have error flash if unable to save" do
        post 'create', :experience => { "title" => "", "desc" => "content", 
          "experience_id" => 0, "sdate" => DateTime.now, "company_name" => "company test" }
        response.should redirect_to '/'
        flash[:error].should_not be_nil
      end
    end
  end
  describe "#destroy" do
    describe "employee signed in" do
      before do
        sign_in employee
        test.save
      end
      it "delete a experience through destroy" do
        post 'destroy', :id => 1
        response.should redirect_to '/experiences'
        flash[:success].should_not be_nil
      end
    end
    describe "employer signed in" do
      before do
        sign_in employer
        test.save
      end
      it "should not be able to delete a experience" do
        post 'destroy', :id => 1
        response.should redirect_to '/experiences'
        flash[:error].should == "No access"
      end
    end
  end
  describe "#update" do
    describe "employee signed in" do
      before do
        sign_in employee
        test.save
      end
      it "should be able to update a experience through edit" do
        post 'update', :experience => { "title" => "title", "desc" => "content", 
          "experience_id" => 0, "sdate" => DateTime.now, "company_name" => "company test" }, :id => 1
        response.should redirect_to '/experiences'
        flash[:success].should_not be_nil
      end
      it "should not have success flash if unable to update" do
        post 'update', :experience => { "title" => "", "desc" => "content", 
          "experience_id" => 0, "sdate" => DateTime.now, "company_name" => "company test" }, :id => 1
        response.should redirect_to '/experiences'
        flash[:error].should_not be_nil
      end
    end
    describe "employer signed in" do
      before do
        sign_in employer
        test.save
      end
      it "should not be able to update a experience through edit" do
        post 'update', :experience => { "title" => "title", "desc" => "content", 
          "experience_id" => 0, "sdate" => DateTime.now, "company_name" => "company test" }, :id => 1
        response.should redirect_to '/experiences'
        flash[:error].should == "No access"
      end
      it "should have error flash if unable to save" do
        post 'update', :experience => { "title" => "", "desc" => "content", 
          "experience_id" => 0, "sdate" => DateTime.now, "company_name" => "company test" }, :id => 1
        response.should redirect_to '/experiences'
        flash[:error].should_not be_nil
      end
    end
  end
end