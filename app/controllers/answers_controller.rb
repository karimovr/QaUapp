class AnswersController < ApplicationController
  def create
     @question = Question.find(params[:question_id])
     @answer = @question.answers.new(answer_params)
     flash[:notice] = 'Your answer was successfully created'
     if @answer.save
     redirect_to @question
     end
  def new
    @answer = Answer.new
  end

  private

  def answer_params
      params.require(:answer).permit(:body)
    end
  end
end