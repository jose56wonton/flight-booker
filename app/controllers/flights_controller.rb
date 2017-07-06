class FlightsController < ApplicationController

  def index
    @airport_options = Airport.all.map{|u| [u.code,u.id]}
    @dates = Flight.valid_flight_dates
  end
end
