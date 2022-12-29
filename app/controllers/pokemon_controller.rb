class PokemonController < ApplicationController
  def index
  end

  def show
    @pokemon = find_pokemon(params[:pokemon_name])

    if (!@pokemon || params[:pokemon_name].blank?)
      flash[:alert] = 'Pokémon not found'
      redirect_to root_url
    end
  end

  private

    def request_api(url)
      response = Excon.get(url)

      return nil if response.status != 200

      JSON.parse response.body
    end

    def find_pokemon(name)
      name.downcase! if name.is_a? String
      url = "https://pokeapi.co/api/v2/pokemon/#{name}"
      request_api(url)
    end
end
