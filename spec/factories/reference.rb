FactoryGirl.define do
  factory :reference do
    fname	"test"
    lname	"test"
    email "test1@email.com"
    phone_number "test"
    relationship "Boss of Bosses"
    yrsknown "3"
    
  end
end