% bs.pl

main :-
    write('N: '), read(N),
    write('N'), tab(1), write('Shapes'), nl,
    format('~`-t~10| ~n', []),
    N1 is N + 1,
    prints(0,N1), !.

prints(Act,N) :-
    Act = N, !.
prints(Act,N) :-
    write(Act), tab(1),
    shapes(Act,S),
    S1 is round(S),
    write(S1), nl,
    Act1 is Act + 1,
    prints(Act1,N), !.


shapes(N,Total) :-
    N1 is N * 2,
    combinations(N1,N,C),
    Total is (1 / (N+1)) * C, !. 

combinations(N,R,F) :-
    factorial(N,N1),
    factorial(R,R1),
    Temp is N - R,
    factorial(Temp,Temp1),
    F is N1 / (R1 * Temp1), !.

factorial(0,1) :- !.
factorial(N,F) :-
    N1 is N-1, factorial(N1,F1), F is N*F1.