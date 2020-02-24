const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

let originalList = [];

rl.question('N: ', (datas) => {
    datas.split(' ').forEach(data => {
        let val = parseInt(data);
        originalList.push(val);
    });
    console.log(originalList);
    let all = combine(originalList);
    console.log(all);
    rl.close();
});

var combine = function(a) {
    var fn = function(n, src, got, all) {
        if (n == 0) {
            if (got.length > 0) {
                all[all.length] = got;
            }
            return;
        }
        for (var j = 0; j < src.length; j++) {
            fn(n - 1, src.slice(j + 1), got.concat([src[j]]), all);
        }
        return;
    }
    var all = [];
    for (var i=0; i < a.length; i++) {
        fn(i, a, [], all);
    }
    all.push(a);
    return all;
}

