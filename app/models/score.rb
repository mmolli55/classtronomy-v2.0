class Score < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  # TODO:
  # vaidates :score, range 1-5

  scope :passed, -> { where('score = ?', Course.passing_score) }

  # def badge_image_file
  #   course.badge_image_file
  # end

end
