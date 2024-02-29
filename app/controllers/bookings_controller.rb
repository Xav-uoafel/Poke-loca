class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show destroy]

  def index
    @bookings = Booking.all
    @pokemons = Pokemon.all
    @booking = Booking.new
  end

  def show
  end

  def new
    @booking = Booking.new
    @pokemon = Pokemon.find(params[:pokemon_id])
  end

  def create
    @pokemon = Pokemon.find(params[:pokemon_id])
    @booking = Booking.new(strong_params)
    @booking.user_id = current_user.id

    @booking.pokemon_id = @pokemon.id

    @booking.total_price = calculate_price(@pokemon, @booking)
    if @booking.save!
      redirect_to pokemon_path(@pokemon), notice: 'La réservation a été créée avec succès.'
    else
      render :new
    end
  end

  def destroy
    @booking.destroy
    redirect_to booking_path, notice: 'La réservation a été supprimée avec succès.'
  end

  private

  def strong_params
    params.require(:booking).permit(:user_id, :start_date, :end_date, :pokemon_id)
  end

  def calculate_price(pokemon, booking)
    days = (booking.end_date - booking.start_date).to_i
    total_price = pokemon.price * days
    return total_price
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
