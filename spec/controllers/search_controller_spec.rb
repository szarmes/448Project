require 'spec_helper'

describe SearchController do

  let(:employee) { create(:user, :employee) }
  let(:employer) { create(:user, :employer) }
  let(:test)     { create(:posting) }
  
  describe "search should set current user properly" do
    before do
        sign_in employer
      end
    it "sets user" do
      get 'search'
      assigns(:user).should_not be_nil
    end
  end

  describe "search should get correct results" do
    before do
        sign_in employer
      end
     it "should pass in correct queiry" do
      get 'search', :q => 'test'
      assigns(:q).should eq 'test'
      assigns(:q).should_not eq 'nottest'
    end
    it "should find posting" do
      get 'search', :q => 'test'
      assigns(:results).should_not be_nil
    end
    it "should not find posting" do
      get 'search', :q => 'bad'
      assigns(:results).should be_empty
    end
  end
  
end
