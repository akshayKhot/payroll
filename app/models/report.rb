
class Report

  def generate
    employee_reports = []

    # Tracks each employees daily work hours
    employee_workdays = {}

    employees = get_all_employees
    employees.each { |e| employee_workdays[e] = [] }

    TimeReport.all.order(:date).each do |time_report|
      employee = employees.find { |e| e.id == time_report.employee_id }
      employee_workdays[employee] << Workday.new(time_report)
    end

    employee_workdays.each do |employee, workdays|
      workdays.each do |workday|
        pay_period = PayPeriod.new(workday)
        emp_report = employee_reports.find { |er| er.belongs_to_employee_for_pay_period?(employee.id, pay_period) }

        if emp_report
          emp_report.pay_employee_for(workday)
        else
          employee_reports << EmployeeReport.new(employee, pay_period, workday)
        end
      end
    end

    {
      payroll_report: {
        employee_reports: employee_reports.collect do |er|
          {
            employee_id: er.employee.id,
            pay_period: er.pay_period,
            amount_paid: er.amount_paid
          }
        end
      }
    }
  end

  def get_all_employees
    # [1, 2]
    employee_ids = TimeReport.distinct.pluck(:employee_id, :job_group)
    employee_ids.sort_by(&:first).collect { |id| Employee.new(id[0], id[1]) }
  end
end

