# require 'active_support/core_ext'

# A workday represent the day employee did the work
# and number of hours they worked that day.
class Workday
  attr_accessor :date, :hours

  def initialize(report)
    @date = report[:date].to_datetime
    @hours = report[:hours_worked]
  end

  def pay_period
    @date.day.between?(1, 15) ? :first : :second
  end

  def start_date
    day = pay_period == :first ? 1 : 16
    DateTime.new(@date.year, @date.month, day).strftime("%Y-%m-%d")
  end

  def end_date
    end_of_month.strftime("%Y-%m-%d")
  end

  private

  def end_of_month
    if pay_period == :second
      @date.end_of_month
    else
      DateTime.new(@date.year, @date.month, 15)
    end
  end
end
