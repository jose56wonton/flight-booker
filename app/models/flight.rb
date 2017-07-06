class Flight < ApplicationRecord
  belongs_to :origin,      :class_name => "Airport"
  belongs_to :destination, :class_name => "Airport"
  has_many  :bookings
  has_many  :passengers, through: :bookings

  def self.valid_dates
    flights = Flight.all.order(departure_date: :asc)
    flights.sort_by { |f| f.departure_date}
    flights.map { |f| f.departure_date.strftime('%b %d, %Y') }.uniq

  end

  # def self.valid_flights(origin, destination, date)
  #   flights = Flight.all.order(departure_date: :asc)
  #   flights.map do |f|
  #     if( f.departure_date == date && f.origin_id == origin && f.destination_id == destination)}
  #       Flight.create(origin_id:origin ,destination_id: destination ,
  #       departure_date: date,duration: 5)
  #     end
  #   end
  # end


  def self.valid_flights(origin, destination, dept_date)
    where(origin_id: origin, destination_id: destination,
          departure_date: Flight.parse_date(dept_date))
  end

  # Parse a string date into a range object representing the whole day
  def self.parse_date(date)
    datetime = date.to_datetime
    datetime.beginning_of_day..datetime.end_of_day
  end
end
