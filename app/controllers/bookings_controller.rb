class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @user = current_user
    @costume = params[:costume_id]
  end

  private

  def booking_params
    params.require(:booking).permit(:date_start, :date_end, :user_id, :costume_id)
  end
end
