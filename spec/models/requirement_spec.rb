require 'spec_helper'

describe Requirement do

	let(:req) {FactoryGirl.build(:requirement)}

  	subject{req}
  	it { should be_valid }
   	it { should respond_to(:mandatory) }
  	it { should respond_to(:degree) }
  	it { should respond_to(:educationLvl) }
  	it { should respond_to(:desc) }
  	it { should respond_to(:exp) }
  	it { should respond_to(:exp_area) }
  	

  	describe "mandatory is invalid" do
        it "should be invalid" do
            req.mandatory=nil
            expect(req).to_not be_valid
        end
    end
   describe "desc is invalid" do
        it "should be invalid" do
            req.desc=nil
            expect(req).to_not be_valid
        end
    end
   



end