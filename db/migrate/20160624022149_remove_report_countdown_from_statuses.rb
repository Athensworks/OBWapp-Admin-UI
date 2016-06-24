class RemoveReportCountdownFromStatuses < ActiveRecord::Migration
  def change
    remove_column :statuses, :report_countdown
  end
end
