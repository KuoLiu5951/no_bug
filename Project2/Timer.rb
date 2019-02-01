class Timer
  def initialize
    @startTime = Time.now;
  end

  #Get the start time.
  def getStartTime
    return @startTime;
  end

  #Calculate total time it takes.
  def totalTimeCost
    return Time.now - getStartTime;
  end

  # Set the game lasts for 1 minutes
 def gameStart
    minutes = 1
    seconds = minutes * 60
    end_time = Time.now + seconds
    while initialize < end_time
      sleep 1
    end
    puts "Game Over!"
  end
end
