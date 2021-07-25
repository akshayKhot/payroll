
# Represents a biweekly date interval. Each month has two pay periods:
# the first half is from the 1st to the 15th inclusive, and
# the second half is from the 16th to the end of the month, inclusive.
class PayPeriod
  attr_accessor :start_date, :end_date

  def initialize(workday)
    @start_date = workday.start_date
    @end_date = workday.end_date
  end

  def ==(other)
    @start_date == other.start_date && @end_date == other.end_date
  end

  def <=>(other)
    @start_date <=> other.start_date
  end
end
