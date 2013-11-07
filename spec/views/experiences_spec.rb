require 'spec_helper'
include Warden::Test::Helpers

describe "experiences view"do


	let(:user) { create_logged_in_user }
	let(:exp) {FactoryGirl.create(:experience)}
	
	describe "experiences form test" do
		
		it "should have content Title" do 
			visit experiences_path(user)
			expect(page).to have_content('Title')
		end
			it "should have content Description/Responsibilities *" do 
			visit experiences_path(user)
			expect(page).to have_content('Description/responsibilities *')
		end
		it "should have content Company Name* " do 
			visit experiences_path(user)
			expect(page).to have_content('Company name*')
		end
			it "should have content Starting Date *" do 
			visit experiences_path(user)
			expect(page).to have_content('Starting date *')
		end
		it "should have content Finish Date" do 
			visit experiences_path(user)
			expect(page).to have_content('Finish date')
		end

			it "should have content Company Address" do 
			visit experiences_path(user)
			expect(page).to have_content('Company address')
		end
		it "should have content Company City" do 
			visit experiences_path(user)
			expect(page).to have_content('Company city')
		end

		it "should have exp Company Country" do 
			visit experiences_path(user)
			expect(page).to have_content('Company country')
		end
			it "should have content Company province" do 
			visit experiences_path(user)
			expect(page).to have_content('Company province')
		end
		it "should have content Supervisor" do 
			visit experiences_path(user)
			expect(page).to have_content('Supervisor')
		end
			it "should have content Supervisor Phone Number" do 
			visit experiences_path(user)
			expect(page).to have_content('Supervisor phone number')
		end
		
	end

=begin
	describe "experiences partial test" do

		before do

			render_views

		end
		it "should have exp Title" do 
			visit experiences_path(user)
			expect(page).to have_content('test')
		end
			it "should have exp Description/Responsibilities *" do 
			visit experiences_path(user)
			expect(page).to have_content('test1')
		end
		it "should have exp Company Name* " do 
			visit experiences_path(user)
			expect(page).to have_content('test2')
		end
			it "should have exp Starting Date *" do 
			visit experiences_path(user)
			expect(page).to have_content('2013-02-27 14:14:22 +0200')
		end
		it "should have exp Finish Date" do 
			visit experiences_path(user)
			expect(page).to have_content('2012-02-27 14:14:22 +0200')
		end
			it "should have exp Company Address" do 
			visit experiences_path(user)
			expect(page).to have_content('test3')
		end
		it "should have exp Company City" do 
			visit experiences_path(user)
			expect(page).to have_content('test4')
		end
			it "should have exp Company province" do 
			visit experiences_path(user)
			expect(page).to have_content('test5')
		end
		it "should have exp Country" do 
			visit experiences_path(user)
			expect(page).to have_content('test6')
		end
		it "should have exp Supervisor" do 
			visit experiences_path(user)
			expect(page).to have_content('test7')
		end
			it "should have exp Supervisor Phone Number" do 
			visit experiences_path(user)
			expect(page).to have_content('test8')
		end
		
	end
=end

end