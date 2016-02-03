class User < ActiveRecord::Base
  has_many :courses
end
