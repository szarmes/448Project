require 'spec_helper'

describe "StaticPages" do

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
        post_via_redirect new_user_session_path, :email => 'employer@test.ca', :password => 'testtest'
      end
      it "should have links to postings when employer signed in" do
       visit root_path
       click_link 'Postings'
       expect(page).to have_title('Your Postings')
      end
    end

    describe "employee signed in" do
      before do 
        post_via_redirect new_user_session_path, :email => 'employee@test.ca', :password => 'testtest'
      end
      it "should have links to skills, experiences, references when employee signed in" do
        visit root_path
        click_link "Skills"
        expect(page).to have_title('Your Skills')
        click_link "Experiences"
        expect(page).to have_title('Your Experiences')
        click_link "References"
        expect(page).to have_title('Your References')
      end
    end
  end
end
