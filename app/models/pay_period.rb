class PayPeriod
  attr_accessor :start_date, :end_date

  def initialize(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
  end

  def ==(other)
    @start_date == other.start_date && @end_date == other.end_date
  end
end
