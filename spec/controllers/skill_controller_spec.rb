require 'spec_helper'

describe SkillsController do

  let(:employee) { create(:user, :employee) }
  let(:employer) { create(:user, :employer) }
  
  describe "GET #index" do
    it "renders index skill page" do
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
    describe "employee signed in" do
      before do
        sign_in employee
      end
      it "should be able to submit a skill through create" do
        post 'create', :skill => { "label" => "title", "desc" => "content", "skill_id" => 0 }
        response.should redirect_to '/'
        flash[:success].should_not be_nil
      end
      it "should not have success flash if unable to save" do
        post 'create', :skill => { "label" => "", "desc" => "content" }
        response.should redirect_to '/'
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
end
