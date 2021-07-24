
class EmployeeReport

  def initialize(employee_id, pay_period, amount_paid)
    @employee_id = employee_id
    @pay_period = pay_period
    @amount_paid = amount_paid
  end

  def belongs_to_employee_for_pay_period?(employee_id, pay_period)
    @employee_id == employee_id && @pay_period == pay_period
  end

  def add_amount_to_employee(employee, daily_hours)
    amount = employee.amount_paid(daily_hours.hours)
    @amount_paid += amount
  end
end