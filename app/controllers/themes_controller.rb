class ThemesController < ApplicationController
  def index
    @themes = Theme.all
  end

  def result
    random = Random.new
    count = Theme.all.count
    
    record_id = random.rand(1..count)

    @result = Theme.find(record_id).theme

    render 'result'
  end
end
