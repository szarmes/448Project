class Posting < ActiveRecord::Base

        belongs_to :user
        has_many :requirements, dependent: :destroy
        has_many :keywords, dependent: :destroy

        validates :user_id, :posting_id, presence: true
        validates :title, :desc, presence: true
end