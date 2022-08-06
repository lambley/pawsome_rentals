class CostumesController < ApplicationController
  def index
    @costumes = Costume.all
  end

  def show
    @costume = Costume.find(params[:id])
  end

  def edit
    @costume = Costume.find(params[:id])
  end

  def update
    @costume = Costume.find(params[:id])
    @costume.update(costume_params)

    redirect_to costume_path(@costume)
  end

  private

  def costume_params
    params.require(:costume).permit(:name, :description, :animal_type)
  end
end
