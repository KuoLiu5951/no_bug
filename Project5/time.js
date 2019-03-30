
/*
    A countdown timer to remind the user how much time is left. It is refered to StackOverflow: How to create a simpliest timer in javascript.
*/
function startTimer(duration, display) {
    var timer = duration, minutes, seconds;
    setInterval(function createTime() {
        minutes = parseInt(timer / 60, 10);
        seconds = parseInt(timer % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.textContent = minutes + ":" + seconds;

        if (--timer < 0) {
            timer = duration;
        }
    }, 1000);
}

window.onload = function () {
    var fiveMinutes = 60 * 30;
    display = document.querySelector("#time");
    startTimer(fiveMinutes, display);
};