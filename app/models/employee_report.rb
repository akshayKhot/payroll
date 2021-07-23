
class EmployeeReport

  attr_accessor :employee_id, :pay_period, :amount_paid

  def initialize(employee_id, pay_period, amount_paid)
    @employee_id = employee_id
    @pay_period = pay_period
    @amount_paid = amount_paid
  end
end