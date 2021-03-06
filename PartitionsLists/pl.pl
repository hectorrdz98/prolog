% pl.pl
% part([1,2,3],[],X).
% X = [[3, 2, 1]] ;
% X = [[2, 1], [3]] ;
% X = [[3, 1], [2]] ;
% X = [[1], [3, 2]] ;
% X = [[1], [2], [3]].

agrega(X,[],[[X]]) :- !.
agrega(X,[Y],[[X | Y]]).
agrega(X,[Y | Resto],[[X | Y] | Resto]) :- Resto \= [].
agrega(X,[Y | Resto],[Y | Lista]) :-
    agrega(X,Resto,Lista).

part([],Lista,Lista) :- !.
part([X | Resto],Lista1,Lista2) :-
    agrega(X,Lista1,Temp),
    part(Resto,Temp,Lista2).