class RecipeService
  def recipes_by_country(country)
    get_url("/api/recipes/v2?type=public&q=#{country}")
  end

  def get_url(url)
    response = conn.get(url)
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.edamam.com") do |faraday|
      faraday.params["app_id"] = Rails.application.credentials.edamam_app_id[:key]
      faraday.params["app_key"] = Rails.application.credentials.edamam_api_key[:key]
    end
  end
end