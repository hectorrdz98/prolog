
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

var originalNodes = [];
var nodes = [];
var sorting = null;

class Node {
    constructor(x, y) {
        this.x = x;
        this.y = y;
        this.color = null;
    }
}

$(".sortBtn").click(function () {
    sorting = $(this).attr('id');
});

$("#reset").click(function () {
    sorting = null
    nodes = originalNodes.slice()
    actComp = 0
    comparations.text("Comp: " + (actComp))
});

var maxTamCanvas = [1536, 754];

function setup() {
    var myCanvas = createCanvas(windowWidth, windowHeight);
    myCanvas.parent("design-container");
    for (let i = 500; i <= 1190; i+=10) {
        createNode(i, 100 + Math.random() * 500);
    }
    nodes = originalNodes.slice();
    iShell = nodes.length / 2;
}

var swapped = true;
var iInsert = 1;
var iShell = 0;

let comparations = $("#compartions h3");
var actComp = 0;

function draw() {
    frameRate(10);
    clear();
    background(70, 66, 74);
    drawNodes();
    if (sorting) {
        if (sorting == 'bubble') {
            if (swapped) {
                swapped = false
                for (let i = 0; i < nodes.length-1; i++) {
                    if (nodes[i].y > nodes[i+1].y)
                    {
                        const temp = nodes[i]
                        nodes[i] = nodes[i+1]
                        nodes[i+1] = temp
                        swapped = true
                    }
                    comparations.text("Comp: " + (++actComp))
                }
            } else {
                sorting = null
                actComp = 0
            }
        } else if (sorting == 'insertion') {
            if (iInsert < nodes.length) {
                if (nodes[iInsert].y < nodes[0].y) {
                    nodes.unshift(nodes.splice(iInsert,1)[0])
                    comparations.text("Comp: " + (++actComp))
                } 
                else if (nodes[iInsert].y > nodes[iInsert-1].y) { } 
                else {
                    for (let j = 1; j < iInsert; j++) {
                        if (nodes[iInsert].y > nodes[j-1].y && nodes[iInsert].y < nodes[j].y) 
                        {
                            nodes.splice(j, 0, nodes.splice(iInsert,1)[0])
                        }
                        comparations.text("Comp: " + (++actComp))
                    }
                }
                iInsert++
            } else {
                iInsert = 1
                sorting = null
                actComp = 0
            }
        } else if (sorting == 'shell') {
            if (iShell > 0) {
                for (var i = iShell; i < nodes.length; i++) {
                    var j = i;
                    var temp = nodes[i];
            
                    while (j >= iShell && nodes[j-iShell].y > temp.y) {
                        nodes[j] = nodes[j-iShell];
                        j = j - iShell;
                        comparations.text("Comp: " + (++actComp))
                    }

                    nodes[j] = temp;
                }
            
                if (iShell == 2) {
                    iShell = 1;
                } else {
                    iShell = parseInt(iShell*5 / 11);
                }
            } else {
                iShell = 1
                sorting = null
                actComp = 0
            }
        }
    }
}

function createNode(X, Y) {
    var node = new Node(X, Y);
    node.color = [
        0,
        0,
        255*Y/600
    ];
    originalNodes.push(node);
}

function drawNodes() {
    let X = 500;
    nodes.forEach(node => {
        fill(node.color);
        stroke(255);
        circle(X, node.y, 15);
        X += 10;
    });
}