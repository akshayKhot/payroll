
require "test_helper"

class WorkdayTest < ActiveSupport::TestCase
  setup do
    @workday_first_period = Workday.new(date: "2020-01-04", hours_worked: 10)
    @workday_second_period = Workday.new(date: "2022-10-21", hours_worked: 10)
  end

  test "pay period" do
    assert_equal :first, @workday_first_period.pay_period
    assert_equal :second, @workday_second_period.pay_period
  end

  test "start date" do
    assert_equal "2020-01-01", @workday_first_period.start_date
    assert_equal "2022-10-16", @workday_second_period.start_date
  end

  test "end date" do
    assert_equal "2020-01-15", @workday_first_period.end_date
    assert_equal "2022-10-31", @workday_second_period.end_date
  end
end
