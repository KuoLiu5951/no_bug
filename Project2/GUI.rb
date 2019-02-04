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
        image1 = image  address + ".png", width: 270, height:180, margin: 12
        image1.click do
          if !card.getState

            image1.path = address + "_c.png"
            if cardChosen.length <3
              cardChosen.push(card )
              card.switch
            else
              alert "You have already chosen 3 cards!"
            end
          else
            card.switch
            image1.path =address + "_d.png"
            cardChosen.delete(card)

          end

        end
      end
      flow width:0.25, height:0.2 do

        cards = cardShow.keys
        card= cards[1]
        address = cardShow[card]
        image2 = image  address + ".png", width: 270, height:180, margin: 12
        image2.click do
          if !card.getState

            image2.path = address + "_c.png"
            if cardChosen.length <3
              cardChosen.push(card )
              card.switch
            else
              alert "You have already chosen 3 cards!"
            end
          else
            card.switch
            image2.path =address + "_d.png"
            cardChosen.delete(card)

          end

        end
      end

      flow width:0.25, height:0.2 do

        cards = cardShow.keys
        card= cards[2]
        address = cardShow[card]
        image3 = image  address + ".png", width: 270, height:180, margin: 12
        image3.click do
          if !card.getState

            image2.path = address + "_c.png"
            if cardChosen.length <3
              cardChosen.push(card )
              card.switch
            else
              alert "You have already chosen 3 cards!"
            end
          else
            card.switch
            image3.path =address + "_d.png"
            cardChosen.delete(card)

          end

        end
      end

      flow width:0.25, height:0.2 do

        cards = cardShow.keys
        card= cards[3]
        address = cardShow[card]
        image4 = image  address + ".png", width: 270, height:180, margin: 12
        image4.click do
          if !card.getState

            image4.path = address + "_c.png"
            if cardChosen.length <3
              cardChosen.push(card )
              card.switch
            else
              alert "You have already chosen 3 cards!"
            end
          else
            card.switch
            image4.path =address + "_d.png"
            cardChosen.delete(card)

          end

        end
      end

      flow width:0.25, height:0.2 do

        cards = cardShow.keys
        card= cards[4]
        address = cardShow[card]
        image5 = image  address + ".png", width: 270, height:180, margin: 12
        image5.click do
          if !card.getState

            image5.path = address + "_c.png"
            if cardChosen.length <3
              cardChosen.push(card )
              card.switch
            else
              alert "You have already chosen 3 cards!"
            end
          else
            card.switch
            image5.path =address + "_d.png"
            cardChosen.delete(card)

          end

        end
      end
      flow width:0.25, height:0.2 do

        cards = cardShow.keys
        card= cards[5]
        address = cardShow[card]
        image6 = image  address + ".png", width: 270, height:180, margin: 12
        image6.click do
          if !card.getState

            image6.path = address + "_c.png"
            if cardChosen.length <3
              cardChosen.push(card )
              card.switch
            else
              alert "You have already chosen 3 cards!"
            end
          else
            card.switch
            image6.path =address + "_d.png"
            cardChosen.delete(card)

          end

        end
      end
      flow width:0.25, height:0.2 do

        cards = cardShow.keys
        card= cards[6]
        address = cardShow[card]
        image7= image  address + ".png", width: 270, height:180, margin: 12
        image7.click do
          if !card.getState

            image7.path = address + "_c.png"
            if cardChosen.length <3
              cardChosen.push(card )
              card.switch
            else
              alert "You have already chosen 3 cards!"
            end
          else
            card.switch
            image7.path =address + "_d.png"
            cardChosen.delete(card)

          end

        end
      end

      flow width:0.25, height:0.2 do

        cards = cardShow.keys
        card= cards[7]
        address = cardShow[card]
        image8 = image  address + ".png", width: 270, height:180, margin: 12
        image8.click do
          if !card.getState

            image8.path = address + "_c.png"
            if cardChosen.length <3
              cardChosen.push(card )
              card.switch
            else
              alert "You have already chosen 3 cards!"
            end
          else
            card.switch
            image8.path =address + "_d.png"
            cardChosen.delete(card)

          end

        end
      end

      flow width:0.25, height:0.2 do

        cards = cardShow.keys
        card= cards[8]
        address = cardShow[card]
        image9 = image  address + ".png", width: 270, height:180, margin: 12
        image9.click do
          if !card.getState

            image9.path = address + "_c.png"
            if cardChosen.length <3
              cardChosen.push(card )
              card.switch
            else
              alert "You have already chosen 3 cards!"
            end
          else
            card.switch
            image9.path =address + "_d.png"
            cardChosen.delete(card)

          end

        end
      end

      flow width:0.25, height:0.2 do

        cards = cardShow.keys
        card= cards[9]
        address = cardShow[card]
        image10 = image  address + ".png", width: 270, height:180, margin: 12
        image10.click do
          if !card.getState

            image10.path = address + "_c.png"
            if cardChosen.length <3
              cardChosen.push(card )
              card.switch
            else
              alert "You have already chosen 3 cards!"
            end
          else
            card.switch
            image10.path =address + "_d.png"
            cardChosen.delete(card)

          end

        end
      end

      flow width:0.25, height:0.2 do

        cards = cardShow.keys
        card= cards[10]
        address = cardShow[card]
        image11 = image  address + ".png", width: 270, height:180, margin: 12
        image11.click do
          if !card.getState

            image11.path = address + "_c.png"
            if cardChosen.length <3
              cardChosen.push(card )
              card.switch
            else
              alert "You have already chosen 3 cards!"
            end
          else
            card.switch
            image11.path =address + "_d.png"
            cardChosen.delete(card)

          end

        end
      end

      flow width:0.25, height:0.2 do

        cards = cardShow.keys
        card= cards[11]
        address = cardShow[card]
        image12 = image  address + ".png", width: 270, height:180, margin: 12
        image12.click do
          if !card.getState

            image12.path = address + "_c.png"
            if cardChosen.length <3
              cardChosen.push(card )
              card.switch
            else
              alert "You have already chosen 3 cards!"
            end
          else
            card.switch
            image12.path =address + "_d.png"
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
