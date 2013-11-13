require 'spec_helper'
include Warden::Test::Helpers

describe "Add a Skill"do


	let(:user) { create_logged_in_user }
	
	describe "elements on page" do
		
		it "should have content Title" do 
			visit  skills_path(user)
			expect(page).to have_content('Title')
		end
			it "should have content Description" do 
			visit skills_path(user)
			expect(page).to have_content('Description')
		end
	
	end

	let(:skill){create(:skill)}

	describe "Edditing Skills" do

		it "should have content Title" do 
			visit  edit_skill_path(skill)
			expect(page).to have_content('Title')
		end
			it "should have content Description" do 
			visit edit_skill_path(skill)
			expect(page).to have_content('Description')
		end
	end

end