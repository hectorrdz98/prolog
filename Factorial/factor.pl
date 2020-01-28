% factor.pl - Factoriales de enteros

main :-
    write('N: '), read(N),
    factorial(N,F),
    write('El factorial es: '), write(F), nl,
    contDig(0,F,D0),
    contDig(1,F,D1),
    contDig(2,F,D2),
    contDig(3,F,D3),
    contDig(4,F,D4),
    contDig(5,F,D5),
    contDig(6,F,D6),
    contDig(7,F,D7),
    contDig(8,F,D8),
    contDig(9,F,D9),
    write('Digitos 0: '), write(D0), nl,
    write('Digitos 1: '), write(D1), nl,
    write('Digitos 2: '), write(D2), nl,
    write('Digitos 3: '), write(D3), nl,
    write('Digitos 4: '), write(D4), nl,
    write('Digitos 5: '), write(D5), nl,
    write('Digitos 6: '), write(D6), nl,
    write('Digitos 7: '), write(D7), nl,
    write('Digitos 8: '), write(D8), nl,
    write('Digitos 9: '), write(D9), nl.

factorial(0,1) :- !.
factorial(N,F) :-
    N1 is N-1, factorial(N1,F1), F is N*F1.

contDig(_,0,0) :- !.
contDig(D,N,C) :-
    Q is N div 10, R is N mod 10,
    R = D, !, contDig(D,Q,C1), C is C1 + 1.
contDig(D,N,C) :-
    Q is N div 10, contDig(D,Q,C).
