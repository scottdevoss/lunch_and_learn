class Api::V1::LearningResourcesController < ApplicationController
  def index
    
    conn = Faraday.new(url: "https://www.googleapis.com") do |faraday|
      faraday.params["key"] = Rails.application.credentials.youtube[:key]
      faraday.params["channelId"] = Rails.application.credentials.youtube_channel_id[:key]
    end

    response = conn.get("/youtube/v3/search?part=snippet&q=#{params[:country]}")

    json = JSON.parse(response.body, symbolize_names: true)

    Video.new(params[:country], json[:items].first)
  end
end