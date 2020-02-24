const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('N: ', (n) => {
    let s = shapes(n);
    console.log("Shapes: " + s);
    rl.close();
});

function shapes(n) {
    let i, total;
    if (n == 0) return 1;
    total = 0;
    for (let i = 0; i < n; i++) {
        total += shapes(i) * shapes(n-i-1);
    }
    return total;
}