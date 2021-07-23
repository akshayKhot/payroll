
class ReportGenerator
  def initialize
    @employee_reports = []
  end

  def generate
    # [1, 2]
    employee_ids = TimeReport.distinct.pluck(:employee_id, :job_group)
    employees = employee_ids.collect { |id| Employee.new(id[0], id[1]) }

    employee_daily_work_hours = {}

    employees.each do |emp|
      employee_daily_work_hours[emp.id] = []
    end

    TimeReport.all.order(:date).each do |time_report|
      daily_work = DailyWork.new(time_report.date, time_report.hours_worked)
      employee_daily_work_hours[time_report.employee_id] << daily_work
    end

    employee_daily_work_hours.each do |emp_id, dail_work_hours|
      dail_work_hours.each do |daily_hours|
        pay_period = PayPeriod.new(daily_hours.start_date, daily_hours.end_date)
        employee = employees.find { |emp| emp.id == emp_id }
        emp_report = @employee_reports.find { |er| er.employee_id == emp_id && er.pay_period.start_date == pay_period.start_date && er.pay_period.end_date == pay_period.end_date }

        if emp_report
          emp_report.amount_paid += employee.amount_paid(daily_hours.hours)
        else
          @employee_reports << EmployeeReport.new(emp_id, pay_period, employee.amount_paid(daily_hours.hours))
        end
      end
    end

    {
      payroll_report: {
        employee_reports: @employee_reports
      }
    }
  end
end

