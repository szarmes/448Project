class Experience < ActiveRecord::Base


        belongs_to :user
        has_many :keywords

        validates :user_id, :experience_id, presence: true
        validates :title, :desc, :sdate, :fdate, 
                          :company_name, presence:  true
  
 
end