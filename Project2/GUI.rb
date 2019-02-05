require_relative 'deck'
require_relative 'cards'



Shoes.app(title: "Set Game", width: 600, height: 400) do
  deckClass = Deck.new
  @@deck = deckClass.getDeck
  @@cardShow = deckClass.getRandomCards
  $cardChosen = Array.new


  $score = 0



  flow width:1080, height:1125 do
    flow width:1.0, height: 0.1 do
      background rgb(0,157, 228)
      button 'Start',width:150,height:60 do


      end
      button 'restart',width:150,height:60 do
        deckClass = Deck.new
        @@deck = deckClass.getDeck
        @@cardShow = deckClass.getRandomCards
        $cardChosen = Array.new
      end




      button 'Add 3 Cards',width:150,height:60 do
        if deckClass.containSet?
          alert "There is a set among these cards!"
        else
          deckClass.addCards

        end
      end




      button 'Hint',width:150,height:60 do
        if $cardChosen.length != 2
          alert "You must choose 2 cards before click hint!"
        else
          hint = deckClass.get_hint($cardChosen[0], $cardChosen[1])
          if not hint == false
            card = hint
            window :title => "Hint" do
              image @@cardShow[card] + ".png"
            end
          else
            alert "You chose the wrong cards!"
          end

        end

      end
      button 'Easy',width:150,height:60 do


      end
      button 'Hard',width:150,height:60 do


      end
      button 'Rule',width:150,height:60 do


      end

      para "Score:"
      $score_field = para $score
      $score_field.replace ($score)
    end
    flow  width:1.0, height: 0.8 do

      flow width:0.25, height:0.2 do

        cards = @@cardShow.keys
        card= cards[0]
        address = @@cardShow[card]
        @image1 = image  address + ".png", width: 270, height:180, margin: 12
        @image1.click do
          if  $cardChosen.length < 2
            if !card.getState
              @image1.path = address + "_c.png"
              $cardChosen.push(card )
              card.switch
            else
              card.switch
              @image1.path =address + "_d.png"
              $cardChosen.delete(card)
            end
          else
            if !card.getState
              @image1.path = address + "_c.png"
              card.switch
              $cardChosen.push(card )
              if deckClass.isSet?($cardChosen)
                alert "Congratulations! This is a set!"

                $score +=1
                $score_field.replace ($score)

                newCards = deckClass.addCards
                for i in 0..3 do
                  cardChoose = $cardChosen[i]
                  index = @@cardShow.keys.index(cardChoose)
                  newAddress = newCards[newCards.keys[i]] + "_d.png"

                  case index
                  when 0
                    @image1.path = newAddress
                  when 1
                    @image2.path = newAddress
                  when 2
                    @image3.path = newAddress
                  when 3
                    @image4.path = newAddress
                  when 4
                    @image5.path =newAddress
                  when 5
                    @image6.path = newAddress
                  when 6
                    @image7.path =  newAddress
                  when 7
                    @image8.path =  newAddress
                  when 8
                    @image9.path =  newAddress
                  when 9
                    @image10.path = newAddress
                  when 10
                    @image11.path =  newAddress
                  when 11
                    @image12.path =  newAddress
                  end

                end
                deckClass.removeCard($cardChosen)
                @@cardShow = newCards.merge(@@cardShow)
                $cardChosen = Array.new()
              else
                alert "Not a set! Try again!"

              end
            else
              @image1.path = address + "_d.png"
              card.switch

              $cardChosen.delete(card )
            end

          end

        end
      end

      flow width:0.25, height:0.2 do

        cards = @@cardShow.keys
        card= cards[1]
        address = @@cardShow[card]
        @image2 = image  address + ".png", width: 270, height:180, margin: 12
        @image2.click do
          if  $cardChosen.length < 2
            if !card.getState
              @image2.path = address + "_c.png"
              $cardChosen.push(card )
              card.switch
            else
              card.switch
              @image2.path =address + "_d.png"
              $cardChosen.delete(card)
            end
          else
            if !card.getState
              card.switch
              @image2.path = address + "_c.png"
              $cardChosen.push(card )
              if deckClass.isSet?($cardChosen)
                alert "Congratulations! This is a set!"

                $score +=1
                $score_field.replace ($score)

                newCards = deckClass.addCards
                for i in 0..3 do
                  cardChoose = $cardChosen[i]
                  index = @@cardShow.keys.index(cardChoose)
                  newAddress = newCards[newCards.keys[i]] + "_d.png"

                  case index
                  when 0
                    @image1.path = newAddress
                  when 1
                    @image2.path = newAddress
                  when 2
                    @image3.path = newAddress
                  when 3
                    @image4.path = newAddress
                  when 4
                    @image5.path =newAddress
                  when 5
                    @image6.path = newAddress
                  when 6
                    @image7.path =  newAddress
                  when 7
                    @image8.path =  newAddress
                  when 8
                    @image9.path =  newAddress
                  when 9
                    @image10.path = newAddress
                  when 10
                    @image11.path =  newAddress
                  when 11
                    @image12.path =  newAddress
                  end

                end
                deckClass.removeCard($cardChosen)
                @@cardShow = newCards.merge(@@cardShow)
                $cardChosen = Array.new()
              else
                alert "Not a set! Try again!"

              end
            else
              @image2.path = address + "_d.png"
              card.switch
              $cardChosen.delete(card )
            end
          end

        end
      end

      flow width:0.25, height:0.2 do

        cards = @@cardShow.keys
        card= cards[2]
        address = @@cardShow[card]
        @image3 = image  address + ".png", width: 270, height:180, margin: 12
        @image3.click do
          if  $cardChosen.length < 2
            if !card.getState
              @image3.path = address + "_c.png"
              $cardChosen.push(card )
              card.switch
            else
              card.switch
              @image3.path =address + "_d.png"
              $cardChosen.delete(card)
            end
          else
            if !card.getState
              card.switch
              @image3.path = address + "_c.png"
              $cardChosen.push(card )
              if deckClass.isSet?($cardChosen)
                alert "Congratulations! This is a set!"

                $score +=1
                $score_field.replace ($score)

                newCards = deckClass.addCards
                for i in 0..3 do
                  cardChoose = $cardChosen[i]
                  index = @@cardShow.keys.index(cardChoose)
                  newAddress = newCards[newCards.keys[i]] + "_d.png"

                  case index
                  when 0
                    @image1.path = newAddress
                  when 1
                    @image2.path = newAddress
                  when 2
                    @image3.path = newAddress
                  when 3
                    @image4.path = newAddress
                  when 4
                    @image5.path =newAddress
                  when 5
                    @image6.path = newAddress
                  when 6
                    @image7.path =  newAddress
                  when 7
                    @image8.path =  newAddress
                  when 8
                    @image9.path =  newAddress
                  when 9
                    @image10.path = newAddress
                  when 10
                    @image11.path =  newAddress
                  when 11
                    @image12.path =  newAddress
                  end

                end
                deckClass.removeCard($cardChosen)
                @@cardShow = newCards.merge(@@cardShow)
                $cardChosen = Array.new()
              else
                alert "Not a set! Try again!"

              end
            else
              card.switch
              @image3.path = address + "_d.png"
              $cardChosen.delete(card )
            end
          end

        end
      end

      flow width:0.25, height:0.2 do

        cards = @@cardShow.keys
        card= cards[3]
        address = @@cardShow[card]
        @image4 = image  address + ".png", width: 270, height:180, margin: 12
        @image4.click do
          if  $cardChosen.length < 2
            if !card.getState
              @image4.path = address + "_c.png"
              $cardChosen.push(card )
              card.switch
            else
              card.switch
              @image4.path =address + "_d.png"
              $cardChosen.delete(card)
            end
          else
            if !card.getState
              card.switch
              @image4.path = address + "_c.png"
              $cardChosen.push(card )
              if deckClass.isSet?($cardChosen)
                alert "Congratulations! This is a set!"

                $score +=1
                $score_field.replace ($score)

                newCards = deckClass.addCards
                for i in 0..3 do
                  cardChoose = $cardChosen[i]
                  index = @@cardShow.keys.index(cardChoose)
                  newAddress = newCards[newCards.keys[i]] + "_d.png"

                  case index
                  when 0
                    @image1.path = newAddress
                  when 1
                    @image2.path = newAddress
                  when 2
                    @image3.path = newAddress
                  when 3
                    @image4.path = newAddress
                  when 4
                    @image5.path =newAddress
                  when 5
                    @image6.path = newAddress
                  when 6
                    @image7.path =  newAddress
                  when 7
                    @image8.path =  newAddress
                  when 8
                    @image9.path =  newAddress
                  when 9
                    @image10.path = newAddress
                  when 10
                    @image11.path =  newAddress
                  when 11
                    @image12.path =  newAddress
                  end

                end
                deckClass.removeCard($cardChosen)
                @@cardShow = newCards.merge(@@cardShow)
                $cardChosen = Array.new()
              else
                alert "Not a set! Try again!"

              end
            else
              card.switch
              @image4.path = address + "_d.png"
              $cardChosen.delete(card )
            end
          end

        end
      end

      flow width:0.25, height:0.2 do

        cards = @@cardShow.keys
        card= cards[4]
        address = @@cardShow[card]
        @image5 = image  address + ".png", width: 270, height:180, margin: 12
        @image5.click do
          if  $cardChosen.length < 2
            if !card.getState
              @image5.path = address + "_c.png"
              $cardChosen.push(card )
              card.switch
            else
              card.switch
              @image5.path =address + "_d.png"
              $cardChosen.delete(card)
            end
          else
            if !card.getState
              card.switch
              @image5.path = address + "_c.png"
              $cardChosen.push(card )
              if deckClass.isSet?($cardChosen)
                alert "Congratulations! This is a set!"

                $score +=1
                $score_field.replace ($score)

                newCards = deckClass.addCards
                for i in 0..3 do
                  cardChoose = $cardChosen[i]
                  index = @@cardShow.keys.index(cardChoose)
                  newAddress = newCards[newCards.keys[i]] + "_d.png"

                  case index
                  when 0
                    @image1.path = newAddress
                  when 1
                    @image2.path = newAddress
                  when 2
                    @image3.path = newAddress
                  when 3
                    @image4.path = newAddress
                  when 4
                    @image5.path =newAddress
                  when 5
                    @image6.path = newAddress
                  when 6
                    @image7.path =  newAddress
                  when 7
                    @image8.path =  newAddress
                  when 8
                    @image9.path =  newAddress
                  when 9
                    @image10.path = newAddress
                  when 10
                    @image11.path =  newAddress
                  when 11
                    @image12.path =  newAddress
                  end

                end
                deckClass.removeCard($cardChosen)
                @@cardShow = newCards.merge(@@cardShow)
                $cardChosen = Array.new()
              else
                alert "Not a set! Try again!"

              end
            else
              card.switch
              @image5.path = address + "_d.png"
              $cardChosen.delete(card )
            end
          end

        end
      end

      flow width:0.25, height:0.2 do

        cards = @@cardShow.keys
        card= cards[5]
        address = @@cardShow[card]
        @image6 = image  address + ".png", width: 270, height:180, margin: 12
        @image6.click do
          if  $cardChosen.length < 2
            if !card.getState
              @image6.path = address + "_c.png"
              $cardChosen.push(card )
              card.switch
            else
              card.switch
              @image6.path =address + "_d.png"
              $cardChosen.delete(card)
            end
          else
            if !card.getState
              card.switch

              @image6.path = address + "_c.png"
              $cardChosen.push(card )
              if deckClass.isSet?($cardChosen)
                alert "Congratulations! This is a set!"

                $score +=1
                $score_field.replace ($score)

                newCards = deckClass.addCards
                for i in 0..3 do
                  cardChoose = $cardChosen[i]
                  index = @@cardShow.keys.index(cardChoose)
                  newAddress = newCards[newCards.keys[i]] + "_d.png"

                  case index
                  when 0
                    @image1.path = newAddress
                  when 1
                    @image2.path = newAddress
                  when 2
                    @image3.path = newAddress
                  when 3
                    @image4.path = newAddress
                  when 4
                    @image5.path =newAddress
                  when 5
                    @image6.path = newAddress
                  when 6
                    @image7.path =  newAddress
                  when 7
                    @image8.path =  newAddress
                  when 8
                    @image9.path =  newAddress
                  when 9
                    @image10.path = newAddress
                  when 10
                    @image11.path =  newAddress
                  when 11
                    @image12.path =  newAddress
                  end

                end
                deckClass.removeCard($cardChosen)
                @@cardShow = newCards.merge(@@cardShow)
                $cardChosen = Array.new()
              else
                alert "Not a set! Try again!"

              end
            else
              card.switch
              @image6.path = address + "_d.png"
              $cardChosen.delete(card )
            end
          end

        end
      end

      flow width:0.25, height:0.2 do

        cards = @@cardShow.keys
        card= cards[6]
        address = @@cardShow[card]
        @image7 = image  address + ".png", width: 270, height:180, margin: 12
        @image7.click do
          if  $cardChosen.length < 2
            if !card.getState
              @image7.path = address + "_c.png"
              $cardChosen.push(card )
              card.switch
            else
              card.switch
              @image7.path =address + "_d.png"
              $cardChosen.delete(card)
            end
          else
            if !card.getState
              card.switch
              @image7.path = address + "_c.png"
              $cardChosen.push(card )
              if deckClass.isSet?($cardChosen)
                alert "Congratulations! This is a set!"

                $score +=1
                $score_field.replace ($score)

                newCards = deckClass.addCards
                for i in 0..3 do
                  cardChoose = $cardChosen[i]
                  index = @@cardShow.keys.index(cardChoose)
                  newAddress = newCards[newCards.keys[i]] + "_d.png"

                  case index
                  when 0
                    @image1.path = newAddress
                  when 1
                    @image2.path = newAddress
                  when 2
                    @image3.path = newAddress
                  when 3
                    @image4.path = newAddress
                  when 4
                    @image5.path =newAddress
                  when 5
                    @image6.path = newAddress
                  when 6
                    @image7.path =  newAddress
                  when 7
                    @image8.path =  newAddress
                  when 8
                    @image9.path =  newAddress
                  when 9
                    @image10.path = newAddress
                  when 10
                    @image11.path =  newAddress
                  when 11
                    @image12.path =  newAddress
                  end

                end
                deckClass.removeCard($cardChosen)
                @@cardShow = newCards.merge(@@cardShow)
                $cardChosen = Array.new()
              else
                alert "Not a set! Try again!"

              end
            else
              card.switch
              @image7.path = address + "_d.png"
              $cardChosen.delete(card )
            end
          end

        end
      end

      flow width:0.25, height:0.2 do

        cards = @@cardShow.keys
        card= cards[7]
        address = @@cardShow[card]
        @image8 = image  address + ".png", width: 270, height:180, margin: 12
        @image8.click do
          if  $cardChosen.length < 2
            if !card.getState
              @image8.path = address + "_c.png"
              $cardChosen.push(card )
              card.switch
            else
              card.switch
              @image8.path =address + "_d.png"
              $cardChosen.delete(card)
            end
          else
            if !card.getState
              card.switch
              @image8.path = address + "_c.png"
              $cardChosen.push(card )
              if deckClass.isSet?($cardChosen)
                alert "Congratulations! This is a set!"

                $score +=1
                $score_field.replace ($score)

                newCards = deckClass.addCards
                for i in 0..3 do
                  cardChoose = $cardChosen[i]
                  index = @@cardShow.keys.index(cardChoose)
                  newAddress = newCards[newCards.keys[i]] + "_d.png"

                  case index
                  when 0
                    @image1.path = newAddress
                  when 1
                    @image2.path = newAddress
                  when 2
                    @image3.path = newAddress
                  when 3
                    @image4.path = newAddress
                  when 4
                    @image5.path =newAddress
                  when 5
                    @image6.path = newAddress
                  when 6
                    @image7.path =  newAddress
                  when 7
                    @image8.path =  newAddress
                  when 8
                    @image9.path =  newAddress
                  when 9
                    @image10.path = newAddress
                  when 10
                    @image11.path =  newAddress
                  when 11
                    @image12.path =  newAddress
                  end

                end
                deckClass.removeCard($cardChosen)
                @@cardShow = newCards.merge(@@cardShow)
                $cardChosen = Array.new()
              else
                alert "Not a set! Try again!"

              end
            else
              card.switch
              @image8.path = address + "_d.png"
              $cardChosen.delete(card )
            end
          end

        end
      end

      flow width:0.25, height:0.2 do

        cards = @@cardShow.keys
        card= cards[8]
        address = @@cardShow[card]
        @image9 = image  address + ".png", width: 270, height:180, margin: 12
        @image9.click do
          if  $cardChosen.length < 2
            if !card.getState
              @image9.path = address + "_c.png"
              $cardChosen.push(card )
              card.switch
            else
              card.switch
              @image9.path =address + "_d.png"
              $cardChosen.delete(card)
            end
          else
            if !card.getState
              card.switch
              @image9.path = address + "_c.png"
              $cardChosen.push(card )
              if deckClass.isSet?($cardChosen)
                alert "Congratulations! This is a set!"

                $score +=1
                $score_field.replace ($score)

                newCards = deckClass.addCards
                for i in 0..3 do
                  cardChoose = $cardChosen[i]
                  index = @@cardShow.keys.index(cardChoose)
                  newAddress = newCards[newCards.keys[i]] + "_d.png"

                  case index
                  when 0
                    @image1.path = newAddress
                  when 1
                    @image2.path = newAddress
                  when 2
                    @image3.path = newAddress
                  when 3
                    @image4.path = newAddress
                  when 4
                    @image5.path =newAddress
                  when 5
                    @image6.path = newAddress
                  when 6
                    @image7.path =  newAddress
                  when 7
                    @image8.path =  newAddress
                  when 8
                    @image9.path =  newAddress
                  when 9
                    @image10.path = newAddress
                  when 10
                    @image11.path =  newAddress
                  when 11
                    @image12.path =  newAddress
                  end

                end
                deckClass.removeCard($cardChosen)
                @@cardShow = newCards.merge(@@cardShow)
                $cardChosen = Array.new()
              else
                alert "Not a set! Try again!"

              end
            else
              card.switch
              @image9.path = address + "_d.png"
              $cardChosen.delete(card )
            end
          end

        end
      end

      flow width:0.25, height:0.2 do

        cards = @@cardShow.keys
        card= cards[9]
        address = @@cardShow[card]
        @image10 = image  address + ".png", width: 270, height:180, margin: 12
        @image10.click do
          if  $cardChosen.length < 2
            if !card.getState
              @image10.path = address + "_c.png"
              $cardChosen.push(card )
              card.switch
            else
              card.switch
              @image10.path =address + "_d.png"
              $cardChosen.delete(card)
            end
          else
            if !card.getState
              card.switch
              @image10.path = address + "_c.png"
              $cardChosen.push(card )
              if deckClass.isSet?($cardChosen)
                alert "Congratulations! This is a set!"

                $score +=1
                $score_field.replace ($score)

                newCards = deckClass.addCards
                for i in 0..3 do
                  cardChoose = $cardChosen[i]
                  index = @@cardShow.keys.index(cardChoose)
                  newAddress = newCards[newCards.keys[i]] + "_d.png"

                  case index
                  when 0
                    @image1.path = newAddress
                  when 1
                    @image2.path = newAddress
                  when 2
                    @image3.path = newAddress
                  when 3
                    @image4.path = newAddress
                  when 4
                    @image5.path =newAddress
                  when 5
                    @image6.path = newAddress
                  when 6
                    @image7.path =  newAddress
                  when 7
                    @image8.path =  newAddress
                  when 8
                    @image9.path =  newAddress
                  when 9
                    @image10.path = newAddress
                  when 10
                    @image11.path =  newAddress
                  when 11
                    @image12.path =  newAddress
                  end

                end
                deckClass.removeCard($cardChosen)
                @@cardShow = newCards.merge(@@cardShow)
                $cardChosen = Array.new()
              else
                alert "Not a set! Try again!"

              end
            else
              card.switch
              @image10.path = address + "_d.png"
              $cardChosen.delete(card )
            end
          end

        end
      end

      flow width:0.25, height:0.2 do

        cards = @@cardShow.keys
        card= cards[10]
        address = @@cardShow[card]
        @image11 = image  address + ".png", width: 270, height:180, margin: 12
        @image11.click do
          if  $cardChosen.length < 2
            if !card.getState
              @image11.path = address + "_c.png"
              $cardChosen.push(card )
              card.switch
            else
              card.switch
              @image11.path =address + "_d.png"
              $cardChosen.delete(card)
            end
          else
            if !card.getState
              card.switch
              @image11.path = address + "_c.png"
              $cardChosen.push(card )
              if deckClass.isSet?($cardChosen)
                alert "Congratulations! This is a set!"

                $score +=1
                $score_field.replace ($score)

                newCards = deckClass.addCards
                for i in 0..3 do
                  cardChoose = $cardChosen[i]
                  index = @@cardShow.keys.index(cardChoose)
                  newAddress = newCards[newCards.keys[i]] + "_d.png"

                  case index
                  when 0
                    @image1.path = newAddress
                  when 1
                    @image2.path = newAddress
                  when 2
                    @image3.path = newAddress
                  when 3
                    @image4.path = newAddress
                  when 4
                    @image5.path =newAddress
                  when 5
                    @image6.path = newAddress
                  when 6
                    @image7.path =  newAddress
                  when 7
                    @image8.path =  newAddress
                  when 8
                    @image9.path =  newAddress
                  when 9
                    @image10.path = newAddress
                  when 10
                    @image11.path =  newAddress
                  when 11
                    @image12.path =  newAddress
                  end

                end
                deckClass.removeCard($cardChosen)
                @@cardShow = newCards.merge(@@cardShow)
                $cardChosen = Array.new()
              else
                alert "Not a set! Try again!"

              end
            else
              card.switch
              @image11.path = address + "_d.png"
              $cardChosen.delete(card )
            end
          end

        end
      end

      flow width:0.25, height:0.2 do

        cards = @@cardShow.keys
        card= cards[11]
        address = @@cardShow[card]
        @image12 = image  address + ".png", width: 270, height:180, margin: 12
        @image12.click do
          if  $cardChosen.length < 2
            if !card.getState
              @image12.path = address + "_c.png"
              $cardChosen.push(card )
              card.switch
            else
              card.switch
              @image12.path =address + "_d.png"
              $cardChosen.delete(card)
            end
          else
            if !card.getState
              card.switch
              @image12.path = address + "_c.png"
              $cardChosen.push(card )
              if deckClass.isSet?($cardChosen)
                alert "Congratulations! This is a set!"

                $score +=1
                $score_field.replace ($score)

                newCards = deckClass.addCards
                for i in 0..3 do
                  cardChoose = $cardChosen[i]
                  index = @@cardShow.keys.index(cardChoose)
                  newAddress = newCards[newCards.keys[i]] + "_d.png"

                  case index
                  when 0
                    @image1.path = newAddress
                  when 1
                    @image2.path = newAddress
                  when 2
                    @image3.path = newAddress
                  when 3
                    @image4.path = newAddress
                  when 4
                    @image5.path =newAddress
                  when 5
                    @image6.path = newAddress
                  when 6
                    @image7.path =  newAddress
                  when 7
                    @image8.path =  newAddress
                  when 8
                    @image9.path =  newAddress
                  when 9
                    @image10.path = newAddress
                  when 10
                    @image11.path =  newAddress
                  when 11
                    @image12.path =  newAddress
                  end

                end
                deckClass.removeCard($cardChosen)
                @@cardShow = newCards.merge(@@cardShow)
                $cardChosen = Array.new()
              else
                alert "Not a set! Try again!"

              end
            else
              card.switch
              @image12.path = address + "_d.png"
              $cardChosen.delete(card )
            end
          end

        end
      end

    end





    flow width:1.0, height:0.1 do
      background rgb(139,206,236)

















    end
  end
end
