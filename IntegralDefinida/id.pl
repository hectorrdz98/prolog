% id.pl

f(X,Y) :- Y is exp(-(X*X / 2)) / sqrt(2*pi), !.

main :-
    write('a: '), read(A),
    write('b: '), read(B),
    N is 1000,
    getIntegral(A,B,N,0,R),
    write('r: '), write(R), !.

getIntegral(_,_,N,Act,0) :- Act >= N, !.
getIntegral(A,B,N,Act,R) :-
    L is (B - A) / N,
    A1 is A + (L * Act),
    f(A1,Y1),
    Area1 is L * Y1,
    Act1 is Act + 1,
    getIntegral(A,B,N,Act1,R1),
    R is Area1 + R1.

