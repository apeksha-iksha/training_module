# spec/requests/projects_spec.rb
require 'rails_helper'

RSpec.describe "Projects API", type: :request do
  it "returns a list of projects" do
    Project.create!(name: "Demo")
    get "/projects"
    expect(response).to have_http_status(:ok)
    expect(JSON.parse(response.body).first["name"]).to eq("Demo")
  end
end
