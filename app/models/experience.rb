class Experience < ActiveRecord::Base


	validates :title, :desc, :sdate, :fdate, 
  			:company_name, presence:  true
  
 
end
