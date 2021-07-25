class Report
  def initialize(employee_records)
    employee_reports = employee_records.collect { |record| record.build_report }
    @payroll_report = { employee_reports: employee_reports }
  end
end
