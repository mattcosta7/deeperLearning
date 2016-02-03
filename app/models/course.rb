class Course < ActiveRecord::Base
  has_many :challenges
  belongs_to :user

  validates :names, presence: true
end
