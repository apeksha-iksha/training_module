# spec/controllers/projects_controller_spec.rb
require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  controller do
    include AdminAuthorizable

    def index
      render plain: "OK"
    end
  end

  it "blocks non-admin users" do
    user = User.create!(name: "User", admin: false)
    allow(controller).to receive(:current_user).and_return(user)
    get :index
    expect(response).to have_http_status(:forbidden)
  end
end
