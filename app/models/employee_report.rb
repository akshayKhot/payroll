
class EmployeeReport

  attr_accessor :employee, :pay_period, :amount_paid

  def initialize(employee, pay_period, amount_paid)
    @employee = employee
    @pay_period = pay_period
    @amount_paid = amount_paid
  end

  def belongs_to_employee_for_pay_period?(employee_id, pay_period)
    @employee.id == employee_id && @pay_period == pay_period
  end

  def add_amount_to_employee(daily_hours)
    @amount_paid += @employee.amount_paid(daily_hours.hours)
  end
end