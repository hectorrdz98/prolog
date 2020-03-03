
% ( condition -> then_clause ; else_clause )

gripe() :-
    sintoma('Fiebre'),
    sintoma('Tos'),
    sintoma('DolorGarganta'),
    sintoma('CongestionNasal'),
    sintoma('DoloresMusculares'),
    sintoma('DolorCabeza'),
    sintoma('Fatiga'),
    write('Gripe, '), !.
gripe() :- !.

asma() :-
    sintoma('FaltaAire'),
    sintoma('Tos'),
    sintoma('DoloresMusculares'),
    sintoma('ProblemasDormir'),
    write('Asma, '), !.
asma() :- !.

bronquitis() :-
    sintoma('Tos'),
    sintoma('CongestionNasal'),
    sintoma('Fatiga'),
    sintoma('FaltaAire'),
    sintoma('Fiebre'),
    sintoma('DoloresMusculares'),
    write('Bronquitis, '), !.
bronquitis() :- !.

ebola() :-
    sintoma('Fiebre'),
    sintoma('DolorCabeza'),
    sintoma('DoloresMusculares'),
    sintoma('Diarrea'),
    sintoma('CongestionConjuntival'),
    write('Ebola, '), !.
ebola() :- !.

gastritis() :-
    sintoma('DolorAbdominal'),
    sintoma('Nauseas'),
    sintoma('AcidezEstomago'),
    sintoma('AusenciaHambre'),
    write('Gastritis, '), !.
gastritis() :- !.

main :-
    retractall(sintoma(_)),
    write('Fiebre? '), read(PreFiebre),
    write('Tos? '), read(PreTos),
    write('Dolor de garganta? '), read(PreDolorGarganta),
    write('Congestion nasal? '), read(PreCongestionNasal),
    write('Dolores musculares? '), read(PreDoloresMusculares),
    write('Dolor de cabeza? '), read(PreDolorCabeza),
    write('Fatiga? '), read(PreFatiga),
    write('Falta de aire? '), read(PreFaltaAire),
    write('Problemas para dormir? '), read(PreProblemasDormir),
    write('Diarrea? '), read(PreDiarrea),
    write('Congestion conjuntival? '), read(PreCongestionConjuntival),
    write('Dolor abdominal? '), read(PreDolorAbdominal),
    write('Nauseas? '), read(PreNauseas),
    write('Acidez de estomago? '), read(PreAcidezEstomago),
    write('Ausencia de hambre? '), read(PreAusenciaHambre),
    
    fillDiag(PreFiebre, 'Fiebre'),
    fillDiag(PreTos, 'Tos'),
    fillDiag(PreDolorGarganta, 'DolorGarganta'),
    fillDiag(PreCongestionNasal, 'CongestionNasal'),
    fillDiag(PreDoloresMusculares, 'DoloresMusculares'),
    fillDiag(PreDolorCabeza, 'DolorCabeza'),
    fillDiag(PreFatiga, 'Fatiga'),
    fillDiag(PreFaltaAire, 'FaltaAire'),
    fillDiag(PreProblemasDormir, 'ProblemasDormir'),
    fillDiag(PreDiarrea, 'Diarrea'),
    fillDiag(PreCongestionConjuntival, 'CongestionConjuntival'),
    fillDiag(PreDolorAbdominal, 'DolorAbdominal'),
    fillDiag(PreNauseas, 'Nauseas'),
    fillDiag(PreAcidezEstomago, 'AcidezEstomago'),
    fillDiag(PreAusenciaHambre, 'AusenciaHambre'),

    predict(), !.

fillDiag('y', Val) :- assert(sintoma(Val)), !.
fillDiag(_, _) :- !.

predict() :-
    write('\nTienes: '),
    gripe(),
    asma(),
    bronquitis(),
    ebola(),
    gastritis(),
    !.
