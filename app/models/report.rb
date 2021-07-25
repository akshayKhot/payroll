class Report
  def initialize(employee_records)
    employee_reports = employee_records
                         .sort_by { |record| [record.employee.id, record.pay_period]}
                         .collect { |record| record.build_report }
    @payroll_report = { employee_reports: employee_reports }
  end
end
