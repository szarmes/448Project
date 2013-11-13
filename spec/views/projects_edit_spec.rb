require 'spec_helper'
include Warden::Test::Helpers

describe "projects_edit"do

    let(:proj) {create(:project)}
	let(:user) { create_logged_in_user }
	
	describe "elements" do
		
		it "should have content name" do 
			visit edit_project_path(proj)
			expect(page).to have_content('Title of project *')
		end

		it "should have content desc" do 
			visit edit_project_path(proj)
			expect(page).to have_content('Description *')
		end
	end

	describe "Edit projects" do
		it "should have content name" do 
			visit projects_path(user)
			expect(page).to have_content('Title of project *')
		end

		it "should have content desc" do 
			visit projects_path(user)
			expect(page).to have_content('Description *')
		end

	end
end