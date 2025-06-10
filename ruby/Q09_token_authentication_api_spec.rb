# spec/requests/auth_spec.rb
require 'rails_helper'

RSpec.describe "Token Auth", type: :request do
  it "authenticates with valid token" do
    user = User.create!(name: "Test", api_token: "valid_token")
    get "/projects", headers: { "Authorization" => "Bearer valid_token" }
    expect(response).to have_http_status(:ok)
  end

  it "rejects with invalid token" do
    get "/projects", headers: { "Authorization" => "Bearer bad" }
    expect(response).to have_http_status(:unauthorized)
  end
end
