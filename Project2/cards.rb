class Cards
  def initialize(number, color, shape, shade, address, c_address)
    #0 is single, 1 is double, 2 is triple
    @number = number

    # 0 is red, 1 is green, 2 is purple
    @color = color

    #0 is diamond, 1 is squiggle, 2 is oval
    @shape = shape

    # 0 is solid, 1 is striped, 2 is  empty
    @shade = shade

    # the address of images
    @address = address

    #the address of images that are clicked by users
    @c_address = c_address
  end
  
  def getAddress
    @address
  end
  
  def switch
    @address, @c_address = @c_address, @address
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
    colors = [red, green, purple];
    shapes = [diamond,squiggle, oval];
    shades = [solid, striped, empty];
    cards = Array.new(81);
    for number in numbers
      for color in colors
        for shape in shapes
          for shade in shades
            card = Cards.initialize(number,color,shape,shade);
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
    i = 0;
    while i < 3
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

  # If Set on the board: highlights the next card in the Set. If no Set on board: adds three new cards
  def hint (cardA, cardB, cardShow,cards)
    0.upto cardShow.length
      cardC = cardShow[i]
      cardChosen = [cardA,cardB,cardC]
      if isSet(cardChosen)
        return cardC
      end
      i += 1
    end
    addCards(cards,cardShow)
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

end
