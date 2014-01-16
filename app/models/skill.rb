class Skill < ActiveRecord::Base

        belongs_to :user
        has_many :keywords, dependent: :destroy
        
        validates :user_id, :skill_id, presence: true
        validates_presence_of :mandatory, :if => :posting_id?

        validates :label, presence: true
 	after_create :do_setID

  private
    def do_setID
      
      newID = self.id
      self.update_attributes(:skill_id => newID)


    end
end