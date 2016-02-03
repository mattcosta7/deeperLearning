class Challenge < ActiveRecord::Base
  belongs_to :course

  validates :course_id, presence: true
  validates :title, presence: true
  validates :instructions, presence: true
  validates :lesson, presence: true
  validates :problem, presence: true
  validates :answer, presence: true
  validates :hints, presence: true
end
