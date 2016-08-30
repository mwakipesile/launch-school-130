class Meetup
  attr_reader :month, :year

  FIRST_DAY = {
    first: 1, second: 8, third: 15, fourth: 22, teenth: 13, last: -7
  }.freeze

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(day_of_week, week)
    first_date = Date.new(year, month, FIRST_DAY[week])
    (first_date..first_date + 6).detect { |date| date.send("#{day_of_week}?") }
  end
end
