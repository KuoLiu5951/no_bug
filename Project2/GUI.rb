require_relative 'deck'
Shoes.app(title: "Set Game", width: 600, height: 400) do
  flow width:1032, height:1050 do
    flow width:1.0, height: 0.1 do
      background rgb(0,157, 228)

    end

    flow width:1.0, height: 0.8 do
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

    flow width:1.0, height:0.1 do
      background rgb(139,206,236)
      para "Rest card: "
      para "State"
      para "Time"
    end
    
        button "rule" do
      link = "https://www.setgame.com/set"
      if RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/
        system "start #{link}"
      elsif RbConfig::CONFIG['host_os'] =~ /darwin/
        system "open #{link}"
      elsif RbConfig::CONFIG['host_os'] =~ /linux|bsd/
        system "xdg-open #{link}"
      end
    end
    
  end

end


