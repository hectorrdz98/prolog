% n2t.pl

main :-
    write('N: '), read(N),
    getNum(N), !.

getNum(0) :- !.
getNum(1) :- write('uno'), !.
getNum(2) :- write('dos'), !.
getNum(3) :- write('tres'), !.
getNum(4) :- write('cuatro'), !.
getNum(5) :- write('cinco'), !.
getNum(6) :- write('seis'), !.
getNum(7) :- write('siete'), !.
getNum(8) :- write('ocho'), !.
getNum(9) :- write('nueve'), !.

getNum(10) :- write('diez'), !.
getNum(11) :- write('once'), !.
getNum(12) :- write('doce'), !.
getNum(13) :- write('trece'), !.
getNum(14) :- write('catorce'), !.
getNum(15) :- write('quince'), !.
getNum(N) :- 
    N < 20,
    write('dieci'), 
    N1 is N - 10,
    getNum(N1), !.

getNum(20) :- write('veinte'), !.
getNum(N) :- 
    N < 30,
    write('veinti'), 
    N1 is N - 20,
    getNum(N1), !.

getNum(30) :- write('treinta'), !.
getNum(N) :- 
    N < 40,
    write('treinta y '), 
    N1 is N - 30,
    getNum(N1), !.

getNum(40) :- write('cuarenta'), !.
getNum(N) :- 
    N < 50,
    write('cuarenta y '), 
    N1 is N - 40,
    getNum(N1), !.

getNum(50) :- write('cincuenta'), !.
getNum(N) :- 
    N < 60,
    write('cincuenta y '), 
    N1 is N - 50,
    getNum(N1), !.

getNum(60) :- write('sesenta'), !.
getNum(N) :- 
    N < 70,
    write('sesenta y '), 
    N1 is N - 60,
    getNum(N1), !.

getNum(70) :- write('setenta'), !.
getNum(N) :- 
    N < 80,
    write('setenta y '), 
    N1 is N - 70,
    getNum(N1), !.

getNum(80) :- write('ochenta'), !.
getNum(N) :- 
    N < 90,
    write('ochenta y '), 
    N1 is N - 80,
    getNum(N1), !.

getNum(90) :- write('noventa'), !.
getNum(N) :- 
    N < 100,
    write('noventa y '), 
    N1 is N - 90,
    getNum(N1), !.

getNum(100) :- write('cien'), !.
getNum(N) :- 
    N < 200,
    write('ciento '), 
    N1 is N - 100,
    getNum(N1), !.

getNum(N) :- 
    N < 300,
    write('doscientos '), 
    N1 is N - 200,
    getNum(N1), !.

getNum(N) :- 
    N < 400,
    write('trescientos '), 
    N1 is N - 300,
    getNum(N1), !.

getNum(N) :- 
    N < 500,
    write('cuatrocientos '), 
    N1 is N - 400,
    getNum(N1), !.

getNum(N) :- 
    N < 600,
    write('quinientos '), 
    N1 is N - 500,
    getNum(N1), !.

getNum(N) :- 
    N < 700,
    write('seiscientos '), 
    N1 is N - 600,
    getNum(N1), !.

getNum(N) :- 
    N < 800,
    write('setecientos '), 
    N1 is N - 700,
    getNum(N1), !.

getNum(N) :- 
    N < 900,
    write('ochocientos '), 
    N1 is N - 800,
    getNum(N1), !.

getNum(N) :- 
    N < 1000,
    write('novecientos '), 
    N1 is N - 900,
    getNum(N1), !.

getNum(N) :- 
    N < 2000,
    write('mil '), 
    N1 is N - 1000,
    getNum(N1), !.

getNum(N) :- 
    N < 1000000,
    Res is truncate(N / 1000),
    getNumPre(Res),
    write(' mil '), 
    N1 is N - (Res * 1000),
    getNum(N1), !.

getNum(N) :- 
    N < 2000000,
    write('un millon '), 
    N1 is N - 1000000,
    getNum(N1), !.

getNum(N) :- 
    N < 1000000000,
    Res is truncate(N / 1000000),
    getNumPre(Res),
    write(' millones '), 
    N1 is N - (Res * 1000000),
    getNum(N1), !.


getNumPre(0) :- !.
getNumPre(1) :- write('un'), !.
getNumPre(2) :- write('dos'), !.
getNumPre(3) :- write('tres'), !.
getNumPre(4) :- write('cuatro'), !.
getNumPre(5) :- write('cinco'), !.
getNumPre(6) :- write('seis'), !.
getNumPre(7) :- write('siete'), !.
getNumPre(8) :- write('ocho'), !.
getNumPre(9) :- write('nueve'), !.

getNumPre(10) :- write('diez'), !.
getNumPre(11) :- write('once'), !.
getNumPre(12) :- write('doce'), !.
getNumPre(13) :- write('trece'), !.
getNumPre(14) :- write('catorce'), !.
getNumPre(15) :- write('quince'), !.
getNumPre(N) :- 
    N < 20,
    write('dieci'), 
    N1 is N - 10,
    getNumPre(N1), !.

getNumPre(20) :- write('veinte'), !.
getNumPre(N) :- 
    N < 30,
    write('veinti'), 
    N1 is N - 20,
    getNumPre(N1), !.

getNumPre(30) :- write('treinta'), !.
getNumPre(N) :- 
    N < 40,
    write('treinta y '), 
    N1 is N - 30,
    getNumPre(N1), !.

getNumPre(40) :- write('cuarenta'), !.
getNumPre(N) :- 
    N < 50,
    write('cuarenta y '), 
    N1 is N - 40,
    getNumPre(N1), !.

getNumPre(50) :- write('cincuenta'), !.
getNumPre(N) :- 
    N < 60,
    write('cincuenta y '), 
    N1 is N - 50,
    getNumPre(N1), !.

getNumPre(60) :- write('sesenta'), !.
getNumPre(N) :- 
    N < 70,
    write('sesenta y '), 
    N1 is N - 60,
    getNumPre(N1), !.

getNumPre(70) :- write('setenta'), !.
getNumPre(N) :- 
    N < 80,
    write('setenta y '), 
    N1 is N - 70,
    getNumPre(N1), !.

getNumPre(80) :- write('ochenta'), !.
getNumPre(N) :- 
    N < 90,
    write('ochenta y '), 
    N1 is N - 80,
    getNumPre(N1), !.

getNumPre(90) :- write('noventa'), !.
getNumPre(N) :- 
    N < 100,
    write('noventa y '), 
    N1 is N - 90,
    getNumPre(N1), !.

getNumPre(100) :- write('cien'), !.
getNumPre(N) :- 
    N < 200,
    write('ciento '), 
    N1 is N - 100,
    getNumPre(N1), !.

getNumPre(N) :- 
    N < 300,
    write('doscientos '), 
    N1 is N - 200,
    getNumPre(N1), !.

getNumPre(N) :- 
    N < 400,
    write('trescientos '), 
    N1 is N - 300,
    getNumPre(N1), !.

getNumPre(N) :- 
    N < 500,
    write('cuatrocientos '), 
    N1 is N - 400,
    getNumPre(N1), !.

getNumPre(N) :- 
    N < 600,
    write('quinientos '), 
    N1 is N - 500,
    getNumPre(N1), !.

getNumPre(N) :- 
    N < 700,
    write('seiscientos '), 
    N1 is N - 600,
    getNumPre(N1), !.

getNumPre(N) :- 
    N < 800,
    write('setecientos '), 
    N1 is N - 700,
    getNumPre(N1), !.

getNumPre(N) :- 
    N < 900,
    write('ochocientos '), 
    N1 is N - 800,
    getNumPre(N1), !.

getNumPre(N) :- 
    N < 1000,
    write('novecientos '), 
    N1 is N - 900,
    getNumPre(N1), !.

getNumPre(N) :- 
    N < 2000,
    write('mil '), 
    N1 is N - 1000,
    getNumPre(N1), !.