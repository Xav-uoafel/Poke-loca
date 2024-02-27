class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    if current_user.nil?
      redirect_to new_user_session_path
    else
      pokemon = Pokemon.find(params[:pokemon_id])
      @booking = Booking.new(user: current_user, pokemon:, start_date: params[:start_date],
                             end_date: params[:end_date])
      @booking.total_price = calculate_price(pokemon, @booking)
      if @booking.save
        redirect_to booking_path(@booking)
      else
        render :new
      end
    end
  end
  
    def destroy
      @booking.destroy
      redirect_to bookings_path
    end

  private

  def calculate_price(pokemon, booking)
    total_price = pokemon.price * (booking.end_date - booking.start_date)
    return total_price
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
