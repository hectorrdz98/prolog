
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
    swapped = true
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
var iShell2 = 0;
var mergeStart = false;
var quickStart = false;
var heapStart = false;

var resultsExtra = [];

let comparations = $("#compartions h3");
var actComp = 0;

function draw() {
    frameRate(60);
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
                if (iShell2 < nodes.length) {
                    var j = iShell2
                    var temp = nodes[iShell2]
            
                    while (j >= iShell && nodes[j-iShell].y > temp.y) {
                        nodes[j] = nodes[j-iShell]
                        j = j - iShell
                        comparations.text("Comp: " + (++actComp))
                        drawNodes()
                    }

                    nodes[j] = temp;
                    iShell2++;
                } else {
                    if (iShell == 2) {
                        iShell = 1
                    } else {
                        iShell = parseInt(iShell*5 / 11)
                    }
                    iShell2 = iShell
                }
            } else {
                iShell = 0
                iShell = 0
                sorting = null
                actComp = 0
            }
        } else if (sorting == 'merge') {
            if (!mergeStart) {
                nodes = mergeSort(nodes)
                mergeStart = true
            } else {
                sorting = null
                actComp = 0
                mergeStart = false
            }
        } else if (sorting == 'quick') {
            if (!quickStart) {
                nodes = quickSort(nodes, 0, nodes.length-1)
                quickStart = true
            } else {
                sorting = null
                actComp = 0
                quickStart = false
            }
        } else if (sorting == 'heap') {
            if (!heapStart) {
                heapSort(nodes)
                heapStart = true
            } else {
                sorting = null
                actComp = 0
                heapStart = false
            }
        }
    }
}

const mergeSort = (list) =>{
    if(list.length <= 1) return list;
    const middle = list.length / 2 ;
    const left = list.slice(0, middle);
    const right = list.slice(middle, list.length);
    return merge(mergeSort(left), mergeSort(right));
}

const merge = (left, right) => {
    var result = []
    while(left.length || right.length) {
        if(left.length && right.length) {
            if(left[0].y < right[0].y) {
                result.push(left.shift())
            } else {
                result.push(right.shift())
            }
        } else if(left.length) {
            result.push(left.shift())
        } else {
            result.push(right.shift())
        }
        comparations.text("Comp: " + (++actComp))
      }
    return result
}

function quickSort(arr, left, right){
    var len = arr.length, 
    pivot,
    partitionIndex;
 
    if(left < right){
        pivot = right;
        partitionIndex = partition(arr, pivot, left, right);
    
        quickSort(arr, left, partitionIndex - 1);
        quickSort(arr, partitionIndex + 1, right);
    }

    return arr;
 }
 
 function partition(arr, pivot, left, right){
    var pivotValue = arr[pivot],
        partitionIndex = left;
 
    for(var i = left; i < right; i++){
        if(arr[i].y < pivotValue.y){
            swap(arr, i, partitionIndex);
            partitionIndex++;
        }
    }
   swap(arr, right, partitionIndex);
   return partitionIndex;
 }

 function swap(arr, i, j){
    var temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
    comparations.text("Comp: " + (++actComp))
 }

 function max_heapify(a, i, length) {
    while (true) {
        var left = i*2 + 1;
        var right = i*2 + 2;
        var largest = i;

        if (left < length && a[left].y > a[largest].y) {
            largest = left;
        }

        if (right < length && a[right].y > a[largest].y) {
            largest = right;
        }

        if (i == largest) {
            break;
        }

        swap(a, i, largest);
        i = largest;
    }
}

function heapify(a, length) {
    for (var i = Math.floor(length/2 - 1); i >= 0; i--) {
        max_heapify(a, i, length);
    }
}

function heapSort(a) {
    heapify(a, a.length);

    for (var i = a.length - 1; i > 0; i--) {
        swap(a, i, 0);

        max_heapify(a, 0, i);
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
    clear();
    background(70, 66, 74);
    let X = 500;
    nodes.forEach(node => {
        fill(node.color);
        stroke(255);
        circle(X, node.y, 15);
        X += 10;
    });
    resultsExtra.forEach(node => {
        fill(node.color);
        stroke(255);
        circle(X, node.y, 15);
        X += 10;
    });
}