class QuestionsController < ApplicationController
  before_action :set_question, only: %i[destroy]
  def index
    @questions = Question.all
  end

  def result
    @question = Question.select_a_word_at_random

    render :result
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to questions_url
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_url
  end

  private

    def set_question
      @question = Question.find(params[:id])
    end  

    def question_params
      params.require(:question).permit(:content)
    end  
end
