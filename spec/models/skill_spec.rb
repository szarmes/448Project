require 'spec_helper'

describe Skill do

	let(:skill) {FactoryGirl.build(:skill)}

	subject{skill}
	it { should be_valid }
 	it { should respond_to(:label) }
  it { should respond_to(:desc) }
  it { should respond_to(:user_id) }
  it { should respond_to(:skill_id) }
  it { should have_many (:keywords) }
  it { should belong_to (:user) }
  	

  describe "label is invalid" do
    it "should be invalid" do
       skill.label=""
        expect(skill).to_not be_valid
    end
  end
  describe "keywords associations" do
    before do
      @keyword = FactoryGirl.build(:keyword, skill_id: skill.skill_id)
      @keyword.save
      @keyword1 = FactoryGirl.build(:keyword, skill_id: 5)
      @keyword1.save
    end
    it "should be destroyed when skill is destroyed" do
      Keyword.all.should include(@keyword1) 
      Keyword.all.should include(@keyword)
      skill.keywords.push(@keyword)
      skill.destroy
      Keyword.all.should_not include(@keyword)
      Keyword.all.should include(@keyword1)
    end
  end
end