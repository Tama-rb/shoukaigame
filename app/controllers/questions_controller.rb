class QuestionsController < ApplicationController
  before_action :set_question, only: [:destroy]
  def index
    @questions = Question.all
    @question = Question.new
  end

  def result
    random = Random.new
    count = Question.all.count

    record_id = random.rand(1..count)

    @result = Question.find(record_id).question

    render 'result'
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to questions_path
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
      params.require(:question).permit(
        :question
      )
    end  
end
