
Shoes.app(title: "Set Game", width: 600, height: 400) do
  flow width:600, height:400 do
    flow width:1.0, height: 0.15 do
      background rgb(0,157, 228)
      para "Rest card: "
      para "State"
      para "Time"
    end

    flow width:1.0, height: 0.6 do
      deck = Array.new
      x = 0
      while x < 81
        deck[x] = "C:/img/" + x.to_s + ".png"
        x = x + 1
      end

      cardShow = Array.new
      0.upto 11 do
        card = deck[rand(deck.length)];
        deck.delete(card);
        cardShow.push(card);
      end
      i = 0
      while i<cardShow.length
        image cardShow[i]
        i = i + 1
      end
      while i < 18
        image "C:/img/empty.png"
        i = i + 1
      end
    end

    flow width:1.0, height:0.25 do
    background rgb(139,206,236)

      end
  end

  end

