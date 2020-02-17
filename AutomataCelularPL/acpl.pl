% acpl.pl

main :-
    write('N: '), read(N),
    F is N + 2,
    getInitialP(F,[],IP),
    printRow(IP),
    go(N,F,IP,[]), !.

getInitialP(1,_,[0]) :- !.
getInitialP(2,_,[0,1]) :- !.
getInitialP(N,Act,IP) :-
    N1 is N - 1,
    getInitialP(N1,Act,IP1),
    append(IP1,[0],IP), !.

go(N,_,_,_) :- N =< 1, !.
go(N,F,Last,Act) :-
    newRow(0,F,Last,Act,Res), 
    printRow(Res),
    N1 is N - 1, 
    go(N1,F,Res,[]), !.

newRow(0,F,Last,_,Res) :- 
    newRow(1,F,Last,[0],Res1), 
    Res = Res1, !.
newRow(Cont,F,_,Act,Act) :- Cont = F, !.
newRow(Cont,F,Last,Act,Res) :-
    Cont1 is Cont - 1,
    nth0(Cont1, Last, A),
    nth0(Cont, Last, B),
    getNextVal(A,B,R),
    append(Act,[R],Act1),
    Cont2 is Cont + 1,
    newRow(Cont2,F,Last,Act1,Res1),
    Res = Res1, !.

getNextVal(A,B,0) :- ((A = 0, B = 0) ; (A = 1, B = 1)), !.
getNextVal(_,_,1) :- !.

printRow([]) :- nl, !.
printRow([X | Next]) :-
    X = 1,
    write('* '),
    printRow(Next), !.
printRow([_ | Next]) :- 
    write('. '),
    printRow(Next), !.