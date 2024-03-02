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
      expect(json[:data]).to be_a(Array)

      json[:data].each do |resource|
        expect(resource).to have_key(:id)
        expect(resource).to have_key(:type)
        expect(resource).to have_key(:attributes)
        expect(resource[:attributes]).to have_key(:country)
        expect(resource[:attributes][:country]).to be_a(String)

        expect(resource[:attributes]).to have_key(:video)
        expect(resource[:attributes][:video]).to have_key(:title)
        expect(resource[:attributes][:video]).to have_key(:youtube_video_id)

        expect(resource[:attributes]).to have_key(:images)
        expect(resource[:attributes][:images]).to be_an(Array)
      end
    end 
  end 
end 