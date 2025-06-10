# Example of using SELECT ... FOR UPDATE via ActiveRecord
def decrement_stock(product_id, amount)
  Product.transaction do
    product = Product.lock.find(product_id)  # SELECT ... FOR UPDATE
    raise "Out of stock" if product.stock < amount
    product.stock -= amount
    product.save!
  end
end

# Usage:
# decrement_stock(42, 1)
