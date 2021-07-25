class PayrollController < ApplicationController
  skip_before_action :verify_authenticity_token

  def upload
    @employee_report = params[:employee_report]
    @report_id = get_report_id

    if file_already_uploaded?
      render json: {status: "error", message: "You've already uploaded a file with the id #{@report_id}."} and return
    end

    TimeReport.parse(@report_id, File.read(@employee_report))
    render json: {status: "success", message: "The file is successfully uploaded."}
  end

  def report
    render :json => Report.new.generate
  end

  private

  def file_already_uploaded?
    TimeReport.exists?(file_number: @report_id)
  end

  def get_report_id
    File.basename(@employee_report.original_filename, ".csv").split("-").last
  end

end





























