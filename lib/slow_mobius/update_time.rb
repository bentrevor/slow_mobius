# TODO: need a better name for this, as this won't actually be updating the
# system time, just figuring out the new arg to `date`
module SlowMobius
  class UpdateTime
    def self.call(timestamp, update)
      if update =~ /\d{10}/
        update
      else
        new_timestamp(timestamp, update)
      end
    end

    def self.new_timestamp(timestamp, update)
      date = SMDate.new(timestamp)

      update.split(',').each do |change|
        unit = change[-1]
        delta = change[0..-2].to_i

        case unit
        when 'm'
          date.month += delta
        when 'd'
          date.day += delta
        when 'y'
          date.year += delta
        when 'M'
          date.minute += delta
        when 'H'
          date.hour += delta
        end
      end

      date.to_timestamp
    end
  end
end
