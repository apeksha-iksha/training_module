# config/environments/development.rb
Rails.application.configure do
  config.x.external_api_url = "http://localhost:3000/api"
end

# config/environments/production.rb
Rails.application.configure do
  config.x.external_api_url = "https://api.myapp.com"
end
