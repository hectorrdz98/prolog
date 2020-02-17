const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

class Token {
    constructor(value, type) {
        this.value = value;
        this.type = type;
    }
}

let tokens = [];
let stackOp = [];
let actToken = 0;

rl.question('Expresion: ', (exp) => {
    getTokens(exp);
    //console.log(tokens);
    Expresion();
    let res = parseInt(stackOp.pop());
    console.log("Result: " + res);
    rl.close();
});

function getTokens(exp) {
    let regexToTest = [
        ['OpenP',/\(/],
        ['CloseP',/\)/],
        ['Operator',/[\+|\*]/],
        ['Integer',/\d+/]
    ];

    exp.split(' ').forEach(preToken => {
        for (let i = 0; i < regexToTest.length; i++) {
            const regex = regexToTest[i];
            if (regex[1].test(preToken)) {
                let token = new Token(preToken, regex[0]);
                tokens.push(token);
                break;
            }
        }
    });
}

function Expresion() {
    //console.log("Expresion: " + tokens[actToken].value);
    if (Is('OpenP')) {
        Match('OpenP');
        let operation = tokens[actToken].value;
        Match('Operator');

        let preRes = 0;

        while (!Is('CloseP')) {
            let a = null;
            if (Is('OpenP')) {
                Expresion();
                a = parseInt(stackOp.pop());
            } else {
                a = parseInt(tokens[actToken].value);
                Match('Integer');
            }
            switch (operation) {
                case '+':
                    preRes += a;
                    break;
                default:
                    preRes = preRes == 0 ? a : preRes * a;
                    break;
            }
        }

        stackOp.push(preRes.toString());

        Match('CloseP');
    }
}

function Match(match) {
    //console.log("Match: " + match);
    if (Is(match)) {
        actToken++;
    } else {
        throw new Error(tokens[actToken].type + " doesn't match expected " + match);
    }
}

function Is(match) {
    return tokens[actToken].type == match;
}