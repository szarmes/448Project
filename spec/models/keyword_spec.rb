require 'spec_helper'

describe Keyword do 
  let(:keyword) { FactoryGirl.build(:keyword)}

  subject{ keyword }
  it{ should be_valid }
  it{ should respond_to(:keyword) }
  describe "when keyword is not present" do
  	before { keyword.keyword = ""}
  	it { should_not be_valid}
  end
	
end