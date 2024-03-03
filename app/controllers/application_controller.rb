class ApplicationController < ActionController::API
  def authenticate_api_key
    @current_user = User.find_by(api_key: params[:api_key])

    if !@current_user
      render json: { error: "Invalid API Key" }, status: :unauthorized
    end
  end
end
