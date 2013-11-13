class Project < ActiveRecord::Base


    belongs_to :experience

    has_many :links, dependent: :destroy
    

    validates :name, :project_id, :experience_id, presence: true

    private
    def do_setID
      
      newID = self.id
      self.update_attributes(:project_id => newID)


    end
  
end