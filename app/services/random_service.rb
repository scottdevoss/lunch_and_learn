class RandomService
  def random_country
    conn = Faraday.new(url: "https://restcountries.com")
    response = conn.get("/v3.1/all")
    json = JSON.parse(response.body, symbolize_names: true)
  end
end