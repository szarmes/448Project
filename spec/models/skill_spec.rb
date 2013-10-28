require 'spec_helper'

describe Skill do

	let(:skill) {FactoryGirl.build(:skill)}

	subject{skill}
	it { should be_valid }
 	it { should respond_to(:label) }
  it { should respond_to(:desc) }
  it { should respond_to(:user_id) }
  it { should respond_to(:skill_id) }
  	

  	describe "label is invalid" do
        it "should be invalid" do
            skill.label=""
            expect(skill).to_not be_valid
        end
    end
   




end