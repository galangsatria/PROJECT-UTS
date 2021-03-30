% Start Rules (Knowledge Base)
/* Knowledge Base */
plant(dikotil):-
    tulang_daun_sejajar(yes),
    keping_lembaga_1(no),
    batang_bercabang(no),
    tidak_berbunga(yes),
    daun_tebal(yes),
    keping_lembaga_2(yes).
plant(monokotil):-
    tulang_daun_sejajar(no),
    keping_lembaga_1(yes),
    batang_bercabang(yes),
    tidak_berbunga(yes),
    daun_tebal(no),
    keping_lembaga_2(no).
% End Rules (Knowledge Base)
 
% Start User Interface
/* Asking the user */
tulang_daun_sejajar(X):- 
    menuask(tulang_daun_sejajar, X, [yes, no]).
keping_lembaga_1(X):- 
    menuask(keping_lembaga_1, X, [yes, no]).
batang_bercabang(X):- 
    menuask(batang_bercabang, X, [yes, no]).
tidak_berbunga(X):- 
    menuask(tidak_berbunga, X, [yes, no]).
daun_tebal(X):- 
    menuask(daun_tebal, X, [yes, no]).
keping_lembaga_2(X):- 
    menuask(keping_lembaga_2, X, [yes, no]).
 
/* Menus for user & Remembering the answer*/
menuask(A, V, _):-
    known(yes, A, V), % succeed if true
    !. % stop looking
menuask(A, V, _):-
    known(_, A, V), % fail if false
    !,
    fail.
menuask(A, V, MenuList) :-
    write('Apakah '), write(A), write('?'), nl,
    write(MenuList), nl,
    read(X),
    check_val(X, A, V, MenuList),
    asserta( known(yes, A, X) ),
    X == V. 
 
/* Check input */
check_val(X, _A, _V, MenuList) :-
    member(X, MenuList),
    !.
check_val(X, A, V, MenuList) :-
    write(X), write(' is not a legal value, try again.'), nl,
    menuask(A, V, MenuList). 
 
/* Member rules */
member(X,[X|_]).
member(X,[_|T]):-member(X,T).
% End User Interface
 
% Start Simple Shell
/* Simple shell */
top_goal(X) :- plant(X). 
 
solve :-
    abolish(known, 3),
    top_goal(X),
    write('The answer is '), write(X), nl.
solve :-
    write('No answer found.'), nl. 
 
/* Command loop */
go :-  
    greeting,
    repeat,
    write('> '),
    read(X),
    do(X),
    X == quit.
 
greeting :-
    write('This is the Clasification a Plant Prolog Exsys.'), nl,
    write('Enter start or quit at the prompt.'), nl.
 
/* Running Program */
do(start) :-
    solve,
    !. 
 
/* Quit Program */
do(quit).
do(X) :-
    write(X),
    write('is not a legal command.'), nl,
    fail. 
% End Simple Shell
 
/* handle undefined procedure */
:- unknown(trace, fail).