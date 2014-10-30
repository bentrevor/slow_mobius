module SlowMobius
  class UpdateTimestamp
    def self.call(current_timestamp, update)
      if update =~ /\d{10}/
        update
      else
        new_timestamp(current_timestamp, update)
      end
    end

    def self.new_timestamp(current_timestamp, update)
      timestamp = Timestamp.new(current_timestamp)

      update.split(',').each do |change|
        unit = change[-1]
        delta = change[0..-2].to_i

        case unit
        when 'm'
          timestamp.add_months(delta)
        when 'd'
          timestamp.add_days(delta)
        when 'y'
          timestamp.add_months(delta * 12)
        when 'M'
          timestamp.add_minutes(delta)
        when 'H'
          timestamp.add_minutes(delta * 60)
        end
      end

      timestamp.to_strftime
    end
  end
end
