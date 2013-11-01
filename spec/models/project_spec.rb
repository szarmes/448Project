require 'spec_helper'

describe Project do
  let(:project) { FactoryGirl.create(:project) }

  subject { project }

  it { should be_valid }
  it { should respond_to(:name) }
  it { should respond_to(:desc) }
  it { should respond_to(:project_id) }
  it { should respond_to(:experience_id) }


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
    before { project.experience_id = nil }
    it { should_not be_valid }
  end

  describe "links associations" do
    before do
      @link = FactoryGirl.build(:link, project_id: project.project_id)
      @link.save
      @link1 = FactoryGirl.build(:link, project_id: 5)
      @link1.save
      project.save
    end
    it "should be destroyed when employer is destroyed" do
      Link.all.should include(@link1) 
      Link.all.should include(@link)
      project.links.push(@link)
      project.destroy
      Link.all.should_not include(@link)
      Link.all.should include(@link1)
    end
  end
  
end