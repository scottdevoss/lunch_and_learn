require "rails_helper"

RSpec.describe "Air Quality", type: :request do
  describe "Get Air Quality for the capital city of the country provided", :vcr do
    it "returns air quality for capital city of country provided" do

      get "/api/v1/air_quality?country=India"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      json = JSON.parse(response.body, symbolize_names: true)
    end
  end
end
