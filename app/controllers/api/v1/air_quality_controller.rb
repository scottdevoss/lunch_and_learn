class Api::V1::AirQualityController < ApplicationController
  def index
    conn = Faraday.new(url: "https://restcountries.com")

    response = conn.get("/v3.1/name/#{params[:country]}?fullText=true")
    json = JSON.parse(response.body, symbolize_names: true)
    Capital.new(json)
    # require 'pry'; binding.pry
  end
end