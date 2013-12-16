require 'spec_helper'

describe RequirementsController do

  let(:employee) { create(:user, :employee) }
  let(:employer) { create(:user, :employer) }
  let(:test) { create(:requirement) }
  let(:test1) { create(:posting) }
  
  describe "GET #index" do
    it "renders index requirements page" do
      get :index
      response.should render_template :index
    end
  end
  describe "user not signed in" do
    it "should not be able to go to create" do
      get 'create'
      response.should redirect_to '/'
    end
  end
  describe "POST #create" do
    describe "employer signed in" do
      before do
        sign_in employer
      end
      it "should be able to submit a projcet through create" do
        post 'create', :requirement => { "mandatory" => true, "degree" => "test", "educationLvl" => "test",
        "description" => "test", "exp" => 2, "exp_area" => "test", "posting_id" => 1, "requirement_id" => 1}
        Requirement.find_by(:degree => "test").should_not be_nil
        response.should redirect_to '/postings'
        flash[:success].should_not be_nil
      end
      it "should not have success flash if unable to save" do
        post 'create', :requirement => { "mandatory" => nil, "degree" => "test", "educationLvl" => "test",
        "description" => "test", "exp" => 2, "exp_area" => "test", "posting_id" => 1, "requirement_id" => 1}
        Requirement.find_by(:degree => "test").should be_nil
        response.should redirect_to '/requirements'
        flash[:error].should_not be_nil
      end
    end
    describe "employee signed in" do
      before do
        sign_in employee
      end
      it "should not be able to submit a requirement through create" do
        post 'create', :requirement => { "mandatory" => true, "degree" => "test", "educationLvl" => "test",
        "description" => "test", "exp" => 2, "exp_area" => "test", "posting_id" => 1, "requirement_id" => 1}
        Requirement.find_by(:degree => "test").should be_nil
        response.should redirect_to '/'
        flash[:error].should == "No access"
      end
      it "should have error flash if unable to save" do
        post 'create', :requirement => { "mandatory" => true, "degree" => "test", "educationLvl" => "test",
        "description" => "test", "exp" => 2, "exp_area" => "test", "posting_id" => 1, "requirement_id" => 1}
        Requirement.find_by(:degree => "test").should be_nil 
        response.should redirect_to '/'
        flash[:error].should_not be_nil
      end
    end
 describe "#destroy" do
    describe "employer signed in" do
      before do
        sign_in employer
        test.save
        test1.save
      end
      it "delete a requirement through destroy" do
        post 'destroy', :id => 1
        Requirement.find_by(:id => 1).should be_nil
        response.should redirect_to '/requirements'
        flash[:success].should_not be_nil
      end
    end
    describe "employee signed in" do
      before do
        sign_in employee
        test.save
        test1.save
      end
      it "should not be able to delete a requirement" do
        post 'destroy', :id => 1
        Requirement.find_by(:id => 1).should_not be_nil
        response.should redirect_to '/requirements'
        flash[:error].should == "No access"
      end
    end
  end
  describe "#update" do
    describe "employer signed in" do
      before do
        sign_in employer
        test.save
        test1.save
      end
      it "should be able to update a requirement through edit" do
       post 'create', :requirement => { "mandatory" => true, "degree" => "test2", "educationLvl" => "test",
        "description" => "test", "exp" => 2, "exp_area" => "test", "posting_id" => 1, "requirement_id" => 1}
        Requirement.find_by(:degree => "test2").should_not be_nil
        response.should redirect_to '/postings'
        flash[:success].should_not be_nil
      end
      it "should not have success flash if unable to update" do
        post 'create', :requirement => { "mandatory" => nil, "degree" => "test2", "educationLvl" => "test",
        "description" => "test", "exp" => 2, "exp_area" => "test", "posting_id" => 1, "requirement_id" => 1}
        Requirement.find_by(:degree => "test2").should be_nil
        Requirement.find_by(:degree => "test").should_not be_nil
        response.should redirect_to '/requirements'
        flash[:error].should_not be_nil
      end
    end
    describe "employee signed in" do
      before do
        sign_in employee
        test.save
        test1.save
      end
      it "should not be able to update a requirement through edit" do
        post 'create', :requirement => { "mandatory" => true, "degree" => "test2", "educationLvl" => "test",
        "description" => "test", "exp" => 2, "exp_area" => "test", "posting_id" => 1, "requirement_id" => 1}
        Requirement.find_by(:degree => "test2").should be_nil
        Requirement.find_by(:degree => "test").should_not be_nil
        response.should redirect_to '/'
        flash[:error].should == "No access"
      end
      it "should have error flash if unable to save" do
        post 'create', :requirement => { "mandatory" => nil, "degree" => "test2", "educationLvl" => "test",
        "description" => "test", "exp" => 2, "exp_area" => "test", "posting_id" => 1, "requirement_id" => 1}
        Requirement.find_by(:degree => "test2").should be_nil
        Requirement.find_by(:degree => "test").should_not be_nil
        response.should redirect_to '/'
        flash[:error].should_not be_nil
      end
    end
  end
end
end
