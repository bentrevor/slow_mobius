# TODO: also a bad name, but I really don't want another Date class, even if
# it's in my own module
class SMDate
  attr_accessor :month, :day, :hour, :minute, :year

  def initialize(timestamp)
    self.month  = timestamp[0..1].to_i
    self.day    = timestamp[2..3].to_i
    self.hour   = timestamp[4..5].to_i
    self.minute = timestamp[6..7].to_i
    self.year   = timestamp[8..9].to_i
  end

  def to_timestamp
    "#{pad(month)}#{pad(day)}#{pad(hour)}#{pad(minute)}#{pad(year)}"
  end

  def pad(unit)
    u = unit.to_s
    case u.length
    when 0
      '00'
    when 1
      '0' + u
    else
      u
    end
  end
end
