const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('N: ', (N) => {
    getAllInfo('', N);
    printRes();
    rl.close();
});

let printL = true;
let answers = [];

function getAllInfo(preText, N) {
    for (let i = N; i > 0; --i) {
        let diff = N - i;
        let text = preText != '' ?
            preText + ' + ' + i : preText + i;
        printL = true;
        getAllInfo(text, diff);
        if (printL) {
            let list = [];
            text.split(' + ').forEach(data => {
                let val = parseInt(data);
                list.push(val);
            });
            pushIfDiff(list);
            printL = false;
        }
    }
}

function pushIfDiff(list) {
    let newList = list.slice();
    newList.sort();
    let flag = true;
    for (let i = 0; i < answers.length; i++) {
        const elem = answers[i][0];
        if (arraysEqual(elem, newList)){
            flag = false;
            break;
        };
    }
    if (flag) {
        answers.push([newList, list]);
    }
}

function arraysEqual(a, b) {
    if (a === b) return true;
    if (a == null || b == null) return false;
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; ++i) {
        if (a[i] !== b[i]) return false;
    }
    return true;
  }

function printRes() {
    answers.forEach(a => {
        console.log(a[1].join(' + '));
    });
}