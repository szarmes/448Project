FactoryGirl.define do
  factory :friendship do
	friendship_id 1
    sender_id 1
    receiver_id 2
    sent_at "2012-02-27 14:14:22 +0200"
    accepted false    
  end
end