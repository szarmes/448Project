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
        post 'create', :skill => { "label" => "title", "skill_id" => 0 }
        Skill.find_by(:label => "title").should_not be_nil
        response.should redirect_to '/skills'
        flash[:success].should_not be_nil
      end
      it "should not have success flash if unable to save" do
        post 'create', :skill => { "label" => ""}
        Skill.find_by(:label => "title").should be_nil
        response.should redirect_to '/skills'
        flash[:error].should_not be_nil
      end
    end
    describe "employer signed in" do
      before do
        sign_in employer
      end
      it "should be able to submit a skill through create with posting id" do
        post 'create', :skill => { "label" => "title", "skill_id" => 0, "posting_id" => 0, "mandatory" => false }
        Skill.find_by(:label => "title").should_not be_nil
        Skill.find_by(:label => "title").posting_id.should_not be_nil
        response.should redirect_to '/skills'
        flash[:success].should_not be_nil
      end
      it "should not have success flash if unable to save" do
        post 'create', :skill => { "label" => ""}
        Skill.find_by(:label => "title").should be_nil
        response.should redirect_to '/skills'
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
        Skill.find_by(:id => 1).should be_nil
        response.should redirect_to '/skills'
        flash[:success].should_not be_nil
      end
    end
    describe "employer signed in" do
      before do
        sign_in employer
        test.save
      end
      it "should be able to delete a skill" do
        post 'destroy', :id => 1
        Skill.find_by(:id => 1).should be_nil
        response.should redirect_to '/skills'
        flash[:success].should_not be_nil
      end
    end
  end
end
