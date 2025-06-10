# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  it "is invalid without a name" do
    user = User.new(name: "")
    expect(user).not_to be_valid
    expect(user.errors[:name]).to include("can't be blank")
  end
end
