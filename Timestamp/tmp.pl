% tmp.pl

main :-
    write('Seconds: '), read(S),
    getDate(S), !.

/*
    01/01/1970 00:00:00
*/

printIntFormatted(N, S) :-
    S1 is (S - 1) * 10,
    N >= S1, format('~d', N), !.
printIntFormatted(N, S) :-
    S1 is (S - 1) * 10,
    N < S1, format('0~d', N).

getDate(Sec) :-
    Sec >= 60,
    Min is round(Sec / 60),
    Sec1 is Sec mod 60,
    write('01/01/1970 00:'), printIntFormatted(Min, 2),
    write(':'), printIntFormatted(Sec1, 2), !.

getDate(Sec) :-
    Sec < 60,
    Sec1 is Sec mod 60,
    write('01/01/1970 00:00:'), printIntFormatted(Sec1, 2).