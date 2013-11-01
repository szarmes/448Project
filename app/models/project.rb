class Project < ActiveRecord::Base


    belongs_to :experience

    has_many :links, dependent: :destroy
    

    validates :name, :project_id, :experience_id, presence: true
  
end