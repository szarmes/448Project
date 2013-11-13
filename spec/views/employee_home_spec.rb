require 'spec_helper'
include Warden::Test::Helpers

describe "home_page"do


	let(:user) { create_logged_in_user }
	
	describe "registration form test" do
		
		it "should have content Add a skill" do 
			visit root_path(user)
			expect(page).to have_content('Add a skill')
		end
			it "should have content Add an experience" do 
			visit root_path(user)
			expect(page).to have_content('Add an experience')
		end
		it "should have content Add a reference" do 
			visit root_path(user)
			expect(page).to have_content('Add a reference')
		end
			it "should have content Edit registration" do 
			visit root_path(user)
			expect(page).to have_content('Edit registration')
		end
		it "should have content logout" do 
			visit root_path(user)
			expect(page).to have_content('Logout')
		end
	end

end