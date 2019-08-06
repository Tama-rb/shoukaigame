class Api::V1::QuestionsController < ApplicationController
  def random
    @question = Question.where(category: params[:category]).sample(1)

    render json: @question
  end

  def create
    @question = Question.new

    @question.content = question_params[:content]
    @question.category = question_params[:category].to_i

    if @question.save
      render json: { result: "success" }
    else
      render json: { result: "failed", error: @question.errors.full_messages }
    end
  end

  private

  def question_params
    params.require(:params).permit(:category, :content)
  end
end
