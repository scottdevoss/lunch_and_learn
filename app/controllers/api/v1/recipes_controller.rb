class Api::V1::RecipesController < ApplicationController
  def index
    if params[:country] == ""
      random = RandomFacade.new.country.name
      random_country = RecipeSerializer.new(RecipeFacade.new(random).recipes)
      render json: random_country
    else 
      recipes = RecipeSerializer.new(RecipeFacade.new(params[:country]).recipes)
      render json: recipes
    end
  end
end