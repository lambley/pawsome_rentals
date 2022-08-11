class CostumesController < ApplicationController
  def index
    if params[:query].present?
      @costumes = Costume.search_by_name_and_animal_type(params[:query])
    else
      @costumes = Costume.all
    end

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
    params.require(:costume).permit(:name, :description, :photo)
  end
end
