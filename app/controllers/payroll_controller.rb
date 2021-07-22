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
  end

  def success
  end

  def duplicate
  end

end
