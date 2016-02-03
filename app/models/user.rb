class User < ActiveRecord::Base
  has_secure_password
  has_many :courses
  has_many :completions
  
  
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX },uniqueness:{ case_sensitive: false }
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates_uniqueness_of :email, case_sensitive: false
  
  has_many :completions, foreign_key: :completer_id
  has_many :completed, through: :completions, source: :completed


  def downcase_email
    self.email = email.downcase
  end 


  def to_param
    name
  end
  
end
