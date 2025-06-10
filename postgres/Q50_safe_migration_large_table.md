Add a new NOT NULL column `new_col` to a large `events` table without downtime.


1.Add column nullable (fast):
   ```ruby
   class AddNewColToEvents < ActiveRecord::Migration[6.1]
     def change
       add_column :events, :new_col, :string, null: true
     end
   end
   ```

2. Backfill data in batches:
   ```ruby
   # Run as a separate rake task or background job, not in migration
   Event.find_in_batches(batch_size: 10_000) do |batch|
     Event.where(id: batch.map(&:id)).update_all(new_col: 'default_value')
   end
   ```

3. Enforce NOT NULL and default (fast):
   ```ruby
   class EnforceNewColNotNull < ActiveRecord::Migration[6.1]
     def change
       change_column_default :events, :new_col, 'default_value'
       change_column_null    :events, :new_col, false
     end
   end
   ```
- This avoids a full table rewrite and long locks.
- Verify via `SELECT COUNT(*) FROM events WHERE new_col IS NULL;` before step 3.
