require "rails_helper"

RSpec.describe "Recipes API", type: :request do
  describe "Get Recipes For A Particular Recipe" do
    it "returns recipes for a specific country" do

      get "/api/v1/recipes?country=thailand"

      # headers = { "Content-Type" => "application/json",
      #   "Accept" => "application/json"
      # }

      expect(response).to be_successful
      expect(response.status).to eq(200)
    end
  end
end