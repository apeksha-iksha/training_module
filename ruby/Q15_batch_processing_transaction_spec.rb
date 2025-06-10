# spec/services/log_archiver_spec.rb
require 'rails_helper'

RSpec.describe LogArchiver do
  it "archives old logs in a transaction" do
    old_log = Log.create!(message: "Old", created_at: 2.years.ago, status: "open")
    LogArchiver.archive_old_logs
    expect(old_log.reload.status).to eq("archived")
  end
end
