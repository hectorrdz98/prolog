parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

female(pam).
male(tom).
male(bob).
female(liz).
female(pat).
female(ann).
male(jim).

offspring(Y, X) :-
    parent(X, Y).
mother(X, Y) :-
    parent(X, Y),
    female(X).
grandparent(X, Z) :-
    parent(X, Y),
    parent(Y, Z).
sister(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    female(X).
    % different(X, Y).

happy(X) :-
    parent(X, _).
hastwochildren(X) :-
    parent(X, Y),
    sister(_, Y).
grandchild(X, Z) :-
    parent(Y, X),
    parent(Z, Y).
aunt(X, Z) :-
    parent(Y, Z),
    sister(X, Y).

predecessor(X, Z) :-
    parent(X, Z).
predecessor(X, Z) :-
    parent(X, Y),
    predecessor(Y, Z).
