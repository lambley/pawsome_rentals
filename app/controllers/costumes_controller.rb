class CostumesController < ApplicationController
  def index
    @costumes = Costume.all
    @markers = @costumes.map do |c|
      {
        lat: c.latitude,
        long: c.longitude
      }
    end
  end

  def show
    @costume = Costume.find(costume_params)
  end

  private

  def costume_params
    params.require(:costume).permit(:name, :description, :photo)
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
