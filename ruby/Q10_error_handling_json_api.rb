# app/controllers/application_controller.rb
class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActionController::ParameterMissing, with: :render_bad_request

  private

  def render_not_found(e)
    render json: { error: e.message }, status: :not_found
  end

  def render_bad_request(e)
    render json: { error: "Missing param: #{e.param}" }, status: :bad_request
  end
end
