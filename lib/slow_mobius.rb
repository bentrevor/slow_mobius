module SlowMobius
  def self.repl
    previous_timestamp = nil

    loop do
      input = Readline.readline("\n> ", true)
      if input.nil?
        puts "\n\n"
        break
      elsif input == 'reset'
        `ntpdate -u time.apple.com`
      elsif input == 'undo'
        new_previous_timestamp = Time.now.strftime('%m%d%H%M%y')
        `date #{previous_timestamp}`
        previous_timestamp = new_previous_timestamp
      else
        previous_timestamp = Time.now.strftime('%m%d%H%M%y')
        new_timestamp = UpdateTimestamp.call(previous_timestamp, input)
        `date #{new_timestamp}`
      end
    end
  end
end
