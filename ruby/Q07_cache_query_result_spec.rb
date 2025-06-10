# spec/services/order_stats_service_spec.rb
require 'rails_helper'

RSpec.describe OrderStatsService do
  it "caches the total sales result" do
    Rails.cache.clear
    allow(Order).to receive(:sum).with(:amount).and_return(100).once

    first = OrderStatsService.total_sales_amount
    second = OrderStatsService.total_sales_amount

    expect(first).to eq(100)
    expect(second).to eq(100)
    expect(Order).to have_received(:sum).once
  end
end
