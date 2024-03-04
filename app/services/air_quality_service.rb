class AirQualityService
  def air_quality_by_capital(capital)
    get_url("/data/2.5/air_pollution?lat=#{capital.lat}&lon=#{capital.lon}")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "http://api.openweathermap.org") do |faraday|
      faraday.params["appid"] = Rails.application.credentials.weather[:key]
    end
  end
end