class UpdateHoursWorkedToDecimal < ActiveRecord::Migration[6.1]
  def change
    change_column :time_reports, :hours_worked, :decimal
  end
end
