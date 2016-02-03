class User < ActiveRecord::Base
  has_secure_password
  has_many :courses

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  def to_param
    name
  end
  
end
