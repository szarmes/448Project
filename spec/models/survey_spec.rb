require 'spec_helper'

describe Survey do

	let(:survey) {FactoryGirl.build(:survey)}

	subject{survey}
	it { should be_valid }
	it { should respond_to(:question1) }
	it { should respond_to(:question2) }
	it { should respond_to(:question3) }
	it { should respond_to(:question4) }
	it { should respond_to(:question5) }
  it { should respond_to(:user_id) }
  it { should respond_to(:survey_id) }
  it { should belong_to (:user) }

  describe "when survey_id is set" do
    it "should equal survey.id" do
      @survey = FactoryGirl.create(:survey)
      @survey.survey_id.should eq @survey.id   
    end
  end
end