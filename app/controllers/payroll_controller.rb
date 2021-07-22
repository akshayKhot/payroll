class PayrollController < ApplicationController

  def upload
    puts "File was uploaded"
  end

  def create
    employee_report = params[:employee_report]
    data = File.read(employee_report)
    TimeReport.parse(data)

    redirect_to :controller => "payroll", :action => "success"
  end

  def report
  end

  def success

  end
end
