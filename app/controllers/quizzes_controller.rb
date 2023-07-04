class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(params.require(:quiz).permit(:name, :description))
    if @quiz.save
      flash[:notice] = "Quiz added successfully!"
      redirect_to quizzes_path
    else
      flash[:alert] = @quiz.errors.full_messages.to_sentence
      redirect_to quizzes_new_path
    end
  end 
end 