class Course < ActiveRecord::Base
  has_many :questions
  has_many :scores

  # def self.passing_score
  #   5
  # end

  # def badge_image_file
  #   "#{badge}.gif"
  # end
end
