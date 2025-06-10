# spec/jobs/send_welcome_email_job_spec.rb
require 'rails_helper'

RSpec.describe SendWelcomeEmailJob, type: :job do
  include ActiveJob::TestHelper

  it "queues the job" do
    ActiveJob::Base.queue_adapter = :test
    user = User.create!(name: "Test", email: "test@example.com")
    expect {
      SendWelcomeEmailJob.perform_later(user.id)
    }.to have_enqueued_job.with(user.id)
  end
end
