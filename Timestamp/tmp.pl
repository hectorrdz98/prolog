% tmp.pl

main :-
    write('Seconds: '), read(S),
    getDate(S), !.

/*
    01/01/1970 00:00:00
    86400       => 1970/01/02 00:00:00
    691200      => 1970/01/09 00:00:00
    691199      => 1970/01/08 23:59:59
    2678400     => 1970/02/01 00:00:00
    5097600     => 1970/03/01 00:00:00
    31536000    => 1971/01/01 00:00:00
*/

printIntFormatted(N, S) :-
    S1 is (S - 1) * 10,
    N >= S1, format('~d', N), !.
printIntFormatted(N, S) :-
    S1 is (S - 1) * 10,
    N < S1, format('0~d', N).

leap(Year) :-
    0 is mod(Year, 4), not(0 is mod(Year, 100)), !;
    0 is mod(Year, 400).

getYear(Days, Actual, Year, Extra) :-
    leap(Actual),
    Days >= 366,
    Days1 is Days - 366,
    Actual1 is Actual + 1,
    getYear(Days1, Actual1, Year1, Extra1), 
    Year is Year1,
    Extra is Extra1, !.
getYear(Days, Actual, Year, Extra) :-
    leap(Actual), 
    Extra is Days,
    Year is Actual, !.
getYear(Days, Actual, Year, Extra) :-
    Days >= 365,
    Days1 is Days - 365,
    Actual1 is Actual + 1,
    getYear(Days1, Actual1, Year1, Extra1), 
    Year is Year1,
    Extra is Extra1, !.
getYear(Days, Actual, Year, Extra) :-
    Extra is Days,
    Year is Actual, !.

getMonth(Days, Act, Year, Month, Extra) :- 
    (Act = 1 ; Act = 3 ; Act = 5 ; Act = 7 ; Act = 8 ;
    Act = 10 ; Act = 12),
    Days >= 31,
    Days1 is Days - 31,
    Act1 is Act + 1,
    getMonth(Days1, Act1, Year, Month1, Extra1),
    Month is Month1,
    Extra is Extra1, !.
getMonth(Days, Act, _, Month, Extra) :- 
    (Act = 1 ; Act = 3 ; Act = 5 ; Act = 7 ; Act = 8 ;
    Act = 10 ; Act = 12),
    Extra is Days + 1,
    Month is Act, !.

getMonth(Days, Act, Year, Month, Extra) :- 
    not(Act = 2),
    Days >= 30,
    Days1 is Days - 30,
    Act1 is Act + 1,
    getMonth(Days1, Act1, Year, Month1, Extra1), 
    Month is Month1,
    Extra is Extra1, !.
getMonth(Days, Act, _, Month, Extra) :- 
    not(Act = 2),
    Extra is Days + 1,
    Month is Act, !.

getMonth(Days, Act, Year, Month, Extra) :- 
    leap(Year), 
    Days >= 29,
    Days1 is Days - 29,
    Act1 is Act + 1,
    getMonth(Days1, Act1, Year, Month1, Extra1), 
    Month is Month1,
    Extra is Extra1, !.
getMonth(Days, Act, Year, Month, Extra) :- 
    leap(Year), 
    Extra is Days + 1,
    Month is Act, !.
getMonth(Days, Act, Year, Month, Extra) :- 
    Days >= 28,
    Days1 is Days - 28,
    Act1 is Act + 1,
    getMonth(Days1, Act1, Year, Month1, Extra1), 
    Month is Month1,
    Extra is Extra1, !.
getMonth(Days, Act, _, Month, Extra) :- 
    Extra is Days + 1,
    Month is Act, !.

getYearMonthDay(Days) :-
    getYear(Days, 1970, Year, Extra), 
    getMonth(Extra, 1, Year, Month, Extra1),
    write(Year), write('/'), 
    printIntFormatted(Month, 2), write('/'),
    printIntFormatted(Extra1, 2), !.

getDate(Secs) :-
    Mins is floor(Secs / 60),
    Hrs is floor(Mins / 60),
    Days is floor(Hrs / 24),
    Secs1 is Secs mod 60,
    Mins1 is Mins mod 60,
    Hrs1 is Hrs mod 24,
    % write(Days), write(' days '),
    getYearMonthDay(Days),
    write(' '), printIntFormatted(Hrs1, 2),
    write(':'), printIntFormatted(Mins1, 2),
    write(':'), printIntFormatted(Secs1, 2).
