require_relative 'deck'
require_relative 'cards'


#Shoes::show_console  #for debug console
Shoes.app(title: "Set Game", width: 600, height: 400) do

  def  replaceNewAddress(index,newAddress, card)
       case index
          when 0
            @image1.path = newAddress + "_d.png"
            @address1 = newAddress
            @card1 = card 
          when 1
            @image2.path = newAddress + "_d.png"
            @address2 = newAddress
            @card2 = card 
          when 2
            @image3.path = newAddress + "_d.png"
            @address3 = newAddress
            @card3 = card 
          when 3
            @image4.path = newAddress + "_d.png"
            @address4 = newAddress
            @card4 = card 
          when 4
            @image5.path =newAddress + "_d.png"
            @address5 = newAddress
            @card5 = card 
          when 5
            @image6.path = newAddress + "_d.png"
            @address6 = newAddress
            @card6 = card 
          when 6
            @image7.path =  newAddress + "_d.png"
            @address7 = newAddress
            @card7 = card 
          when 7
            @image8.path =  newAddress + "_d.png"
            @address8 = newAddress
            @card8 = card 
          when 8
            @image9.path =  newAddress + "_d.png"
            @address9 = newAddress
            @card9 = card 
          when 9
            @image10.path = newAddress + "_d.png"
            @address10 = newAddress
            @card10 = card 
          when 10
            @image11.path =  newAddress + "_d.png"
            @address11 = newAddress
            @card11 = card 
          when 11
            @image12.path =  newAddress + "_d.png"
            @address12 = newAddress
            @card12 = card 
          when 12
            @image13.path = newAddress + "_d.png"
            @address13 = newAddress
            @card13 = card 
          when 13
            @image14.path = newAddress + "_d.png"
            @address14 = newAddress
            @card14 = card 
          when 14
            @image15.path = newAddress + "_d.png"
            @address15 = newAddress
            @card15 = card 
          when 15
            @image16.path = newAddress + "_d.png"
            @address16 = newAddress
            @card16 = card 
          when 16
            @image17.path = newAddress + "_d.png"
            @address17 = newAddress
            @card17 = card 
          when 17
            @image18.path = newAddress + "_d.png"
            @address18 = newAddress
            @card18 = card 
          
        end
  end

  def main
    
    deckClass = Deck.new
    @@deck = deckClass.getDeck
    @@cardShow = deckClass.getRandomCards
    $cardChosen = Array.new
    $change = false


    $score = 0



    flow width:1080, height:1125 do
      flow width:1.0, height: 0.1 do
        background rgb(0,157, 228)
        
        # listener of restart button
        button 'restart',width:150,height:60 do
          self.clear
          main
        end



        # listener of add 3 cards button
        button 'Add 3 Cards',width:150,height:60 do
          if deckClass.containSet?
            alert "There is a set among these cards!"
          else
            cardsAdd = deckClass.addCards
            keys = cardsAdd.keys
            @@cardShow = cardsAdd.merge(@@cardShow)
            length = @@cardShow.keys.length
            case length
            when 15
              @image13.path= @@cardShow[keys[0]]+".png"
              @image14.path =@@cardShow[keys[1]]+".png"
              @image15.path =@@cardShow[keys[2]]+".png"
            when 18
              @image16.path=@@cardShow[keys[0]]+".png"
              @image17.path=@@cardShow[keys[1]]+".png"
              @image18.path=@@cardShow[keys[2]]+".png"
            end
          end
        end



        # listener of hint button
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
        # listener of easy button
        button 'Easy Start',width:150,height:60 do
          flow width: 200, height: 130 do

            seconds = 120
            tenths = 0
            clock =  '%02d:%02d'

            flow do
              @show = para clock % [seconds, tenths], size: 15, stroke: black
            end

            a = animate(10) do
              tenths -= 1

              if tenths < 0
                tenths  = 9
                seconds -= 1
              end
              @show.text = clock % [seconds, tenths]
              if seconds == 0 and tenths == 0
                a.stop
                alert("game over, you get #{$score} points.")
                close
              end

            end
            @stop = button "stop"
            @stop.click do
              a.stop
              alert("Pause")
            end
            @start = button "start"
            @start.click do
              a.start
            end
          end
        end
        # listener of hard button
        button 'Hard Start',width:150,height:60 do
          flow width: 200, height: 130 do

            seconds = 60
            tenths = 0
            clock =  '%02d:%02d'

            flow do
              @show = para clock % [seconds, tenths], size: 15, stroke: black
            end

            a = animate(10) do
              tenths -= 1

              if tenths < 0
                tenths  = 9
                seconds -= 1
              end

              @show.text = clock % [seconds, tenths]

              if seconds == 0 and tenths == 0
                a.stop
                alert("game over, you get #{$score} points.")
                close
              end

            end
            @stop = button "stop"
            @stop.click do
              a.stop
              alert("Pause")
            end
            @start = button "start"
            @start.click do
              a.start
            end

          end


        end
        # listener of rule button
        button 'Rule',width:150,height:60 do
          link = "https://www.setgame.com/set"
          if RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/
            system "start #{link}"
          elsif RbConfig::CONFIG['host_os'] =~ /darwin/
            system "open #{link}"
          elsif RbConfig::CONFIG['host_os'] =~ /linux|bsd/
            system "xdg-open #{link}"
          end

        end

        para "Score:"
        $score_field = para $score
        $score_field.replace ($score)
      end
# listener of card buttons
      flow  width:1.0, height: 0.8 do

        flow width:0.25, height:0.2 do
          

          cards = @@cardShow.keys
          @card1= cards[0]
          @address1 = @@cardShow[@card1]
          @image1 = image  @address1 + ".png", width: 270, height:180, margin: 12
          
          @image1.click do
            
            if  $cardChosen.length < 2
              if ! @card1.getState
                @image1.path = @address1 + "_c.png"
                $cardChosen.push(@card1 )
                $stderr.puts @card1
                @card1.switch
              else
                @card1.switch
                @image1.path =@address1 + "_d.png"
                $cardChosen.delete(@card1)
              end
            else
              if !@card1.getState
                @image1.path = @address1 + "_c.png"
                @card1.switch
                $cardChosen.push(@card1 )
                if deckClass.isSet?($cardChosen)
                  alert "Congratulations! This is a set!"
                  $score +=1
                  $score_field.replace ($score)
                  newCards = deckClass.addCards
                  for i in 0..2 do
                    cardChoose = $cardChosen[i]
                    newCards.keys[i].setState(false)
                    index = @@cardShow.keys.index(cardChoose)
                    newAddress = newCards[newCards.keys[i]]
                    replaceNewAddress(index, newAddress, newCards.keys[i])
                  end
                  deckClass.removeCard($cardChosen)
                  @@cardShow = @@cardShow.merge(newCards)
                  $cardChosen.clear()
                  
                  
                else
                  alert "Not a set! Try again!"

                end
              else
                @image1.path = @address1 + "_d.png"
                @card1.switch

                $cardChosen.delete(@card1 )
              end

            end

          end
        end

        flow width:0.25, height:0.2 do
          cards = @@cardShow.keys
          @card2 = cards[1]
          @address2 = @@cardShow[@card2]
          @image2 = image  @address2 + ".png", width: 270, height:180, margin: 12
          @image2.click do
            if  $cardChosen.length < 2
              if ! @card2.getState
                @image2.path = @address2 + "_c.png"
                $cardChosen.push(@card2 )
                $stderr.puts @card2
                @card2.switch
              else
                @card2.switch
                @image2.path =@address2 + "_d.png"
                $cardChosen.delete(@card2)
              end
            else
              if !@card2.getState
                @image2.path = @address2 + "_c.png"
                @card2.switch
                $cardChosen.push(@card2 )
                if deckClass.isSet?($cardChosen)
                  alert "Congratulations! This is a set!"
                  $score +=1
                  $score_field.replace ($score)
                  newCards = deckClass.addCards
                  for i in 0..2 do
                    cardChoose = $cardChosen[i]
                    newCards.keys[i].setState(false)
                    index = @@cardShow.keys.index(cardChoose)
                    newAddress = newCards[newCards.keys[i]]
                    replaceNewAddress(index, newAddress, newCards.keys[i])
                  end
                  deckClass.removeCard($cardChosen)
                  @@cardShow = @@cardShow.merge(newCards)
                  $cardChosen.clear()
                  
                  
                else
                  alert "Not a set! Try again!"

                end
              else
                @image2.path = @address2 + "_d.png"
                @card2.switch

                $cardChosen.delete(@card2 )
              end

            end

          end
        end

        flow width:0.25, height:0.2 do


          cards = @@cardShow.keys
          @card3= cards[2]
          @address3 = @@cardShow[@card3]
          @image3 = image  @address3 + ".png", width: 270, height:180, margin: 12
          @image3.click do
            if  $cardChosen.length < 2
              if ! @card3.getState
                @image3.path = @address3 + "_c.png"
                $cardChosen.push(@card3 )
                $stderr.puts @card3
                @card3.switch
              else
                @card3.switch
                @image3.path =@address3 + "_d.png"
                $cardChosen.delete(@card3)
              end
            else
              if !@card3.getState
                @image3.path = @address3 + "_c.png"
                @card3.switch
                $cardChosen.push(@card3 )
                if deckClass.isSet?($cardChosen)
                  alert "Congratulations! This is a set!"
                  $score +=1
                  $score_field.replace ($score)
                  newCards = deckClass.addCards
                  for i in 0..2 do
                    cardChoose = $cardChosen[i]
                    newCards.keys[i].setState(false)
                    index = @@cardShow.keys.index(cardChoose)
                    newAddress = newCards[newCards.keys[i]]

                   replaceNewAddress(index, newAddress, newCards.keys[i])
                  end
                  deckClass.removeCard($cardChosen)
                  @@cardShow = @@cardShow.merge(newCards)
                  $cardChosen.clear()
                  
                  
                else
                  alert "Not a set! Try again!"

                end
              else
                @image3.path = @address3 + "_d.png"
                @card3.switch

                $cardChosen.delete(@card3 )
              end

            end

          end
        end

        flow width:0.25, height:0.2 do


          cards = @@cardShow.keys
          @card4= cards[3]
          @address4 = @@cardShow[@card4]
          @image4 = image  @address4 + ".png", width: 270, height:180, margin: 12
          @image4.click do
            if  $cardChosen.length < 2
              if ! @card4.getState
                @image4.path = @address4 + "_c.png"
                $cardChosen.push(@card4 )
                $stderr.puts @card4
                @card4.switch
              else
                @card4.switch
                @image4.path =@address4 + "_d.png"
                $cardChosen.delete(@card4)
              end
            else
              if !@card4.getState
                @image4.path = @address4 + "_c.png"
                @card4.switch
                $cardChosen.push(@card4 )
                if deckClass.isSet?($cardChosen)
                  alert "Congratulations! This is a set!"
                  $score +=1
                  $score_field.replace ($score)
                  newCards = deckClass.addCards
                  for i in 0..2 do
                    cardChoose = $cardChosen[i]
                    newCards.keys[i].setState(false)
                    index = @@cardShow.keys.index(cardChoose)
                    newAddress = newCards[newCards.keys[i]]
                    replaceNewAddress(index, newAddress, newCards.keys[i])
                  end
                  deckClass.removeCard($cardChosen)
                  @@cardShow = @@cardShow.merge(newCards)
                  $cardChosen.clear()
                else
                  alert "Not a set! Try again!"

                end
              else
                @image4.path = @address4 + "_d.png"
                @card4.switch

                $cardChosen.delete(@card4 )
              end

            end

          end
        end

        flow width:0.25, height:0.2 do

         
            cards = @@cardShow.keys
            @card5= cards[4]
            @address5 = @@cardShow[@card5]
            @image5 = image  @address5 + ".png", width: 270, height:180, margin: 12
          @image5.click do
            if  $cardChosen.length < 2
              if ! @card5.getState
                @image5.path = @address5 + "_c.png"
                $cardChosen.push(@card5 )
                $stderr.puts @card5
                @card5.switch
              else
                @card5.switch
                @image5.path =@address5 + "_d.png"
                $cardChosen.delete(@card5)
              end
            else
              if !@card5.getState
                @image5.path = @address5 + "_c.png"
                @card5.switch
                $cardChosen.push(@card5 )
                if deckClass.isSet?($cardChosen)
                  alert "Congratulations! This is a set!"
                  $score +=1
                  $score_field.replace ($score)
                  newCards = deckClass.addCards
                  for i in 0..2 do
                    cardChoose = $cardChosen[i]
                    newCards.keys[i].setState(false)
                    index = @@cardShow.keys.index(cardChoose)
                    newAddress = newCards[newCards.keys[i]]
                    replaceNewAddress(index, newAddress, newCards.keys[i])
                  end
                  deckClass.removeCard($cardChosen)
                  @@cardShow = @@cardShow.merge(newCards)
                  $cardChosen.clear()
                  
                  
                else
                  alert "Not a set! Try again!"

                end
              else
                @image5.path = @address5 + "_d.png"
                @card5.switch

                $cardChosen.delete(@card5 )
              end

            end

          end
        end

        flow width:0.25, height:0.2 do

        
            cards = @@cardShow.keys
            @card6= cards[5]
            @address6 = @@cardShow[@card6]
            @image6 = image  @address6 + ".png", width: 270, height:180, margin: 12
          @image6.click do
            if  $cardChosen.length < 2
              if ! @card6.getState
                @image6.path = @address6 + "_c.png"
                $cardChosen.push(@card6 )
                $stderr.puts @card6
                @card6.switch
              else
                @card6.switch
                @image6.path =@address6 + "_d.png"
                $cardChosen.delete(@card6)
              end
            else
              if !@card6.getState
                @image6.path = @address6 + "_c.png"
                @card6.switch
                $cardChosen.push(@card6 )
                if deckClass.isSet?($cardChosen)
                  alert "Congratulations! This is a set!"
                  $score +=1
                  $score_field.replace ($score)
                  newCards = deckClass.addCards
                  for i in 0..2 do
                    cardChoose = $cardChosen[i]
                    newCards.keys[i].setState(false)
                    index = @@cardShow.keys.index(cardChoose)
                    newAddress = newCards[newCards.keys[i]]

                    replaceNewAddress(index, newAddress, newCards.keys[i])
                  end
                  deckClass.removeCard($cardChosen)
                  @@cardShow = @@cardShow.merge(newCards)
                  $cardChosen.clear()
                  
                  
                else
                  alert "Not a set! Try again!"

                end
              else
                @image6.path = @address6 + "_d.png"
                @card6.switch

                $cardChosen.delete(@card6 )
              end

            end

          end
        end

        flow width:0.25, height:0.2 do

          
            cards = @@cardShow.keys
            @card7= cards[6]
            @address7 = @@cardShow[@card7]
            @image7 = image  @address7 + ".png", width: 270, height:180, margin: 12
          @image7.click do
            if  $cardChosen.length < 2
              if ! @card7.getState
                @image7.path = @address7 + "_c.png"
                $cardChosen.push(@card7 )
                $stderr.puts @card7
                @card7.switch
              else
                @card7.switch
                @image7.path =@address7 + "_d.png"
                $cardChosen.delete(@card7)
              end
            else
              if !@card7.getState
                @image7.path = @address7 + "_c.png"
                @card7.switch
                $cardChosen.push(@card7 )
                if deckClass.isSet?($cardChosen)
                  alert "Congratulations! This is a set!"
                  $score +=1
                  $score_field.replace ($score)
                  newCards = deckClass.addCards
                  for i in 0..2 do
                    cardChoose = $cardChosen[i]
                    newCards.keys[i].setState(false)
                    index = @@cardShow.keys.index(cardChoose)
                    newAddress = newCards[newCards.keys[i]]
                    replaceNewAddress(index, newAddress, newCards.keys[i])
                  end
                  deckClass.removeCard($cardChosen)
                  @@cardShow = @@cardShow.merge(newCards)
                  $cardChosen.clear()
                  
                  
                else
                  alert "Not a set! Try again!"

                end
              else
                @image7.path = @address7 + "_d.png"
                @card7.switch

                $cardChosen.delete(@card7 )
              end

            end

          end
        end

        flow width:0.25, height:0.2 do

         
            cards = @@cardShow.keys
            @card8= cards[7]
            @address8 = @@cardShow[@card8]
            @image8 = image  @address8 + ".png", width: 270, height:180, margin: 12

          @image8.click do
            if  $cardChosen.length < 2
              if ! @card8.getState
                @image8.path = @address8 + "_c.png"
                $cardChosen.push(@card8 )
                $stderr.puts @card8
                @card8.switch
              else
                @card8.switch
                @image8.path =@address8 + "_d.png"
                $cardChosen.delete(@card8)
              end
            else
              if !@card8.getState
                @image8.path = @address8 + "_c.png"
                @card8.switch
                $cardChosen.push(@card8 )
                if deckClass.isSet?($cardChosen)
                  alert "Congratulations! This is a set!"
                  $score +=1
                  $score_field.replace ($score)
                  newCards = deckClass.addCards
                  for i in 0..2 do
                    cardChoose = $cardChosen[i]
                    newCards.keys[i].setState(false)
                    index = @@cardShow.keys.index(cardChoose)
                    newAddress = newCards[newCards.keys[i]]

                    replaceNewAddress(index, newAddress, newCards.keys[i])
                  end
                  deckClass.removeCard($cardChosen)
                  @@cardShow = @@cardShow.merge(newCards)
                  $cardChosen.clear()
                  
                  
                else
                  alert "Not a set! Try again!"

                end
              else
                @image8.path = @address8 + "_d.png"
                @card8.switch

                $cardChosen.delete(@card8)
              end

            end

          end
        end

        flow width:0.25, height:0.2 do

  
            cards = @@cardShow.keys
            @card9= cards[8]
            @address9 = @@cardShow[@card9]
            @image9 = image  @address9 + ".png", width: 270, height:180, margin: 12

          @image9.click do
            if  $cardChosen.length < 2
              if ! @card9.getState
                @image9.path = @address9 + "_c.png"
                $cardChosen.push(@card9 )
                $stderr.puts @card9
                @card9.switch
              else
                @card9.switch
                @image9.path =@address9 + "_d.png"
                $cardChosen.delete(@card9)
              end
            else
              if !@card9.getState
                @image9.path = @address9 + "_c.png"
                @card9.switch
                $cardChosen.push(@card9 )
                if deckClass.isSet?($cardChosen)
                  alert "Congratulations! This is a set!"
                  $score +=1
                  $score_field.replace ($score)
                  newCards = deckClass.addCards
                  for i in 0..2 do
                    cardChoose = $cardChosen[i]
                    newCards.keys[i].setState(false)
                    index = @@cardShow.keys.index(cardChoose)
                    newAddress = newCards[newCards.keys[i]]

                    replaceNewAddress(index, newAddress, newCards.keys[i])
                  end
                  deckClass.removeCard($cardChosen)
                  @@cardShow = @@cardShow.merge(newCards)
                  $cardChosen.clear()
                  
                  
                else
                  alert "Not a set! Try again!"

                end
              else
                @image9.path = @address9 + "_d.png"
                @card9.switch

                $cardChosen.delete(@card9 )
              end

            end

          end
        end

        flow width:0.25, height:0.2 do

        
            cards = @@cardShow.keys
            @card10= cards[9]
            @address10 = @@cardShow[@card10]
            @image10 = image  @address10 + ".png", width: 270, height:180, margin: 12

          @image10.click do
            if  $cardChosen.length < 2
              if ! @card10.getState
                @image10.path = @address10 + "_c.png"
                $cardChosen.push(@card10 )
                $stderr.puts @card10
                @card10.switch
              else
                @card10.switch
                @image10.path =@address10 + "_d.png"
                $cardChosen.delete(@card10)
              end
            else
              if !@card10.getState
                @image10.path = @address10 + "_c.png"
                @card10.switch
                $cardChosen.push(@card10 )
                if deckClass.isSet?($cardChosen)
                  alert "Congratulations! This is a set!"
                  $score +=1
                  $score_field.replace ($score)
                  newCards = deckClass.addCards
                  for i in 0..2 do
                    cardChoose = $cardChosen[i]
                    newCards.keys[i].setState(false)
                    index = @@cardShow.keys.index(cardChoose)
                    newAddress = newCards[newCards.keys[i]]
                    replaceNewAddress(index, newAddress, newCards.keys[i])

                    
                  end
                  deckClass.removeCard($cardChosen)
                  @@cardShow = @@cardShow.merge(newCards)
                  $cardChosen.clear()
                  
                  
                else
                  alert "Not a set! Try again!"

                end
              else
                @image10.path = @address10 + "_d.png"
                @card10.switch

                $cardChosen.delete(@card10)
              end

            end

          end
        end

        flow width:0.25, height:0.2 do


            cards = @@cardShow.keys
            @card11= cards[10]
            @address11 = @@cardShow[@card11]
            @image11 = image  @address11 + ".png", width: 270, height:180, margin: 12
 
          @image11.click do
            if  $cardChosen.length < 2
              if ! @card11.getState
                @image11.path = @address11 + "_c.png"
                $cardChosen.push(@card11 )
                $stderr.puts @card11
                @card11.switch
              else
                @card11.switch
                @image11.path =@address11 + "_d.png"
                $cardChosen.delete(@card11)
              end
            else
              if !@card11.getState
                @image11.path = @address11 + "_c.png"
                @card11.switch
                $cardChosen.push(@card11 )
                if deckClass.isSet?($cardChosen)
                  alert "Congratulations! This is a set!"
                  $score +=1
                  $score_field.replace ($score)
                  newCards = deckClass.addCards
                  for i in 0..2 do
                    cardChoose = $cardChosen[i]
                    newCards.keys[i].setState(false)
                    index = @@cardShow.keys.index(cardChoose)
                    newAddress = newCards[newCards.keys[i]]
                    replaceNewAddress(index, newAddress, newCards.keys[i])

                    
                  end
                  deckClass.removeCard($cardChosen)
                  @@cardShow = @@cardShow.merge(newCards)
                  $cardChosen.clear()
                  
                  
                else
                  alert "Not a set! Try again!"

                end
              else
                @image11.path = @address11 + "_d.png"
                @card11.switch

                $cardChosen.delete(@card11)
              end

            end

          end
        end

        flow width:0.25, height:0.2 do


            cards = @@cardShow.keys
            @card12= cards[11]
            @address12 = @@cardShow[@card12]
            @image12= image  @address12 + ".png", width: 270, height:180, margin: 12

          @image12.click do
            if  $cardChosen.length < 2
              if ! @card12.getState
                @image12.path = @address12 + "_c.png"
                $cardChosen.push(@card12 )
                $stderr.puts @card12
                @card12.switch
              else
                @card12.switch
                @image12.path =@address12 + "_d.png"
                $cardChosen.delete(@card12)
              end
            else
              if !@card12.getState
                @image12.path = @address12 + "_c.png"
                @card12.switch
                $cardChosen.push(@card12 )
                if deckClass.isSet?($cardChosen)
                  alert "Congratulations! This is a set!"
                  $score +=1
                  $score_field.replace ($score)
                  newCards = deckClass.addCards
                  for i in 0..2 do
                    cardChoose = $cardChosen[i]
                    newCards.keys[i].setState(false)
                    index = @@cardShow.keys.index(cardChoose)
                    newAddress = newCards[newCards.keys[i]]
                    replaceNewAddress(index, newAddress, newCards.keys[i])
                    
                  end
                  deckClass.removeCard($cardChosen)
                  @@cardShow = @@cardShow.merge(newCards)
                  $cardChosen.clear()
                  
                  
                else
                  alert "Not a set! Try again!"

                end
              else
                @image12.path = @address12 + "_d.png"
                @card12.switch

                $cardChosen.delete(@card12)
              end

            end

          end
        end


        flow width:0.25, height:0.2 do
          @image13 = image "img/empty.png" ,width: 270, height:180, margin: 12
          @image13.click do
            if @image13.path() == "img/empty.png"
              alert "You cannot choose an empty card!"
            else
              address = @image13.path
              if address.include?("_c.png")
                address.slice!("_c.png")
              elsif address.include?("_d.png")
                address.slice!("_d.png")
              elsif address.include?(".png")
                address.slice!(".png")
              end
              card = @@cardShow.key(address)
              if  $cardChosen.length < 2
                if !card.getState
                  @image13.path = address + "_c.png"
                  $cardChosen.push(card )
                  card.switch
                else
                  card.switch
                  @image13.path =address + "_d.png"
                  $cardChosen.delete(card)
                end
              else
                if !card.getState
                  card.switch
                  @image13.path = address + "_c.png"
                  $cardChosen.push(card )
                  if deckClass.isSet?($cardChosen)
                    alert "Congratulations! This is a set!"

                    $score +=1
                    $score_field.replace ($score)

                    newCards = deckClass.addCards
                    for i in 0..2 do
                      cardChoose = $cardChosen[i]
                      newCards.keys[i].setState(false)
                      index = @@cardShow.keys.index(cardChoose)
                      newAddress = newCards[newCards.keys[i]]
                      replaceNewAddress(index, newAddress, newCards.keys[i])

                    end
                    deckClass.removeCard($cardChosen)
                    @@cardShow = @@cardShow.merge(newCards)
                    $cardChosen.clear()
                  else
                    alert "Not a set! Try again!"

                  end
                else
                  card.switch
                  @image13.path = address + "_d.png"
                  $cardChosen.delete(card )
                end
              end
            end
          end



        end

        flow width:0.25, height:0.2 do

          @image14 = image "img/empty.png" ,width: 270, height:180, margin: 12
          @image14.click do
            if @image14.path() == "img/empty.png"
              alert "You cannot choose an empty card!"
            else
              address = @image14.path

              if address.include?("_c.png")
                address.slice!("_c.png")
              elsif address.include?("_d.png")
                address.slice!("_d.png")
              elsif address.include?(".png")
                address.slice!(".png")
              end


              card = @@cardShow.key(address)
              if  $cardChosen.length < 2
                if !card.getState
                  @image14.path = address + "_c.png"
                  $cardChosen.push(card )
                  card.switch
                else
                  card.switch
                  @image14.path =address + "_d.png"
                  $cardChosen.delete(card)
                end
              else
                if !card.getState
                  card.switch
                  @image14.path = address + "_c.png"
                  $cardChosen.push(card )
                  if deckClass.isSet?($cardChosen)
                    alert "Congratulations! This is a set!"

                    $score +=1
                    $score_field.replace ($score)

                    newCards = deckClass.addCards
                    for i in 0..2 do
                      cardChoose = $cardChosen[i]
                      newCards.keys[i].setState(false)
                      index = @@cardShow.keys.index(cardChoose)
                      newAddress = newCards[newCards.keys[i]]
                      replaceNewAddress(index, newAddress, newCards.keys[i])

                    end
                    deckClass.removeCard($cardChosen)
                    @@cardShow = @@cardShow.merge(newCards)
                    $cardChosen.clear()
                  else
                    alert "Not a set! Try again!"

                  end
                else
                  card.switch
                  @image14.path = address + "_d.png"
                  $cardChosen.delete(card )
                end
              end
            end
          end



        end

        flow width:0.25, height:0.2 do
          @image15 = image "img/empty.png" ,width: 270, height:180, margin: 12
          @image15.click do
            if @image15.path() == "img/empty.png"
              alert "You cannot choose an empty card!"
            else
              address = @image15.path
              if address.include?("_c.png")
                address.slice!("_c.png")
              elsif address.include?("_d.png")
                address.slice!("_d.png")
              elsif address.include?(".png")
                address.slice!(".png")
              end
              card = @@cardShow.key(address)
              if  $cardChosen.length < 2
                if !card.getState
                  @image15.path = address + "_c.png"
                  $cardChosen.push(card )
                  card.switch
                else
                  card.switch
                  @image15.path =address + "_d.png"
                  $cardChosen.delete(card)
                end
              else
                if !card.getState
                  card.switch
                  @image15.path = address + "_c.png"
                  $cardChosen.push(card )
                  if deckClass.isSet?($cardChosen)
                    alert "Congratulations! This is a set!"

                    $score +=1
                    $score_field.replace ($score)

                    newCards = deckClass.addCards
                    for i in 0..2 do
                      cardChoose = $cardChosen[i]
                      newCards.keys[i].setState(false)
                      index = @@cardShow.keys.index(cardChoose)
                      newAddress = newCards[newCards.keys[i]]
                      replaceNewAddress(index, newAddress, newCards.keys[i])
                      card = newCards.key(newAddress)
                    end
                    deckClass.removeCard($cardChosen)
                    @@cardShow = @@cardShow.merge(newCards)
                    $cardChosen.clear()
                  else
                    alert "Not a set! Try again!"

                  end
                else
                  card.switch
                  @image15.path = address + "_d.png"
                  $cardChosen.delete(card )
                end
              end
            end
          end



        end

        flow width:0.25, height:0.2 do
           @image16 = image "img/empty.png" ,width: 270, height:180, margin: 12
          @image16.click do
            if @image16.path() == "img/empty.png"
              alert "You cannot choose an empty card!"
            else
              address = @image16.path
              if address.include?("_c.png")
                address.slice!("_c.png")
              elsif address.include?("_d.png")
                address.slice!("_d.png")
              elsif address.include?(".png")
                address.slice!(".png")
              end
              card = @@cardShow.key(address)
              if  $cardChosen.length < 2
                if !card.getState
                  @image16.path = address + "_c.png"
                  $cardChosen.push(card )
                  card.switch
                else
                  card.switch
                  @image16.path =address + "_d.png"
                  $cardChosen.delete(card)
                end
              else
                if !card.getState
                  card.switch
                  @image16.path = address + "_c.png"
                  $cardChosen.push(card )
                  if deckClass.isSet?($cardChosen)
                    alert "Congratulations! This is a set!"

                    $score +=1
                    $score_field.replace ($score)

                    newCards = deckClass.addCards
                    for i in 0..2 do
                      cardChoose = $cardChosen[i]
                      newCards.keys[i].setState(false)
                      index = @@cardShow.keys.index(cardChoose)
                      newAddress = newCards[newCards.keys[i]]
                      replaceNewAddress(index, newAddress, newCards.keys[i])
                      card = newCards.key(newAddress)

                     

                    end
                    deckClass.removeCard($cardChosen)
                    @@cardShow = @@cardShow.merge(newCards)
                    $cardChosen.clear()
                  else
                    alert "Not a set! Try again!"

                  end
                else
                  card.switch
                  @image16.path = address + "_d.png"
                  $cardChosen.delete(card )
                end
              end
            end
          end



        end

        flow width:0.25, height:0.2 do
          @image17 = image "img/empty.png" ,width: 270, height:180, margin: 12
          @image17.click do
            if @image17.path() == "img/empty.png"
              alert "You cannot choose an empty card!"
            else
              address = @image17.path
              if address.include?("_c.png")
                address.slice!("_c.png")
              elsif address.include?("_d.png")
                address.slice!("_d.png")
              elsif address.include?(".png")
                address.slice!(".png")
              end
              card = @@cardShow.key(address)
              if  $cardChosen.length < 2
                if !card.getState
                  @image17.path = address + "_c.png"
                  $cardChosen.push(card )
                  card.switch
                else
                  card.switch
                  @image17.path =address + "_d.png"
                  $cardChosen.delete(card)
                end
              else
                if !card.getState
                  card.switch
                  @image17.path = address + "_c.png"
                  $cardChosen.push(card )
                  if deckClass.isSet?($cardChosen)
                    alert "Congratulations! This is a set!"

                    $score +=1
                    $score_field.replace ($score)

                    newCards = deckClass.addCards
                    for i in 0..2 do
                      cardChoose = $cardChosen[i]
                      newCards.keys[i].setState(false)
                      index = @@cardShow.keys.index(cardChoose)
                      newAddress = newCards[newCards.keys[i]]

                      replaceNewAddress(index, newAddress, newCards.keys[i])
                      card = newCards.key(newAddress)

                    end
                    deckClass.removeCard($cardChosen)
                    @@cardShow = @@cardShow.merge(newCards)
                    $cardChosen.clear()
                  else
                    alert "Not a set! Try again!"

                  end
                else
                  card.switch
                  @image17.path = address + "_d.png"
                  $cardChosen.delete(card )
                end
              end
            end
          end



        end

        flow width:0.25, height:0.2 do
          @image18 = image "img/empty.png" ,width: 270, height:180, margin: 12
          @image18.click do
            if @image18.path() == "img/empty.png"
              alert "You cannot choose an empty card!"
            else
              address = @image18.path
              if address.include?("_c.png")
                address.slice!("_c.png")
              elsif address.include?("_d.png")
                address.slice!("_d.png")
              elsif address.include?(".png")
                address.slice!(".png")
              end
              card = @@cardShow.key(address)
              if  $cardChosen.length < 2
                if !card.getState
                  @image18.path = address + "_c.png"
                  $cardChosen.push(card )
                  card.switch
                else
                  card.switch
                  @image18.path =address + "_d.png"
                  $cardChosen.delete(card)
                end
              else
                if !card.getState
                  card.switch
                  @image18.path = address + "_c.png"
                  $cardChosen.push(card )
                  if deckClass.isSet?($cardChosen)
                    alert "Congratulations! This is a set!"

                    $score +=1
                    $score_field.replace ($score)

                    newCards = deckClass.addCards
                    for i in 0..2 do
                      cardChoose = $cardChosen[i]
                      newCards.keys[i].setState(false)
                      index = @@cardShow.keys.index(cardChoose)
                      newAddress = newCards[newCards.keys[i]]
                      replaceNewAddress(index, newAddress, newCards.keys[i])
                      card = newCards.key(newAddress)

                    end
                    deckClass.removeCard($cardChosen)
                    @@cardShow = @@cardShow.merge(newCards)
                    $cardChosen.clear()
                  else
                    alert "Not a set! Try again!"

                  end
                else
                  card.switch
                  @image18.path = address + "_d.png"
                  $cardChosen.delete(card )
                end
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

  background "#F3F".."#F90"
  title("Set_Game",
        top:    200,
        align:  "center",
        font:   "Trebuchet MS",
        stroke: white)
  button  "Start" do
    self.clear
    main
  end

end
