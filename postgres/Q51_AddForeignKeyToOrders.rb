class AddForeignKeyToOrders < ActiveRecord::Migration[6.1]
  def change
    # Add FK from orders.user_id to users.id, cascade on delete
    add_foreign_key :orders, :users, on_delete: :cascade
  end
end
