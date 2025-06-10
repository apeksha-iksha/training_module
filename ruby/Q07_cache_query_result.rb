# app/services/order_stats_service.rb
class OrderStatsService
  def self.total_sales_amount
    Rails.cache.fetch("stats/total_sales", expires_in: 5.minutes) do
      Order.sum(:amount)
    end
  end
end
