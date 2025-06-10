# spec/models/order_spec.rb
require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "#total_price" do
    it "sums the prices of all line items" do
      order = Order.new
      order.line_items.build(product: "A", price: 10.0)
      order.line_items.build(product: "B", price: 5.5)
      expect(order.total_price).to eq(15.5)
    end

    it "returns 0 if there are no line items" do
      order = Order.new
      expect(order.total_price).to eq(0)
    end
  end
end
