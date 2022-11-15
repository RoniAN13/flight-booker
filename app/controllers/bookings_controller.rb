class BookingsController < ApplicationController
    def create
        @flight = Flight.find(booking_params[:flight_id])
    @booking = @flight.bookings.build booking_params
    
    if blank_params &&  @booking.save 
        redirect_to @booking
    else
      flash.now[:alert] = "Fill all passenger info"
      render 'new'
    end
    end
    def show
        @booking = Booking.find(params[:id])
        @flight = @booking.flight
    end        
    private
    def booking_params
      params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
    end
    def blank_params
      params[:booking][:passengers_attributes].each do |key,value|
        value.each do |k,v|
          return false if v.blank?
        end
      end
              

    end  
end
