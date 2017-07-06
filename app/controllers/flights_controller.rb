class FlightsController < ApplicationController

  def index
    @airport_options = Airport.all.map{|u| [u.code,u.id]}
    @dates = Flight.valid_dates
  

    check_flights if params[:commit]
  end



  private
    def check_flights
      if params[:origin] == params[:destination]
        flash.now[:danger] = "Please choose different departure and arrival locations."
      else
        @flights = Flight.valid_flights(params[:origin],params[:destination],params[:date])
      end
    end
end
