require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "StaticPages" do

  let(:employee) { create(:user, :employee) }
  let(:employer) { create(:user, :employer) }
  
  subject { page }

  shared_examples_for "all static pages" do
      it {should have_title(title)}
      it {should have_content(content)}
  end

  describe "Home page" do

    before { visit root_path }
    let(:title)    { 'Chewink' }
    let(:content) { 'Welcome' }

    it_should_behave_like "all static pages"
    it { should_not have_title('|') }
  end


  describe "should have links that go to expected pages" do
    describe "employer signed in" do
      before do 
        login_as(employer, :scope => :user )
      end
      it "should have links to postings when employer signed in" do
       visit root_path
       click_link 'Postings'
       expect(page).to have_content('Posting')
      end
    end

    describe "employee signed in" do
      before do 
        login_as(employee, :scope => :user )
      end
      it "should have links to skills, experiences, references when employee signed in" do
        visit root_path
        click_link "Skills"
        expect(page).to have_content('Skill')
        click_link "Experiences"
        expect(page).to have_content('Experience')
        click_link "References"
        expect(page).to have_content('Reference')
      end
    end
  end
end
