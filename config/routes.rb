Rails.application.routes.draw do
  post "/api/payroll/upload" => "payroll#upload"
  get "/api/payroll/report" => "payroll#report", format: "json"
end
