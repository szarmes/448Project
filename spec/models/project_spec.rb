require 'spec_helper'

describe Project do
  let(:project) { FactoryGirl.create(:project) }

  subject { project }

  it { should be_valid }
  it { should respond_to(:name) }
  it { should respond_to(:desc) }
  it { should respond_to(:project_id) }
  it { should respond_to(:user_id) }


  describe "when name is not present" do
    before { project.name = ""}
    it { should_not be_valid }
  end

  describe "when desc is not present" do
    before { project.desc = ""}
    it { should be_valid }
  end

  describe "when project ID is not present" do
    before { project.project_id = ""}
    it { should_not be_valid }
  end

  describe "when user id is not present" do
    before { project.user_id = nil }
    it { should_not be_valid }
  end
  
end