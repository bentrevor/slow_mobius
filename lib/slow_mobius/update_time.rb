# TODO: need a better name for this, as this won't actually be updating the
# system time, just figuring out the new arg to `date`
class UpdateTime
  def self.call(time, update)
    if update =~ /\d{10}/
      update
    else
      time
    end
  end
end
