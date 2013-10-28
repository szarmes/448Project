class Keyword < ActiveRecord::Base

	validates :keyword, presence: true
end