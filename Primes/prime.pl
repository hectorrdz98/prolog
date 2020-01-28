% prime.pl - See if number is prime or not

main :-
    write('N: '), read(N),
    isPrime(N).

div(N, X) :-
    0 is N mod X, !.
div(N, X) :-
    N > X+1, div(N, X+1).

isPrime(2) :- true, !.
isPrime(N) :-
    div(N, 2), !,
    write('Not prime').
isPrime(_) :-
    write('Prime').


