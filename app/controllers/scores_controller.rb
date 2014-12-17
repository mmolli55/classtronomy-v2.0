class ScoresController < ApplicationController
  def update
    course_score = current_user.scores.find(params[:id])
    course_score.update(score: params[:score])
    respond_to do |format|
      # format.html { redirect_to current_user }
      # format.json { render nothing: true, status: 200 }
      render nothing: true, status: 200
    end
  end

end

