class StarWarsController < ApplicationController
  def index
    @characters = StarWarsService.get_star_wars_characters
    binding.pry
  end
end
