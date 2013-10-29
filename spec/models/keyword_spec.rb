require 'spec_helper'

describe Keyword do 
  let(:keyword) { FactoryGirl.build(:keyword)}

  subject{ keyword }
  it{ should be_valid }
  it{ should respond_to(:keyword) }
  it { should respond_to(:posting_id) }
  it { should respond_to(:skill_id) }
  it { should respond_to(:experience_id) }
  it { should belong_to (:experience) }
  it { should belong_to (:skill) }
  it { should belong_to (:posting) }
  describe "when keyword is not present" do
  	before { keyword.keyword = ""}
  	it { should_not be_valid}
  end
	
end