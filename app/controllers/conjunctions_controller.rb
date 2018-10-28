class ConjunctionsController < ApplicationController
  before_action :set_conjunction, only: [:destroy]
  def index
    @conjunctions = Conjunction.all
    @conjunction = Conjunction.new
  end

  def result
    @conjunction = Conjunction.select_a_word_at_random

    render 'result'
  end

  def new
    @conjunction = Conjunction.new
  end

  def create
    @conjunction = Conjunction.new(conjunction_params)

    if @conjunction.save
      redirect_to conjunctions_path
    else
      render :new
    end
  end

  def destroy
    @conjunction.destroy
    redirect_to conjunctions_url
  end

  private

    def set_conjunction
      @conjunction = Conjunction.find(params[:id])
    end  

    def conjunction_params
      params.require(:conjunction).permit(
        :content
      )
    end
end
