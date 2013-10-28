FactoryGirl.define do
  factory :reference do
    fname	"test"
    lname	"test"
    email "test1@email.com"
    phone_number "test"
    relationship "Boss of Bosses"
    yrsknown "3"
    user_id     1
    
  end
end