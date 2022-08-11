class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :edit, :update, :destroy]

  def create
    @booking = Booking.new
  end

  def show
    @costume = @booking.costume
  end

  def index
    @bookings = Booking.where(user: current_user)
  end
end

private

def booking_params
  params.require(:booking).permit(:date_start, :date_end, :value, :status)
end

def find_booking
  @booking = Booking.find(params[:id])
end
