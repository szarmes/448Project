class Skill < ActiveRecord::Base

        belongs_to :user
        has_many :keywords, dependent: :destroy
        
        validates :user_id, :skill_id, presence: true

        validates :label, presence: true
 
end