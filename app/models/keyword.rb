class Keyword < ActiveRecord::Base

        validates :keyword, presence: true
        validates :experience_id, :posting_id, :skill_id, presence: true

        belongs_to :skill
        belongs_to :experience
        belongs_to :posting
end