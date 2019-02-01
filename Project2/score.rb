class Score
  def initialize
    @scores = 0
    @start_time = Time.now
    @stop_time = Time.now
    @sum_time = 0
  end
   #calculate the total time of playing
    def total_time
      @sum_time = (Time.now - @start_time).round(2)
    end
    #calculate time of finding a set
     def set_time
       @set_time = (Time.now - @stop_time).round(2)
       @stop_time = Time.now
       @set_time
     end
    #If player find a set, then get one point
    def increment_score
      @score += 1
    end




end