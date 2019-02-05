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
        image1 = image  address + ".png", width: 270, height:180, margin: 12
        image1.click do
          if !card.getState


            if $cardChosen.length <=2
              image1.path = address + "_c.png"
              $cardChosen.push(card )
              card.switch


            else

              if deckClass.isSet?($cardChosen)

                alert "this is set"
                cardFormASet=Array.new
                cardA = $cardChosen[0]
                cardB = $cardChosen[1]
                cardC = $cardChosen[2]
                cardFormASet.push(cardA)
                cardFormASet.push(cardB)
                cardFormASet.push(cardC)
                cardShowTemp = @@cardShow
                deckClass.removeCard(cardFormASet)
                newCards = deckClass.addCards
                if image1.path == cardShowTemp[cardA]
                  image1.path=@@cardShow[newCards[0]]
                elsif image1.path == cardShowTemp[cardB]
                  image1.path = @@cardShow[newCards[1]]
                else
                  image1.path = @@cardShow[newCards[2]]
                end
                $cardChosen = Array.new(3)


                $score +=1
                $score_field.replace ($score)

              else
                alert "Not a set! Try again!"
              end
            end
          else
            card.switch
            image1.path =address + "_d.png"
            $cardChosen.delete(card)

          end

        end
      end

      flow width:0.25, height:0.2 do

        cards = @@cardShow.keys
        card= cards[1]
        address = @@cardShow[card]
        image2= image  address + ".png", width: 270, height:180, margin: 12
        image2.click do
          if !card.getState


            if $cardChosen.length <=2
              image2.path = address + "_c.png"
              $cardChosen.push(card )
              card.switch
            else

              if deckClass.isSet?($cardChosen)

                cardFormASet=Array.new
                cardA = $cardChosen[0]
                cardB = $cardChosen[1]
                cardC = $cardChosen[2]
                cardFormASet.push(cardA)
                cardFormASet.push(cardB)
                cardFormASet.push(cardC)
                cardShowTemp = @@cardShow
                deckClass.removeCard(cardFormASet)
                newCards = deckClass.addCards
                if image2.path == cardShowTemp[cardA]
                  image2.path=@@cardShow[newCards[0]]
                elsif image2.path == cardShowTemp[cardB]
                  image2.path = @@cardShow[newCards[1]]
                else
                  image2.path = @@cardShow[newCards[2]]
                end
                $score +=1
                $score_field.replace ($score)
                $cardChosen = Array.new(3)
              else
                alert "Not a set! Try again!"
              end
            end
          else
            card.switch
            image2.path =address + "_d.png"
            $cardChosen.delete(card)

          end

        end
      end

      flow width:0.25, height:0.2 do

        cards = @@cardShow.keys
        card= cards[2]
        address = @@cardShow[card]
        image3 = image  address + ".png", width: 270, height:180, margin: 12
        image3.click do
          if !card.getState
            if $cardChosen.length <=2
              image3.path = address + "_c.png"
              $cardChosen.push(card )
              card.switch
            else
              if deckClass.isSet?($cardChosen)
                cardFormASet=Array.new
                cardA = $cardChosen[0]
                cardB = $cardChosen[1]
                cardC = $cardChosen[2]
                cardFormASet.push(cardA)
                cardFormASet.push(cardB)
                cardFormASet.push(cardC)
                cardShowTemp = @@cardShow
                deckClass.removeCard(cardFormASet)
                newCards = deckClass.addCards
                if image3.path == cardShowTemp[cardA]
                  image3.path=@@cardShow[newCards[0]]
                elsif image3.path == cardShowTemp[cardB]
                  image3.path = @@cardShow[newCards[1]]
                else
                  image3.path = @@cardShow[newCards[2]]
                end
                $score +=1
                $score_field.replace ($score)
                $cardChosen = Array.new(3)
              else
                alert "Not a set! Try again!"
              end
            end
          else
            card.switch
            image3.path =address + "_d.png"
            $cardChosen.delete(card)

          end

        end
      end

      flow width:0.25, height:0.2 do

        cards = @@cardShow.keys
        card= cards[3]
        address = @@cardShow[card]
        image4 = image  address + ".png", width: 270, height:180, margin: 12
        image4.click do
          if !card.getState


            if $cardChosen.length <=2
              image4.path = address + "_c.png"
              $cardChosen.push(card )
              card.switch
            else
              if deckClass.isSet?($cardChosen)

                cardFormASet=Array.new
                cardA = $cardChosen[0]
                cardB = $cardChosen[1]
                cardC = $cardChosen[2]
                cardFormASet.push(cardA)
                cardFormASet.push(cardB)
                cardFormASet.push(cardC)
                cardShowTemp = @@cardShow
                deckClass.removeCard(cardFormASet)
                newCards = deckClass.addCards
                if image4.path == cardShowTemp[cardA]
                  image4.path=@@cardShow[newCards[0]]
                elsif image4.path == cardShowTemp[cardB]
                  image4.path = @@cardShow[newCards[1]]
                else
                  image4.path = @@cardShow[newCards[2]]
                end
                $score +=1
                $score_field.replace ($score)
                $cardChosen = Array.new(3)
              else
                alert "Not a set! Try again!"
              end
            end
          else
            card.switch
            image4.path =address + "_d.png"
            $cardChosen.delete(card)

          end

        end
      end

      flow width:0.25, height:0.2 do

        cards = @@cardShow.keys
        card= cards[4]
        address = @@cardShow[card]
        image5 = image  address + ".png", width: 270, height:180, margin: 12
        image5.click do
          if !card.getState


            if $cardChosen.length <=2
              image5.path = address + "_c.png"
              $cardChosen.push(card )
              card.switch
            else
              if deckClass.isSet?($cardChosen)

                cardFormASet=Array.new
                cardA = $cardChosen[0]
                cardB = $cardChosen[1]
                cardC = $cardChosen[2]
                cardFormASet.push(cardA)
                cardFormASet.push(cardB)
                cardFormASet.push(cardC)
                cardShowTemp = @@cardShow
                deckClass.removeCard(cardFormASet)
                newCards = deckClass.addCards
                if image5.path == cardShowTemp[cardA]
                  image5.path=@@cardShow[newCards[0]]
                elsif image5.path == cardShowTemp[cardB]
                  image5.path = @@cardShow[newCards[1]]
                else
                  image5.path = @@cardShow[newCards[2]]
                end
                $score +=1
                $score_field.replace ($score)
                $cardChosen = Array.new(3)
              else
                alert "Not a set! Try again!"
              end
            end
          else
            card.switch
            image5.path =address + "_d.png"
            $cardChosen.delete(card)

          end

        end
      end

      flow width:0.25, height:0.2 do

        cards = @@cardShow.keys
        card= cards[5]
        address = @@cardShow[card]
        image6 = image  address + ".png", width: 270, height:180, margin: 12
        image6.click do
          if !card.getState


            if $cardChosen.length <3
              image6.path = address + "_c.png"
              $cardChosen.push(card )
              card.switch
            else
              if deckClass.isSet?($cardChosen)

                cardFormASet=Array.new
                cardA = $cardChosen[0]
                cardB = $cardChosen[1]
                cardC = $cardChosen[2]
                cardFormASet.push(cardA)
                cardFormASet.push(cardB)
                cardFormASet.push(cardC)
                cardShowTemp = @@cardShow
                deckClass.removeCard(cardFormASet)
                newCards = deckClass.addCards
                if image6.path == cardShowTemp[cardA]
                  image6.path=@@cardShow[newCards[0]]
                elsif image6.path == cardShowTemp[cardB]
                  image6.path = @@cardShow[newCards[1]]
                else
                  image6.path = @@cardShow[newCards[2]]
                end
                $score +=1
                $score_field.replace ($score)
                $cardChosen = Array.new(3)
              else
                lert "Not a set! Try again!"
              end
            end
          else
            card.switch
            image6.path =address + "_d.png"
            $cardChosen.delete(card)

          end

        end
      end

      flow width:0.25, height:0.2 do

        cards = @@cardShow.keys
        card= cards[6]
        address = @@cardShow[card]
        image7 = image  address + ".png", width: 270, height:180, margin: 12
        image7.click do
          if !card.getState


            if $cardChosen.length <3
              image7.path = address + "_c.png"
              $cardChosen.push(card )
              card.switch
            else
              if deckClass.isSet?($cardChosen)

                cardFormASet=Array.new
                cardA = $cardChosen[0]
                cardB = $cardChosen[1]
                cardC = $cardChosen[2]
                cardFormASet.push(cardA)
                cardFormASet.push(cardB)
                cardFormASet.push(cardC)
                cardShowTemp = @@cardShow
                deckClass.removeCard(cardFormASet)
                newCards = deckClass.addCards
                if image7.path == cardShowTemp[cardA]
                  image7.path=@@cardShow[newCards[0]]
                elsif image7.path == cardShowTemp[cardB]
                  image7.path = @@cardShow[newCards[1]]
                else
                  image7.path = @@cardShow[newCards[2]]
                end
                $score +=1
                $score_field.replace ($score)
                $cardChosen = Array.new(3)
              else
                alert "Not a set! Try again!"

              end
            end
          else
            card.switch
            image7.path =address + "_d.png"
            $cardChosen.delete(card)

          end

        end
      end

      flow width:0.25, height:0.2 do

        cards = @@cardShow.keys
        card= cards[7]
        address = @@cardShow[card]
        image8 = image  address + ".png", width: 270, height:180, margin: 12
        image8.click do
          if !card.getState


            if $cardChosen.length <3
              image8.path = address + "_c.png"
              $cardChosen.push(card )
              card.switch
            else
              if deckClass.isSet?($cardChosen)

                cardFormASet=Array.new
                cardA = $cardChosen[0]
                cardB = $cardChosen[1]
                cardC = $cardChosen[2]
                cardFormASet.push(cardA)
                cardFormASet.push(cardB)
                cardFormASet.push(cardC)
                cardShowTemp = @@cardShow
                deckClass.removeCard(cardFormASet)
                newCards = deckClass.addCards
                if image8.path == cardShowTemp[cardA]
                  image8.path=@@cardShow[newCards[0]]
                elsif image8.path == cardShowTemp[cardB]
                  image8.path = @@cardShow[newCards[1]]
                else
                  image8.path = @@cardShow[newCards[2]]
                end
                $score +=1
                $score_field.replace ($score)
                $cardChosen = Array.new(3)
              else
                alert "Not a set! Try again!"
              end
            end
          else
            card.switch
            image8.path =address + "_d.png"
            $cardChosen.delete(card)

          end

        end
      end

      flow width:0.25, height:0.2 do

        cards = @@cardShow.keys
        card= cards[8]
        address = @@cardShow[card]
        image9 = image  address + ".png", width: 270, height:180, margin: 12
        image9.click do
          if !card.getState


            if $cardChosen.length <3
              image9.path = address + "_c.png"
              $cardChosen.push(card )
              card.switch
            else
              if deckClass.isSet?($cardChosen)

                cardFormASet=Array.new
                cardA = $cardChosen[0]
                cardB = $cardChosen[1]
                cardC = $cardChosen[2]
                cardFormASet.push(cardA)
                cardFormASet.push(cardB)
                cardFormASet.push(cardC)
                cardShowTemp = @@cardShow
                deckClass.removeCard(cardFormASet)
                newCards = deckClass.addCards
                if image9.path == cardShowTemp[cardA]
                  image9.path=@@cardShow[newCards[0]]
                elsif image9.path == cardShowTemp[cardB]
                  image9.path = @@cardShow[newCards[1]]
                else
                  image9.path = @@cardShow[newCards[2]]
                end
                $score +=1
                $score_field.replace ($score)
                $cardChosen = Array.new(3)
              else
                alert "Not a set! Try again!"
              end
            end
          else
            card.switch
            image9.path =address + "_d.png"
            $cardChosen.delete(card)

          end

        end
      end

      flow width:0.25, height:0.2 do

        cards = @@cardShow.keys
        card= cards[9]
        address = @@cardShow[card]
        image10 = image  address + ".png", width: 270, height:180, margin: 12
        image10.click do
          if !card.getState


            if $cardChosen.length <3
              image10.path = address + "_c.png"
              $cardChosen.push(card )
              card.switch
            else
              if deckClass.isSet?($cardChosen)

                cardFormASet=Array.new
                cardA = $cardChosen[0]
                cardB = $cardChosen[1]
                cardC = $cardChosen[2]
                cardFormASet.push(cardA)
                cardFormASet.push(cardB)
                cardFormASet.push(cardC)
                cardShowTemp = @@cardShow
                deckClass.removeCard(cardFormASet)
                newCards = deckClass.addCards
                if image10.path == cardShowTemp[cardA]
                  image10.path=@@cardShow[newCards[0]]
                elsif image10.path == cardShowTemp[cardB]
                  image10.path = @@cardShow[newCards[1]]
                else
                  image10.path = @@cardShow[newCards[2]]
                end
                $score +=1
                $score_field.replace ($score)
                $cardChosen = Array.new(3)
              else
                alert "Not a set! Try again!"
              end
            end
          else
            card.switch
            image10.path =address + "_d.png"
            $cardChosen.delete(card)

          end

        end
      end

      flow width:0.25, height:0.2 do

        cards = @@cardShow.keys
        card= cards[10]
        address = @@cardShow[card]
        image11 = image  address + ".png", width: 270, height:180, margin: 12
        image11.click do
          if !card.getState


            if $cardChosen.length <3
              image11.path = address + "_c.png"
              $cardChosen.push(card )
              card.switch
            else
              if deckClass.isSet?($cardChosen)

                cardFormASet=Array.new
                cardA = $cardChosen[0]
                cardB = $cardChosen[1]
                cardC = $cardChosen[2]
                cardFormASet.push(cardA)
                cardFormASet.push(cardB)
                cardFormASet.push(cardC)
                cardShowTemp = @@cardShow
                deckClass.removeCard(cardFormASet)
                newCards = deckClass.addCards
                if image11.path == cardShowTemp[cardA]
                  image11.path=@@cardShow[newCards[0]]
                elsif image11.path == cardShowTemp[cardB]
                  image11.path = @@cardShow[newCards[1]]
                else
                  image11.path = @@cardShow[newCards[2]]
                end
                $score +=1
                $score_field.replace ($score)
                $cardChosen = Array.new(3)
              else
                alert "Not a set! Try again!"
              end
            end
          else
            card.switch
            image11.path =address + "_d.png"
            $cardChosen.delete(card)

          end

        end
      end

      flow width:0.25, height:0.2 do

        cards = @@cardShow.keys
        card= cards[11]
        address = @@cardShow[card]
        image12 = image  address + ".png", width: 270, height:180, margin: 12
        image12.click do
          if !card.getState


            if $cardChosen.length <3
              image12.path = address + "_c.png"
              $cardChosen.push(card )
              card.switch
            else
              if deckClass.isSet?($cardChosen)

                cardFormASet=Array.new
                cardA = $cardChosen[0]
                cardB = $cardChosen[1]
                cardC = $cardChosen[2]
                cardFormASet.push(cardA)
                cardFormASet.push(cardB)
                cardFormASet.push(cardC)
                cardShowTemp = @@cardShow
                deckClass.removeCard(cardFormASet)
                newCards = deckClass.addCards
                if image12.path == cardShowTemp[cardA]
                  image12.path=@@cardShow[newCards[0]]
                elsif image12.path == cardShowTemp[cardB]
                  image12.path = @@cardShow[newCards[1]]
                else
                  image12.path = @@cardShow[newCards[2]]
                end
                $score +=1
                $score_field.replace ($score)
                $cardChosen = Array.new(3)
              else
                alert "Not a set! Try again!"
              end
            end
          else
            card.switch
            image12.path =address + "_d.png"
            $cardChosen.delete(card)
          end

        end
      end

      flow width:0.25, height:0.2 do

        cards = @@cardShow.keys
        card= cards[12]
        address = @@cardShow[card]
        image13 = image  address + ".png", width: 270, height:180, margin: 12
        image13.click do
          if !card.getState


            if $cardChosen.length <3
              image13.path = address + "_c.png"
              $cardChosen.push(card )
              card.switch
            else
              if deckClass.isSet?($cardChosen)

                cardFormASet=Array.new
                cardA = $cardChosen[0]
                cardB = $cardChosen[1]
                cardC = $cardChosen[2]
                cardFormASet.push(cardA)
                cardFormASet.push(cardB)
                cardFormASet.push(cardC)
                cardShowTemp = @@cardShow
                deckClass.removeCard(cardFormASet)
                newCards = deckClass.addCards
                if image13.path == cardShowTemp[cardA]
                  image13.path=@@cardShow[newCards[0]]
                elsif image13.path == cardShowTemp[cardB]
                  image13.path = @@cardShow[newCards[1]]
                else
                  image13.path = @@cardShow[newCards[2]]
                end
                $score +=1
                $score_field.replace ($score)
                $cardChosen = Array.new(3)
              else
                alert "Not a set! Try again!"
              end
            end
          else
            card.switch
            image13.path =address + "_d.png"
            $cardChosen.delete(card)
          end

        end
      end

      flow width:0.25, height:0.2 do

        cards = @@cardShow.keys
        card= cards[13]
        address = @@cardShow[card]
        image14 = image  address + ".png", width: 270, height:180, margin: 12
        image14.click do
          if !card.getState


            if $cardChosen.length <3
              image14.path = address + "_c.png"
              $cardChosen.push(card )
              card.switch
            else
              if deckClass.isSet?($cardChosen)

                cardFormASet=Array.new
                cardA = $cardChosen[0]
                cardB = $cardChosen[1]
                cardC = $cardChosen[2]
                cardFormASet.push(cardA)
                cardFormASet.push(cardB)
                cardFormASet.push(cardC)
                cardShowTemp = @@cardShow
                deckClass.removeCard(cardFormASet)
                newCards = deckClass.addCards
                if image14.path == cardShowTemp[cardA]
                  image14.path=@@cardShow[newCards[0]]
                elsif image14.path == cardShowTemp[cardB]
                  image14.path = @@cardShow[newCards[1]]
                else
                  image14.path = @@cardShow[newCards[2]]
                end
                $score +=1
                $score_field.replace ($score)
                $cardChosen = Array.new(3)

              else
                alert "Not a set! Try again!"
              end
            end
          else
            card.switch
            image14.path =address + "_d.png"
            $cardChosen.delete(card)
          end
        end

      end



      flow width:0.25, height:0.2 do

        cards = @@cardShow.keys
        card= cards[14]
        address = @@cardShow[card]
        image15 = image  address + ".png", width: 270, height:180, margin: 12
        image15.click do
          if !card.getState


            if $cardChosen.length <3
              image15.path = address + "_c.png"
              $cardChosen.push(card )
              card.switch
            else
              if deckClass.isSet?($cardChosen)

                cardFormASet=Array.new
                cardA = $cardChosen[0]
                cardB = $cardChosen[1]
                cardC = $cardChosen[2]
                cardFormASet.push(cardA)
                cardFormASet.push(cardB)
                cardFormASet.push(cardC)
                cardShowTemp = @@cardShow
                deckClass.removeCard(cardFormASet)
                newCards = deckClass.addCards
                if image15.path == cardShowTemp[cardA]
                  image15.path=@@cardShow[newCards[0]]
                elsif image15.path == cardShowTemp[cardB]
                  image15.path = @@cardShow[newCards[1]]
                else
                  image15.path = @@cardShow[newCards[2]]
                end
                $score +=1
                $score_field.replace ($score)
                $cardChosen = Array.new(3)

              else
                alert "Not a set! Try again!"
              end
            end
          else
            card.switch
            image15.path =address + "_d.png"
            $cardChosen.delete(card)
          end
        end

      end


      flow width:0.25, height:0.2 do

        cards = @@cardShow.keys
        card= cards[15]
        address = @@cardShow[card]
        image16 = image  address + ".png", width: 270, height:180, margin: 12
        image16.click do
          if !card.getState


            if $cardChosen.length <3
              image16.path = address + "_c.png"
              $cardChosen.push(card )
              card.switch
            else
              if deckClass.isSet?($cardChosen)

                cardFormASet=Array.new
                cardA = $cardChosen[0]
                cardB = $cardChosen[1]
                cardC = $cardChosen[2]
                cardFormASet.push(cardA)
                cardFormASet.push(cardB)
                cardFormASet.push(cardC)
                cardShowTemp = @@cardShow
                deckClass.removeCard(cardFormASet)
                newCards = deckClass.addCards
                if image16.path == cardShowTemp[cardA]
                  image16.path=@@cardShow[newCards[0]]
                elsif image16.path == cardShowTemp[cardB]
                  image16.path = @@cardShow[newCards[1]]
                else
                  image16.path = @@cardShow[newCards[2]]
                end
                $score +=1
                $score_field.replace ($score)
                $cardChosen = Array.new(3)

              else
                alert "Not a set! Try again!"
              end
            end
          else
            card.switch
            image16.path =address + "_d.png"
            $cardChosen.delete(card)
          end
        end

      end


      flow width:0.25, height:0.2 do

        cards = @@cardShow.keys
        card= cards[16]
        address = @@cardShow[card]
        image17 = image  address + ".png", width: 270, height:180, margin: 12
        image17.click do
          if !card.getState


            if $cardChosen.length <3
              image17.path = address + "_c.png"
              $cardChosen.push(card )
              card.switch
            else
              if deckClass.isSet?($cardChosen)

                cardFormASet=Array.new
                cardA = $cardChosen[0]
                cardB = $cardChosen[1]
                cardC = $cardChosen[2]
                cardFormASet.push(cardA)
                cardFormASet.push(cardB)
                cardFormASet.push(cardC)
                cardShowTemp = @@cardShow
                deckClass.removeCard(cardFormASet)
                newCards = deckClass.addCards
                if image17.path == cardShowTemp[cardA]
                  image17.path=@@cardShow[newCards[0]]
                elsif image17.path == cardShowTemp[cardB]
                  image17.path = @@cardShow[newCards[1]]
                else
                  image17.path = @@cardShow[newCards[2]]
                end
                $score +=1
                $score_field.replace ($score)
                $cardChosen = Array.new(3)
              else
                alert "Not a set! Try again!"
              end
            end
          else
            card.switch
            image17.path =address + "_d.png"
            $cardChosen.delete(card)
          end
        end

      end

      flow width:0.25, height:0.2 do

        cards = @@cardShow.keys
        card= cards[17]
        address = @@cardShow[card]
        image18 = image  address + ".png", width: 270, height:180, margin: 12
        image18.click do
          if !card.getState


            if $cardChosen.length <3
              image18.path = address + "_c.png"
              $cardChosen.push(card )
              card.switch
            else
              if deckClass.isSet?($cardChosen)

                cardFormASet=Array.new
                cardA = $cardChosen[0]
                cardB = $cardChosen[1]
                cardC = $cardChosen[2]
                cardFormASet.push(cardA)
                cardFormASet.push(cardB)
                cardFormASet.push(cardC)
                cardShowTemp = @@cardShow
                deckClass.removeCard(cardFormASet)
                newCards = deckClass.addCards
                if image18.path == cardShowTemp[cardA]
                  image18.path=@@cardShow[newCards[0]]
                elsif image18.path == cardShowTemp[cardB]
                  image18.path = @@cardShow[newCards[1]]
                else
                  image18.path = @@cardShow[newCards[2]]
                end
                $score +=1
                $score_field.replace ($score)
                $cardChosen = Array.new(3)

              else
                alert "Not a set! Try again!"
              end
            end
          else
            card.switch
            image18.path =address + "_d.png"
            $cardChosen.delete(card)
          end
        end

      end



    end





    flow width:1.0, height:0.1 do
      background rgb(139,206,236)

















    end
  end
end
