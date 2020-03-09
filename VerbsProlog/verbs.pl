
main :-
    write('Verbo: '), read(Verb),
    open('C:\\Users\\sasuk\\Documents\\ITQ\\6 semestre\\Programacion Logica y Funcional\\Prolog\\VerbsProlog\\regulars.txt', read, StrRegulars),
    nextSteps(Verb, StrRegulars).

nextSteps(Verb, StrRegulars) :-
    existsInFile(Verb, StrRegulars), 
    close(StrRegulars), !.
nextSteps(Verb, StrRegulars) :-
    close(StrRegulars),
    open('C:\\Users\\sasuk\\Documents\\ITQ\\6 semestre\\Programacion Logica y Funcional\\Prolog\\VerbsProlog\\irregulars.txt', read, StrIrregulars),
    nextStepsIrreg(Verb, StrIrregulars), !.

nextStepsIrreg(Verb, StrIrregulars) :-
    existsInFile(Verb, StrIrregulars), 
    close(StrIrregulars), !.
nextStepsIrreg(Verb, StrIrregulars) :-
    close(StrIrregulars),
    conjugate(Verb), !.

existsInFile(_, Str) :-
    at_end_of_stream(Str), !, false.

existsInFile(VerbReq, Str) :-
    read(Str, [Verb,I,You,He,We,They]),
    VerbReq = Verb, 
    printConj(Verb,I,You,He,We,They), !.

existsInFile(VerbReq, Str) :-
    existsInFile(VerbReq, Str).

printConj(Verb,I,You,He,We,They) :-
    write('------------'), nl,
    write(' '), write(Verb), nl,
    write('------------'), nl,
    write('Yo: '), tab(12), write(I), nl,
    write('Tu: '), tab(12), write(You), nl,
    write('El/Ella: '), tab(7), write(He), nl,
    write('Nosotros: '), tab(6), write(We), nl,
    write('Ustedes/Ellos: '), tab(1), write(They), nl, !.
prePrintConj(I,You,He,We,They) :-
    write('Yo: '), tab(12), write(I), nl,
    write('Tu: '), tab(12), write(You), nl,
    write('El/Ella: '), tab(7), write(He), nl,
    write('Nosotros: '), tab(6), write(We), nl,
    write('Ustedes/Ellos: '), tab(1), write(They), nl, !.

conjugate(Verb) :-
    sub_atom(Verb, _, 2, 0, C), 
    sub_atom(Verb, 0, _, 2, S),
    C = 'ar', 
    atom_concat(S, 'o', I),
    atom_concat(S, 'as', You),
    atom_concat(S, 'a', He),
    atom_concat(S, 'amos', We),
    atom_concat(S, 'an', They), 
    prePrintConj(I, You, He, We, They),
    askForIt(Verb, I, You, He, We, They), !.
conjugate(Verb) :-
    sub_atom(Verb, _, 2, 0, C), 
    sub_atom(Verb, 0, _, 2, S),
    C = 'er', 
    atom_concat(S, 'o', I),
    atom_concat(S, 'es', You),
    atom_concat(S, 'e', He),
    atom_concat(S, 'emos', We),
    atom_concat(S, 'en', They), 
    prePrintConj(I, You, He, We, They),
    askForIt(Verb, I, You, He, We, They), !.
conjugate(Verb) :-
    sub_atom(Verb, _, 2, 0, C),
    sub_atom(Verb, 0, _, 2, S),
    C = 'ir', 
    atom_concat(S, 'o', I),
    atom_concat(S, 'es', You),
    atom_concat(S, 'e', He),
    atom_concat(S, 'imos', We),
    atom_concat(S, 'en', They), 
    prePrintConj(I, You, He, We, They),
    askForIt(Verb, I, You, He, We, They), !.
conjugate(Verb) :-
    write(Verb), write(' no es un verbo valido'), !.

askForIt(Verb, I, You, He, We, They) :-
    nl, write('Correcto? '), read(Ans),
    Ans = 'y', 
    open('C:\\Users\\sasuk\\Documents\\ITQ\\6 semestre\\Programacion Logica y Funcional\\Prolog\\VerbsProlog\\regulars.txt', append, StrRegulars),
    saveInFile(Verb, I, You, He, We, They, StrRegulars), !.
askForIt(Verb, _, _, _, _, _) :-
    write('Yo: '), read(I),
    write('Tu: '), read(You),
    write('El/Ella: '), read(He),
    write('Nosotros: '), read(We),
    write('Ustedes/Ellos: '), read(They),
    open('C:\\Users\\sasuk\\Documents\\ITQ\\6 semestre\\Programacion Logica y Funcional\\Prolog\\VerbsProlog\\irregulars.txt', append, StrIrregulars),
    saveInFile(Verb, I, You, He, We, They, StrIrregulars), !.

saveInFile(Verb, I, You, He, We, They, File) :-
    write(File, '\n'),
    write(File, [Verb,I,You,He,We,They]),
    write(File, '.'),
    close(File), !.