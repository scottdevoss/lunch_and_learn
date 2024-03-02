class Api::V1::RecipesController < ApplicationController
  def index
    recipes = RecipeSerializer.new(RecipeFacade.new(params[:country]).recipes)
    render json: recipes
    # require 'pry'; binding.pry
  end
end