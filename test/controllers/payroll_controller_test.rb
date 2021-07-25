require "test_helper"

class PayrollControllerTest < ActionDispatch::IntegrationTest
  test "should get report" do
    get "/api/payroll/report"
    assert_response :success

    assert_equal %Q({"payroll_report":{"employee_reports":[{"employee_id":1,"pay_period":{"start_date":"2020-01-01","end_date":"2020-01-15"},"amount_paid":"300.0"},{"employee_id":1,"pay_period":{"start_date":"2020-01-16","end_date":"2020-01-31"},"amount_paid":"80.0"},{"employee_id":2,"pay_period":{"start_date":"2020-01-16","end_date":"2020-01-31"},"amount_paid":"90.0"}]}}), @response.body
  end
end
