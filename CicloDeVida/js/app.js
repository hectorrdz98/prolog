
var maxTamCanvas = [1536, 754];
var dimensions = [30,30];
var things = [];
var thingsMatrix = [];
var thingsSize = 20;

var playing = false;

$("#start").click(function () {
    if (playing) {
        $(this).text("Start");
        $(this).addClass("is-info");
        $(this).removeClass("is-danger");
    } else {
        $(this).text("Stop");
        $(this).removeClass("is-info");
        $(this).addClass("is-danger");
    }
    playing = !playing;
});

class Thing {
    constructor(x, y) {
        this.x = x;
        this.y = y;
        this.color = null;
        this.currentState = false;
        this.nextState = false;
    }
}

function setup() {
    var myCanvas = createCanvas(windowWidth, windowHeight);
    myCanvas.parent("design-container");
    createThings();
}

function draw() {
    if (playing) frameRate(30);
    else frameRate(60);
    clear();
    background(255,255,255);
    drawThings();
    if (playing) {
        getNextGen();
        changeToNextGen();
    } 
}

function createThings() {
    for (let i = 0; i < dimensions[0]; i++) {
        thingsMatrix.push([]);
        for (let j = 0; j < dimensions[1]; j++) {
            let thing = new Thing(j * (thingsSize + 4) + 4, i * (thingsSize + 4) + 4);
            /*thing.color = [
                Math.floor(Math.random() * 255),
                Math.floor(Math.random() * 255),
                Math.floor(Math.random() * 255)
            ];*/
            thing.color = [0,0,0];
            thingsMatrix[i].push(thing);
            things.push(thing);
        }
    }
}

function drawThings() {
    things.forEach(thing => {
        push();
        if (thing.currentState) 
            fill(thing.color);
        square(thing.x, thing.y, thingsSize);
        pop();
    });
}

function getNextGen() {
    for (let i = 0; i < thingsMatrix.length; i++) {
        for (let j = 0; j < thingsMatrix[i].length; j++) {
            const thing = thingsMatrix[i][j];
            let neighbors = [];
            if (i > 0) {
                neighbors.push(thingsMatrix[i-1][j]);
                if (j > 0)
                    neighbors.push(thingsMatrix[i-1][j-1]);
                if (j + 1 < thingsMatrix[i].length)
                    neighbors.push(thingsMatrix[i-1][j+1]);
            }
            if (j > 0)
                neighbors.push(thingsMatrix[i][j-1]);
            if (j + 1 < thingsMatrix[i].length)
                neighbors.push(thingsMatrix[i][j+1]);
            if (i + 1 < thingsMatrix[i].length) {
                neighbors.push(thingsMatrix[i+1][j]);
                if (j > 0)
                    neighbors.push(thingsMatrix[i+1][j-1]);
                if (j + 1 < thingsMatrix[i].length)
                    neighbors.push(thingsMatrix[i+1][j+1]);
            }

            let totalAliveNeighbors = 0;
            neighbors.forEach(neighbor => {
                totalAliveNeighbors += neighbor.currentState ? 1 : 0;
            });
            
            if (thing.currentState) {
                if (totalAliveNeighbors < 2 || totalAliveNeighbors > 3) thing.nextState = false;
                else thing.nextState = true;
            } else {
                if (totalAliveNeighbors == 3) thing.nextState = true;
            }
        }
    }
}

function changeToNextGen() {
    things.forEach(thing => {
        thing.currentState = thing.nextState;
    });
}

function mouseClicked() {
    let thing = getThingClicked();
    if (thing) {}
        thing.currentState = !thing.currentState;
}

function getThingClicked() {
    for (let i = 0; i < things.length; i++) {
        const thing = things[i];
        if (((thing.x <= mouseX) && (thing.x + thingsSize >= mouseX)) &&
            ((thing.y <= mouseY) && (thing.y + thingsSize >= mouseY)))
            return thing;
    }
    return null;
}