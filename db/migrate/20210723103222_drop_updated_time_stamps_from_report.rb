class DropUpdatedTimeStampsFromReport < ActiveRecord::Migration[6.1]
  def change
    remove_column :time_reports, :updated_at
  end
end
