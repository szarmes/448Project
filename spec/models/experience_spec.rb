require 'spec_helper'

describe Experience do

  it { should belong_to (:user)}
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
    it { should belong_to (:user) }
    it { should have_many (:keywords) }

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
     describe "company_name is invalid" do
        it "should be invalid" do
            exp.company_name=""
            expect(exp).to_not be_valid
        end
    end
    describe "keywords associations" do
    before do
      @keyword = FactoryGirl.build(:keyword, experience_id: exp.experience_id)
      @keyword.save
      @keyword1 = FactoryGirl.build(:keyword, experience_id: 5)
      @keyword1.save
    end
    it "should be destroyed when experience is destroyed" do
      Keyword.all.should include(@keyword1) 
      Keyword.all.should include(@keyword)
      exp.keywords.push(@keyword)
      exp.destroy
      Keyword.all.should_not include(@keyword)
      Keyword.all.should include(@keyword1)
    end
  end




end