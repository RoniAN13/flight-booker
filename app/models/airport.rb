class Airport < ApplicationRecord
    has_many :departing_flights, foreign_key: :departure_airport , class_name: 'Flight'
    has_many :arriving_flights, foreign_key: :arriving_airport , class_name: 'Flight'
end
