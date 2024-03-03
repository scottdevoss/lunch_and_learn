require "rails_helper"

RSpec.describe "Favorites", type: :request do
  describe "Add recipes to a favorited list for a particular user", :vcr do
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
  end
end