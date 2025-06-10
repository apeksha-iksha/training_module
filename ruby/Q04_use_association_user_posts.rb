# app/models/user.rb
class User < ApplicationRecord
  has_many :posts
end

# app/services/user_posts_service.rb
class UserPostsService
  def self.posts_for_user(user)
    user.posts
  end
end
