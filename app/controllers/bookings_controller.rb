class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :edit, :update, :destroy]

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
  
  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date_start, :date_end, :user_id, :costume_id)
  end
  
end
