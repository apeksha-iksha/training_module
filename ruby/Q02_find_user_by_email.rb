# app/services/user_lookup_service.rb
class UserLookupService
  def self.find_user_by_email(email)
    User.find_by(email: email)
  end
end
