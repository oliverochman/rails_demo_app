require 'rest-client'

module FoodService
  def self.get_cheese
    response = RestClient.get(
      'https://api.spoonacular.com/recipes/search',
      {
        params: {
          number: 5,
          query: "cheese",
          apiKey: "your-api-key"
        }
      }
    ) 
    
    binding.pry
    
      
    recipes = JSON.parse(response)
    
    recipes['results']
  end
end