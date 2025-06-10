# spec/models/project_spec.rb
require 'rails_helper'

RSpec.describe Project, type: :model do
  it "raises error on concurrent update using optimistic locking" do
    project = Project.create!(name: "Initial")
    proj_copy1 = Project.find(project.id)
    proj_copy2 = Project.find(project.id)

    proj_copy1.update!(name: "Update A")

    expect {
      proj_copy2.update!(name: "Update B")
    }.to raise_error(ActiveRecord::StaleObjectError)
  end
end
