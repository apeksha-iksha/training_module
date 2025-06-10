namespace :events do
  desc "Backfill new_col for existing events"
  task backfill_new_col: :environment do
    Event.find_in_batches(batch_size: 10_000) do |batch|
      ids = batch.map(&:id)
      Event.where(id: ids).update_all(new_col: 'default_value')
    end
  end
end
