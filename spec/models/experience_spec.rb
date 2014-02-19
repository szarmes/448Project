require 'spec_helper'

describe Experience do

  it { should belong_to (:user)}
	let(:exp) {FactoryGirl.build(:experience)}

	subject{exp}
	  it { should be_valid }
   	it { should respond_to(:title) }
  	it { should respond_to(:description) }
  	it { should respond_to(:sdate) }
  	it { should respond_to(:fdate) }
  	it { should respond_to(:company_name) }
  	it { should respond_to(:company_address) }
  	it { should respond_to(:company_city) }
  	it { should respond_to(:company_province) }
  	it { should respond_to(:company_country) }
  	it { should respond_to(:supervisor) }
  	it { should respond_to(:supervisor_phone) }
    it { should respond_to(:user_id) }
    it { should respond_to(:experience_id) }
    it { should belong_to (:user) }

    describe "when experience_id is set" do
    it "should equal ex.id" do
      @ex = FactoryGirl.create(:experience)
      @ex.experience_id.should eq @ex.id
      
    end
  end

  	 describe "title is invalid" do
        it "should be invalid" do
            exp.title=""
            expect(exp).to_not be_valid
        end
    end
     describe "desc is invalid" do
        it "should be invalid" do
            exp.description=""
            expect(exp).to_not be_valid
        end
    end
     describe "sdate is invalid" do
        it "should be invalid" do
            exp.sdate=""
            expect(exp).to_not be_valid
        end
    end
     describe "company_name is invalid" do
        it "should be invalid" do
            exp.company_name=""
            expect(exp).to_not be_valid
        end
    end
end