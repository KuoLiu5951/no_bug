class Cards
  def initialize(number,color,shape,shade)
    @number = number;
    @color = color;
    @shape = shape;
    @shade = shade;
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
# Get 81 cards and put them in the array. Each of them has different number, color, shape and shade.
def getCards
  numbers = [1,2,3];
  colors = [diamond,squiggle, oval];
  shapes = [solid, striped, open];
  shades = [red, green, purple]
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
  while i < 12
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
  i = 0
  while i < cardsFormASet.length
    cards.delete(cardsFormASet[i]);
    i = i + 1;
  end
end

# Algorithm to determine 3 cards is a set or not
def isSet(card a, card b, card c)
  set = false
  if (((a.number == b.number) && (b.number == c.number) ||
      (a.number != b.number) && (a.number != c.number) && (b.number != c.number)))
    set = true
  end

  if (((a.shape== b.shape) && (b.shape== c.shape) ||
      (a.shape != b.shape) && (a.shape != c.shape) && (b.shape != c.shape)))
    set = true
  end

  if (((a.shade == b.shade) && (b.shade == c.shade) ||
      (a.shade != b.shade) && (a.shade != c.shade) && (b.shade != c.shade)))
    set = true
  end

  if (((a.color == b.color) && (b.color == c.color) ||
      (a.color != b.color) && (a.color != c.color) && (b.color != c.color)))
    set = true
  end

  return set
end

# If Set on the board: highlights the next card in the Set. If no Set on board: adds three new cards
def hint (card a, card b, cardShow,cards)
  i = 0
  while i<cardShow.length
    c = cardShow[i]
    if isSet(card a,card b, card c)
      return c
    end
    i += 1
  end
  addCards(cards,cardShow)
end