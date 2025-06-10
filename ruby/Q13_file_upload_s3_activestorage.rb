# app/models/user.rb
class User < ApplicationRecord
  has_one_attached :avatar
end
