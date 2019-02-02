class Score
  
  #If player find a set, then get one point
  def Add_score(cardChosen)
    if isSet(cardChosen)
    @score += 1
    end
    return @score
  end
  
end
