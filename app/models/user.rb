class User < ActiveRecord::Base

  after_create :do_setID

  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :skills, dependent: :destroy
  has_many :references, dependent: :destroy
  has_many :postings, dependent: :destroy
  has_many :experiences, dependent: :destroy


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :user_id, presence: true
  validates  :username, uniqueness: true

  validates :username, :fname, :lname, :password, 
            :password_confirmation, presence:  true
  
  validates_inclusion_of :employee, :employer, :admin, :in => [true, false]
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: true }


  private
    def do_setID
      
      newID = self.id
      self.update_attributes(:user_id => newID)


    end
 
end