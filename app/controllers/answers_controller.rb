class AnswersController < ApplicationController
  before_action :set_question

  def index
    @answers = @question.answers  
  end

  def show
    @answer = Answer.find params[:id]
  end

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = Answer.new(answer_params)

    if @answer.save
      redirect_to @answer
    else
      render :new
    end
  end

  private

  def set_question
    @question = Question.find params[:question_id]
  end
  
  def answer_params
    params.require(:answer).permit(:description, :question_id)
  end
end
