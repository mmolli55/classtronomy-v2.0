class QuestionsController < ApplicationController
  def index
    @course = Course.find(params[:course_id])
    @questions = @course.questions
  end

  def new
    @course = Course.find(params[:course_id])
    @question = @course.questions.build
  end

  def create
    @course = Course.find(params[:course_id])
    @question = @course.questions.create(question_params)
    if @question.save
      redirect_to course_questions_path
    else
      render 'new'
    end
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
      :course_id
      )
  end
end
