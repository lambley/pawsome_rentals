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
end
