class Flight < ApplicationRecord
    belongs_to :departure_airport , foreign_key: :departure_airport_id, class_name:'Airport'
    belongs_to :arrival_airport , foreign_key: :arrival_airport_id, class_name:'Airport'
    has_many :bookings
    def self.dates
       
        pluck(:start_datetime).uniq.map{|datetime| [datetime.strftime('%d/%m/%Y %H:%M'),datetime.strftime('%Y-%m-%d %H:%M:00')]}
    end
    def self.search(flight_params) 
        if flight_params.empty?
            nil
        else 
        results = Flight.all
        results=results.where(['departure_airport_id = ?',flight_params[:departure_airport].to_i ])if flight_params[:departure_airport].present?
        results=results.where([ 'arrival_airport_id= ?',flight_params[:arrival_airport]])  if flight_params[:arrival_airport].present? 
        results=results.where([ 'start_datetime=?',flight_params[:start_datetime]]) if flight_params[:start_datetime].present?          
        return results
        end
    end    
end
