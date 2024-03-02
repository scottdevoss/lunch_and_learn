require "rails_helper"

RSpec.describe "Recipes API", type: :request do
  describe "Get Recipes For A Particular Recipe", :vcr do
    it "returns recipes for a specific country" do

      get "/api/v1/recipes?country=thailand"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to be_a(Hash)
      expect(json).to have_key(:data)
      expect(json[:data]).to be_a(Array)

      json[:data].each do |recipe|
        expect(recipe).to have_key(:id)
        expect(recipe).to have_key(:type)
        expect(recipe).to have_key(:attributes)
        expect(recipe[:attributes]).to have_key(:title)
        expect(recipe[:attributes]).to have_key(:url)
        expect(recipe[:attributes]).to have_key(:country)
        expect(recipe[:attributes]).to have_key(:image)
        expect(recipe[:attributes]).to_not have_key(:count)
        expect(recipe[:attributes]).to_not have_key(:hits)
        expect(recipe[:attributes]).to_not have_key(:source)
        expect(recipe[:attributes]).to_not have_key(:dietLabels)
        expect(recipe[:attributes]).to_not have_key(:healthLabels)
        expect(recipe[:attributes]).to_not have_key(:ingredients)
      end
    end

    it "returns a random country if no country is sent by the user" do

      get "/api/v1/recipes?country="

      expect(response).to be_successful
      expect(response.status).to eq(200)
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to be_a(Hash)
      expect(json).to have_key(:data)
      expect(json[:data]).to be_a(Array)

      json[:data].each do |recipe|
        expect(recipe).to have_key(:id)
        expect(recipe).to have_key(:type)
        expect(recipe).to have_key(:attributes)
        expect(recipe[:attributes]).to have_key(:title)
        expect(recipe[:attributes]).to have_key(:url)
        expect(recipe[:attributes]).to have_key(:country)
        expect(recipe[:attributes]).to have_key(:image)
        expect(recipe[:attributes]).to_not have_key(:count)
        expect(recipe[:attributes]).to_not have_key(:hits)
        expect(recipe[:attributes]).to_not have_key(:source)
        expect(recipe[:attributes]).to_not have_key(:dietLabels)
        expect(recipe[:attributes]).to_not have_key(:healthLabels)
        expect(recipe[:attributes]).to_not have_key(:ingredients)
      end
    end

    it "returns a an empty array if there are no recipes" do

      get "/api/v1/recipes?country=alkhgernadg"

      expect(response).to be_successful
      expect(response.status).to eq(200)
      json = JSON.parse(response.body, symbolize_names: true)
      
      expect(json).to have_key(:data)
      expect(json[:data]).to eq([])
    end
  end
end