% a2r.pl

main :-
    write('N: '), read(N),
    toRoman(N, 5, F),
    write('Answer: '), write(F).

toRoman(1, _, 'I') :- !.

toRoman(N, Div, F) :-
    N1 is N mod Div,
    toRoman(N1, Div, F1),
    F is F + F1.