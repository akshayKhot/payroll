require "csv"

class TimeReport < ApplicationRecord

  def self.parse(file_num, data)
    time_reports = []
    CSV.parse(data, headers: true).each do |row|
      time_reports << {
                        date: row["date"],
                        hours_worked: row["hours worked"],
                        employee_id: row["employee id"],
                        job_group: row["job group"],
                        file_number: file_num,
                      }
    end

    TimeReport.insert_all(time_reports)
  end
end
