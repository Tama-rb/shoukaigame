class ThemesController < ApplicationController
  before_action :set_theme, only: [:destroy]
  def index
    @themes = Theme.all
    @theme = Theme.new
  end

  def result
    random = Random.new
    count = Theme.all.count

    record_id = random.rand(1..count)

    @result = Theme.find(record_id).theme

    render 'result'
  end

  def new
    @theme = Theme.new
  end

  def create
    @theme = Theme.new(theme_params)

    if @theme.save
      redirect_to themes_path
    else
      render :new
    end
  end

  def destroy
    @theme.destroy
    redirect_to themes_url
  end

  private

    def set_theme
      @theme = Theme.find(params[:id])
    end  

    def theme_params
      params.require(:theme).permit(
        :theme
      )
    end  
end
