require 'spec_helper'


describe Reference do 

let(:ref) { FactoryGirl.create(:reference)}


  subject{ref}
  it { should be_valid }
  it { should respond_to(:fname) }
  it { should respond_to(:lname) }
  it { should respond_to(:phone_number) }
  it { should respond_to(:relationship) }
  it { should respond_to(:yrsknown) }
  it { should respond_to(:email) }
  it { should respond_to(:user_id) }
  it { should belong_to (:user) }


#describe "when email format is invalid" do
#    it "should be invalid" do
#      addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
#      addresses.each do |invalid_address|
#        ref.email = invalid_address
#        expect(ref).not_to be_valid
#      end
#    end
#  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        ref.email = valid_address
        expect(ref).to be_valid
      end
    end
  end

  describe "when First name is not present" do
    before { ref.fname = " " }
    it { should_not be_valid }
  end

  describe "when last name is not present" do
    before { ref.lname = " " }
    it { should_not be_valid }
  end

  describe "when relartionship is not present" do
    before { ref.relationship = " " }
    it { should_not be_valid }
  end


end

