class Skill < ActiveRecord::Base

        belongs_to :user
        
        validates :user_id, :skill_id, presence: true
        validates_inclusion_of :mandatory, :if => :posting_id?, :in => [true, false]

        validates :label, presence: true
 	after_create :do_setID

  private
    def do_setID
      
      newID = self.id
      self.update_attributes(:skill_id => newID)
    end
end