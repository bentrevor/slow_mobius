module SlowMobius
  def self.repl
    loop do
      input = Readline.readline("\n> ", true)
      if input == 'reset'
        `osascript resetClock.AppleScript`
      else
        current_timestamp = Time.now.strftime('%m%d%H%M%y')
        new_timestamp = UpdateTimestamp.call(current_timestamp, input)
        `date #{new_timestamp}`
      end
    end
  end
end
