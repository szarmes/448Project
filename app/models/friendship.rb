class Friendship < ActiveRecord::Base


    belongs_to :user, :foreign_key => "sender_id"
    belongs_to :user, :foreign_key => "receiver_id"

    validates :sender_id, :receiver_id, presence: true

    after_create :do_setID

  private
    def do_setID
      
      newID = self.id
      self.update_attributes(:friendship_id => newID)


    end
  
 
end