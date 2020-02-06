% cal.pl

main :-
    printCal(2,1).

printCal(Day2Start, 13) :- !.
printCal(Day2Start, ActMonth) :-
    printMonth(Day2Start, ActMonth), nl,
    ActMonth1 is ActMonth + 1,
    printCal(Day2Start, ActMonth1), !.

printMonth(Day2Start, ActMonth) :-
    getMonthName(ActMonth, Month),
    format('+~`-t~35|+ ~n', []),
    format('|~t~w~t~35||~n', [Month]),
    format('+~`-t~35|+ ~n', []),
    printDaysNames(), 
    write('|'), tab(1),
    printDays(ActMonth), !.

printDaysNames() :-
    format('|~t~w ~w ~w ~w ~w ~w ~w~t~32||~n', [
        'sun.', 'mon.', 'tue.', 'wed.', 'thu.', 'fri.', 'sat.'
    ]), !.

printDays(Act) :-
    (Act = 1 ; Act = 3 ; Act = 5 ; Act = 7 ; Act = 8 ;
    Act = 10 ; Act = 12),
    printUntil(1, 31, 1, [], Numbers), 
    print(Numbers), !.
printDays(Act) :-
    not(Act = 2),
    printUntil(1, 30, 1, [], Numbers), 
    print(Numbers), !.
printDays(_) :-
    printUntil(1, 28, 1, [], Numbers), 
    print(Numbers), !.

printUntil(ActN, DestN, _, LList, NList) :-
    ActN > DestN, NList is LList, print('fin'), !.
printUntil(ActN, DestN, Cont, LList, NList) :-
    number_string(ActN, ActStr),
    append(LList, [ActStr], LList2),
    ActN1 is ActN + 1,
    Cont1 is Cont + 1,
    Cont1 =< 7,
    writeNumber(ActN),
    printUntil(ActN1, DestN, Cont1, LList2, NList1), 
    NList is NList1, !.
printUntil(ActN, DestN, Cont, LList, NList) :-
    number_string(ActN, ActStr),
    append(LList, [ActStr], LList2),
    ActN1 is ActN + 1,
    Cont1 is 1,
    writeNumber(ActN),
    write('|'), nl, write('|'), tab(1),
    printUntil(ActN1, DestN, Cont1, LList2, NList1), 
    NList is NList1, !.

writeNumber(Number) :-
    Number < 10,
    write(' '), write(Number), tab(3), !.
writeNumber(Number) :-
    write(Number), tab(3), !.

getMonthName(MonthNumber, 'January') :- MonthNumber = 1, !.
getMonthName(MonthNumber, 'February') :- MonthNumber = 2, !.
getMonthName(MonthNumber, 'March') :- MonthNumber = 3, !.
getMonthName(MonthNumber, 'April') :- MonthNumber = 4, !.
getMonthName(MonthNumber, 'May') :- MonthNumber = 5, !.
getMonthName(MonthNumber, 'June') :- MonthNumber = 6, !.
getMonthName(MonthNumber, 'July') :- MonthNumber = 7, !.
getMonthName(MonthNumber, 'August') :- MonthNumber = 8, !.
getMonthName(MonthNumber, 'September') :- MonthNumber = 9, !.
getMonthName(MonthNumber, 'October') :- MonthNumber = 10, !.
getMonthName(MonthNumber, 'November') :- MonthNumber = 11, !.
getMonthName(_, 'December') :- !.

