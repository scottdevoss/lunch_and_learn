require "rails_helper"

RSpec.describe "User" do
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
    
    expect(response.status).to eq(201)
    
    user = JSON.parse(response.body, symbolize_names: true)

    expect(user).to be_a(Hash)
    expect(user).to have_key(:data)
    expect(user[:data]).to have_key(:id)
    expect(user[:data]).to have_key(:type)
    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:attributes]).to have_key(:name)
    expect(user[:data][:attributes][:name]).to be_a(String)

    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes][:email]).to be_a(String)

    expect(user[:data][:attributes]).to have_key(:api_key)
    expect(user[:data][:attributes][:api_key]).to be_a(String)
  end

  #Sad Path
  it "gives an error if the passwords do not match" do
    user_params = {
      "name": "Odell",
      "email": "goodboy@ruffruff.com",
      "password": "treats4lyf",
      "password_confirmation": "wrongpassword"
    }
    
    headers = { "CONTENT_TYPE" => "application/json",
      "ACCEPT" => "application/json"
    }

    post "/api/v1/users", headers: headers, params:user_params.to_json
    
    expect(response.status).to eq(400)

    error = JSON.parse(response.body, symbolize_names: true)

    expect(error).to have_key(:errors)
    expect(error[:errors]).to be_a(Array)
    expect(error[:errors][0]).to have_key(:title)
    expect(error[:errors][0]).to have_key(:status)
    expect(error[:errors][0][:title]).to eq("Password must match")
    expect(error[:errors][0][:status]).to eq("400")
  end

  it "gives an error if the user already exists" do
    user_params = {
      "name": "Odell",
      "email": "goodboy@ruffruff.com",
      "password": "treats4lyf",
      "password_confirmation": "treats4lyf"
    }
    old_user = User.create!(user_params)
   
    headers = { "CONTENT_TYPE" => "application/json",
      "ACCEPT" => "application/json"
    }

    post "/api/v1/users", headers: headers, params:user_params.to_json
    
    expect(response.status).to eq(422)

    error = JSON.parse(response.body, symbolize_names: true)

    expect(error).to have_key(:errors)
    expect(error[:errors]).to be_a(Array)
    expect(error[:errors][0]).to have_key(:title)
    expect(error[:errors][0]).to have_key(:status)
    expect(error[:errors][0][:title]).to eq("User already exists")
    expect(error[:errors][0][:status]).to eq("422")
  end

  it "logs in a user" do
    user_params = {
      "name": "Odell",
      "email": "goodboy@ruffruff.com",
      "password": "treats4lyf"
    }

    user = User.create!(user_params)

    
    headers = { "CONTENT_TYPE" => "application/json",
      "ACCEPT" => "application/json"
    }

    post '/api/v1/sessions', headers: headers, params: user_params.to_json 

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user).to be_a(Hash)
    expect(user).to have_key(:data)
    expect(user[:data]).to have_key(:id)
    expect(user[:data]).to have_key(:type)
    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:attributes]).to have_key(:name)
    expect(user[:data][:attributes][:name]).to be_a(String)

    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes][:email]).to be_a(String)

    expect(user[:data][:attributes]).to have_key(:api_key)
    expect(user[:data][:attributes][:api_key]).to be_a(String)
  end
end
