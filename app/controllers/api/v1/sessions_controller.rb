class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      render json: UserSerializer.new(user), status: :ok
    else
      render json: { errors: [title: "Bad Credentials", status: "400"]}, status: :bad_request
    end
  end
end