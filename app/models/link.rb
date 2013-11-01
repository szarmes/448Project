class Link < ActiveRecord::Base


    belongs_to :projects
    
    validates :link_id, :project_id, :url, presence: true

    
    
    after_create :do_setID

  private
    def do_setID
      
      newID = self.id
      self.update_attributes(:link_id => newID)


    end
  
 
end