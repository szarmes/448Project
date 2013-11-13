require 'spec_helper'
include Warden::Test::Helpers

describe "experiences view"do


	let(:user) { create_logged_in_user }
	let(:posting)  { FactoryGirl.create(:posting) }
	
	describe "projects form test" do
		
		it "should have content Title" do 
			visit postings_path(user)
			expect(page).to have_content('Title')
		end
			it "should have content Description/Responsibilities *" do 
			visit postings_path(user)
			expect(page).to have_content('Description/responsibilities *')
		end
		it "should have content Salary " do 
			visit postings_path(user)
			expect(page).to have_content('Salary')
		end
	end


	describe "projects partial test" do

		before do
			render :partial => "shared/postings.html.erb", :locals => {:postings => posting}
		end
		it "should have posting Title" do 
			visit postings_path(user)
			expect(page).to have_content('testTitle')
		end
			it "should have posting Description" do 
			visit postings_path(user)
			expect(page).to have_content('testDesc')
		end
		it "should have posting Salary" do 
			visit postings_path(user)
			expect(page).to have_content(123)
		end
	end
end