require 'spec_helper'

describe FriendshipsController do
	  let(:employee1) { FactoryGirl.build(:user, :employee) }
    let(:employee2) { FactoryGirl.build(:user, :employee) }
    let(:employer) { FactoryGirl.build(:user, :employer) }
    let(:admin)    { FactoryGirl.build(:user, :admin) }
    let(:friendship)     { FactoryGirl.create(:friendship) }

  
end
