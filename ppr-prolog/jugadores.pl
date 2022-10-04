jugador(1,roger_federer, sui, 61, 8,559, 8.1,78,91,42,69).
jugador(2,novak_djokovic, srb, 65, 11,447, 5.9,74,87,46,67).
jugador(3,andy_murray, gbr, 50, 12,455, 7.3,74,84,41,68).
jugador(4,rafael_nadal, esp, 42, 6,160, 3.3,75,88,60,71).
jugador(5,david_ferrer, esp, 62, 14,238, 3.1,73,85,45,64).
jugador(6,jo-wilfried_tsonga, fra, 48, 3,547, 8.3,76,87,42,70).
jugador(7,tomas_berdych, cze, 50, 18,545, 8.0,77,87,44,70).
jugador(8,juan_martin_del_potro, arg, 53, 14,461, 6.9,74,87,44,68).
jugador(9,janko_tipsarevic, srb, 52, 21,575, 7.9,76,85,40,64).
jugador(10,juan_monaco, arg, 38, 16,88, 1.6,67,77,42,58).
jugador(11,nicolas_almagro, esp, 53, 18,577, 8.1,77,86,39,62).
jugador(12,john_isner, usa, 43, 18,917, 15.0,78,91,31,73).
jugador(13,richard_gasquet, fra, 38, 19,311, 5.5,73,84,42,65).
jugador(14,milos_raonic, can, 43, 17,921, 15.4,83,93,39,74).
jugador(15,kei_nishikori, jpn, 35, 17,125, 2.4,69,78,39,58).
jugador(16,marin_cilic, cro, 34, 16,311, 6.2,72,81,43,60).
jugador(17,stanislas_wawrinka, sui, 32, 17,367, 7.5,73,83,44,66).
jugador(18,gilles_simon, fra, 38, 22,247, 4.1,69,76,41,59).
jugador(19,philipp_kohlschreiber, ger, 41, 21,474, 7.6,74,85,45,65).
jugador(20,alexandr_dolgopolov, ukr, 28, 21,402, 8.2,75,80,41,62).
jugador(21,tommy_haas, ger, 27, 14,257, 6.3,75,83,38,64).
jugador(22,sam_querrey, usa, 31, 22,590, 11.1,80,86,38,64).
jugador(23,fernando_verdasco, esp, 29, 19,237, 4.9,71,82,40,65).
jugador(24,marcel_granollers, esp, 20, 21,171, 4.2,69,74,34,57).
jugador(25,florian_mayer, ger, 22, 23,167, 3.7,71,78,39,60).
jugador(26,andreas_seppi, ita, 32, 24,223, 4.0,70,78,44,58).
jugador(27,andy_roddick, usa, 23, 16,358, 9.2,75,84,36,60).
jugador(28,mardy_fish, usa, 21, 11,301, 9.4,78,85,44,66).
jugador(29,feliciano_lopez, esp, 23, 23,468, 10.2,77,86,38,71).
jugador(30,mikhail_youzhny, rus, 29, 17,199, 4.3,71,80,40,60).
jugador(31,jeremy_chardy, fra, 23, 18,304, 7.4,74,81,38,68).
jugador(32,viktor_troicki, srb, 25, 25,379, 7.6,71,74,43,56).
jugador(33,julien_benneteau, fra, 25, 21,310, 6.7,71,79,42,62).
jugador(34,martin_klizan, svk, 18, 12,101, 3.4,70,76,44,60).
jugador(35,jurgen_melzer, aut, 17, 21,175, 4.6,69,75,44,57).
jugador(36,marcos_baghdatis, cyp, 30, 22,334, 6.4,73,80,41,61).
jugador(37,jarkko_nieminen, fin, 25, 24,130, 2.7,67,75,42,56).
jugador(38,kevin_anderson, rsa, 25, 22,507, 10.8,74,85,35,65).
jugador(39,thomaz_bellucci, bra, 22, 18,203, 5.1,71,78,38,62).
jugador(40,pablo_andujar, esp, 19, 25,71, 1.6,65,68,40,52).

%cls/1: limpia la ventana de comandos.
cls:-write('\33\[2J').

% torneo/2: permite modelar torneos ganados por un jugador de un
% ranking determinado

torneo(1, grand_slam("Australia Open")).
torneo(2, olimpiada("Espa�a", 1992)).
torneo(20, grand_slam("Australia Open")).
torneo(29, olimpiada("Australia", 2000)).
torneo(5, olimpiada("Grecia", 2004)).
torneo(3, grand_slam("Winbledon")).
torneo(3, olimpiada("Inglaterra", 2012)).
torneo(1, olimpiada("China", 2008)).
torneo(2, grand_slam("US Open")).

%regla1/2
regla1(Jugador, Posicion):- jugador(Posicion, Jugador,arg,_,_,_,_,_,_,_,_).

%regla2/1
regla2(Tenista):-
    jugador(_, Tenista,_,_ ,_ ,_ ,_ ,_,PGS,_,_),
    PGS >80.

regla2_w:-
    regla2(Tenista),
    write("Tenista: "),
    write(Tenista),
    nl,
    fail.

%regla3/1:
regla3(Jugador) :-
    jugador(Ranking,Jugador,_,_,_,_,_,_,_,_,BPS),
    BPS >= 50,
    BPS =< 60,
    Ranking > 20.


regla4(T, Jugador) :-
    jugador(_,T,Nacionalidad,PP,_,_,_,_,_,_,_),
    jugador(_,Jugador,Nacionalidad,PP2,_,_,_,_,_,_,_),
    PP2 > PP.


promedio_ganados(Tenista, Prom):-
    jugador(_,Tenista,_,PG,PP,_,_,_,_,_,_),
    Aux is PG+PP,
    Prom is PG/Aux.


ganador(Tenista, Oponente):-
    jugador(Rank1,Tenista,_,_,_,_,_,PSG,_,_,_),
    promedio_ganados(Tenista, Prom1),
    jugador(Rank2,Oponente,_,_,_,_,_,PSG2,_,_,_),
    promedio_ganados(Oponente, Prom2),
    Prom1 > Prom2,
    Dif is abs(Rank1-Rank2),
    Dif =<5,
    PSG > PSG2.

%regla8/1:
regla8(Tenista):-
    jugador(Rank, Tenista,_,_,_,_,_,_,_,_,_),
    ( torneo(Rank, grand_slam("Australia Open"))
    ; torneo(Rank, olimpiada("Espa�a", _))
    ).

















