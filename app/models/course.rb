class Course < ActiveRecord::Base
  has_many :challenges
  belongs_to :user

  validates :names, presence: true
  validates :title, presence: true
  validates :instructions, presence: true
  validates :lesson, presence: true
  validates :problem, presence: true
  validates :answer, presence: true
  validates :hints, presence: true
end
