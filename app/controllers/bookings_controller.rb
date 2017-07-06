class BookingsController < ApplicationController

  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new
    @num_passengers = params[:passengers].to_i
    @num_passengers.times{@booking.passengers.build}
  end
  def create
    @booking = Booking.new booking_params
    if @booking.save
      flash[:success] = "Flights booked successfully!"
      redirect_to @booking
    else
      @flight = Flight.find(params[:flight_id])
      flash.now[:danger] = "Please enter valid passenger information"
      render 'new'
    end
  end
  def show
    @booking = Booking.find(params[:id])
  end


  private
    def booking_params
      params.require(:booking).permit(:flight_id,passengers_attributes:[:name,:email])
    end
end
