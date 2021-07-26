
# Represents the pay period for an employee and
# the amount paid to that employee for that period
class EmployeeRecord

  attr_accessor :employee, :pay_period, :amount_paid

  def initialize(employee, pay_period, workday)
    @employee = employee
    @pay_period = pay_period
    @amount_paid = employee.amount_paid(workday.hours)
  end

  def belongs_to_employee_for_pay_period?(employee, pay_period)
    @employee == employee && @pay_period == pay_period
  end

  def add_payment_for(workday)
    @amount_paid += @employee.amount_paid(workday.hours)
  end

  def build_report
    {
      employee_id: @employee.id.to_s,
      pay_period: @pay_period,
      amount_paid: @amount_paid
    }
  end

end