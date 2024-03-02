class LearningResourcesService
  def resources_by_country(country)
    get_url("/youtube/v3/search?part=snippet&q=#{country}")
  end

  def get_url(url)
    response = conn.get(url)

    JSON.parse(response.body, symbolize_names: true)
  end

  def conn 
    Faraday.new(url: "https://www.googleapis.com") do |faraday|
      faraday.params["key"] = Rails.application.credentials.youtube[:key]
      faraday.params["channelId"] = Rails.application.credentials.youtube_channel_id[:key]
    end
  end
end