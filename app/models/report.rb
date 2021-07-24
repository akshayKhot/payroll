
class Report

  def generate
    employee_reports = []

    # Tracks each employees daily work hours
    employee_daily_work_hours = {}

    employees = get_all_employees
    employees.each { |e| employee_daily_work_hours[e] = [] }

    TimeReport.all.order(:date).each do |time_report|
      employee = employees.find { |e| e.id == time_report.employee_id }
      employee_daily_work_hours[employee] << DailyWork.new(time_report)
    end

    employee_daily_work_hours.each do |employee, dail_work_hours|
      dail_work_hours.each do |daily_hours|
        pay_period = PayPeriod.new(daily_hours.start_date, daily_hours.end_date)
        emp_report = employee_reports.find { |er| er.employee_id == employee.id &&
                                                  er.pay_period.start_date == pay_period.start_date &&
                                                  er.pay_period.end_date == pay_period.end_date }

        if emp_report
          emp_report.amount_paid += employee.amount_paid(daily_hours.hours)
        else
          employee_reports << EmployeeReport.new(employee.id, pay_period, employee.amount_paid(daily_hours.hours))
        end
      end
    end

    {
      payroll_report: {
        employee_reports: employee_reports
      }
    }
  end

  def get_all_employees
    # [1, 2]
    employee_ids = TimeReport.distinct.pluck(:employee_id, :job_group)
    employee_ids.sort_by(&:first).collect { |id| Employee.new(id[0], id[1]) }
  end
end

