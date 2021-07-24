

require "test_helper"

class EmployeeTest < ActiveSupport::TestCase
  setup do
    @employee_a = Employee.new(1, "A")
    @employee_b = Employee.new(10, "B")
  end

  test "amount paid" do
    assert_equal 100, @employee_a.amount_paid(5)
    assert_equal 150, @employee_b.amount_paid(5)
  end

end
