# app/services/user_service.rb
class UserService
  def self.find_user_by_name(name)
    User.where("name = ?", name).first
  end
end
