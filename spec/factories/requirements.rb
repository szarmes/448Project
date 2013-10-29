 FactoryGirl.define do

    factory :requirement do
        mandatory  true
        degree  "test"
        educationLvl "test"
        desc "test"               
        exp 2
        exp_area    "test"
        posting_id     1
        requirement_id     1
    
        trait :mandatory do
            mandatory false
        end

    end

  

end