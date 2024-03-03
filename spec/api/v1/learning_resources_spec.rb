require "rails_helper"

RSpec.describe "Learning Resources", type: :request do
  describe "Get Learning Resources for a Particular Country", :vcr do
    it "returns learning resources for a specific country" do

      get "/api/v1/learning_resources?country=laos"

      expect(response).to be_successful
      expect(response.status).to eq(200)
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to be_a(Hash)
      expect(json).to have_key(:data)
      expect(json[:data]).to be_a(Hash)

      expect(json[:data]).to have_key(:id)
      expect(json[:data]).to have_key(:type)
      expect(json[:data]).to have_key(:attributes)
      expect(json[:data][:attributes]).to have_key(:country)
      expect(json[:data][:attributes][:country]).to be_a(String)

      expect(json[:data][:attributes]).to have_key(:video)
      expect(json[:data][:attributes][:video]).to be_a(Hash)

      expect(json[:data][:attributes]).to have_key(:images)
      expect(json[:data][:attributes][:images]).to be_a(Array)
    end 
  end 
end 