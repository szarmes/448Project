require 'spec_helper'
include Warden::Test::Helpers

describe SearchController do

  let(:user) { create_logged_in_employer }
  let(:test)     { FactoryGirl.create(:posting) }
  

  describe "search should get correct results" do

    before do
      render :partial => "shared/results.html.erb", :locals => {:results => test, :user=> user}
    end
    it "should display result" do
      visit search_path(:q => 'test')
      expect(page).to have_content('testTitle')
     
    end
    it "should not display result" do
       visit search_path(:q => 'test')
      expect(page).to_not have_content('tttttt')
    end
   
  end
  
end
