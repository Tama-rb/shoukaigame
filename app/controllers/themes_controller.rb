class ThemesController < ApplicationController
  before_action :set_theme, only: %i[destroy]
  def index
    @themes = Theme.all
  end

  def result
    @theme = Theme.pluck_a_theme_from_all_or_offset
    render :result
  end

  def new
    @theme = Theme.new
  end

  def create
    @theme = Theme.new(theme_params)

    if @theme.save
      redirect_to themes_url
    else
      render :new
    end
  end

  def destroy
    @theme.destroy!
    redirect_to themes_url
  end

  private

  def set_theme
    @theme = Theme.find(params[:id])
  end

  def theme_params
    params.require(:theme).permit(:content)
  end
end
