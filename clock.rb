class Clock
  MINUTES_IN_HOUR = 60
  HOURS_IN_DAY = 24
  MINUTES_IN_DAY = HOURS_IN_DAY * MINUTES_IN_HOUR

  attr_accessor :minutes

  def initialize(hour, minutes = 0)
    @minutes = hour * MINUTES_IN_HOUR + minutes
  end

  class << self
    alias at new # Alternatively, alias_method :at, :new (Rubocop no like!)
  end

  def +(minutes)
    self.minutes = (self.minutes + minutes + MINUTES_IN_DAY) % MINUTES_IN_DAY
    self
  end

  def -(minutes)
    self.+(-minutes)
  end

  def ==(other)
    minutes == other.minutes
  end

  def to_s
    hours = (minutes / MINUTES_IN_HOUR) % HOURS_IN_DAY
    self.minutes = minutes % MINUTES_IN_HOUR

    format('%02d:%02d', hours, minutes) # "#{'%02d' % hours}:#{'%02d' % minutes}"
  end
end
