const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

class Tree {
    constructor(value, parent) {
        this.value = value;
        this.parent = parent;
        this.left = null;
        this.right = null;
    }
}

let root = null;
let trees = {};
let cont = 1;

var readLines = function () {
    rl.question('Tree #' + cont + ': ', (preTree) => {
        if (preTree == 'exit') {
            printTrees();
            return rl.close();
        }
        else {
            root = null;
            preTree.split(' ').forEach(preValue => {
                let value = parseInt(preValue);
                let node = addToTree(root, value);
                //console.log(node);
            });
            shapeSTR = '';
            getShape(root, 'C', 0);
            if (shapeSTR in trees)
                trees[shapeSTR]++;
            else 
                trees[shapeSTR] = 1;
            cont++;
        }
        readLines();
    });
};
  
readLines();

function addToTree(origin, value) {
    let node = null;
    if (!root) {
        node = new Tree(value, origin);
        root = node;
    } else {
        if (origin && origin.value > value) {
            if (!origin.left) {
                node = new Tree(value, origin);
                origin.left = node;
            } else {
                node = addToTree(origin.left, value);
            }
        } else if (origin && origin.value <= value) {
            if (!origin.right) {
                node = new Tree(value, origin);
                origin.right = node;
            } else {
                node = addToTree(origin.right, value);
            }
        }
    }
    return node;
}

let shapeSTR = '';

function getShape(act, dir, tabs) {
    if (act) {
        getShape(act.left, 'L', tabs + 1);
        getShape(act.right, 'R', tabs + 1);
        shapeSTR += dir;
    }
}

function printTrees() {
    console.log('-------------------------');
    console.log('Type\tAmount');
    console.log('-------------------------');
    Object.entries(trees).forEach(([name, entries]) => {
        console.log(name + '\t' + entries);
    });
}