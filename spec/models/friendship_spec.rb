require 'spec_helper'

describe Friendship do
	  let(:employee) { FactoryGirl.build(:user, :employee) }
    let(:employer) { FactoryGirl.build(:user, :employer) }
    let(:admin)    { FactoryGirl.build(:user, :admin) }
    let(:friendship)     { FactoryGirl.create(:friendship) }
  subject{friendship}
  it { should be_valid }
  it { should respond_to(:friendship_id) }
  it { should respond_to(:sender_id) }
  it { should respond_to(:receiver_id) }
  it { should respond_to(:sent_at) }
  it { should respond_to(:accepted) }
  it { should respond_to(:accepted_at) }
  it { should belong_to (:user) }

  describe "when sender id is not present" do
    before { friendship.sender_id = nil }
    it { should_not be_valid }
  end
  describe "when receiver id is not present" do
    before { friendship.receiver_id = nil }
    it { should_not be_valid }
  end
  
end
