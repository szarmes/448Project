require 'spec_helper'

describe Posting do
  let(:posting) { FactoryGirl.build(:posting) }

  subject { posting }

  it { should be_valid }
  it { should respond_to( :title ) }
  it { should respond_to( :description ) }
  it { should respond_to( :salary ) }
  it { should respond_to(:user_id) }
  it { should respond_to(:posting_id) }
  it { should belong_to (:user) }

  describe "when posting_id is set" do
    it "should equal post.id" do
      @post = FactoryGirl.create(:posting)
      @post.posting_id.should eq @post.id
      
    end
  end

	 describe "when title is empty" do
	 	before { posting.title  = "" }
	 	it { should_not be_valid }
	 end
	 describe "when desc is empty" do 
	 	before { posting.description = ""}
	 	it { should_not be_valid }
	 end
end