class BookingsController < ApplicationController

  def show
    @booking =  Booking.find(params[:id])
  end

  def new
    @booking = Booking.new()
    puts params
  end

  def create
    @booking = Booking.new(book_params)
    if @booking.save
      redirect_to @booking
    else
      puts "***********************"
      puts book_params
      puts "***********************"
      puts params
      puts "************************"
      puts @booking.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  private
  def book_params
    params.require(:booking).permit(:flight_id, :number_of_passeners, passengers_attributes: [:name, :email])
  end
end
