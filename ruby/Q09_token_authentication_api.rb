# app/controllers/application_controller.rb
class ApplicationController < ActionController::API
  before_action :authenticate_request

  private

  def authenticate_request
    token = request.headers["Authorization"]&.split("Bearer ")&.last
    user = User.find_by(api_token: token)
    render json: { error: "Unauthorized" }, status: :unauthorized unless user
  end
end
