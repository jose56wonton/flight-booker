class Flight < ApplicationRecord
  belongs_to :origin,      :class_name => "Airport"
  belongs_to :destination, :class_name => "Airport"

  def self.valid_flight_dates
    flights = Flight.all.order(departure_date: :asc)
    flights.sort_by { |f| f.departure_date}
    flights.map { |f| f.departure_date.strftime('%b %d, %Y') }.uniq

  end
end
