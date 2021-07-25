class RenameFileNumToReportId < ActiveRecord::Migration[6.1]
  def change
    rename_column :time_reports, :file_number, :report_id
  end
end
