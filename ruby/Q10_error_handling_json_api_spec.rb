# spec/requests/error_handling_spec.rb
require 'rails_helper'

RSpec.describe "Error Handling", type: :request do
  it "returns 404 for record not found" do
    get "/projects/999999"
    expect(response).to have_http_status(:not_found)
  end

  it "returns 400 for missing param" do
    post "/projects", params: {}, as: :json
    expect(response).to have_http_status(:bad_request)
  end
end
