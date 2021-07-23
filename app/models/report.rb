# require 'active_support/core_ext'
#
# class Report
#   def generate
#     records = TimeReport.all
#
#     @employee_reports = []
#
#     records.each do |record|
#
#       employee = Employee.new(record.hours_worked, record.job_group)
#       emp_reports = @employee_reports.find_all { |r| r.employee_id == record.employee_id }
#
#       if emp_reports.any?
#         if record.date.day.between?(1, 15)
#           emp_reports[0].amount_paid += employee.amount_paid
#         else
#           emp_reports[1].amount_paid += employee.amount_paid
#         end
#       else
#         if record.date.day.between?(1, 15)
#           @employee_reports << EmployeeReport.new(record.employee_id, pay_period_for(record.date, :first), employee.amount_paid)
#           @employee_reports << EmployeeReport.new(record.employee_id, pay_period_for(record.date, :second), 0)
#         else
#           @employee_reports << EmployeeReport.new(record.employee_id, pay_period_for(record.date, :first), 0)
#           @employee_reports << EmployeeReport.new(record.employee_id, pay_period_for(record.date, :second), employee.amount_paid)
#         end
#       end
#
#     end
#
#     {
#       payroll_report: {
#         employee_reports: @employee_reports
#       }
#     }
#   end
#
#   def pay_period_for(date_str, period)
#     date = date_str.to_datetime
#
#     start_date = period == :first ? 1 : 16
#     end_date = period == :second ? date.end_of_month.day: 15
#
#     return {
#       start_date: Date.new(date.year, date.month, start_date),
#       end_date: Date.new(date.year, date.month, end_date)
#     }
#   end
#
#   def belongs_to_pay_period?(date, pay_period)
#
#   end
#
# end
#
