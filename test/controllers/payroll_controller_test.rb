require "test_helper"

class PayrollControllerTest < ActionDispatch::IntegrationTest
  test "should get report" do
    get "/api/payroll/report"
    assert_response :success

    assert_equal %Q({"payrollReport":{"employeeReports":[{"employeeId":"1","payPeriod":{"start_date":"2020-01-01","end_date":"2020-01-15"},"amountPaid":"300.0"},{"employeeId":"1","payPeriod":{"start_date":"2020-01-16","end_date":"2020-01-31"},"amountPaid":"80.0"},{"employeeId":"2","payPeriod":{"start_date":"2020-01-16","end_date":"2020-01-31"},"amountPaid":"90.0"}]}}), @response.body
  end
end
