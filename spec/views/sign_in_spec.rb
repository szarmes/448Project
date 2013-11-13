require 'spec_helper'
include Warden::Test::Helpers

describe "sign_in"do


	let(:user) { create_logged_in_user }
	
	describe "registration form test" do
		
		it "should have content Email" do 
			visit  new_user_session_path
			expect(page).to have_content('Email')
		end
			it "should have content Password" do 
			visit  new_user_session_path
			expect(page).to have_content('Password')
		end
	
	end
end