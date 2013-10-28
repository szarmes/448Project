class Posting < ActiveRecord::Base

	validates :title, :desc, presence: true
end