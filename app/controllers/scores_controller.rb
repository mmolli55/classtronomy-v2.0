class ScoresController < ApplicationController
  def update
    course_score = current_user.scores.find(params[:id])
    course_score.update(score: params[:score])
    render nothing: true, status: 200
  end

end

