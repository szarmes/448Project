class Posting < ActiveRecord::Base

        belongs_to :user
        has_many :requirements
        has_many :keywords

        validates :user_id, :posting_id, presence: true
        validates :title, :desc, presence: true
end