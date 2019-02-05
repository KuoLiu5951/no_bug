# Project2: Set Game
Start date: 01/26/2019
## Game Tutorial
The rules of the SET game can be found on [Wikipedia](https://en.wikipedia.org/wiki/Set_(card_game)).
## Requirement
     -- RubyMine
     -- Ruby Shoes 3.3
## How to Run
     -- Clone the repo using
     git clone https://github.com/cse-3901-sp2019-1800/no_bug/tree/master/Project2
     and make sure downloading the Project2 into Disk C with img file inside it. (The path of img file is C:/Project2/img) If you meet some errors like images does not show in our
     set game, please check the deck.rb there are specific address of images.
## Quick Start
     -- There are 3 * 6 buttons to display the cards on the table. Initially there are 12 cards, empty 
     image files are used for the other 6 buttons, in case that the player clicks "Add Card" button 
     because there are no set. Every time there are three cards being clicked which will be check 
     automatically. When finding a set in the limited time, the player will get one point.
     
     -- There are two buttons which the player could choose a difficulty. Easy mode (time limit to 
     find a set is 2 minutes), and Hard mode(time limit to find a set is 1 minutes) player will 
     choose. If the timer run out, the game will be stopped.
     
     -- There is a "Restart" button, which can restart a new game.
     
     -- The "Hint" button can be used when the player have no idea, but player must choose two cards first.
     
     -- "Score" field : display the score in game.
## Implementations Details
     -- Cards.rb
     * Each card of total 81 cards has one of each attrubute: number(single, double, triple), color(red, green, purple), 
     shape(diamond, squiggle, oval), and shade(solid, striped, empty), which was coded as address. 
     * get_hint function would be called if player click Hint button, which will highlight the possible card that could form 
     a set, or add three new cards if there is no set on the board.
     * game
     -- Deck.rb
     * total number of cards is 3^4=81
     * getRandomCards will generate first 12 cards on board in an array, and remove them from the whole cards array, which 
     will call function removeCard.
     * addCards would be called if player click Add 3 cards button, which will add 3 more cards to array of the first 
     generated cards, and remove them from the rest of the whole cards array, which will call function removeCard.
     * isSet? would be called if player choose three cards. This function returns whether 3-cards is a set or not. 
     * containSet? verify there exists one or more sets on the board. When player click Add 3 cards button, only if containSet?
     does not return true, there will be 3 cards added.
     -- Score.rb
     *If player find a set, there will be one point added shown on screen.
     --GUI.rb
     *GUI.rb is the outlook of the game, it implement the start button, restart button, hint button, add 3 cards button, esay button,
     and hard button. It has show of time, score.
     
     
## Meeting
     -- 01/27/2019:
     Our team learned how to program with Ruby.
     -- 01/30/2019:
     Our team developed the structure of the game, implemented the class "Cards", and designed what the GUI looks like.
     -- 01/31/2019:
     Our team implemented the class "Timer" and "Score".
     --02/01/2019:
     Our team discussed how to link buttons to functions.
     --02/02/2019:
     Our team failed to connect Ruby with GUI using glade and decided to use Ruby Shoes.
     --02/03/2019:
     Our team implemented the class "deck", and learned how to use Shoes to design and implement GUI.
     --02/04/2019:
     Our team implemented the function that updates the cards, and create functions of according buttons. 
     Our team worked around the clock.
     --02/05/2019:
     Our team implemented more functions of the buttons, and implemented the methods that the board would update the card 
     chosen after player choose a set. And our team debug the code at the eleventh hour.
     
