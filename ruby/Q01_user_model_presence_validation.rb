# app/models/user.rb
class User < ApplicationRecord
  validates :name, presence: true
end
