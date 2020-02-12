
function toRadians (angle) {
    return angle * (Math.PI / 180);
}

var maxTamCanvas = [1536, 754];
var lengthS = 600;
var origin = [maxTamCanvas[0] / 2, (maxTamCanvas[1] / 2) + ((lengthS + (lengthS / 6)) / 2)];
var vertex = [];
var bgColor = [70, 66, 74];
var depth = 0;
var flag = true;

function setup() {
    var myCanvas = createCanvas(windowWidth, windowHeight);
    myCanvas.parent("design-container");
    vertex = [
        [origin[0], origin[1]],
        [origin[0] - (lengthS / 2), origin[1] - lengthS*Math.cos(toRadians(30))],
        [origin[0] + (lengthS / 2), origin[1] - lengthS*Math.cos(toRadians(30))]
    ];
}

function draw() {
    clear();
    frameRate(1);
    background(bgColor);
    startKoch();

    if (flag) {
        if (depth >= 5) {
            depth--;
            flag = false;
        } else {
            depth++;
        }
    } else {
        if (depth <= 0) {
            depth++;
            flag = true;
        } else {
            depth--;
        }
    }
}

function startKoch() {
    fractal(vertex[0], vertex[1], depth);
    fractal(vertex[1], vertex[2], depth);
    fractal(vertex[2], vertex[0], depth);
}

function fractal(A, B, depth){
    if (depth < 0){
        return null;
    }

    var C = divide(add(multiply(A, 2), B), 3);
    var D = divide(add(multiply(B, 2), A), 3);
    var F = divide(add(A, B), 2);
    
    var V1 = divide(minus(F, A), length(F, A));
    var V2 = [V1[1], -V1[0]];

    var E = add(multiply(V2, Math.sqrt(3)/6 * length(B, A)), F);

    DrawLine(A, B, 255);

    if (depth !=0){
        for (var i=0;i<10;i++)
            DrawLine(C, D, bgColor);
    };
    
    fractal(A, C, depth-1);
    fractal(C, E, depth-1);
    fractal(E, D, depth-1);
    fractal(D, B, depth-1);

};

function multiply(v, num) {
    return [v[0]*num, v[1]*num];
};

function divide(v, num) {
    return [v[0]/num, v[1]/num];
};
 
function add(a, b) {
    return [a[0]+b[0], a[1]+b[1]];
};

function minus(a, b) {
    return [a[0]-b[0], a[1]-b[1]];
};

function length(a, b) {
    return Math.sqrt(Math.pow(a[0] - b[0],2) + 
                     Math.pow(a[1] - b[1],2));
};

function DrawLine(a, b, c) {
    stroke(c);
    line(a[0], a[1], b[0], b[1]);
};