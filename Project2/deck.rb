class Deck

  def initialize
    # Get 81 cards and put them in the array. Each of them has different number, color, shape and shade.
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
    @deck = cards
  end

  #Get random 12 cards and put them in the array. Then remove them from the original array.
  def getRandomCards
    @cardShow = Array.new()
    0.upto 12 do
      card = @deck[rand(@deck.length)];
      @deck.delete(card);
      @cardShow.add(card);
    end
  end

  #Add 3 cards to the array of cards that will be shown to the player. And remove them from the original card array.
  def addCards
    0.upto 3 do
      card = @deck[rand(@deck.length)];
      @deck.delete(card);
      @cardShow.add(card);
    end
  end

  #Remove card from the original array of cards
  def removeCard(cardsFormASet)
    0.upto cardsFormASet.length do
      @deck.delete(cardsFormASet[i]);
    end
  end

  #Determine if the card array shown to the user contains a set.
  def containSet
    for cardA in @cardShow
      for cardB in @cardShow
        for cardC in @cardShow
          if cardA != cardB && cardB !=cardC && cardA!=cardC
            if isSet(cardChosen[cardA,cardB,cardC])
              return true
            end
          end
        end
      end
    end
  end

end