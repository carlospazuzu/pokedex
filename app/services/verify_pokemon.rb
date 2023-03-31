class VerifyPokemon < ApplicationService
  HTTP_STATUS_OK = 200

  def initialize(pokemon_name)
    @pokemon_name = pokemon_name
  end

  def call
    connection = Faraday.new
    response = connection.get("https://pokeapi.co/api/v2/pokemon/#{@pokemon_name}")

    return SuccessResult.new if response.status == HTTP_STATUS_OK

    FailureResult.new
  end
end
