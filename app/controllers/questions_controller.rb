class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def result
    random = Random.new
    count = Question.all.count

    record_id = random.rand(1..count)

    @result = Question.find(record_id).question

    render 'result'
  end
end
