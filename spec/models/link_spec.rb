require 'spec_helper'

describe Link do
  let(:link) { FactoryGirl.create(:link) }

  subject { link }

  it { should be_valid }
  it { should respond_to(:url) }
  it { should respond_to(:project_id) }
  it { should respond_to(:link_id) }

  describe "when name is not present" do
    before { link.url = ""}
    it { should_not be_valid }
  end

  describe "when link ID is not present" do
    before { link.link_id = ""}
    it { should_not be_valid }
  end

  describe "when project ID is not present" do
    before { link.project_id = ""}
    it { should_not be_valid }
  end
end