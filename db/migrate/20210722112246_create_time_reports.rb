class CreateTimeReports < ActiveRecord::Migration[6.1]
  def change
    create_table :time_reports do |t|
      t.datetime :date
      t.integer :hours_worked
      t.integer :employee_id
      t.string :job_group

      t.timestamps
    end
  end
end
