% pl.pl
% part([1,2,3],[],X)

agrega(X,[],[[X]]) :- !.
agrega(X,[Y],[[X | Y]]).
agrega(X,[Y | Resto],[[X | Y] | Resto]) :- Resto \= [].
agrega(X,[Y | Resto],[Y | Lista]) :-
    agrega(X,Resto,Lista).

part([],Lista,Lista) :- !.
part([X | Resto],Lista1,Lista2) :-
    agrega(X,Lista1,Temp),
    part(Resto,Temp,Lista2).