
var menuActive = true;
var pathsDiv = $("#paths-div");

$("#diagram-show-menu").click(function () {
    if ($("#diagram-menu").css("transform") == "matrix(1, 0, 0, 1, -350, 0)") {
        $("#diagram-menu").css("transform", "translateX(0px)");
        $("#diagram-show-menu i").css("transform", "rotate(180deg)");
        menuActive = true;
    } else {
        $("#diagram-menu").css("transform", "translateX(-350px)");
        $("#diagram-show-menu i").css("transform", "rotate(0deg)");
        setTimeout(function(){ menuActive = false; }, 500);
    }
});

var squareSize = 15;
var squares = [];
var sW = 1;
var actRow = 1;

function fillSq() {
    //let maxX = Math.floor(maxTamCanvas[0] / (squareSize + (sW*2)));
    //let maxY = Math.floor(maxTamCanvas[1] / (squareSize + (sW*2)));
    let maxX = 150;
    let maxY = 150;

    squares.push([false, true]);
    for (let j = 0; j < maxX - 2; j++) {
        squares[0].push(false);
    }

    for (let i = 1; i < maxY; i++) {
        squares.push([]);
        for (let j = 0; j < maxX; j++) {
            squares[i].push(false);
        }
    }
}

function setup() {
    var myCanvas = createCanvas(windowWidth, windowHeight);
    myCanvas.parent("design-container");
    fillSq();
}

function draw() {
    clear();
    background(70, 66, 74);
    drawSquares();
    if (actRow < squares.length) {
        updateSquares();
        actRow++;
    } else {
        noLoop();
    }
}

function drawSquares() {
    for (let i = 0; i < squares.length; i++) {
        for (let j = 0; j < squares[i].length; j++) {
            const s = squares[i][j];
            strokeWeight(sW);
            stroke(255);
            if (s) fill(255, 0, 0);
            else fill(70, 66, 74);
            square(j * (squareSize + (sW*2)), i * (squareSize + (sW*2)), squareSize);
        }
    }
}

function updateSquares() {
    for (let i = 1; i < squares[actRow].length; i++) {
       squares[actRow][i] = useGrammar([squares[actRow-1][i-1], squares[actRow-1][i]]);
    }
}

function useGrammar(pair) {
    if ((pair[0] && !pair[1]) || (!pair[0] && pair[1])) return true;
    return false;
}