class Cards
  def initialize(number, color, shape, shade, state)
    #1 is single, 2 is double, 3 is triple
    @number = number

    #1 is red, 2 is green, 3 is purple
    @color = color

    #1 is diamond, 2 is squiggle, 3 is oval
    @shape = shape

    #1 is solid, 2 is striped, 3 is  empty
    @shade = shade

    #Chosen means this card is chosen by the user. UnChosen means this card is not chosen by the user.
    @state = state
  end

  #Get the state of the card.
  def getState
    return @state
  end

  #Change the state of the card.
  def switch
    if @state
      @state  = false
    else
      @state  = true
    end
  end

  def getNum
    return @number;
  end

  def getColor
    return @color;
  end

  def getShape
    return @shape;
  end

  def getShade
    return @shade;
  end


end
