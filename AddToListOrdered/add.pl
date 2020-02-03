% add.pl

main :-
    write('Lista: '), read(X),
    write('Elemento: '), read(N),
    append([N],X,X1),
    quicksort(X1,Y),
    write('Lista ordenada: '), write(Y), nl.

quicksort([],[]) :- !.
quicksort([X | Resto],Y) :-
    menoresIguales(X,Resto,Aux1),
    quicksort(Aux1, Y1),
    mayores(X,Resto,Aux2),
    quicksort(Aux2,Y2),
    append(Y1,[X | Y2],Y).

menoresIguales(_,[],[]) :- !.
menoresIguales(X,[Y | Resto],[Y | Otros]) :-
    Y =< X, !, menoresIguales(X,Resto,Otros).
menoresIguales(X,[_ | Resto],Otros) :-
    menoresIguales(X,Resto,Otros).

mayores(_,[],[]) :- !.
mayores(X,[Y | Resto],[Y | Otros]) :-
    Y > X, !, mayores(X,Resto,Otros).
mayores(X,[_ | Resto],Otros) :-
    mayores(X,Resto,Otros).

listaRandom(0,[]) :- !.
listaRandom(N,[X | Resto]) :-
    X is random(100), N1 is N-1, listaRandom(N1, Resto).