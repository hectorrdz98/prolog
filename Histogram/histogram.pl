
main :-
    write('Ingresa la lista: '), read(Lista),
    write('Ingresa el alto: '), read(Alto),
    write('Ingresa el ancho: '), read(Ancho),
    nl,
    mayor(Lista,ElementoMayor), 
    nuevaLista(Lista,Alto,Multiplicada),
    MasAlto is ElementoMayor*Alto,
    imprimir(Multiplicada,Ancho,Alto,MasAlto), 
    nl, !.

nuevaLista([],_,[]) :- !.
nuevaLista([X | Resto],Alto,[Y | Final]) :-
    Y is X*Alto,
    nuevaLista(Resto,Alto,Final).

mayor([X],X) :- !.
mayor([X | Resto],X) :-
    mayor(Resto,Y),
    X >= Y, !.
mayor([_ | Resto],X) :-
    mayor(Resto,X).

imprimir([_ | _],_,_,0) :- !.
imprimir(Lista,Ancho,Alto,MasAlto) :-
    imprimirRenglon(Lista,Ancho,MasAlto),
    nl, MasAlto1 is MasAlto-1,
    imprimir(Lista,Ancho,Alto,MasAlto1).

imprimirRenglon([],_,_) :- !.
imprimirRenglon([X | Resto],Ancho,MasAlto) :-
    X < MasAlto,
    imprimeValorBlanco(Ancho),
    write(' '),
    imprimirRenglon(Resto,Ancho,MasAlto).
imprimirRenglon([_ | Resto],Ancho,MasAlto) :-
    imprimeValorAstedisco(Ancho),
    write(' '),
    imprimirRenglon(Resto,Ancho,MasAlto).

imprimeValorAstedisco(0) :- !.
imprimeValorAstedisco(Ancho):-
    write('*'),
    Ancho1 is Ancho-1,
    imprimeValorAstedisco(Ancho1).

imprimeValorBlanco(0) :- !.
imprimeValorBlanco(Ancho):-
    write(' '),
    Ancho1 is Ancho-1,
    imprimeValorBlanco(Ancho1).
