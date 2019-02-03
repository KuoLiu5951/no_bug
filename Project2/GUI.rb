require_relative 'deck'
Shoes.app(title: "Set Game", width: 600, height: 400) do
  flow width:600, height:400 do
    flow width:1.0, height: 0.15 do
      background rgb(0,157, 228)
      para "Rest card: "
      para "State"
      para "Time"
    end

    flow width:1.0, height: 0.6 do
      deck = Deck.new
      deck.newDeck
      cardShow = deck.getRandomCards
      i = 0
      while i<12
        keys = cardShow.keys
        image cardShow[keys[i]]
        i = i + 1
      end
      while i< 18
        image "D:/img/empty.png"
        i = i + 1
      end
    end

    flow width:1.0, height:0.25 do
      background rgb(139,206,236)

    end
  end

end

