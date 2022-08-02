class CostumesController < ApplicationController
  def index
    @costumes = Costume.all
  end

  def show
    @costume = Costume.find(params[:id])
  end

  private

  def costume_params
    params.require(:costume).permit(:name, :description, :photo)
  end
end
