# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
a1 = Airport.create(code:'LAX')
a2 = Airport.create(code:'SFO')
a3 = Airport.create(code:'NYC')
a4 = Airport.create(code:'ATL')
a5 = Airport.create(code:'ORD')
a6 = Airport.create(code:'LHR')
airports = [a1,a2,a3,a4,a5,a6]

dates =[]
10.times {dates <<Faker::Date.forward(30)}

airports.each_with_index do |a,i|
  airports.each_with_index do |b,j|
    if(i!=j)
      dates.each do |d|
        3.times do
          Flight.create(origin_id: (a.id),
                      destination_id: (b.id),
                      departure_date: Faker::Time.between(d.beginning_of_day, d.end_of_day),
                      duration: rand(3..10))
        end
      end
    end
  end
end
