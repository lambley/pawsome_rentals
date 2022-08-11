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

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to costume_booking_path(@booking)
  end

  def destroy
    @booking.destroy
    redirect_to costumes_path
  end
end

private

def booking_params
  params.require(:booking).permit(:date_start, :user_id, :costume_id, :date_end, :value, :status)
end

def find_booking
  @booking = Booking.find(params[:id])
end
