# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

flights = Flight.create([
    {
        departure_airport_id: 1,
        arrival_airport_id: 2,
        start_datetime: DateTime.parse('2022/11/3 10:00:00'),
        flight_duration: 6
    },
    {
        departure_airport_id: 1,
        arrival_airport_id: 3,
        start_datetime: DateTime.parse('2022/11/5 12:30:00'),
        flight_duration: 5
    },
    {
        departure_airport_id: 4,
        arrival_airport_id: 5,
        start_datetime: DateTime.parse('2022/11/4 10:00:00'),
        flight_duration: 5.5
    },
    {
        departure_airport_id: 5,
        arrival_airport_id: 2,
        start_datetime: DateTime.parse('2022/11/6 10:00:00'),
        flight_duration: 7
    }
])