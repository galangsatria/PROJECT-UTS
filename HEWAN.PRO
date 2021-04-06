% Start Rules (Knowledge Base)
/* Knowledge Base */
hewan(herbivora):-
    memakan_daging(no),
    memakan_rumput(yes),
    gigi_utama_taring(no),
    panjang_usus_12_kali_badannya(yes),
    memiliki_kuku_yang_tajam(no),
    punya_enzim_pencerna_karbohidrat(yes),
    memiliki_gigi_geraham_besar(yes),
    sebagian_besar_hewan_buas(no),
    kemampuan_berkembang_biak_rendah(no).

hewan(karnivora):-
    memakan_daging(yes),
    memakan_rumput(no),
    gigi_utama_taring(yes),
    panjang_usus_12_kali_badannya(no),
    memiliki_kuku_yang_tajam(yes),
    punya_enzim_pencerna_karbohidrat(no),
    memiliki_gigi_geraham_besar(no),
    sebagian_besar_hewan_buas(yes),
    kemampuan_berkembang_biak_rendah(yes).
hewan(omnivora):-
    memakan_daging(yes),
    memakan_rumput(yes),
    gigi_utama_taring(no),
    panjang_usus_12_kali_badannya(yes),
    memiliki_kuku_yang_tajam(yes),
    punya_enzim_pencerna_karbohidrat(yes),
    memiliki_gigi_geraham_besar(yes),
    sebagian_besar_hewan_buas(no),
    kemampuan_berkembang_biak_rendah(no).
% End Rules (Knowledge Base)
 
% Start User Interface
/* Asking the user */
memakan_daging(X):- 
    menuask(memakan_daging, X, [yes, no]).
memakan_rumput(X):- 
    menuask(memakan_rumput, X, [yes, no]).
gigi_utama_taring(X):- 
    menuask(gigi_utama_taring, X, [yes, no]).
panjang_usus_12_kali_badannya(X):- 
    menuask(panjang_usus_12_kali_badannya, X, [yes, no]).
memiliki_kuku_yang_tajam(X):- 
    menuask( memiliki_kuku_yang_tajam, X, [yes, no]).
punya_enzim_pencerna_karbohidrat(X):- 
    menuask(punya_enzim_pencerna_karbohidrat, X, [yes, no]).
memiliki_gigi_geraham_besar(X):- 
    menuask(memiliki_gigi_geraham_besar, X, [yes, no]).
sebagian_besar_hewan_buas(X):- 
    menuask(sebagian_besar_hewan_buas, X, [yes, no]).
kemampuan_berkembang_biak_rendah(X):-
    menuask(kemampuan_berkembang_biak_rendah, X, [yes, no]).
 
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
top_goal(X) :- hewan(X). 
 
solve :-
    abolish(known, 3),
    top_goal(X),
    write('Hewan ini termasuk '), write(X), nl.
solve :-
    write('Hewan ini tidak terdefinisi.'), nl. 
 
/* Command loop */
go :-  
    greeting,
    repeat,
    write('> '),
    read(X),
    do(X),
    X == quit.
 
greeting :-
    write('SELAMAT DATANG DI PROGRAM PANDUAN PEMILIH HEWAN'), nl,
    write('Ketik Start untuk memulai.'), nl.
 
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