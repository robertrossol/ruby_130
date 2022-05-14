require 'date'

#Useful Date methods:
# mday = day of month (1-31)
# wday = day of week (0-6, sunday is 0)
# (day of week)? =  true if date is that day of week (i.e., date.wednesday? == true)
#Constants:
#Date::DAYNAMES = ["Sunday", "Monday"...]
#Date::MONTHNAMES = [nil, "January", "February"...]

# Define a class Meetup with a constructor taking a month and a year
# and a method day(weekday, schedule).
# where weekday is one of: monday, tuesday, wednesday, etc.
# and schedule is first, second, third, fourth, fifth, last, or teenth.

class Meetup

  SCHEDULE_OPTIONS = %w(first second third fourth fifth last teenth)
  SCHEDULE_OPTIONS_HASH = %w(first second third fourth fifth last).zip([0, 1, 2, 3, 4, -1]).to_h

  attr_reader :target_month, :year, :month

  def initialize(year, month)
    @year = year
    @month = month
    @target_month = Date.new(year, month)
  end

  def day(weekday, schedule)
    if schedule.downcase == 'teenth'
      correct_day = teenth(weekday)
    else
      # days_of_month = (target_month..(target_month >> 1)-1)
      # weekdays = days_of_month.select { |day| day.send("#{weekday.downcase}?") }
      # correct_day = weekdays[SCHEDULE_OPTIONS_HASH[schedule]]
      correct_day = get_day(weekday, schedule)
    end
    return nil if correct_day.nil?
    correct_day_of_month = correct_day.mday
    Date.new(year, month, correct_day_of_month)
  end

  def get_day(weekday, schedule)
    days_of_month = (target_month..(target_month >> 1)-1)
    weekdays = days_of_month.select { |day| day.send("#{weekday.downcase}?") }
    weekdays[SCHEDULE_OPTIONS_HASH[schedule.downcase]]
  end

  def teenth(weekday)
    days_of_month = (Date.new(year, month, 13)..Date.new(year, month, 19))
    days_of_month.select { |day| day.send("#{weekday.downcase}?") }.first
    # correct_day_of_month = correct_day.mday
  end
end

x = Meetup.new(2013, 4)
p x.day('MONDAY', 'first')