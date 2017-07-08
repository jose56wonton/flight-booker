class PassengerMailer < ApplicationMailer
  default from: 'FlightBooker@example.com'

  def thank_you(passenger)
    @passenger = passenger
    @date = Flight.find(Booking.find(Passenger.find(@passenger.id).booking_id).flight_id).departure_date.strftime("%H:%M %p on %m-%d-%Y")
    mail(to: @passenger.email, subject: 'Thanks for booking with FlightBooker')
  end
end
