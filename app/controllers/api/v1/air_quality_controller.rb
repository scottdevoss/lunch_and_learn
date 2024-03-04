class Api::V1::AirQualityController < ApplicationController
  def index
    capital = CapitalFacade.new(params[:country]).get_coordinates
    
    conn = Faraday.new(url: "http://api.openweathermap.org") do |faraday|
      faraday.params["appid"] = Rails.application.credentials.weather[:key]
    end

    response = conn.get("/data/2.5/air_pollution?lat=#{capital.lat}&lon=#{capital.lon}")
    json = JSON.parse(response.body, symbolize_names: true)
    AirQuality.new(json)
  end
end