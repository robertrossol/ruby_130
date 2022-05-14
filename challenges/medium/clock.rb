

class Clock
  attr_writer :hours, :minutes

  def initialize(hours, minutes = 0)
    @hours = hours
    @minutes = minutes
  end

  def hours
    @hours % 24
  end

  def minutes
    @minutes #% 60
  end

  def self.at(hours, minutes = 0)
    self.new(hours, minutes)
    # "#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}"
  end

  def to_s
    "#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}"
    # format('%02d:%02d', hour, minute);
  end

  def +(minutes)
    # self.minutes += minutes
    # self.hours, self.minutes = (self.minutes + minutes).divmod(60)[0] + self.hours, (self.minutes + minutes)%60
    hour_mod, self.minutes = (self.minutes + minutes).divmod(60)
    self.hours += hour_mod
    self
  end

  def -(minutes)
    hour_mod, self.minutes = (self.minutes - minutes).divmod(60)
    self.hours += hour_mod
    self
  end

  def ==(other_clock)
    to_s == other_clock.to_s
  end
end

x = Clock.at(8, 8)
y = Clock.at(8, 8)
p x
p y
p x.to_s
p y.to_s
p x == y
p Clock.at(8, 42)
p Clock.at(11, 3)
x + 5
p x.to_s
x - 15
p x.to_s
puts Clock.at(23, 50) + 25
