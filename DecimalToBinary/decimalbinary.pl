main :- 
    write('N: '), read(N),
    binario(N, Binario),
    write('Binario: '), write(Binario), !.

binario(0, '0').
binario(1, '1').
binario(N, Binario) :-
    X is N mod 2,
    Y is N//2,
    binario(Y, Binario1),
    atom_concat(Binario1, X, Binario).