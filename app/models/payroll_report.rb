class PayrollReport
  def initialize(reports)
    employee_reports = reports.collect { |report| report.build }
    @payroll_report = { employee_reports: employee_reports }
  end
end
