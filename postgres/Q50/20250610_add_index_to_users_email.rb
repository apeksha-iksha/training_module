# Q44: Migration to add unique index on users.email
class AddIndexToUsersEmail < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :email, unique: true
  end
end
