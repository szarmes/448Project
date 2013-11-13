require 'spec_helper'

describe ReferencesController do

  let(:employee) { create(:user, :employee) }
  let(:employer) { create(:user, :employer) }
  let(:test)     { create(:reference) }
  
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
      it "should be able to submit a reference through create" do
        post 'create', :reference => { "fname" => "test", "lname" => "test", "relationship" => "test"}
        response.should redirect_to '/'
        Reference.find_by(:fname => "test").should_not be_nil
        flash[:success].should_not be_nil
      end
      it "should not have success flash if unable to save" do
        post 'create', :reference => { "fname" => "", "lname" => "test", "relationship" => "test"}
        response.should redirect_to '/'
        Reference.find_by(:fname => "test").should be_nil
        flash[:error].should_not be_nil
      end
    end
    describe "employer signed in" do
      before do
        sign_in employer
      end
      it "should not be able to submit a reference through create" do
        post 'create', :reference => { "fname" => "test", "lname" => "test", "relationship" => "test" }
        response.should redirect_to '/'
        Reference.find_by(:fname => "test").should be_nil
        flash[:error].should == "No access"
      end
      it "should have error flash if unable to save" do
        post 'create', :reference => { "fname" => "", "lname" => "test", "relationship" => "test" }
        response.should redirect_to '/'
        Reference.find_by(:fname => "test").should be_nil
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
      it "delete a reference through destroy" do
        post 'destroy', :id => 1
        response.should redirect_to '/references'
        flash[:success].should_not be_nil
        Reference.find_by(:fname => "test").should be_nil
      end
    end
    describe "employer signed in" do
      before do
        sign_in employer
        test.save
      end
      it "should not be able to delete a reference" do
        post 'destroy', :id => 1
        response.should redirect_to '/references'
        flash[:error].should == "No access"
        Reference.find_by(:fname => "test").should_not be_nil
      end
    end
  end
  describe "#update" do
    describe "employee signed in" do
      before do
        sign_in employee
        test.save
      end
      it "should be able to update a reference through edit" do
        post 'update', :reference => { "fname" => "newtest", "lname" => "newtest", "relationship" => "newtest" }, :id => 1
        response.should redirect_to '/references'
        Reference.find_by(:fname => "test").should be_nil
        Reference.find_by(:fname => "newtest").should_not be_nil
        flash[:success].should_not be_nil
      end
      it "should not have success flash if unable to update" do
        post 'update', :reference => { "fname" => "", "lname" => "newtest", "relationship" => "newtest" }, :id => 1
        response.should redirect_to '/references'
        Reference.find_by(:fname => "test").should_not be_nil
        Reference.find_by(:fname => "newtest").should be_nil
        flash[:error].should_not be_nil
      end
    end
    describe "employer signed in" do
      before do
        sign_in employer
        test.save
      end
      it "should not be able to update a reference through edit" do
        post 'update', :reference => { "fname" => "newtest", "lname" => "newtest", "relationship" => "newtest"}, :id => 1
        response.should redirect_to '/references'
        Reference.find_by(:fname => "test").should_not be_nil
        Reference.find_by(:fname => "newtest").should be_nil
        flash[:error].should == "No access"
      end
      it "should have error flash if unable to save" do
        post 'update', :reference => { "fname" => "newtest", "lname" => "newtest", "relationship" => "" }, :id => 1
        response.should redirect_to '/references'
        Reference.find_by(:fname => "test").should_not be_nil
        Reference.find_by(:fname => "newtest").should be_nil
        flash[:error].should_not be_nil
      end
    end
  end
end
