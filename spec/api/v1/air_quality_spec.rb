require "rails_helper"

RSpec.describe "Air Quality", type: :request do
  describe "Get Air Quality for the capital city of the country provided", :vcr do
    it "returns air quality for capital city of country provided" do

      get "/api/v1/air_quality?country=India"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to have_key(:data)
      expect(json[:data]).to have_key(:id)
      expect(json[:data]).to have_key(:type)
      expect(json[:data]).to have_key(:attributes)

      expect(json[:data][:attributes]).to have_key(:aqi)
      expect(json[:data][:attributes][:aqi]).to be_a(Integer)

      expect(json[:data][:attributes]).to have_key(:datetime)
      expect(json[:data][:attributes][:datetime]).to be_a(Integer)

      expect(json[:data][:attributes]).to have_key(:readable_aqi)
      expect(json[:data][:attributes][:readable_aqi]).to be_a(String)
    end
  end
end
