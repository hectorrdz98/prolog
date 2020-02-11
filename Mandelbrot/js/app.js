
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

var maxTamCanvas = [1536, 754];

function setup() {
    var myCanvas = createCanvas(windowWidth, windowHeight);
    myCanvas.parent("design-container");
}

function draw() {
    noLoop();
    clear();
    background(70, 66, 74);
    mandelbrot();
}

function isMandelNumber(x, y) {
    let real = x;
    let img = y;
    const maxIterations = 64;

    for (let i = 0; i < maxIterations; i++) {
        const tempReal = (real ** 2) - (img ** 2) + x;
        const tempImg = (2.0 * real * img) + y;
        real = tempReal;
        img = tempImg;
        if (real * img > 5) {
            return (i / maxIterations) * 100.0;
        }
    }
    return 0;
}

function mandelbrot() {
    const magnificationFactor = 300;
    const panX = 2;
    const panY = 1.2;

    for (let x = 0; x < maxTamCanvas[0]; x++) {
        for (let y = 0; y < maxTamCanvas[1]; y++) {
            let mandelPercentage = isMandelNumber(x / magnificationFactor - panX, y / magnificationFactor - panY);
            //console.log(mandelPercentage);
            if (mandelPercentage === 0) {
                stroke(0, 0, 0);
            } else {
                stroke(`hsl(242, 40%, ${mandelPercentage}%)`);
            }
            point(x, y);
        }
    }
}