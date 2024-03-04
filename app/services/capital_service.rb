class CapitalService
  def get_lat_and_lon(country)
    get_url("/v3.1/name/#{country}?fullText=true")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://restcountries.com")
  end
end