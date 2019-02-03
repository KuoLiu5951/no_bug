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

  # Get 81 cards and put them in the array. Each of them has different number, color, shape and shade.
  def getCards
    numbers = [1,2,3];
    colors = [1,2,3]; # 1 is red, 2 is green, 3 is purple
    shapes = [1,2,3]; # 1 is diamond, 2 is squiggle, 3 is oval
    shades = [1,2,3]; # 1 is solid, 2 is striped, 3 is  empty
    cards = Array.new(81);
    for number in numbers
      for color in colors
        for shape in shapes
          for shade in shades
            card = Cards.initialize(number,color,shape,shade,false);
            cards.add card;
          end
        end
      end
    end
    return cards;
  end

  #Get random 12 cards and put them in the array. Then remove them from the original array.
  def getRandomCards(cards)
    i = 0;
    cardShow = Array.new()
    0.upto 12 do
      card = cards[rand(cards.length)];
      cards.delete(card);
      cardShow.add(card);
      i = i + 1;
    end
    return cardShow;
  end

  #Add 3 cards to the array of cards that will be shown to the player. And remove them from the original card array.
  def addCards(cards,cardShow)
   0.upto 3 do
     card = cards[rand(cards.length)];
     cards.delete(card);
     cardShow.add(card);
     i = i + 1;
     
   end
  end


  #Remove card from the original array of cards
  def removeCard(cards,cardsFormASet)
    0.upto cardsFormASet.length do
      cards.delete(cardsFormASet[i]);
    end
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

  #Determine if the card array shown to the user contains a set.
  def containSet(cardShow)
    for cardA in cardShow
      for cardB in cardShow
        for cardC in cardShow
          if cardA != cardB && cardB !=cardC && cardA!=cardC
            if isSet([cardA,cardB,cardC])
              return true
            end
          end
        end
      end
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
