# db/migrate/xxxxxx_add_lock_version_to_projects.rb
class AddLockVersionToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :lock_version, :integer, default: 0, null: false
  end
end

# app/models/project.rb
class Project < ApplicationRecord
end
