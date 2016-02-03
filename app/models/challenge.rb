class Challenge < ActiveRecord::Base
  belongs_to :course
  has_many :completions

  validates :course_id, presence: true
  validates :title, presence: true
  validates :instructions, presence: true
  validates :lesson, presence: true
  validates :problem, presence: true
  validates :answer, presence: true
  validates :hints, presence: true

  has_many :completions, foreign_key: :completed_id
  has_many :completers, through: :completions, source: :completer
end
