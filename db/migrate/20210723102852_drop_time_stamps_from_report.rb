class DropTimeStampsFromReport < ActiveRecord::Migration[6.1]
  def change
    remove_column :time_reports, :created_at
  end
end
