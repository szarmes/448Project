require 'spec_helper'

describe Skill do

	let(:skill) {FactoryGirl.build(:skill)}

	subject{skill}
	it { should be_valid }
 	it { should respond_to(:label) }
  it { should respond_to(:desc) }
  	

  	describe "label is invalid" do
        it "should be invalid" do
            skill.label=""
            expect(skill).to_not be_valid
        end
    end
   




end