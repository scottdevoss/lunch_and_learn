require "rails_helper"

RSpec.describe "YouTube API", type: :request do
  describe "Get Learning Resources for a Particular Country", :vcr do
    xit "returns learning resources for a specific country" do

      get "/api/v1/learning_resources?country=laos"

      expect(response).to be_successful
      expect(response.status).to eq(200)
      json = JSON.parse(response.body, symbolize_names: true)
    end 
  end 
end 