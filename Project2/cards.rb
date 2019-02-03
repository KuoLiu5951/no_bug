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
    if @state = true
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





  
  # Algorithm to determine 3 cards is a set or not
  def isSet(cardChosen)
    cardA = cardChosen[0];
    cardB = cardChosen[1];
    cardC = cardChosen[2];
    set = false
    if (((cardA.number == cardB.number) && (cardB.number == cardC.number) ||
        (cardA.number != cardB.number) && (cardA.number != cardC.number) && (cardB.number != cardC.number)))
      if (((cardA.shape== cardB.shape) && (cardB.shape== cardC.shape) ||
          (cardA.shape != cardB.shape) && (cardA.shape != cardC.shape) && (cardB.shape != cardC.shape)))
        if (((cardA.shade == cardB.shade) && (cardB.shade == cardC.shade) ||
            (cardA.shade != cardB.shade) && (cardA.shade != cardC.shade) && (cardB.shade != cardC.shade)))
          if (((cardA.color == cardB.color) && (cardB.color == cardC.color) ||
              (cardA.color != cardB.color) && (cardA.color != cardC.color) && (cardB.color != cardC.color)))
            set = true
          end
        end
      end
    end
    return set
  end

  

    # If Set on the board: highlights the next card in the Set. If no Set on board: adds three new cards
    def get_hint (cardA, cardB, cardShow,cards)
      0.upto cardShow.length do
        cardC = cardShow[i]
        cardChosen = [cardA,cardB,cardC]
        if isSet(cardChosen)
          @builder['hint'].visible = false
          return cardC
        end
        i += 1
      end
      addCards(cards,cardShow)
      @builder['hint'].visible = false
    end

    def gameOver
      if gameStart == "Game Over"
        @builder['score'].label = "Score: " + @score.to_s
      end
    end

    def instruction_button(*args)
      @builder['instruction'].label = "A SET is three cards where each feature, when looked at individually, is either all
                                  the same OR all different. Each card contains four features: color (red, purple or
                                  green), shape (oval, squiggle or diamond), number (one, two or three) and
                                  shading (solid, striped or outlined). SET isa speed game."
    end

    def pause_button(*args)
      pauseTime = $Timer.Time.now
      @builder['pause'].label = "Game is stopped, time is : "+ pauseTime.to_s
      @builder['cards'].visible = false
    end

  end
