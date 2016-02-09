class User < ActiveRecord::Base
  has_secure_password
  has_many :courses
  before_save :downcase_email
  mount_uploader :avatar, AvatarUploader
  geocoded_by :location
  after_validation :geocode
  
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX },uniqueness:{ case_sensitive: false }
  validates :password, presence: true,length: { minimum: 6 }, on: :create, on: :delete
  validates :password_confirmation, presence: true,length: { minimum: 6 }, on: :create, on: :delete
  validates_uniqueness_of :email, case_sensitive: false
  

  has_many :completions, foreign_key: :completer_id
  has_many :completed, through: :completions, source: :completed, dependent: :destroy

  def downcase_email
    self.email = email.downcase
  end 



  def to_param
    name
  end
  
  def isSomewhere?
    if 
      self.location == "" || self.location == " " || self.location == nil || self.location == false
    else
      true
    end
  end
end

#users have secure passwords (confirmed on creation)
#users have an avatar uploader
#users have names, email validated through regex, passwords and confirmed passwords min 6 char
#unique email addresses
#users can complete challenges through a dependent destroyed entry on the completion table
#user emails are downcased and params of the user are names instead of id numbers