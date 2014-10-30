class SlowMobius::Timestamp
  attr_accessor :date_time

  def initialize(timestamp)
    self.date_time = DateTime.strptime(timestamp, strf)
  end

  def add_months(months)
    self.date_time = date_time >> months
  end

  def add_days(days)
    self.date_time += days
  end

  def add_minutes(minutes)
    self.date_time += (minutes / (24.0 * 60))
  end

  def to_strftime
    date_time.strftime(strf)
  end

  private

  def strf
    '%m%d%H%M%y'
  end
end
