% fibo.pl

main :-
    write('Termino: '), read(N),
    fibonacci(N, F),
    write('El termino es: '), write(F), nl.

fibonacci(0, 0) :- !.
fibonacci(1, 1) :- !.

fibonacci(N, F) :-
    N1 is N-1, fibonacci(N1, F1),
    N2 is N-2, fibonacci(N2, F2),
    F is F1+F2.

