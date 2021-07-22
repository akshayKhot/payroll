require "test_helper"

class PayrollControllerTest < ActionDispatch::IntegrationTest
  test "should get upload" do
    get payroll_upload_url
    assert_response :success
  end

  test "should get report" do
    get payroll_report_url
    assert_response :success
  end
end
