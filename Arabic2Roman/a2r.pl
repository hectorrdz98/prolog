% a2r.pl

main :-
    write('N: '), read(N),
    toRoman(N).

toRoman(0) :- !.
toRoman(4) :- write('IV'), !.
toRoman(5) :- write('V'), !.
toRoman(9) :- write('IX'), !.

toRoman(N) :-
    N < 4, write('I'),
    N1 is N - 1,
    toRoman(N1).
toRoman(N) :-
    N < 9, write('V'),
    N1 is N - 5,
    toRoman(N1).
toRoman(N) :-
    N < 40, write('X'),
    N1 is N - 10,
    toRoman(N1).
toRoman(N) :-
    N < 50, write('XL'),
    N1 is N - 40,
    toRoman(N1).
toRoman(N) :-
    N < 90, write('L'),
    N1 is N - 50,
    toRoman(N1).
toRoman(N) :-
    N < 100, write('XC'),
    N1 is N - 90,
    toRoman(N1).
toRoman(N) :-
    N < 400, write('C'),
    N1 is N - 100,
    toRoman(N1).
toRoman(N) :-
    N < 500, write('CD'),
    N1 is N - 400,
    toRoman(N1).
toRoman(N) :-
    N < 900, write('D'),
    N1 is N - 500,
    toRoman(N1).
toRoman(N) :-
    N < 1000, write('CM'),
    N1 is N - 900,
    toRoman(N1).
toRoman(N) :-
    N < 4000, write('M'),
    N1 is N - 1000,
    toRoman(N1).
toRoman(N) :-
    N < 5000, write('~IV~'),
    N1 is N - 4000,
    toRoman(N1).