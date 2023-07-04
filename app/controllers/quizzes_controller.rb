class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
  end

  def new
    @quiz = Quiz.new
  end

  def show
    if Quiz.exists?(id: params[:id])
      @quiz = Quiz.find(params[:id])
    else
      flash[:alert] = "Quiz does not exist!"
      redirect_to quizzes_path
    end
  end

  def destroy
    quiz = Quiz.find(params[:id])
    quiz.destroy
    respond_to do |format|
      format.html do
        flash[:notice] = "Quiz deleted successfully!"
        redirect_to quizzes_path
      end
    end
  end

  def edit
    if Quiz.exists?(id: params[:id])
      @quiz = Quiz.find(params[:id])
      respond_to do |format|
        format.html { render :edit, locals: {quiz: @quiz}}
      end
    else
      flash[:alert] = "Quiz does not exist!"
      redirect_to quizzes_path
    end
  end

  def update
    @quiz = Quiz.find(params[:id])
    respond_to do |format|
      format.html do
        if @quiz.update(params.require(:quiz).permit(:name, :description))
          flash[:notice] = "Quiz updated successfully!"
          redirect_to quizzes_path
        else
          flash.now[:alert] = @quiz.errors.full_messages.to_sentence
          render :edit, status: :unprocessable_entity, locals: {quiz: @quiz}
        end
      end
    end
  end 

  def create
    @quiz = Quiz.new(params.require(:quiz).permit(:name, :description))

    if @quiz.save
      flash[:notice] = "Quiz added successfully!"
      redirect_to quizzes_path
    else
      flash[:alert] = @quiz.errors.full_messages.to_sentence
      redirect_to new_quiz_path
    end
  end 
end 