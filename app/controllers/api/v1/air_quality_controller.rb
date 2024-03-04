class Api::V1::AirQualityController < ApplicationController
  def index
    capital = CapitalFacade.new(params[:country]).get_coordinates

    air_data = AirQualityFacade.new(capital).air_quality

    air_quality = {
      aqi: air_data,
      datetime: air_data,
      readable_aqi: air_data

    }
    air = AirQualitySerializer.new(air_quality)
  
    render json: air
  end
end