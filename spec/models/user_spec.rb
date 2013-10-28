require 'spec_helper'

describe User do
	
	let(:employee) { FactoryGirl.build(:user, :employee) }
  let(:employer) { FactoryGirl.build(:user, :employer) }
  let(:admin)    { FactoryGirl.build(:user, :admin) }
  let(:user)     { FactoryGirl.create(:user) }

  subject{user}
  it { should be_valid }
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
  it { should respond_to(:user_id) }

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        user.email = invalid_address
        expect(user).not_to be_valid
      end
    end
  end
  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        user.email = valid_address
        expect(user).to be_valid
      end
    end
  end
  describe "when email address is already taken" do
    it "prevents duplicates" do
      user1 = create(:user, email: 'unique@email.com')
      user2 = build(:user, email: 'unique@email.com')

      user1.should be_valid
      user2.should_not be_valid
    end
  end
  describe "when username is not present" do
    before { user.username = " " }
    it { should_not be_valid }
  end
  describe "when fname is not present" do
    before { user.fname = " " }
    it { should_not be_valid }
  end
  describe "when lname is not present" do
    before { user.lname = " " }
    it { should_not be_valid }
  end
  describe "when email is not present" do
    before { user.email = " " }
    it { should_not be_valid }
  end
   describe "when password is not present" do
    before { user.password = " " }
    it { should_not be_valid }
  end
   describe "when password_confirmation is not present" do
    before { user.password_confirmation = " " }
    it { should_not be_valid }
  end
  describe "when admin is not present" do
    before { user.admin = nil }
    it { should_not be_valid }
  end
  describe "when employer is not present" do
    before { user.employer = nil }
    it { should_not be_valid }
  end
  describe "when employee is not present" do
    before { user.employer = nil }
    it { should_not be_valid }
  end

   describe "employee checking if admin " do
    it "checks admin" do
      employee.admin.should eq false
    end
  end
  describe "employee checking if employer " do
    it "checks employer" do
      employee.employer.should eq false
    end
  end
  describe "employee checking if employee " do
    it "checks employee" do
      employee.employee.should eq true
    end
  end
  describe "employee company name should be empty" do
    it "checks company name" do
      employee.company_name.should eq ""
    end
  end
  describe "employee company address should be empty" do
    it "checks company address" do
      employee.company_address.should eq ""
    end
  end
  describe "employee field should be empty" do
    it "checks field" do
      employee.field.should eq ""
    end
  end
  describe "employee goals should not be empty" do
    it "checks field" do
      employee.goals.should_not eq ""
    end
  end
  describe "employer checking if admin " do
    it "checks admin" do
      employer.admin.should eq false
    end
  end
  describe "employer checking if employer " do
    it "checks employer" do
      employer.employer.should eq true
    end
  end
  describe "employer checking if employee " do
    it "checks employee" do
      employer.employee.should eq false
    end
  end
  describe "employer goals should be empty" do
    it "checks company name" do
      employer.goals.should eq ""
    end
  end
  describe "employer company name should not be empty" do
    it "checks company name" do
      employer.company_name.should_not eq ""
    end
  end
  describe "employer company address should not be empty" do
    it "checks company address" do
      employer.company_address.should_not eq ""
    end
  end
  describe "employer field should not be empty" do
    it "checks field" do
      employer.field.should_not eq ""
    end
  end
  describe "admin checking if admin " do
    it "checks admin" do
      admin.admin.should eq true
    end
  end
  describe "admin checking if employer " do
    it "checks employer" do
      admin.employer.should eq false
    end
  end
  describe "admin checking if employee " do
    it "checks employee" do
      admin.employee.should eq false
    end
  end
  describe "admin goals should be empty" do
    it "checks company name" do
      admin.goals.should eq ""
    end
  end
  describe "admin company name should be empty" do
    it "checks company name" do
      admin.company_name.should eq ""
    end
  end
  describe "admin company address should be empty" do
    it "checks company address" do
      admin.company_address.should eq ""
    end
  end
  describe "admin field should be empty" do
    it "checks field" do
      admin.field.should eq ""
    end
  end
end