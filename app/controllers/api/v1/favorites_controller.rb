class Api::V1::FavoritesController < ApplicationController
  before_action :authenticate_api_key

  def create
    require 'pry'; binding.pry
  end
end