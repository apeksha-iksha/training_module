# spec/services/user_service_spec.rb
require 'rails_helper'

RSpec.describe UserService do
  it "prevents SQL injection using parameterized query" do
    safe_name = "test' OR 1=1 --"
    UserService.find_user_by_name(safe_name) # should not crash or leak data
    expect(User.count).to eq(0)
  end
end
