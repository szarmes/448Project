class Reference < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable,
   #      :recoverable, :rememberable, :trackable, :validatable

  #validates :username, :fname, :lname, :password, 
  #			:password_confirmation, presence:  true
  #validates_inclusion_of :employee, :employer, :admin, :in => [true, false]


  validates :fname, :lname, :relationship, presence: true
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX }
                    
 
end
