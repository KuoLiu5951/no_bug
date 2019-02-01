class Timer
  def initialize
    @startTime = Time.now;
  end

  #Get the start time.
  def getStartTime
    return @startTime;
  end

  # Set the game lasts for 1 minutes
 def gameStart
    minutes = 1
    seconds = minutes * 60
    end_time = Time.now + seconds
    while Time.now < end_time
      sleep 1
    end
    puts "Game Over!"
  end
end
