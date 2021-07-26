
# Represents the pay period for an employee and
# the amount paid to that employee for that period
class EmployeeRecord

  attr_reader :pay_period
  attr_accessor :employee, :amount_paid

  def initialize(employee, workday)
    @employee = employee
    @pay_period = PayPeriod.for(workday)
    @amount_paid = employee.amount_paid(workday.hours)
  end

  def belongs_to_employees_pay_period_for_workday?(employee, workday)
    @employee == employee && @pay_period == PayPeriod.for(workday)
  end

  def track_payment_for_pay_period_containing(workday)
    @amount_paid += @employee.amount_paid(workday.hours)
  end

  def build_report
    {
      employee_id: @employee.id.to_s,
      pay_period: @pay_period,
      amount_paid: amount_paid
    }
  end

  def amount_paid
    rounded_to_two_decimals = "%.2f" % @amount_paid
    "$#{rounded_to_two_decimals}"
  end

end