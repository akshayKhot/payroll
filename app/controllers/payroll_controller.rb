class PayrollController < ApplicationController
  skip_before_action :verify_authenticity_token

  def upload
    employee_report = params[:employee_report]
    file_num = File.basename(employee_report.original_filename, ".csv").split("-").last

    if TimeReport.exists?(file_number: file_num)
      render json: {status: "error", message: "You've already uploaded a file with the same report ID."}
      return
    end

    data = File.read(employee_report)
    TimeReport.parse(file_num, data)

    render json: {status: "success", message: "The file is successfully uploaded."}
  end

  def report
    render :json => Report.new.generate
  end

end





























