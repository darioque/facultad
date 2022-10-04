%HECHOS

%Pedidos para la jornada actual:
%pedido(CodPedido,TecnicoAsignado,DNI,domicilioInstalacion(Calle,Altura,CodBarrio),Servicios)
pedido(1,111,'30.000.000',domicilioInstalacion('Salta',250,1),['television por cable','wi-fi']).
pedido(2,111,'20.000.000',domicilioInstalacion('Av. Colon',101,2),['wi-fi']).
pedido(3,222,'15.000.000',domicilioInstalacion('San Martin',1321,1),['internet por cable']).
pedido(4,333,'12.000.000',domicilioInstalacion('Avellaneda',3213,2),['internet por cable','wi-fi']).
pedido(5,333,'25.000.000',domicilioInstalacion('9 de Julio',2123,1),['television por cable']).
pedido(6,111,'20.000.000',domicilioInstalacion('Urquiza',1203,3),['television satelital']).

%tecnico(Legajo,Apellido,Nombre)
tecnico(111,'Olazabal','Juliana').
tecnico(222,'Luchetti','Gertudis').
tecnico(333,'Manfredi','Luiggi').

%descuento(CodBarrio,Barrio,ProcDescuento)
descuentoPorBarrio(1,'Centro',10).
descuentoPorBarrio(2,'Alberdi',20).
descuentoPorBarrio(3,'Cofico',15).
descuentoPorBarrio(4,'Maipu',20).

aux1(NB) :- descuentoPorBarrio(CB, NB, _), pedido(_,_,_, domicilioInstalacion(_,_,CB), _).

regla1(LO) :- findall(NB, aux1(NB), L), sort(L,LO).

regla2(DNI) :- pedido(_,_,DNI,_,_), !.

regla3(CP, AP, NO, IT) :-  pedido(CP, LT, _, domicilioInstalacion(_,_,CB), LS), tecnico(LT, AP, NO), length(LS, CS), I is (CS * 500), descuentoPorBarrio(CB, _, PD), IT is (I - (PD * I / 100)).
