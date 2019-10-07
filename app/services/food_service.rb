require 'rest-client'
require 'json'

module FoodService
  def self.get_cheese
    response = RestClient.get('https://api.spoonacular.com/recipes/search?query=cheese&number=5&apiKey=a0d9fb373fba458f9670daefd86fb2cb') 

    recipes = JSON.parse(response)

    recipes['results']
  end
end