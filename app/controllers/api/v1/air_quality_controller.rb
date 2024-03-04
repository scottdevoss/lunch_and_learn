class Api::V1::AirQualityController < ApplicationController
  def index
    capital = CapitalFacade.new(params[:country]).get_coordinates
    
  end
end