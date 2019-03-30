var deck = [];
var cardSelected = [];
var cardShow = []

function Card(shade, shape, color, number, choosen, path){
    this.shade = shade; 
    this.shape = shape;
    this.color = color;
    this.number = number;
    this.choosen = choosen;
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
                    card = new Card(number, color ,shape, shade, false, path);
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
    for (i = 0; i <cardNum-1; i++){
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
    if(cardShow.length=18){
        window.alert("Three are 18 cards already. You cannot add more cards!");
    }
    else{
        for (i = 0; i < 3; i++){
            let max = deck.length;
            let random = Math.floor(Math.random() * max);
            cardShow.push(deck[random]);
            deck.splice(random,1);
        }
    }
    return cardShow;
}

/*
    Verify that whether the 3 cards selected by the user is a set or not.
*/
function isSet(cardSelected){
    let card1 = cardSelected[0];
    let card2 = cardSelected[1];
    let card3 = cardSelected[2];
    var set = false;
    if ((card1.color === card2.color && card2.color === card3.color) || (card1.color !== card2.color && card2.color !==card3.color && card1.color !== card3.color)){
        if ((card1.number === card2.number && card2.number ===card3.number) || (card1.number !== card2.number && card2.number !== card3.number && card1.number !==card3.number)){
            if ((card1.shape === card2.shape && card2.shape ===card3.shape) || (card1.shape !== card2.shape && card2.shape !== card3.shape && card1.shape !==card3.shape)){
                if ((card1.shade === card2.shade && card2.shade ===card3.shade) || (card1.shade !== card2.shade && card2.shade !== card3.shade && card1.shade !==card3.shade)){
                    set = true;
                }
            }
        }
    } 

    return set;
}

/*
    Change the card state if it was clicked.
*/
function changeState(card){
    if (card.choosen == false){
        card.choosen = true;
    }
    else{
        card.choosen = false;
    }
}

/*
    Change the path of the card whenever its state is changed.
*/
function changePath(card){
    var pathString = card.path;
    if (pathString.indexOf('c') > -1){
        pathString = pathString.replace('_c','');
    }
    else{
        pathString = pathString + "_c";
    }
    card.path = pathString
}


/*
    Give a hint to the player according to the two cards he/she has already choosen.
*/
function hint(cardSelected){
    if (cardSelected.length < 2){
        window.alert("You must choose 2 cards before get a hint!")
    }
    else{
        let card1 = cardSelected[0];
        let card2 = cardSelected[1];
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
            window.alert("You've chosen wrong cards! Try again!");
        }
    }
}



function restartClick(){
    deck = [];
    cardShow = [];
    createDeck(deck);
    cardShow = getRandom(12,deck);
    for(i=0;i<cardShow.length-1;i++){
        let temp = i + 1;
        let id = "card" + temp;
        let img = document.getElementById(id);
        img.src = cardShow[i].path;
    }
}







