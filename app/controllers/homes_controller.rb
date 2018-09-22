class HomesController < ApplicationController
  def index
    @conjunction = Conjunction.new
    @question = Question.new
    @theme = Theme.new
  end  
end
