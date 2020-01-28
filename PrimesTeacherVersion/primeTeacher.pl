% primeTeacher.pl

main :-
    write('N: '), read(N),
    esPrimoResp(N, R),
    write('Primo? '), write(R), nl.

esPrimo(N) :-
    contDiv(N,C,1), C = 2.

esPrimoResp(N,si) :-
    esPrimo(N), !.
esPrimoResp(_,no).

contDiv(N,0,I) :-
    I > N, !.
contDiv(N,C,I) :-
    R is N mod I, R = 0, !,
    I1 is I+1, contDiv(N,C1,I1), C = C1+1.
contDiv(N,C,I) :-
    I1 is I+1, contDiv(N,C,I1).
