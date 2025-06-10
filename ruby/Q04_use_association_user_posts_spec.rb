# spec/services/user_posts_service_spec.rb
require 'rails_helper'

RSpec.describe UserPostsService do
  it "returns posts for the given user" do
    user = User.create!(name: "Alice")
    post = user.posts.create!(title: "Hello")
    expect(UserPostsService.posts_for_user(user)).to include(post)
  end
end
