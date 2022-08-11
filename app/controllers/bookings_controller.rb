class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @costume = Costume.find(params[:costume_id])
  end

  def create
    @booking = current_user.bookings.new(booking_params)
    @costume = Costume.find(params[:costume_id])
    @booking.costume = @costume
    if @booking.save
      redirect_to costumes_path, status: :see_other
    else
      new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date_start, :date_end, :user_id, :costume_id)
  end
end
