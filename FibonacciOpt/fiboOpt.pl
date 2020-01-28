% fiboOpt.pl

main :-
    write('Termino: '), read(N),
    fibonacci(N, F, _),
    write('El termino es: '), write(F), nl.

fibonacci(0, 0, 0) :- !.
fibonacci(1, 1, 0) :- !.

fibonacci(N, F, Last) :-
    N >= 2,
    N1 is N - 1,
    fibonacci(N1, Last, Last1),
    F is Last + Last1.