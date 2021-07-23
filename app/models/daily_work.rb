# require 'active_support/core_ext'

class DailyWork
  attr_accessor :date, :hours

  def initialize(date, hours)
    @date = date.to_datetime
    @hours = hours
  end

  def pay_period
    @date.day.between?(1, 15) ? :first : :second
  end

  def start_date
    if pay_period == :first
      DateTime.new(@date.year, @date.month, 1).strftime("%Y-%m-%d")
    else
      DateTime.new(@date.year, @date.month, 16).strftime("%Y-%m-%d")
    end
  end

  def end_date
    if pay_period == :second
      @date.end_of_month.strftime("%Y-%m-%d")
    else
      DateTime.new(@date.year, @date.month, 15).strftime("%Y-%m-%d")
    end
  end
end
