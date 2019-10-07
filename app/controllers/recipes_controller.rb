class RecipesController < ApplicationController
  def index
    @recipes = FoodService.get_cheese    
  end
end
