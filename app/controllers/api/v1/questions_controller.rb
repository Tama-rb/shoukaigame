class Api::V1::QuestionsController < ApplicationController
  def random
    @question = Question.where(category: params[:category]).sample(1)

    render json: @question
  end
end
