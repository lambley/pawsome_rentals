class CostumesController < ApplicationController
  def index
    @costumes = Costume.all
  end

  def show
    @costume = Costume.find(costume_params)
  end

  def new
    @costume = Costume.new
  end

  def create
    @costume = Costume.new(costume_params)
    @costume.save
    redirect_to costume_path(@costume)
  end

  private

  def costume_params
    params.require(:costume).permit(:name, :description, :photo, :animal_type, :latitude, :longitude, :user_id)
  end
end
