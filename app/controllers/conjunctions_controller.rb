class ConjunctionsController < ApplicationController
  before_action :set_conjunction, only: [:edit, :update, :destroy]
  def index
    @conjunctions = Conjunction.all
    @conjunction = Conjunction.new
  end

  def result
    random = Random.new
    count = Conjunction.all.count
    
    record_id = random.rand(1..count)

    @result = Conjunction.find(record_id).conjunction

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

  def edit
  end

  def update
    if @conjunction.update(conjunction_params)
      redirect_to @conjunction
    else
      render :edit
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
        :conjunction
      )
    end  
end
