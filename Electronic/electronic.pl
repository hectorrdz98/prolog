
main :-
    write('N: '), read(N),
    obtenerNombre(N,[1,2,3,4,5,6,7,8,9,10],['Hidrogeno','Helio','Litio','Berilio','Boro','Carbono','Nitrogeno','Oxigeno','Fluor','Neon']),
    obtenerElectro(N,[2,2,6,2],['1s','2s','2p','3s']), !.

obtenerNombre(N,[],[]) :-
    write('No se encuentra el '), write(N), !.
obtenerNombre(N,[X | Resto],[_ | Resto2]) :-
    N \= X,
    obtenerNombre(N,Resto,Resto2).
obtenerNombre(_,[_ | _],[Y | _]) :-
    write(Y), nl, !.

obtenerElectro(N,[_ | _],[_ | _]) :-
    0 >= N, !.
obtenerElectro(N,[X | Resto],[Y | Resto2]) :-
    N >= X,
    N1 is N-X,
    write(Y), write(X), write(' '),
    obtenerElectro(N1, Resto, Resto2).
obtenerElectro(N,[X | _],[Y | _]) :-
    write(Y), write(N), write(' '), !.