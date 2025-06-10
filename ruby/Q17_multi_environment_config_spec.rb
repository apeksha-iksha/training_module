# spec/config/environment_config_spec.rb
require 'rails_helper'

RSpec.describe "Environment Config" do
  it "loads the external API URL from environment config" do
    expect(Rails.configuration.x.external_api_url).not_to be_nil
  end
end
