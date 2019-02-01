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

  #Determine if the time takes exceed the time restriction
  def exceedTimeRestriction(timeRestriction)
    totalTime = totalTimeCost;
    if totalTime<timeRestriction
      return false;
    end
  else
    return true;
  end
end
