var deck = [];
var cardSelected = [];
var cardShow = []

function Card(shade, shape, color, number,path){
    this.shade = shade; 
    this.shape = shape;
    this.color = color;
    this.number = number;
    this.path = path;
}

/*
    Create the deck contains 81 cards.Shade = 1,2,3 means solid, striped, open; Shape = 1,2,3 means squiggle, diamond, oval; color = 1,2,3 means red, purple, green; number = 1,2,3 means the number of shapes.
*/
function createDeck(deck){
    var pathConst = "images/"
    for(shade = 1; shade < 4; shade ++){
        for(shape = 1; shape < 4; shape ++){
            for(color = 1; color < 4; color ++){
                for(number = 1; number <4; number ++){
                    path = pathConst + shade + "_" + shape + "_" + color + "_" + number + ".png";
                    card = new Card(number, color ,shape, shade, path);
                    deck.push(card);
                }
            }
        }
    }
}

/*
    Get a set of cards that will be showed on the page and remove them from the temporary deck.
*/
function getRandom(cardNum,deck){
    var cardShow =[];
    for (i = 0; i <cardNum; i++){
        let max = deck.length;
        let random = Math.floor(Math.random() * max);
        cardShow.push(deck[random]);
        deck.splice(random,1);

    }
    return cardShow;
}

/*
    Add 3 cards in the cardShow
*/
function addThreeCards(cardShow,deck){
    let cardShowLength = cardShow.length;
    if(cardShowLength==18){
        alert("Three are 18 cards already. You cannot add more cards!");
    }
    else{
        for (i = 0; i < 3; i++){
            let max = deck.length;
            let random = Math.floor(Math.random() * max);
            cardShow.push(deck[random]);
            deck.splice(random,1);
        }
        let cardTable = document.getElementsByClassName("cards");
        let length = cardsTable.length;
        for (j = 0; j<3; j++){
            cardTable[cardShowLength+j].firstElementChild.src=cardShow[cardShowLength+j].path;
        }

    }
    return cardShow;
}

/*
    Verify that whether the 3 cards selected by the user is a set or not.
*/
function isSet(cardSelected){
    card1 = cardSelected[0];
    card2 = cardSelected[1];
    card3 = cardSelected[2];
    let set = false;
    if ((card1.color == card2.color && card2.color == card3.color) || (card1.color != card2.color && card2.color !=card3.color && card1.color != card3.color)){
        if ((card1.number == card2.number && card2.number ==card3.number) || (card1.number != card2.number && card2.number != card3.number && card1.number !=card3.number)){
            if ((card1.shape == card2.shape && card2.shape ==card3.shape) || (card1.shape != card2.shape && card2.shape != card3.shape && card1.shape !=card3.shape)){
                if ((card1.shade == card2.shade && card2.shade ==card3.shade) || (card1.shade != card2.shade && card2.shade != card3.shade && card1.shade !=card3.shade)){
                    set = true;
                }
            }
        }
    } 

    return set;
}

/*
    Give a hint to the player according to the two cards he/she has already choosen.
*/
function hint(cardSelected){
    if (cardSelected.length < 2){
        alert("You must choose 2 cards before get a hint!")
    }
    else{
        card1 = cardSelected[0];
        card2 = cardSelected[1];
        let aSet = false;
        
        for(i=0;i<cardShow.length-1 && !aSet;i++){
            cardSelected.push(cardShow[i]);
            if (isSet(cardSelected)){
                /* Show a window gives the user that card*/ 
                cardSelected.pop();
                aSet = true;
            }
        }
        if (!aSet){
            alert("You've chosen wrong cards! Try again!");
        }
    }
}
function submitClick(){
    alert("Information saved successfully!")
    window.location.replace("cards.html")
}

function restartClick(){
    deck = [];
    cardShow = [];
    cardSelected = [];
    createDeck(deck);
    cardShow = getRandom(12,deck);
    for(i=0;i<cardShow.length;i++){
        let temp = i + 1;
        let id = "card" + temp;
        let img = document.getElementById(id);
        img.src = cardShow[i].path;
    }
}

let cardsTable = document.getElementsByClassName("cards");
for (i = 0; i<cardsTable.length-1;i++){
    cardsTable[i].onclick = function cardClick(){
        
        let id = this.firstElementChild.id;
        let index = id.replace('card','') -1;
        if (index > cardShow.length-1){
            alert("You cannot select an empty card!");
        }
        else{
            card = cardShow[index];
            if (cardSelected.length<3){
                let pathString = card.path;
                if (pathString.indexOf('c') > -1){
                    pathString = pathString.replace('_c.png','.png');
                    cardSelected.splice(cardSelected.indexOf(card),1);
                    card.path = pathString;
                    this.firstElementChild.src = pathString;
                }
                else{
                    pathString = pathString.replace('.png','_c.png');
                    card.path = pathString;
                    this.firstElementChild.src = pathString;
                    cardSelected.push(card);
                    if (cardSelected.length==3){
                        let set = isSet(cardSelected);
                        if (set){
                            alert("Congratulations! This is a set!");
                            /*
                                Add Score
                            */
                            for(i=0;i<3;i++){
                                selectedCard = cardSelected[i];
                                
                                let cardIndex = cardShow.indexOf(selectedCard);
                                let random = Math.floor(Math.random() * deck.length);
                                newCard = deck[random];
                                cardShow[cardIndex]=newCard;
                                cardsTable[cardIndex].firstElementChild.src = newCard.path;
                                deck.splice(random,1);
                            }
                            cardSelected = [];
                        }
                        else{
                            alert("This is not a set. Try again!");
                            pathString = pathString.replace('_c.png','.png');
                            cardSelected.splice(cardSelected.indexOf(card),1);
                            card.path = pathString;
                            this.firstElementChild.src = pathString;
                        }
                    }
                }
                
            }
            
           
        }
        
    }
}




    





