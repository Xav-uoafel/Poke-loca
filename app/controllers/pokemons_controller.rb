class PokemonsController < ApplicationController
  before_action :find_pokemon, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @pokemons = Pokemon.all
    @pokemons = Pokemon.where("services ILIKE ?", "%#{params[:query]}%") if params[:query].present?
    @markers = [
      {
        lat: 43.599550943705445,
        lng: 1.4570582000627619,
        info_window_html: render_to_string(partial: "info_window"),
        marker_html: render_to_string(partial: "marker")
      }
    ]
  end

  def show
    @booking = Booking.new
    @pokemon = Pokemon.find(params[:id])
    @bookings = Booking.where(pokemon_id: @pokemon.id)
  end

  def new
    @pokemon = Pokemon.new
    @pokemons = Pokemon.where(user_id: current_user.id)
  end

  def create
    @pokemon = Pokemon.find_by(name: params[:pokemon][:name])
    @pokemon.user_id = current_user.id
    if @pokemon.update!(pokemon_params)
      redirect_to new_pokemon_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save!
      redirect_to pokemon_path(@pokemon.id)
    else
      render :edit
    end
  end

  def destroy
    @pokemon.destroy
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :price, :photo, :type, :services)
  end

  def find_pokemon
    @pokemon = Pokemon.find(params[:id])
  end
end
