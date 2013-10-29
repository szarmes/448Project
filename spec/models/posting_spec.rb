require 'spec_helper'

describe Posting do
  let(:posting) { FactoryGirl.build(:posting) }

  subject { posting }

  it { should be_valid }
  it { should respond_to( :title ) }
  it { should respond_to( :desc ) }
  it { should respond_to( :salary ) }
  it { should respond_to(:user_id) }
  it { should respond_to(:posting_id) }
  it { should have_many (:keywords) }
  it { should belong_to (:user) }

  describe "when posting_id is set" do
    it "should equal post.id" do
      @post = FactoryGirl.create(:posting)
      @post.posting_id.should eq @post.id
      
    end
  end

	 describe "when title is empty" do
	 	before { posting.title  = "" }
	 	it { should_not be_valid }
	 end
	 describe "when desc is empty" do 
	 	before { posting.desc = ""}
	 	it { should_not be_valid }
	 end
   describe "keywords associations" do
    before do
      @keyword = FactoryGirl.build(:keyword, posting_id: posting.posting_id)
      @keyword.save
      @keyword1 = FactoryGirl.build(:keyword, posting_id: 5)
      @keyword1.save
    end
    it "should be destroyed when posting is destroyed" do
      Keyword.all.should include(@keyword1) 
      Keyword.all.should include(@keyword)
      posting.keywords.push(@keyword)
      posting.destroy
      Keyword.all.should_not include(@keyword)
      Keyword.all.should include(@keyword1)
    end
  end
end