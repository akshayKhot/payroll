
class EmployeeReport

  attr_accessor :employee_id, :pay_period, :amount_paid

  def initialize(employee_id, pay_period, amount_paid)
    @employee_id = employee_id
    @pay_period = pay_period
    @amount_paid = amount_paid
  end

  def belongs_to_employee_for_pay_period?(employee_id, pay_period)
    @employee_id == employee_id &&
    @pay_period.start_date == pay_period.start_date &&
    @pay_period.end_date == pay_period.end_date
  end
end