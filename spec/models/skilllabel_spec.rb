require 'spec_helper'

describe Skilllabel do 
  let(:skilllabel) { FactoryGirl.build(:skilllabel)}

  subject{ skilllabel }
  it{ should be_valid }
  it { should respond_to(:skilllabel_id) }
  it { should respond_to(:label) }
  describe "when label is not present" do
  	before { skilllabel.label = ""}
  	it { should_not be_valid}
  end
	
end