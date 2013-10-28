class Requirement < ActiveRecord::Base

        belongs_to :posting

        validates :posting_id, :requirement_id, presence: true
        validates :desc, presence:  true
        validates_inclusion_of :mandatory, :in => [true, false]
  
 
end