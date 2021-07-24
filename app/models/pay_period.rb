class PayPeriod
  attr_accessor :start_date, :end_date

  def initialize(workday)
    @start_date = workday.start_date
    @end_date = workday.end_date
  end

  def ==(other)
    @start_date == other.start_date && @end_date == other.end_date
  end
end
