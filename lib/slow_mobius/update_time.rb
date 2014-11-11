module SlowMobius
  class UpdateTimestamp
    def self.call(current_timestamp, update, repl_start_year = 2014)
      self.new(current_timestamp, update, repl_start_year).call
    end

    attr_accessor :current_timestamp, :update, :repl_start_year

    def initialize(current_timestamp, update, repl_start_year)
      self.current_timestamp = current_timestamp
      self.update = update
      self.repl_start_year = repl_start_year
    end

    def call
      if update =~ /\d{10}/
        update
      else
        new_timestamp
      end
    end

    def new_timestamp
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

      raise StandardError, "tried to jump too far" if out_of_range?(timestamp)
      timestamp.to_strftime
    end

    def out_of_range?(timestamp)
      delta = (timestamp.date_time.year - repl_start_year).abs
      delta > 10
    end
  end
end
