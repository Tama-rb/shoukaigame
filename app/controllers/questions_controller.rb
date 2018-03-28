class QuestionsController < ApplicationController

  def index
    @conjunction = Conjunction.new
    @question = Question.new
    @theme = Theme.new
  end

  def conjunction
    random = Random.new
    count = Conjunction.all.count
    
    record_id = random.rand(1..count)

    @result = Conjunction.find(record_id).conjunction

    render 'result'
  end

  def question
    random = Random.new
    count = Question.all.count

    record_id = random.rand(1..count)

    @result = Question.find(record_id).question

    render 'result'
  end

  def theme
    random = Random.new
    count = Theme.all.count

    record_id = random.rand(1..count)

    @result = Theme.find(record_id).theme

    render 'result'
  end
end
