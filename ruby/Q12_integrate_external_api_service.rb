# app/services/exchange_rate_service.rb
require 'net/http'
require 'json'

class ExchangeRateService
  API_URL = "https://api.exchangerate-api.com/v4/latest/"

  def self.fetch_rate(from_currency, to_currency)
    url = URI("#{API_URL}#{from_currency}")
    response = Net::HTTP.get_response(url)
    if response.is_a?(Net::HTTPSuccess)
      data = JSON.parse(response.body)
      return data["rates"][to_currency]
    end
    nil
  rescue StandardError => e
    Rails.logger.error("ExchangeRateService error: #{e.message}")
    nil
  end
end
