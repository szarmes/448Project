require 'spec_helper'
include Warden::Test::Helpers

describe "edit_references"do


	let(:user) { create_logged_in_user }
	
	describe "referencesform test" do
		
		it "should have content fname" do 
			visit references_path(user)
			expect(page).to have_content('First name *')
		end
			it "should have content lname" do 
			visit references_path(user)
			expect(page).to have_content('Last name *')
		end
		it "should have content Phone " do 
			visit references_path(user)
			expect(page).to have_content('Phone number')
		end
			it "should have content email" do 
			visit references_path(user)
			expect(page).to have_content('Email')
		end
		it "should have content relationship" do 
			visit references_path(user)
			expect(page).to have_content('Relationship')
		end
	end
end