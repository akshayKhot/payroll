
require "test_helper"

class EmployeeRecordTest < ActiveSupport::TestCase
  setup do
    @employee = Employee.new(1, "A")
    @workday = Workday.new(date: "2020-01-04", hours_worked: 10)
    @pay_period = PayPeriod.new(@workday)

    @employee_record = EmployeeRecord.new(@employee, @pay_period, @workday)
  end

  test "belongs to employee for pay period" do
    assert_equal true, @employee_record.belongs_to_employee_for_pay_period?(@employee, @pay_period)
  end

  test "amount paid after adding payment for pay period" do
    workday = Workday.new(date: "2020-01-06", hours_worked: 5)
    @employee_record.add_payment_for(workday)
    assert_equal "$300.00", @employee_record.amount_paid
  end

  test "build report" do
    expected = {
      employee_id: "1",
      pay_period: @pay_period,
      amount_paid: "$200.00"
    }

    payroll_report = @employee_record.build_report

    assert_equal expected, payroll_report
    assert_equal "2020-01-01", payroll_report[:pay_period].start_date
    assert_equal "2020-01-15", payroll_report[:pay_period].end_date
  end
end
