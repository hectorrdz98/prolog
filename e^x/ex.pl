% ex.pl

main :-
    write('X: '), read(X),
    getEX(X, Y),
    write('e^'), write(X), write(': '), write(Y).

getEX(X, Y) :-
    N is 20,
    getSum(X, N, 0, Y).

getSum(_, N, I, R) :-
    I > N, R is 0, !.
getSum(X, N, I, Y) :-
    getFact(1, I, F),
    Temp is (X ^ I) / F,
    I1 is I + 1,
    getSum(X, N, I1, Y1),
    Y is Temp + Y1.

getFact(N, X, R) :-
    N > X, R is 1, !.
getFact(N, X, R) :-
    N1 is N + 1, getFact(N1, X, R1),
    R is N * R1.
