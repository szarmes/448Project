require 'spec_helper'

describe Experience do

	let(:exp) {FactoryGirl.build(:experience)}

	subject{exp}
	it { should be_valid }
 	it { should respond_to(:title) }
  	it { should respond_to(:desc) }
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

  	 describe "title is invalid" do
        it "should be invalid" do
            exp.title=""
            expect(exp).to_not be_valid
        end
    end
     describe "desc is invalid" do
        it "should be invalid" do
            exp.desc=""
            expect(exp).to_not be_valid
        end
    end
     describe "sdate is invalid" do
        it "should be invalid" do
            exp.sdate=""
            expect(exp).to_not be_valid
        end
    end
     describe "fdate is invalid" do
        it "should be invalid" do
            exp.fdate=""
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