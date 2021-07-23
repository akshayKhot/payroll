class PayrollController < ApplicationController

  def upload
    puts "File was uploaded"
  end

  def create
    employee_report = params[:employee_report]
    file_num = File.basename(employee_report.original_filename, ".csv").split("-").last

    if (TimeReport.exists?(file_number: file_num))
      redirect_to :controller => "payroll", :action => "duplicate"
      return
    end

    data = File.read(employee_report)
    TimeReport.parse(file_num, data)

    redirect_to :controller => "payroll", :action => "success"
  end

  def report
    payrollReport = ReportGenerator.new.generate
    render :json => payrollReport
  end

  def success
  end

  def duplicate
  end

end



# {
#   "payrollReport": {
#     "employeeReports": [
#       {
#         "employeeId": "1",
#         "payPeriod": {
#           "startDate": "2020-01-01",
#           "endDate": "2020-01-15"
#         },
#         "amountPaid": "$300.00"
#       },
#       {
#         "employeeId": "1",
#         "payPeriod": {
#           "startDate": "2020-01-16",
#           "endDate": "2020-01-31"
#         },
#         "amountPaid": "$80.00"
#       },
#       {
#         "employeeId": "2",
#         "payPeriod": {
#           "startDate": "2020-01-16",
#           "endDate": "2020-01-31"
#         },
#         "amountPaid": "$90.00"
#       }
#     ]
#   }
# }



































