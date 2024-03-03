class Api::V1::FavoritesController < ApplicationController
  before_action :authenticate_api_key

  def create
    favorite = @current_user.favorites.new(favorite_params)
    if favorite.save
      render json: { success: "Favorite added successfully" }, status: :created
    else
      render json: { errors: favorite.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit(:country, :recipe_link, :recipe_title)
  end
end