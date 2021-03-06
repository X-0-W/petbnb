class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @pet = Pet.find(params[:pet_id])
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.user = current_user
    @pet = Pet.find(params[:pet_id])
    @booking.pet = @pet
    @booking.calculate_total_price
    if @booking.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
