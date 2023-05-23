paseo(1, '20.000.000',fecha(1,10,2020), ['A','B','C'], 25).
paseo(2, '15.000.000',fecha(1,10,2020), ['B','E'], 30).
paseo(3, '8.000.000',fecha(2,10,2020), ['A','B','C','D','E'], 20).
paseo(4, '20.000.000',fecha(2,10,2020), ['A'], 20).
paseo(5, '12.000.000',fecha(3,10,2020), ['C','D','E'], 40).
paseo(6, '15.000.000',fecha(3,10,2020), ['B','D'], 35).

paseador('8.000.000','Emilia','Estrada').
paseador('12.000.000','Delia','Lizárraga').
paseador('15.000.000','Rocío','Albinoni').
paseador('20.000.000','Nico','Pointer').

tarifa(1, 'paseo exclusivo', 50).
tarifa(2, 'paseo de a dos', 80).
tarifa(3, 'paseo triple', 100).
tarifa(4, 'paseo de dos pares', 120).
tarifa(5, 'paseo quintuple', 150).

regla1(Min, Max) :- paseo(_,_,_,_,Duracion), Duracion >= Min, Duracion =< Max, !.

regla2(NumPas, Nom, Ape, Dia, Mes, Mins) :- paseo(NumPas, Dni,fecha(Dia, Mes,_),_,Mins), paseador(Dni, Nom, Ape).

regla3(Dni, Lista) :- findall(Desc, (paseo(_, Dni,_,Mascotas,_), tarifa(Cant, Desc,_), length(Mascotas, Cant1), Cant1 =:= Cant), Lista1), sort(Lista1, Lista).
