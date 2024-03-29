%HECHOS

promo('AAA','Cargando 10 litros o m�s de cualquier combustible, descuento del 8%',10,8).
promo('BBB','Cargando 8 litros o m�s de cualquier combustible, descuento del 5%',8,5).
promo('CCC','Cargando 12 litros o m�s de cualquier combustible, descuento del 10%',12,10).

venta('V1','AAA',fecha(29,9,2019),'1',12.5).
venta('V2','BBB',fecha(16,10,2019),'2',10.0).
venta('V3','AAA',fecha(16,10,2019),'4',15.5).
venta('V4','AAA',fecha(18,10,2019),'8',8.0).
venta('V5','CCC',fecha(18,10,2019),'9',12.0).

combustible('A','s�per',45.67,['1','2','3']).
combustible('B','premium',52.97,['4','5']).
combustible('C','di�sel',44.69,['6']).
combustible('D','di�sel premium',50.84,['7']).
combustible('E','GNC',20.99,['8','9','0']).

%regla1/4
regla1(CodVen, Slogan, Mes, A�o) :-  venta(CodVen, CodProm, fecha(_, Mes, A�o), _, Litros), promo(CodProm, Slogan, _, _), Litros > 12.

%regla2/2
regla2(CodVen,PorcDesc) :- venta(CodVen, CodProm,_,_,Litros), ((promo(CodProm,_,Minimos,PorcDesc), Litros >= Minimos), ! ; PorcDesc is 0).

%regla3/2
regla3(Nom, Lista):- findall(CodVen, (venta(CodVen,_,_,Surtidor,_), combustible(_,Nom,_,ListaSurtidores), member(Surtidor, ListaSurtidores)), Lista1), sort(Lista1, Lista).
