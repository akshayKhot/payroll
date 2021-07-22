class AddFileNumberToTimeReports < ActiveRecord::Migration[6.1]
  def change
    add_column :time_reports, :file_number, :integer
  end
end
