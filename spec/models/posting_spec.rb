require 'spec_helper'

describe Posting do
  let(:posting) { FactoryGirl.build(:posting) }

  subject { posting }

  it { should be_valid }
  it { should respond_to( :title ) }
  it { should respond_to( :desc ) }
  it { should respond_to( :salary ) }
  it { should respond_to(:user_id) }
  it { should respond_to(:posting_id) }
  it { should have_many (:keywords) }
  it { should belong_to (:user) }

	 describe "when title is empty" do
	 	before { posting.title  = "" }
	 	it { should_not be_valid }
	 end
	 describe "when desc is empty" do 
	 	before { posting.desc = ""}
	 	it { should_not be_valid }
	 end
end