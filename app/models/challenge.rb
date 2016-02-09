class Challenge < ActiveRecord::Base
  belongs_to :course

  validates :course_id, presence: true
  validates :title, presence: true
  validates :instructions, presence: true
  validates :lesson, presence: true
  validates :problem, presence: true
  validates :answer, presence: true
  validates :hints, presence: true


  has_many :completions, foreign_key: :completed_id
  has_many :completers, through: :completions, source: :completer, dependent: :destroy

  def next
    self.course.challenges.where("id > ?", self.id).first
  end
end


# challenges belong to a course
# must have all aspects
# also are marked completions through a completion tabl
# by completers