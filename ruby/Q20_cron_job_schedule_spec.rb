# spec/tasks/orders_rake_spec.rb
require 'rails_helper'
require 'rake'

describe "orders:archive_old" do
  before :all do
    Rake.application.rake_require("tasks/orders")
    Rake::Task.define_task(:environment)
  end

  it "archives old orders" do
    old_order = Order.create!(created_at: 2.years.ago, status: "open")
    Rake::Task["orders:archive_old"].invoke
    expect(old_order.reload.status).to eq("archived")
  end
end
