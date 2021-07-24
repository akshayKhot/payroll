require "test_helper"

class PayPeriodTest < ActiveSupport::TestCase
  setup do
    @workday_first = Workday.new(date: "2020-01-04", hours_worked: 10)
    @pay_period_first = PayPeriod.new(@workday_first)

    @workday_second = Workday.new(date: "2020-01-04", hours_worked: 10)
    @pay_period_second = PayPeriod.new(@workday_second)

    @workday_third = Workday.new(date: "2020-01-10", hours_worked: 10)
    @pay_period_third = PayPeriod.new(@workday_third)

    @workday_fourth = Workday.new(date: "2020-01-21", hours_worked: 10)
    @pay_period_fourth = PayPeriod.new(@workday_fourth)
  end

  test "compare same pay periods with same date" do
    assert_equal true, @pay_period_first == @pay_period_second
  end

  test "compare same pay period with different dates" do
    assert_equal true, @pay_period_first == @pay_period_third
  end

  test "compare different pay periods with different dates" do
    assert_equal false, @pay_period_first == @pay_period_fourth
  end

end
