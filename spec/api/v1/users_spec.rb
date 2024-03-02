require "rails_helper"

RSpec.describe "User Registration" do
  it "creates a user with post info" do
    user_params = {
      "name": "Odell",
      "email": "goodboy@ruffruff.com",
      "password": "treats4lyf",
      "password_confirmation": "treats4lyf"
    }
    
    headers = { "CONTENT_TYPE" => "application/json",
      "ACCEPT" => "application/json"
    }

    post "/api/v1/users", headers: headers, params:user_params.to_json

    new_user = User.last
    expect(response.status).to eq(201)
    
    user_info = JSON.parse(response.body, symbolize_names: true)
  end
end
