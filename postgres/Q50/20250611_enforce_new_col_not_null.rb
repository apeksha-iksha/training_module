class EnforceNewColNotNull < ActiveRecord::Migration[6.1]
  def change
    # Step 3: Set default and enforce NOT NULL
    change_column_default :events, :new_col, 'default_value'
    change_column_null    :events, :new_col, false
  end
end
