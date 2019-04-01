/*timer implements a countdown clock showed on the game website. Reference: Stackoverflow "how to set one minute counter in javascript"*/
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
        alert("Game over!")
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
