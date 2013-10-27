FactoryGirl.define do
  factory :user do
    username "testname"
    fname	"test"
    lname	"test"
    email "test1@email.com"
    password "foobarfoobar"
    password_confirmation "foobarfoobar"
    phone_number "test"
    city		"test" 
    province    "test"
    country		"test"
   	gender		"test"
    birthday	"test"
    admin       true
    employer    true
    employee    true

    trait :employee do
    	goals "test"
    end


    trait :employer do
    	company_name "test"
    	company_address "test"
    	field	"test"
    end

    trait :admin do
    end
    
  end
end