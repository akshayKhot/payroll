
class Employee
  attr_reader :id

  def initialize(id, job_group)
    @id = id
    @job_group = job_group
  end

  def amount_paid(hours)
    case @job_group
    when "A"
      hours * 20
    when "B"
      hours * 30
    else
      0
    end
  end
end