# frozen_string_literal: true

class PokemonsController < ApplicationController
  def index
    @pokemon = Pokemon.all
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    result = VerifyPokemon.call(pokemon_params[:name])

    if result.failure?
      flash.now[:notice] = "Couldn't find pokemon!"
      @pokemon = Pokemon.new
      render :new, status: :unprocessable_entity
    else
      redirect_to pokemons_path
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name)
  end
end
