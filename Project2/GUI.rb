require_relative 'deck'
require_relative 'cards'

Shoes.app(title: "Set Game", width: 600, height: 400) do

  flow width:1080, height:1125 do
    flow width:1.0, height: 0.1 do
      background rgb(0,157, 228)
      button 'Start',width:150,height:60 do


      end
      button 'restart',width:150,height:60 do


      end
      button 'Add 3 Cards',width:150,height:60 do


      end
      button 'Hint',width:150,height:60 do


      end
      button 'Ey',width:150,height:60 do


      end
      button 'Hard',width:150,height:60 do


      end
      button 'Rule',width:150,height:60 do


      end
    end
    flow  width:1.0, height: 0.8 do
      deckClass = Deck.new
      deck = deckClass.getDeck
      cardShow = deckClass.getRandomCards
      i = 0
      cardChosen = Array.new
      while i<12
        flow width:0.25, height:0.2 do

          cards = cardShow.keys
          card= cards[i]

          @next_image = image cardShow[card] + ".png", width: 270, height:180, margin: 12
          @next_image.click do

            if !card.getState
              if cardChosen.length <3
                cardChosen.push(card )
              else
                alert "You have already chosen 3 cards!"
              end
              card.switch
            else
              cardChosen.delete(card)
              card.switch
            end

          end
        end
        i +=1
      end
      while i< 18
        flow width:0.25, height:0.2 do
          empty =image "D:/img/empty.png",width: 270, height:180, margin: 12
          empty.click do
            alert "You cannot choose an empty card!"
          end
          i = i + 1
        end

      end


    end
    flow width:1.0, height:0.1 do
      background rgb(139,206,236)
      para "Rest card: "
      para "State"
      para "Time"
    end
  end
end
