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
    admin       false
    employer    false
    employee    false

    trait :employee do
    	goals "test"
    	admin       false
        employer    false
        employee    true
    end


    trait :employer do
    	company_name "test"
    	company_address "test"
    	field	"test"
        admin       false
        employer    true
        employee    false
    end

    trait :admin do
    	admin       true
        employer    false
        employee    false
    end
    
  end
end