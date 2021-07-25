class PayrollController < ApplicationController
  skip_before_action :verify_authenticity_token

  def upload
    @employee_report = params[:employee_report]
    @report_id = get_report_id

    if file_already_uploaded?
      render json: {status: "error", message: "You've already uploaded a time report with the id #{@report_id}."} and return
    end

    begin
      TimeReport.parse(@report_id, File.read(@employee_report))
      render json: {status: "success", message: "The time report is successfully uploaded."}
    rescue StandardError => e
      render json: {status: "error", message: "An error occurred when uploading the time report. #{e.message}".strip}
    end
  end

  def report
    begin
      render :json => PayrollReport.new.generate
    rescue StandardError => e
      render json: {status: "error", message: "An error occurred when building the payroll report. #{e.message}".strip}
    end
  end

  private

  def file_already_uploaded?
    TimeReport.exists?(report_id: @report_id)
  end

  def get_report_id
    File.basename(@employee_report.original_filename, ".csv").split("-").last
  end
end





























