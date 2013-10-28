class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :skills
  has_many :references
  has_many :postings
  has_many :experiences


  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :user_id, presence: true

  validates :username, :fname, :lname, :password, 
                          :password_confirmation, presence:  true
  validates_inclusion_of :employee, :employer, :admin, :in => [true, false]
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: true }
 
end