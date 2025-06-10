# app/services/log_archiver.rb
class LogArchiver
  def self.archive_old_logs
    ApplicationRecord.transaction do
      Log.where("created_at < ?", 1.year.ago).update_all(status: "archived")
    end
  end
end
