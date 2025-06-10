# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  it "attaches avatar to user" do
    user = User.create!(name: "John")
    file = fixture_file_upload("spec/fixtures/files/avatar.jpg", "image/jpeg")
    user.avatar.attach(file)
    expect(user.avatar).to be_attached
  end
end
