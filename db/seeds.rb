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


Flight.create(origin_id:a1.id ,destination_id: a3.id ,
departure_date: (Time.now + 10.days),duration: 5)
Flight.create(origin_id:a2.id ,destination_id: a4.id ,
departure_date: (Time.now + 5.days),duration: 5)
Flight.create(origin_id:a5.id ,destination_id: a6.id ,
departure_date: (Time.now + 7.days),duration: 5)
