class Api::V1::LearningResourcesController < ApplicationController
  def index
    resources = LearningResourcesFacade.new(params[:country]).resources
    render json: resources

    conn = Faraday.new(url: "https://api.unsplash.com") do |faraday|
      faraday.params["client_id"] = Rails.application.credentials.unsplash[:key]
    end

    response = conn.get("/search/photos?query=#{params[:country]}&page=1&per_page=10")
    json = JSON.parse(response.body, symbolize_names: true)

    images = json[:results].map do |image|
      Image.new(params[:country], image)
    end
  end
end