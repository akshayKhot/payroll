Rails.application.routes.draw do
  get 'payroll/upload'
  get 'payroll/report'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/api/upload" => "payroll#upload"
  post "/payroll/create" => "payroll#create"

  get "/api/report" => "payroll#report"
  get "/success" => "payroll#success"
end
