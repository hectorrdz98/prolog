const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('N: ', (N) => {
    getAllInfo('', N);
    rl.close();
});

let printL = true;

function getAllInfo(preText, N) {
    for (let i = N; i > 0; --i) {
        let diff = N - i;
        let text = preText != '' ?
        preText + ' + ' + i : preText + i;
        printL = true;
        getAllInfo(text, diff);
        if (printL) {
            console.log(text);
            printL = false;
        }
    }
}