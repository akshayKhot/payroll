class PayrollReport
  def initialize(employee_reports)
    @payroll_report = {
      employee_reports: employee_reports.collect { |report| report.build }
    }
  end
end
