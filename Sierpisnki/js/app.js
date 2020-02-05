
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

var nodes = [];
var original = [];
var baseNode = null;
var drawing = false;

class Node {
    constructor(x, y) {
        this.x = x;
        this.y = y;
        this.color = null;
        this.parent = null;
        this.children = [];
    }
}

$("#btnStart").click(function () {
    drawing = !drawing;
});

var maxTamCanvas = [1536, 754];

function setup() {
    var myCanvas = createCanvas(windowWidth, windowHeight);
    myCanvas.parent("design-container");
}

function draw() {
    clear();
    background(70, 66, 74);
    drawNodes();
    if (drawing)
        updateNode();
}

function mouseClicked() {
    if (menuActive) {
        if (mouseX > 400 && (mouseX < 1130 || mouseY < 550)) {
            clickEvent();
        }
    } else {
        if (mouseX > 50 && (mouseX < 1130 || mouseY < 550)) {
            clickEvent();
        }
    }
}

function clickEvent() {
    var node = new Node(mouseX, mouseY);
    node.color = [
        Math.floor(Math.random() * 255),
        Math.floor(Math.random() * 255),
        Math.floor(Math.random() * 255)
    ];
    original.push(node);
    if (!baseNode)
        baseNode = node;
}

function drawNodes() {
    original.forEach(node => {
        push();
        noStroke();
        fill(node.color);
        if (node == baseNode) {
            stroke(255);
            circle(node.x, node.y, 15);
        } else {
            circle(node.x, node.y, 10);
        }
        pop();
    });
    nodes.forEach(node => {
        push();
        noStroke();
        fill(node.color);
        if (node == baseNode) {
            stroke(255);
            circle(node.x, node.y, 5);
        } else {
            circle(node.x, node.y, 3);
        }
            
        pop();
    });
}

function updateNode() {
    let random = original[Math.floor(Math.random() * original.length)];
    let node = new Node(
        Math.round((random.x + baseNode.x) / 2), 
        Math.round((random.y + baseNode.y) / 2)
    );
    node.color = [
        Math.floor(Math.random() * 255),
        Math.floor(Math.random() * 255),
        Math.floor(Math.random() * 255)
    ];
    nodes.push(node);
    baseNode = node;
}