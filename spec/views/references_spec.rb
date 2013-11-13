require 'spec_helper'
include Warden::Test::Helpers

describe "experiences view"do


	let(:user) { create_logged_in_user }
	let(:reference)  { FactoryGirl.create(:reference) }
	
	describe "projects form test" do
		
		it "should have content First name" do 
			visit references_path(user)
			expect(page).to have_content('First name')
		end
			it "should have content last name" do 
			visit references_path(user)
			expect(page).to have_content('Last name')
		end
		it "should have content Relationshp " do 
			visit references_path(user)
			expect(page).to have_content('Relationship')
		end
		it "should have content email " do 
			visit references_path(user)
			expect(page).to have_content('Email')
		end
		it "should have content Phone Number " do 
			visit references_path(user)
			expect(page).to have_content('Phone number')
		end
		it "should have content Years Known" do 
			visit references_path(user)
			expect(page).to have_content('Years Known')
		end
	end


	describe "projects partial test" do

		before do
			render :partial => "shared/references.html.erb", :locals => {:references => reference}
		end
		it "should have content First name" do 
			visit references_path(user)
			expect(page).to have_content('test')
		end
			it "should have content last name" do 
			visit references_path(user)
			expect(page).to have_content('test2')
		end
		it "should have content Relationshp " do 
			visit references_path(user)
			expect(page).to have_content('Relationship')
		end
		it "should have content email " do 
			visit references_path(user)
			expect(page).to have_content('test1@email.com')
		end
		it "should have content Phone Number " do 
			visit references_path(user)
			expect(page).to have_content(number_to_phone(1234567890))
		end
		it "should have content Years Known" do 
			visit references_path(user)
			expect(page).to have_content('3')
		end
	end
end