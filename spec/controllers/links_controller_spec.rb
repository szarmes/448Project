require 'spec_helper'

describe LinksController do

  let(:employee) { create(:user, :employee) }
  let(:employer) { create(:user, :employer) }
  let(:test) { create(:link) }
  let(:test1) { create(:project) }
  let(:test2) { create(:experience) }
  
  describe "GET #index" do
    it "renders index projects page" do
      get :index
      response.should render_template :index
    end
  end
  describe "user not signed in" do
    it "should not be able to go to create" do
      get 'create'
      response.should redirect_to '/'
    end
  end
  describe "POST #create" do
    describe "employee signed in" do
      before do
        sign_in employee
      end
      it "should be able to submit a link through create" do
        post 'create', :link => { "url" => "www.com",
          "link_id" => 1, "project_id" => 1 }
        Link.find_by(:url => "www.com").should_not be_nil
        response.should redirect_to '/experiences'
        flash[:success].should_not be_nil
      end
      it "should not have success flash if unable to save" do
        post 'create', :link => { "url" => "",
          "link_id" => 1, "project_id" => 1 }
        Link.find_by(:url => "www.com").should be_nil
        response.should redirect_to '/links'
        flash[:error].should_not be_nil
      end
    end
    describe "employer signed in" do
      before do
        sign_in employer
      end
      it "should not be able to submit a link through create" do
        post 'create', :link => { "url" => "www.com",
          "link_id" => 1, "project_id" => 1 }
        Link.find_by(:url => "www.com").should be_nil
        response.should redirect_to '/'
        flash[:error].should == "No access"
      end
      it "should have error flash if unable to save" do
        post 'create', :link => { "url" => "",
          "link_id" => 1, "project_id" => 1 }
        Link.find_by(:url => "www.com").should be_nil
        response.should redirect_to '/'
        flash[:error].should_not be_nil
      end
    end
 describe "#destroy" do
    describe "employee signed in" do
      before do
        sign_in employee
        test.save
        test1.save
        test2.save
      end
      it "delete a link through destroy" do
        post 'destroy', :id => 1
        Link.find_by(:url => "test url").should be_nil
        response.should redirect_to '/projects'
        flash[:success].should_not be_nil
      end
    end
    describe "employer signed in" do
      before do
        sign_in employer
        test.save
        test1.save
        test2.save
      end
      it "should not be able to delete a link" do
        post 'destroy', :id => 1
        Link.find_by(:url => "test url").should_not be_nil
        response.should redirect_to '/projects'
        flash[:error].should == "No access"
      end
    end
  end
  describe "#update" do
    describe "employee signed in" do
      before do
        sign_in employee
        test.save
        test1.save
        test2.save
      end
      it "should be able to update a link through edit" do
       post 'update', :link => { "url" => "www.com",
          "link_id" => 1, "project_id" => 1 }, :id => 1
        Link.find_by(:url => "www.com").should_not be_nil
        Link.find_by(:url => "test url").should be_nil
        response.should redirect_to '/projects'
        flash[:success].should_not be_nil
      end
      it "should not have success flash if unable to update" do
        post 'update', :link => { "url" => "",
          "link_id" => 1, "project_id" => 1 }, :id => 1
        Link.find_by(:url => "test url").should_not be_nil
        response.should redirect_to '/projects'
        flash[:error].should_not be_nil
      end
    end
    describe "employer signed in" do
      before do
        sign_in employer
        test.save
        test1.save
        test2.save
      end
      it "should not be able to update a link through edit" do
         post 'update', :link => { "url" => "www.com",
          "link_id" => 1, "project_id" => 1 }, :id => 1
        Link.find_by(:url => "test url").should_not be_nil
        response.should redirect_to '/projects'
        flash[:error].should == "No access"
      end
      it "should have error flash if unable to save" do
        post 'update', :link => { "url" => "",
          "link_id" => 1, "project_id" => 1 }, :id => 1
        Link.find_by(:url => "test url").should_not be_nil
        response.should redirect_to '/projects'
        flash[:error].should_not be_nil
      end
    end
  end
end
end
