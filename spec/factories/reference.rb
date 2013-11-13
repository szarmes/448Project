FactoryGirl.define do
  factory :reference do
    fname	"test"
    lname	"test2"
    email "test1@email.com"
    phone_number "1234567890"
    relationship "Boss of Bosses"
    yrsknown "3"
    user_id     1
    
  end
end