class Course < ActiveRecord::Base
  has_many :challenges
  belongs_to :user

  validates :names, presence: true

  def to_param
    name
  end
end
