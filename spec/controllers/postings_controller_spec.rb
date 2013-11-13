require 'spec_helper'

describe PostingsController do

  let(:employee) { create(:user, :employee) }
  let(:employer) { create(:user, :employer) }
  let(:test)     { create(:posting) }
  
  describe "user not signed in" do
    it "should not be able to go to create" do
      get 'create'
      response.should redirect_to '/'
    end
  end
  describe "POST #create" do
    describe "employer signed in" do
      before do
        sign_in employer
      end
      it "should be able to submit a posting through create" do
        post 'create', :posting => { "title" => "title", "desc" => "content", 
          "posting_id" => 0}
        response.should redirect_to '/postings'
        Posting.find_by(:title => "title").should_not be_nil
        flash[:success].should_not be_nil
      end
      it "should not have success flash if unable to save" do
        post 'create', :posting => { "title" => "", "desc" => "content", 
          "posting_id" => 0}
        Posting.find_by(:title => "newtitle").should be_nil
        response.should redirect_to '/postings'
        flash[:error].should_not be_nil
      end
    end
    describe "employee signed in" do
      before do
        sign_in employee
      end
      it "should not be able to submit a posting through create" do
        post 'create', :posting => { "title" => "title", "desc" => "content", 
          "posting_id" => 0 }
        Posting.find_by(:title => "title").should be_nil
        response.should redirect_to '/'
        flash[:error].should == "No access"
      end
      it "should have error flash if unable to save" do
        post 'create', :posting => { "title" => "", "desc" => "content", 
          "posting_id" => 0 }
        Posting.find_by(:title => "title").should be_nil
        response.should redirect_to '/'
        flash[:error].should_not be_nil
      end
    end
  end
  describe "#destroy" do
    describe "employer signed in" do
      before do
        sign_in employer
        test.save
      end
      it "should be able to delete a posting through destroy" do
        post 'destroy', :id => 1
        Posting.find_by(:id => 1).should be_nil
        response.should redirect_to '/postings'
        flash[:success].should_not be_nil
      end
    end
    describe "employee signed in" do
      before do
        sign_in employee
        test.save
      end
      it "should not be able to delete a posting" do
        post 'destroy', :id => 1
        Posting.find_by(:id => 1).should_not be_nil
        response.should redirect_to '/postings'
        flash[:error].should == "No access"
      end
    end
  end
  describe "#update" do
    describe "employer signed in" do
      before do
        sign_in employer
        test.save
      end
      it "should be able to update a skill through edit" do
        post 'update', :posting => { "title" => "newtitle", "desc" => "newcontent", "posting_id" => 0 }, :id => 1
        response.should redirect_to '/postings'
        Posting.find_by(:title => "newtitle").should_not be_nil
        Posting.find_by(:title => "testTitle").should be_nil
        flash[:success].should_not be_nil
      end
      it "should not have success flash if unable to update" do
        post 'update', :posting => { "title" => "", "desc" => "content", "posting_id" => 0 }, :id => 1
        response.should redirect_to '/postings'
        flash[:error].should_not be_nil
      end
    end
    describe "employee signed in" do
      before do
        sign_in employee
        test.save
      end
      it "should not be able to update a skill through edit" do
        post 'update', :skill => { "title" => "newtitle", "desc" => "newcontent", "posting_id" => 0 }, :id => 1
        response.should redirect_to '/postings'
        Posting.find_by(:title => "newtitle").should be_nil
        flash[:error].should == "No access"
      end
      it "should have error flash if unable to save" do
        post 'update', :skill => { "label" => "", "desc" => "content" }, :id => 1
        response.should redirect_to '/postings'
        flash[:error].should_not be_nil
      end
    end
  end
end
