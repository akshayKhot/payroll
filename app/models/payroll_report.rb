
class PayrollReport

  # Generates a payroll report containing
  # each employee's pay for the specific pay period.
  def generate
    employee_records = []

    employee_workdays.each do |employee, workdays|
      workdays.each do |workday|
        employee_record = employee_records.find { |record| record.belongs_to_employee_for_pay_period_containing_workday?(employee, workday) }

        if employee_record
          employee_record.track_payment_for_pay_period_containing(workday)
        else
          employee_records << EmployeeRecord.new(employee, workday)
        end
      end
    end

    Report.new(employee_records)
  end

  private

  # Returns a hash of employees to workdays.
  # A workday represent the day employee did the work
  # and number of hours they worked that day.
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

  # Returns a list of all employees (unique by id) in the database
  def get_all_employees
    # [[1, "A"], [2, "B"]]
    employee_ids = TimeReport.distinct.pluck(:employee_id, :job_group)
    employee_ids.collect { |id| Employee.new(id[0], id[1]) }
  end
end

