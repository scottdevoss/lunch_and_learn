class Api::V1::UsersController < ApplicationController
  def create
    if params[:password] == params[:password_confirmation]
      existing_user = User.find_by(email: params[:email])
      new_user = User.new(
          name: params[:name],
          email: params[:email],
          password: params[:password]
        )
      if existing_user
        render json: { errors: [title: "User already exists", status: "422"]}, status: :unprocessable_entity
      elsif new_user.save
        render json: UserSerializer.new(new_user), status: :created
      end
    else
      render json: { errors: [title: "Password must match", status: "400"] }, status: :bad_request
    end
  end
end