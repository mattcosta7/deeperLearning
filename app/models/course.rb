class Course < ActiveRecord::Base
  mount_uploader :icon, IconUploader
  has_many :challenges
  belongs_to :user

  validates :name, presence: true
  validates_uniqueness_of :name, case_sensitive: false

end
