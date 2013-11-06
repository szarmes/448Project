require 'spec_helper'

describe SkillsController do

  let(:employee) { create(:user, :employee) }
  let(:employer) { create(:user, :employer) }
  let(:test)     { create(:skill) }
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
      it "should be able to submit a skill through create" do
        post 'create', :skill => { "label" => "title", "desc" => "content", "skill_id" => 0 }
        response.should redirect_to '/skills'
        flash[:success].should_not be_nil
      end
      it "should not have success flash if unable to save" do
        post 'create', :skill => { "label" => "", "desc" => "content" }
        response.should redirect_to '/skills'
        flash[:error].should_not be_nil
      end
    end
    describe "employer signed in" do
      before do
        sign_in employer
      end
      it "should not be able to submit a skill through create" do
        post 'create', :skill => { "label" => "title", "desc" => "content", "skill_id" => 0 }
        response.should redirect_to '/'
        flash[:error].should == "No access"
      end
      it "should have error flash if unable to save" do
        post 'create', :skill => { "label" => "", "desc" => "content" }
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
      it "delete a skill through destroy" do
        post 'destroy', :id => 1
        response.should redirect_to '/skills'
        flash[:success].should_not be_nil
      end
    end
    describe "employer signed in" do
      before do
        sign_in employer
        test.save
      end
      it "should not be able to delete a skill" do
        post 'destroy', :id => 1
        response.should redirect_to '/skills'
        flash[:error].should == "No access"
      end
    end
  end
end
