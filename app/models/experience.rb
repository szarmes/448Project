class Experience < ActiveRecord::Base


    belongs_to :user
    has_many :keywords, dependent: :destroy

    validates :user_id, :experience_id, presence: true
    validates :title, :desc, :sdate, :fdate, 
                          :company_name, presence:  true
    
    after_create :do_setID

  private
    def do_setID
      
      newID = self.id
      self.update_attributes(:experience_id => newID)


    end
  
 
end