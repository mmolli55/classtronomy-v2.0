class Course < ActiveRecord::Base
  has_many :questions
  has_many :scores
end
