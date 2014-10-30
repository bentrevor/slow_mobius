module SlowMobius
  def self.repl
    loop do
      input = Readline.readline("\n> ", true)
      new_timestamp = UpdateTime.call(Time.now.strftime('%m%d%H%M%y'), input)
      `date #{new_timestamp}`
    end
  end
end
