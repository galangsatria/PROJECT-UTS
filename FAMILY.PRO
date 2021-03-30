% Clauses
% Lelaki
    lelaki(dudi).
    lelaki(fandy).
    lelaki(fino).
    lelaki(zaki).
    lelaki(beny).
    lelaki(tono).
    lelaki(oto).
    lelaki(tio).
    lelaki(bedu).
    lelaki(suman).
    lelaki(chico).
    lelaki(jaka).
    lelaki(sudir).
    lelaki(khuz).
    lelaki(shio).

% Perempuan
    perempuan(retno).
    perempuan(ita).
    perempuan(vio).
    perempuan(wati).
    perempuan(ina).
    perempuan(santi).
    perempuan(sisi).
    perempuan(eli).
    perempuan(ela).
    perempuan(nani).
    perempuan(erin).
    perempuan(qiqa).

% Ayah
    ayah(dudi, zaki).
    ayah(dudi, wati).
    ayah(dudi, beny).
    ayah(fandy, ina).
    ayah(fandy, santi).
    ayah(fino, tono).
    ayah(beny, sisi).
    ayah(beny, eli).
    ayah(beny, tio).
    ayah(tono, ela).
    ayah(oto, nani).
    ayah(oto, chico).
    ayah(oto, erin).
    ayah(bedu, qiqa).
    ayah(bedu, sudir).
    ayah(suman, khuz).
    ayah(suman, shio).

% Ibu
    ibu(retno, zaki).
    ibu(retno, wati).
    ibu(retno, beny).
    ibu(ita, ina).
    ibu(ita, santi).
    ibu(vio, tono).
    ibu(ina, sisi).
    ibu(ina, eli).
    ibu(ina, tio).
    ibu(santi, ela).
    ibu(sisi, nani).
    ibu(sisi, chico).
    ibu(sisi, erin).
    ibu(ela, qiqa).
    ibu(ela, sudir).
    ibu(nani, khuz).
    ibu(nani, shio).

% Pasangan
    pasangan(dudi, retno).
    pasangan(retno, dudi).
    pasangan(fandy, ita).
    pasangan(ita, fandy).
    pasangan(fino, vio).
    pasangan(vio, fino).
    pasangan(beny, ina).
    pasangan(ina,beny).
    pasangan(santi, tono).
    pasangan(tono, santi).
    pasangan(oto, sisi).
    pasangan(sisi, oto).
    pasangan(ela, bedu).
    pasangan(bedu, ela).
    pasangan(suman, nani).
    pasangan(nani, suman).
    pasangan(qiqa, sudir).
    pasangan(sudir, qiqa).

% Aturan
    orangtua(X,Y):-ayah(X,Y),lelaki(X).
    orangtua(X,Y):-ibu(X,Y),perempuan(X).
    anak(X,Y):-ibu(Y,X).
    anak(X,Y):-ayah(Y,X).
    saudara(X,Y):-ayah(A,X),ayah(A,Y),ibu(B,X),ibu(B,Y),\+(X==Y).

    paman(X,Y):-orangtua(Z,Y),saudara(X,Z),lelaki(X).
    bibi(X,Y):-orangtua(Z,Y),saudara(X,Z),perempuan(X).
    sepupu(X,Y):-orangtua(A,X),saudara(A,B),orangtua(B,Y).
    keponakan(X,Y):-orangtua(Z,X),saudara(Y,Z).
    mertua(X,Y):-orangtua(X,Z),pasangan(Z,Y).
    mertuaperempuan(X,Y):-orangtua(X,Z),pasangan(Z,Y),perempuan(X).
    mertualelaki(X,Y):-orangtua(X,Z),pasangan(Z,Y),lelaki(X).
    besan(X,Y):-orangtua(Y,A),pasangan(A,B),orangtua(X,B).
    besanperempuan(X,Y):-orangtua(Y,A),pasangan(A,B),orangtua(X,B),perempuan(X).
    besanlelaki(X,Y):-orangtua(Y,A),pasangan(A,B),orangtua(X,B),lelaki(X).
    menantu(X,Y):-orangtua(Y,Z),pasangan(X,Z).
    cucumenantu(X,Y):-cucu(Z,Y),pasangan(X,Z).
    kakek(X,Y):-orangtua(Z,Y),orangtua(X,Z),lelaki(X).
    nenek(X,Y):-orangtua(Z,Y),orangtua(X,Z),perempuan(X).
    kakekmertua(X,Y):-kakek(X,A),pasangan(A,Y),lelaki(X).
    nenekmertua(X,Y):-nenek(X,A),pasangan(A,Y),perempuan(X).
    buyut(X,Y):-orangtua(A,Y),orangtua(B,A),orangtua(X,B).
    buyutperempuan(X,Y):-orangtua(A,Y),orangtua(B,A),orangtua(X,B),perempuan(X).
    buyutlelaki(X,Y):-orangtua(A,Y),orangtua(B,A),orangtua(X,B),lelaki(X).
    cucu(X,Y):-anak(A,Y),anak(X,A).
    cucuperempuan(X,Y):-anak(A,Y),anak(X,A),perempuan(X).
    cuculelaki(X,Y):-orangtua(A,X),orangtua(Y,A),lelaki(X).
    ipar(X,Y):-pasangan(Z,Y),saudara(X,Z).
    iparperempuan(X,Y):-pasangan(Z,Y),saudara(X,Z),perempuan(X).
    iparlelaki(X,Y):-pasangan(Z,Y),saudara(X,Z),lelaki(X).
