
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

  def pay_employee_for(workday)
    @amount_paid += @employee.amount_paid(workday.hours)
  end

  def self.create(employee, pay_period, workday)
    amount_to_pay = employee.amount_paid(workday.hours)
    new(employee, pay_period, amount_to_pay)
  end
end