# spec/services/user_lookup_service_spec.rb
require 'rails_helper'

RSpec.describe UserLookupService do
  it "finds a user by email" do
    user = User.create!(name: "Test", email: "test@example.com")
    found = UserLookupService.find_user_by_email("test@example.com")
    expect(found).to eq(user)
  end
end
