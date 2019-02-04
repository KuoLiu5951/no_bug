require_relative 'cards'
class Deck
  @@deck = Hash.new
  @@cardShow = Hash.new
  def initialize
    # Get the image wof 81 cards and put them in the array. Each of them has different number, color, shape and shade.
    i = 0
    while i<81 do
      for number in 1..3
        for color in 1..3
          for shape in 1..3
            for shade in 1..3
              state = false
              card = Cards.new(number,color,shape,shade,state)
              @@deck[card] = "D:/img/" + number.to_s + "_" + color.to_s + "_" + shape.to_s + "_" + shade.to_s
            end
          end
        end
      end

      i = i + 1
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
      value = @@deck[card]
      @@deck.delete(card);
      @@cardShow[card]=value;
    end
    return @@cardShow
  end

  #Add 3 cards to the array of cards that will be shown to the player. And remove them from the original card array.
  def addCards
    0.upto 3 do
      card = @@deck[rand(@@deck.length)];
      @@deck.delete(card);
      @@cardShow.add(card);
    end
  end

  #Remove card from the original array of cards
  def removeCard(cardsFormASet)
    0.upto cardsFormASet.length do
      @@deck.delete(cardsFormASet[i]);
    end
  end

  #Determine if the card array shown to the user contains a set.
  def containSet
    for cardA in @@cardShow
      for cardB in @@cardShow
        for cardC in @@cardShow
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
