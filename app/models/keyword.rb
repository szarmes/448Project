class Keyword < ActiveRecord::Base

        validates :keyword, presence: true
        validates :experience_id, :posting_id, :skill_id, presence: true
end