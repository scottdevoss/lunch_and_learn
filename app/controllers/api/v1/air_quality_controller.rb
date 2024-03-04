class Api::V1::AirQualityController < ApplicationController
  def index
    capital = CapitalFacade.new(params[:country]).get_coordinates

    air_data = AirQualityFacade.new(capital).air_quality

    air_quality = {
      aqi: air_data.aqi,
      datetime: air_data.datetime,
      readable_aqi: 
      if air_data.aqi == 5
        "Very Poor"
      elsif air_data.aqi == 4
        "Poor"
      elsif air_data.aqi == 3
        "Moderate"
      elsif air_data.aqi == 2
        "Fair"
      else
        "Good"
      end

    }
    air = AirQualitySerializer.new(air_quality)
   
    render json: air
  end
end