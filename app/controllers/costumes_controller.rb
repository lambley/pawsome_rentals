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
    @costume = Costume.find(params[:id])
  end
end
