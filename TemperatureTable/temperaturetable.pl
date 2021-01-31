% temperaturetable.pl - Get Celsius -> Fahrenheit table given a range and an increment

main :-
    write('T0: '), read(T0),
    write('T1: '), read(T1),
    write('Inc: '), read(Inc),
    write('Celsius\tFahrenheit'), nl,
    format('--------------------------'), nl,
    getTemperature(T0, T1, Inc), 
    write('--------------------------'), !.

getTemperature(T0, T1, _) :-
    T0 > T1, !.
getTemperature(T0, T1, Inc) :-
    NewT0 is T0 + Inc,
    Fahrenheit is (T0 * (9/5)) + 32,
    write(T0), write('\t'), write(Fahrenheit), nl,
    getTemperature(NewT0, T1, Inc), !.
