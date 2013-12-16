require 'spec_helper'

describe Requirement do

	let(:req) {FactoryGirl.build(:requirement)}

  	subject{req}
  	it { should be_valid }
   	it { should respond_to(:mandatory) }
  	it { should respond_to(:degree) }
  	it { should respond_to(:educationLvl) }
  	it { should respond_to(:description) }
  	it { should respond_to(:exp) }
  	it { should respond_to(:exp_area) }
    it { should respond_to(:posting_id) }
    it { should respond_to(:requirement_id) }
    it { should belong_to (:posting) } 
  	
    describe "when requirement_id is set" do
    it "should equal requirement.id" do
      @requirement = FactoryGirl.create(:requirement)
      @requirement.requirement_id.should eq @requirement.id
      
    end
  end

  	describe "mandatory is invalid" do
        it "should be invalid" do
            req.mandatory=nil
            expect(req).to_not be_valid
        end
    end
   describe "desc is invalid" do
        it "should be invalid" do
            req.description=nil
            expect(req).to_not be_valid
        end
    end
   



end