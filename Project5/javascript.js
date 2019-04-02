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

var emptyCard = new Card(0,0,0,"images/emptyCard.png");
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
                    card = new Card(shade, shape ,color, number, path);
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
        document.getElementById("cardsRemain").innerHTML  = document.getElementById("cardsRemain").innerHTML- 3;

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

function hintClick(){
    if (cardSelected.length < 2){
        alert("You must choose 2 cards before get a hint!")
    }
    else{
        card1 = cardSelected[0];
        card2 = cardSelected[1];
        let aSet = false;
        for(i=0;i<cardShow.length && !aSet;i++){
            cardHint = cardShow[i];
            cardSelected.push(cardHint);
            if (isSet(cardSelected)){
                let cardShade = ["solid","striped","open"];
                let cardShape = ["squiggle", "diamond", "oval"]; 
                let cardColor= ["red", "purple", "green"];
                alert("The Card that will form a set is "+cardColor[cardHint.color-1]+" ," + cardShade[cardHint.shade-1] + " ," + cardShape[cardHint.shape-1]+ " contains " + cardHint.number + " shapes!" );
               
                aSet = true;
            }
            cardSelected.pop();
        }
        if (!aSet){
            alert("You've chosen wrong cards! Try again!");
         
        }
    }
}



function restartClick(){
    deck = [];
    cardShow = [];
    cardSelected = [];
    document.getElementById("score").innerHTML=0;
    cdreset();
    countdown();
    
    createDeck(deck);
    cardShow = getRandom(12,deck);
    for(i=0;i<cardShow.length;i++){
        let temp = i + 1;
        let id = "card" + temp;
        let img = document.getElementById(id);
        img.src = cardShow[i].path;
    }
    let cardsTable = document.getElementsByClassName("cards");
    for(x = cardShow.length; x<cardsTable.length;x++){
        cardsTable[x].firstElementChild.src = "images/empty.png";
    }
    document.getElementById("cardsRemain").innerHTML = 81 - cardShow.length;
}

let cardsTable = document.getElementsByClassName("cards");
for (i = 0; i<cardsTable.length;i++){
    cardsTable[i].onclick = function cardClick(){
       
        if (this.firstElementChild.src=="images/empty.png"){
            alert("You cannot select an empty card!")
        }
        else{
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
                            document.getElementById("score").innerHTML++;

                            
                            console.log(score);
                            if (deck.length>=3){
                                for(i=0;i<3;i++){
                                    selectedCard = cardSelected[i];
                                    let cardIndex = cardShow.indexOf(selectedCard);
                                    let random = Math.floor(Math.random() * deck.length);
                                    newCard = deck[random];
                                    cardShow[cardIndex]=newCard;
                                    cardsTable[cardIndex].firstElementChild.src = newCard.path;
                                    deck.splice(random,1);
                                }
                            }
                            else{
                                for(i=0;i<3;i++){
                                    selectedCard = cardSelected[i];
                                    let cardIndex = cardShow.indexOf(selectedCard);
                                    cardShow[cardIndex]=emptyCard;
                                    cardsTable[cardIndex].firstElementChild.src = emptyCard.path;
                                }

                            }
                           
                            let cardsInHtml = document.getElementById("cardsRemain").innerHTML;
                            if (cardsInHtml>=3){
                                document.getElementById("cardsRemain").innerHTML= cardsInHtml- 3;
                            }
                            else{
                                alert("Congratulations! You chose all sets! Your total score is 27. Please click restart button if you want to try again.")
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
}


/*
    Following is the time part.
*/
var CCOUNT = 1800;

var t, count;

function cddisplay() {
    // displays time in span
    document.getElementById('timespan').innerHTML = count;
};

function countdown() {
    // starts countdown
    cddisplay();
    if (count == 0) {
        alert("Game over! You score is " + document.getElementById("score").innerHTML + "! Please click restart button if you want to play again!");
    } else {
        count--;
        t = setTimeout("countdown()", 1000);
    }
};

function cdpause() {
    // pauses countdown
    clearTimeout(t);
};

function cdreset() {
    // resets countdown
    cdpause();
    count = CCOUNT;
    cddisplay();
};

    





