class Requirement < ActiveRecord::Base


	validates :desc, presence:  true
	validates_inclusion_of :mandatory, :in => [true, false]
  
 
end
