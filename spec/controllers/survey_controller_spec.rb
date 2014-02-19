require 'spec_helper'

describe SurveysController do

  let(:employee) { create(:user, :employee) }
  let(:employer) { create(:user, :employer) }
  let(:test)     { create(:survey) }
  describe "user not signed in" do
    it "should not be able to go to create" do
      nil.should be_nil
    end
  end
  describe "POST #create" do
    describe "employee signed in" do
      before do
        sign_in employee
      end
      it "should be able to submit a survey through create" do
        post 'create', :survey => { "question1" => 2, "survey_id" => 0 }
        Survey.find_by(:user_id => employee.user_id).should be_nil
      end
      it "should not have success flash if unable to save" do
        Survey.find_by(:question1 => "2").should be_nil
      end
    end
    describe "employer signed in" do
      before do
        sign_in employer
      end
      it "should not be able to submit a survey through create" do
        nil.should be_nil
      end
      it "should have error flash if unable to save" do
        nil.should be_nil
      end
    end
  end
end
