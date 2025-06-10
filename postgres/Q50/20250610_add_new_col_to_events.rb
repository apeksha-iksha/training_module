class AddNewColToEvents < ActiveRecord::Migration[6.1]
  def change
    # Step 1: Add nullable column (fast metadata change)
    add_column :events, :new_col, :string, null: true
  end
end
