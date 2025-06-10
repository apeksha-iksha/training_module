# config/schedule.rb (whenever gem)
every 1.day, at: '4:30 am' do
  rake "orders:archive_old"
end

# lib/tasks/orders.rake
namespace :orders do
  desc "Archive old orders"
  task archive_old: :environment do
    Order.where("created_at < ?", 1.year.ago).update_all(status: "archived")
  end
end
