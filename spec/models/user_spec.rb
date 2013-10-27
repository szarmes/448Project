require 'spec_helper'

describe User do
	
	let(:employee) { FactoryGirl.create(:user, :employee) }
  let(:employer) { FactoryGirl.create(:user, :employer) }
  let(:admin) { FactoryGirl.create(:user, :admin) }

  subject { employee }
  it { should be_valid }
  before do
    employee.admin = false
    employee.employer = false
  end 
  it { should respond_to(:username) }
  it { should respond_to(:fname) }
  it { should respond_to(:lname) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:phone_number) }
  it { should respond_to(:city) }
  it { should respond_to(:province) }
  it { should respond_to(:country) }
  it { should respond_to(:gender) }
  it { should respond_to(:birthday) }
  it { should respond_to(:goals) }
  it { should respond_to(:field) }
  it { should respond_to(:company_name) }
  it { should respond_to(:company_address) }
  it { should respond_to(:employer) }
  it { should respond_to(:admin) }

  describe "checking if admin " do
  	  it { should_not be_admin }
  end
  describe "checking if empoyer " do
      it { should_not be_employer }
  end

  describe "when username is not present" do
    before { employee.username = " " }
    it { should_not be_valid }
  end
  describe "when email is not present" do
    before { employee.email = " " }
    it { should_not be_valid }
  end
   describe "when password is not present" do
    before { employee.password = " " }
    it { should_not be_valid }
  end
   describe "when password_confirmation is not present" do
    before { employee.password_confirmation = " " }
    it { should_not be_valid }
  end
  describe "when admin is not present" do
    before { employee.admin = nil }
    it { should_not be_valid }
  end
  


end