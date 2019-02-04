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

      cardChosen = Array.new
      flow width:0.25, height:0.2 do

        cards = cardShow.keys
        card= cards[0]
        address = cardShow[card]
        next_image = image  address + ".png", width: 270, height:180, margin: 12
        next_image.click do
          if !card.getState

            next_image.path = address + "_c.png"
            if cardChosen.length <3
              cardChosen.push(card )
              card.switch
            else
              alert "You have already chosen 3 cards!"
            end
          else
            card.switch
            next_image.path =address + "_d.png"
            cardChosen.delete(card)

          end

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
