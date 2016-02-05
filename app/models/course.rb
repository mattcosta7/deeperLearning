class Course < ActiveRecord::Base
  mount_uploader :icon, IconUploader
  has_many :challenges, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
  validates_uniqueness_of :name, case_sensitive: false

end

#courses have an icon uploader
#many challenges, that are destroyed if a course is
#belong to a user, who takes courses, and uniqueness of name