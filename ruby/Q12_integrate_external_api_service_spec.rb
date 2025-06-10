# spec/services/exchange_rate_service_spec.rb
require 'rails_helper'

RSpec.describe ExchangeRateService do
  it "fetches exchange rate from API", vcr: true do
    rate = ExchangeRateService.fetch_rate("USD", "EUR")
    expect(rate).to be_a(Float)
  end
end
