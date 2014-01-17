require 'spec_helper'
include Warden::Test::Helpers

describe "profile view"do


	let(:user) { create_logged_in_user }
	
	describe "profile test" do
		
		it "should have content Title" do 
			visit profile_path(user)
			expect(page).to have_content('Experience')
		end
	end
end