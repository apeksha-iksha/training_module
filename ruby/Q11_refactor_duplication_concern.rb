# app/controllers/concerns/admin_authorizable.rb
module AdminAuthorizable
  extend ActiveSupport::Concern

  included do
    before_action :ensure_admin
  end

  private

  def ensure_admin
    unless current_user&.admin?
      render json: { error: "Forbidden" }, status: :forbidden
    end
  end
end
