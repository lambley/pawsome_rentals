class CostumesController < ApplicationController
  def index
    @costumes = Costume.all
    @markers = @costumes.map do |c|
      {
        lat: c.latitude,
        long: c.longitude,
        info_window: render_to_string(partial: "info_window", locals: { costume: c })
      }
    end
  end

  def show
    @costume = Costume.find(params[:id])
  end

  def new
    @costume = Costume.new
  end

  def create
    @costume = Costume.new(costume_params)
    @costume.save
    redirect_to costumes_path(@costume)
  end

  # def edit
  #   @costume = Costume.find(params[:id])
  # end

  # def update
  #   @costume = Costume.find(params[:id])
  #   @costume.update(costume_params)

  #   redirect_to costume_path(@costume)
  # end


  private

  def costume_params
    params.require(:costume).permit(:name, :description, :photo, :animal_type, :latitude, :longitude, :user_id)
  end
end
