class FlightsController < ApplicationController
  def index
    if params[:commit] == 'Search'
    
      @airports = Airport.pluck :airport_code, :id
      @start_datetime = Flight.order(:start_datetime).dates
      @results = Flight.search(flight_params)
      @num_passengers = flight_params[:num_passengers] 
      render 'index'
    elsif params[:commit] == "Book"
      @num_passengers = booking_params[:num_passengers]
      @flight = Flight.find(booking_params[:flight_id])
      @booking = @flight.bookings.build
      (@num_passengers.to_i).times {|index| @booking.passengers.build }
      render 'bookings/new'
     
    else
    @airports = Airport.pluck :airport_code , :id
    @start_datetime = Flight.dates
    end
  end
  private
   def flight_params
    params.require(:flight).permit(:departure_airport, :arrival_airport, :start_datetime, :num_passengers) 
   end 
   def booking_params
    params.require(:booking).permit(:num_passengers, :flight_id)
  end
end
