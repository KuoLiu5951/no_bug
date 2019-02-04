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


    flow width:1.0, height: 0.8 do
      deck = Deck.new
      deck.newDeck
      cardShow = deck.getRandomCards
      i = 0
      images = Array.new(18)
      while i<12
        flow width:0.25, height:0.2 do
          keys = cardShow.keys
          next_image = image cardShow[keys[i]], width: 270, height:180
          images[i] = next_image
        end
        i +=1
      end

      while i< 18
        next_image =image "C:/img/empty.png",width: 262, height:171
        images[i] = next_image
        i = i + 1
      end

      while deck.length >0
        cardChosen=Array.new
        count = 0
        for x in 0..18
          if images[x].click 
            if count<3
              count +=1
              if keys[x].state
                keys[x].state.switch
                cardChosen.delete(keys[x])
                border("#FFF")
              else
                cardChosen.push(keys[x])
                keys[x].state.switch
                border("#F3F",strokwidth:20)
              end
            else
              alert "You have already chose 3 cards!"
            end
          end
        end
        
        if Cards.isSet(cardChosen)
          window :title=>"Congratulations!" do
            puts "Congratulations, you chose a set!"
          end
          
        else
          window :title=>"Sorry" do
            puts "Sorry, the cards you chose cannot form a set!"
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
