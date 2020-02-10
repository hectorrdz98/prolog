% pascal.pl

main :-
    write('N: '), read(N),
    pascal(N), !.

isEven(N) :-
    0 is mod(N, 2), !.

pascal(N) :-
    nextRow(1, N, [0, 1]), !.

nextRow(Actual, Dest, _) :- Actual > Dest, !.
nextRow(Actual, Dest, LastElems) :-
    nextCol(1, Actual, LastElems, [0], NewElems), nl,
    Actual1 is Actual + 1,
    nextRow(Actual1, Dest, NewElems), !.

nextCol(Actual, Dest, _, ActualElems, NewElems) :- 
    Actual > Dest, 
    append(ActualElems, [0], NewElems), !.
nextCol(Actual, Dest, LastElems, ActualElems, NewElems) :-
    getR(Actual, LastElems, R),
    printStuff(R),
    Actual1 is Actual + 1,
    append(ActualElems, [R], ActualElems1),
    nextCol(Actual1, Dest, LastElems, ActualElems1, NewElems), !.

printStuff(N) :-
    isEven(N),
    write('  '), !.
printStuff(_) :-
    write('* '), !.

getR(Actual, LastElems, R) :-
    Last is Actual - 1,
    nth0(Last, LastElems, A),
    nth0(Actual, LastElems, B),
    R is A + B, !.