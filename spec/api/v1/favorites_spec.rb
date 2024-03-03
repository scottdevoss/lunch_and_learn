require "rails_helper"

RSpec.describe "Favorites", type: :request do
  describe "Add recipes to a favorited list for a particular user", :vcr do
    #POST /api/v1/favorites
    it "Can add a favorited recipe to a user" do
      user_params = {
        "name": "Odell",
        "email": "goodboy@ruffruff.com",
        "password": "treats4lyf"
      }
  
      user = User.create!(user_params)

      favorite = {
        "api_key": "#{user.api_key}",
        "country": "Mexico",
        "recipe_link": "https://www.gimmesomeoven.com/best-chicken-enchiladas-ever/",
        "recipe_title": "Chicken Enchiladas"
      }

      headers = { "CONTENT_TYPE" => "application/json",
        "ACCEPT" => "application/json"
      }

      post "/api/v1/favorites", headers: headers, params: favorite.to_json

      expect(response).to be_successful
      expect(response.status).to eq(201)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to be_a(Hash)
      expect(json).to have_key(:success)
      expect(json[:success]).to eq("Favorite added successfully")
    end

    #Sad Path Adding Favorites
    it "Will return an error if API is invalid" do
      user_params = {
        "name": "Odell",
        "email": "goodboy@ruffruff.com",
        "password": "treats4lyf"
      }
  
      user = User.create!(user_params)

      favorite = {
        "api_key": "wrongapikey",
        "country": "Mexico",
        "recipe_link": "https://www.gimmesomeoven.com/best-chicken-enchiladas-ever/",
        "recipe_title": "Chicken Enchiladas"
      }

      headers = { "CONTENT_TYPE" => "application/json",
        "ACCEPT" => "application/json"
      }

      post "/api/v1/favorites", headers: headers, params: favorite.to_json


      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(401)
      expect(json).to have_key(:error)
      expect(json[:error]).to eq("Invalid API Key")
    end

    #Happy Path Get A User's Favorites 
    #GET /api/v1/favorites
    it "can return a user's favorites" do
      user_params = {
        "name": "Odell",
        "email": "goodboy@ruffruff.com",
        "password": "treats4lyf"
      }
  
      user = User.create!(user_params)

      enchiladas = user.favorites.create!(country: "Mexico", recipe_link: "https://www.gimmesomeoven.com/best-chicken-enchiladas-ever/", recipe_title: "Chicken Enchiladas")
      spaghetti = user.favorites.create!(country: "Italy", recipe_link: "https://www.allrecipes.com/recipe/158140/spaghetti-sauce-with-ground-beef/", recipe_title: "Homeade Spaghetti")

      headers = { "CONTENT_TYPE" => "application/json",
        "ACCEPT" => "application/json"
      }

      get "/api/v1/favorites?api_key=#{user.api_key}", headers: headers

      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to be_a(Hash)
      expect(json).to have_key(:data)
      expect(json[:data]).to be_a(Array)

      json[:data].each do |favorite|
        expect(favorite).to have_key(:id)
        expect(favorite).to have_key(:type)
        expect(favorite).to have_key(:attributes)

        expect(favorite[:id]).to be_a(String)
        expect(favorite[:type]).to be_a(String)
        expect(favorite[:attributes]).to be_a(Hash)
        expect(favorite[:attributes]).to have_key(:recipe_title)
        expect(favorite[:attributes]).to have_key(:recipe_link)
        expect(favorite[:attributes]).to have_key(:country)
        expect(favorite[:attributes]).to have_key(:created_at)
      end
    end

    it "returns an empty array if the user has not favorited any recipes" do
      
      user_params = {
        "name": "Odell",
        "email": "goodboy@ruffruff.com",
        "password": "treats4lyf"
      }
  
      user = User.create!(user_params)

      headers = { "CONTENT_TYPE" => "application/json",
        "ACCEPT" => "application/json"
      }

      get "/api/v1/favorites?api_key=#{user.api_key}", headers: headers

      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json).to have_key(:data)
      expect(json[:data]).to eq([])
    end

    #Sad Path
    it "returns an error if API Key is invalid" do
    
      get "/api/v1/favorites?api_key=wrongapikey"
      
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(401)
      expect(json).to have_key(:error)
      expect(json[:error]).to eq("Invalid API Key")
    end
  end
end