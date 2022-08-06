class BookingsController < ApplicationController
  def create
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
    @costume = @booking.costume
  end
end

private

def booking_params
  params.require(:booking).permit(:date_start, :date_end, :value, :status)
end
