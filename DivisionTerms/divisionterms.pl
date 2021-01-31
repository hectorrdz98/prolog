% divisionterms.pl - Get 4 * (1/1 - 1/3 + 1/5 - 1/7 ...) for n terms

main :-
    write('N: '), read(N),
    getFactors(N, 1, 1, Factors), 
    Result is 4 * Factors,
    nl, write('Result: '), write(Result).

getFactors(1, Denominator, Sign, Result) :-
    Result is (1 / Denominator) * Sign, !.
getFactors(ActualN, Denominator, Sign, Result) :-
    NewN is ActualN - 1,
    NewDen is Denominator + 2,
    NewSign is Sign * (-1),
    getFactors(NewN, NewDen, NewSign, NextResult),
    Result is ((1 / Denominator) * Sign) + NextResult, !.