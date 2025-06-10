# app/models/order.rb
class Order < ApplicationRecord
  has_many :line_items

  def total_price
    line_items.sum(&:price)
  end
end
