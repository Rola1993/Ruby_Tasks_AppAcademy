class Timer
  # TODO: your code goes here!
  attr_accessor:seconds

  def initialize(seconds = 0)
    @seconds = seconds
  end

  def time_string
    return Time.at(@seconds).utc.strftime("%H:%M:%S")
  end
end
