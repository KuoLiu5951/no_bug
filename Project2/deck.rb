class Deck
  @@deck = Array.new
  @@cardShow = Array.new
  def newDeck
    # Get the image wof 81 cards and put them in the array. Each of them has different number, color, shape and shade.
    i = 0
    while i<81 do
      @@deck[i] = "D:/img/" + i.to_s + ".png"
      i = i + 1
    end

  end

  #Get random 12 cards and put them in the array. Then remove them from the original array.
  def getRandomCards
    @@cardShow = Array.new
    0.upto 11 do
      card = @@deck[rand(@@deck.length)];
      @@deck.delete(card);
      @@cardShow.push(card);
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
