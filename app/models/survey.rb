class Survey < ActiveRecord::Base

        belongs_to :user
        validates :user_id, :survey_id, presence: true
        
 	after_create :do_setID

  private
    def do_setID
      
      newID = self.id
      self.update_attributes(:survey_id => newID)


    end
end