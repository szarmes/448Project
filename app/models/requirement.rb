class Requirement < ActiveRecord::Base

        belongs_to :posting

        validates :posting_id, :requirement_id, presence: true
        validates :description, presence:  true
        validates_inclusion_of :mandatory, :in => [true, false]
  
 		after_create :do_setID

  private
    def do_setID
      
      newID = self.id
      self.update_attributes(:requirement_id => newID)


    end
end