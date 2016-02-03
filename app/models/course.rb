class Course < ActiveRecord::Base
  has_many :challenges
  belongs_to :user

  validates :name, presence: true


end
