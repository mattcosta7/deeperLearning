class User < ActiveRecord::Base
  has_secure_password
  has_many :courses

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates_uniqueness_of :email, case_sensitive: false
  
  def to_param
    name
  end
  
end
