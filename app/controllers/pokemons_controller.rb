class PokemonsController < ApplicationController
  before_action :find_pokemon, only: [:show, :edit, :update, :destroy]

  def index
    @pokemons = Pokemon.all
  end

  def show
    @booking = Booking.new
    @pokemon = Pokemon.find(params[:id])
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.find(params[:pokemon][:name])
    @pokemon.user_id = current_user.id
    if @pokemon.update!(pokemon_params)
      redirect_to pokemon_path(@pokemon.id)
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
