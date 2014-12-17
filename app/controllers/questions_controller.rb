class QuestionsController < ApplicationController
  def index
    @course = Course.find(params[:course_id])
    # TODO: create score for current_user, if it doesn't already exist
    # score = Score.find_or_create_by_user_and_course(@course, current_user)
    # gon.push(score_id: score.id) # will be available in js
    @questions = @course.questions
  end

  def new
    @course = Course.find(params[:course_id])
    @question = @course.questions.new
  end

  def create
    @course = Course.find(params[:course_id])
    @question = @course.questions.new(question_params)
    if @question.save
      redirect_to course_questions_path
    else
      render 'new'
    end
  end

  def edit
    @course = Course.find(params[:course_id])
    @question = @course.questions.find(params[:id])
  end

  def update
    @course = Course.find(params[:course_id])
    @question = @course.questions.find(params[:id])
    if @question.update_attributes(question_params)
      flash[:notice] = "Successfully updated question."
      redirect_to course_questions_path
    else
      render 'edit'
    end
  end

  def destroy
    @course = Course.find(params[:course_id])
    @question = @course.questions.find(params[:id])
    @question.destroy
    flash[:notice] = "Successfully destroyed question."
    redirect_to course_questions_path
  end

  def show
  end

  private

  def question_params
    params.require(:question).permit(
      :content,
      :possible_answer1,
      :possible_answer2,
      :possible_answer3,
      :possible_answer4,
      :correct_answer,
      :course_id,
      )
  end
end
