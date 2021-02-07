
main :-
    write('N: '), read(N),
    obtenerSucesion(N, 0, Long), nl,
    write('Longitud: '), write(Long), !.

obtenerSucesion(1, Cont, Long) :- 
    write(1), write(' '),
    Long is Cont + 1, !.
obtenerSucesion(N, Cont, Long) :-
    0 is N mod 2,
    write(N), write(' '),
    NewCont is Cont + 1,
    NewN is N / 2,
    obtenerSucesion(NewN, NewCont, NewLong),
    Long is NewLong, !.
obtenerSucesion(N, Cont, Long) :-
    write(N), write(' '),   
    NewCont is Cont + 1,
    NewN is (3 * N) + 1,
    obtenerSucesion(NewN, NewCont, NewLong), 
    Long is NewLong, !.
