% listas.pl

longitud([],0) :- !.
longitud([_ | Resto],X) :-
    longitud(Resto,Y), X is 1+Y.

mayor([X],X) :- !.
mayor([X | Resto],X) :-
    mayor(Resto,Z), X >= Z, !.
mayor([_ | Resto],X) :-
    mayor(Resto,X).