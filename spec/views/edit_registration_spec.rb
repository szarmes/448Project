require 'spec_helper'

describe "edit_registration"do


	let(:employee) { FactoryGirl.create(:user, :employee) }
  	let(:employer) { FactoryGirl.create(:user, :employer) }
	
	describe "registration form test" do
		before do

			sign_in(employer)
		end
		it "should have content fname" do 
			visit edit_users_path(employer)
			expect(page).to have_content('First Name')
		end
			it "should have content lname" do 
			visit edit_users_path
			expect(page).to have_content('Last Name')
		end
	end



end