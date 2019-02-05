require_relative 'cards'
class Deck
  @@deck = Hash.new
  @@cardShow = Hash.new
  def initialize
    # Get the image wof 81 cards and put them in the array. Each of them has different number, color, shape and shade.

    for number in 1..3
      for color in 1..3
        for shape in 1..3
          for shade in 1..3
            state = false
            card = Cards.new(number,color,shape,shade,state)
            @@deck[card] = "C:/img/" + number.to_s + "_" + color.to_s + "_" + shape.to_s + "_" + shade.to_s
          end
        end
      end
    end
  end

  #return the deck hash
  def getDeck
    return @@deck
  end
  #Get random 12 cards and put them in the array. Then remove them from the original array.
  def getRandomCards
    0.upto 11 do
      keys = @@deck.keys
      card = keys[rand(keys.length)];
      value = @@deck.delete(card);
      @@cardShow[card]=value;
    end
    return @@cardShow
  end

  #Add 3 cards to the array of cards that will be shown to the player. And remove them from the original card array.
  def addCards
    newCards = Array.new(3)
    3.times do
      card = @@deck.keys[rand(@@deck.length)];
      address = @@deck.delete(card);
      @@cardShow[card] = address;
      newCards.push(card)
    end
    return newCards


  end

  #Remove card from the original array of cards
  def removeCard(cardsFormASet)
   for i in 0..cardsFormASet.length do
      @@cardShow.delete(cardsFormASet[i]);
    end
  end

  # Algorithm to determine 3 cards is a set or not
  def isSet?(cardChosen)
    cardA = cardChosen[0];
    cardB = cardChosen[1];
    cardC = cardChosen[2];
    set = false
    if (((cardA.getNum == cardB.getNum ) && (cardB.getNum  == cardC.getNum ) ||
        (cardA.getNum  != cardB.getNum ) && (cardA.getNum != cardC.getNum ) && (cardB.getNum  != cardC.getNum)))
      if (((cardA.getShape== cardB.getShape) && (cardB.getShape== cardC.getShape) ||
          (cardA.getShape != cardB.getShape) && (cardA.getShape != cardC.getShape) && (cardB.getShape != cardC.getShape)))
        if (((cardA.getShade == cardB.getShade) && (cardB.getShade == cardC.getShade) ||
            (cardA.getShade != cardB.getShade) && (cardA.getShade != cardC.getShade) && (cardB.getShade != cardC.getShade)))
          if (((cardA.getColor == cardB.getColor) && (cardB.getColor == cardC.getColor) ||
              (cardA.getColor != cardB.getColor) && (cardA.getColor != cardC.getColor) && (cardB.getColor != cardC.getColor)))
            set = true
          end
        end
      end
    end
    return set
  end


  #Determine if the card array shown to the user contains a set.
  def containSet?
    for cardA in @@cardShow.keys
      for cardB in @@cardShow.keys
        for cardC in @@cardShow.keys
          if cardA != cardB && cardB !=cardC && cardA!=cardC
            cards = Array.new(3)
            cards[0] = cardA
            cards[1] = cardB
            cards[2] = cardC
            if isSet?(cards)
              return true
            else

            end
          end
        end
      end
    end
  end

  # If Set on the board: highlights the next card in the Set. If no Set on board: adds three new cards
  def get_hint (cardA, cardB)
    i = 0
    cards = Array.new(3)
    cards[0] = cardA
    cards[1] = cardB
    keys = @@cardShow.keys
    while i <@@cardShow.length do
      cardC = keys[i]
      cards[2] = cardC
      if isSet?(cards)
        return cardC
      end
      i += 1
    end
    return false
  end


end
