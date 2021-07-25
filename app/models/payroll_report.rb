
class PayrollReport

  def generate
    employee_records = []

    employee_workdays.each do |employee, workdays|
      workdays.each do |workday|
        pay_period = PayPeriod.new(workday)
        employee_record = employee_records.find { |er| er.belongs_to_employee_for_pay_period?(employee, pay_period) }

        if employee_record
          employee_record.pay_employee_for(workday)
        else
          employee_records << EmployeeRecord.new(employee, pay_period, workday)
        end
      end
    end

    Report.new(employee_records)
  end

  private

  def employee_workdays
    employee_workdays = {}
    employees = get_all_employees

    TimeReport.all.order(:date).each do |time_report|
      employee = employees.find { |e| e.id == time_report.employee_id }
      employee_workdays[employee] ||= []
      employee_workdays[employee] << Workday.new(time_report)
    end

    employee_workdays
  end

  def get_all_employees
    employee_ids = TimeReport.distinct.pluck(:employee_id, :job_group)
    employee_ids.sort_by(&:first).collect { |id| Employee.new(id[0], id[1]) }
  end
end

