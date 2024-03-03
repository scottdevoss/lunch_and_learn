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
require 'pry'; binding.pry
      post "/api/v1/favorites"

      expect(response).to be_successful
      expect(response.status).to eq(201)
    end
  end
end