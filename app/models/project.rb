class Project < ActiveRecord::Base


    belongs_to :user
    

    validates :name, :project_id, :user_id, presence: true
  
end