% pedido(numeroPredido, numeroInterno, horaExacta(hora, minutos),
% listadoArticulos, importe, tipoCobro)
%
pedido(1,'333',hora_exacta(7,30),['cafe','cafe','factura','factura'],300,'TC').
pedido(2,'444',hora_exacta(9,20),['gaseosa','torta'],500,'TC').
pedido(3,'111',hora_exacta(9,25),['factura','criollo','criollo'],150,'E').
pedido(4,'444',hora_exacta(10,15),['sandwich','sandwich','torta'],800,'TC').
pedido(5,'333',hora_exacta(10,25),['cafe','cafe'],200,'E').
pedido(6,'444',hora_exacta(10,40),['sandwich','factura','cafe'],600,'D').


% oficina(numeroInterno, tipoOficina, Ubicacion)
oficina('111','Biblioteca','Ala A').
oficina('222','Laboratorio','Ala B').
oficina('333','Sala de maestros','Lateral D').
oficina('444','Direccion','Central').

% recargo(tipoCobro, descripcion, porcentaje)
recargo('E','efectivo',0).
recargo('D','debito',10).
recargo('TC','tarjeta de credito',25).

% 1.Conocer si entre los pedidos recibidos, hubo o no hubo, algún
%   pedido cuyo importe final esté comprendido entre 2 valores que
%   se reciben como argumentos en la regla, incluyendo ambos
%   extremos. Tener en cuenta que el importe final se calcula
%   incrementándole al importe del pedido, el porcentaje del mismo,
%   correspondiente al tipo de cobro, especificado en la tabla 3.
%   Predicado sugerido para esta regla: regla1/2. (15 puntos).

regla1(VI,VF) :- pedido(_, _, _, _, Importe,TC), recargo(TC,_,Porc), IF is (Importe + (Porc * Importe / 100)), IF >= VI, IF =< VF, !.

%2. Conocer para un determinado número de pedido que también se
%   deberá especificar como argumento a la regla, los siguientes
%   datos: descripción de la oficina/departamento desde el cual se
%   hizo el pedido, hora y minuto (por separado) en el que se
%   recibió el pedido, descripción del tipo de cobro, e importe
%   final del pedido. Recordar que el importe final se calcula
%   incrementándole al importe del pedido, el porcentaje del mismo,
%   correspondiente al tipo de cobro, especificado en la tabla 3.
%   Predicado sugerido para esta regla: regla2/6. (15 puntos)

regla2(NP, DO, HO, MI, DC, IF) :- pedido(NP, NI, hora_exacta(HO, MI),_,Importe,TC), oficina(NI, DO, _), recargo(TC, DC, Porc), IF is (Importe + (Porc * Importe / 100)).

%3. Generar una lista con las descripciones de aquellas
%   oficinas/departamentos que hayan realizado algún pedido en el
%   cual el listado de artículos correspondiente tenga una cantidad
%   mayor a N, siendo N un valor especificado en la regla. En la
%   lista a generar no deberán figurar descripciones o nombres de
%   oficinas/departamentos repetidos en caso que dicha
%   oficina/departamento tenga más de un pedido en el que figuren en
%   sus listados de artículos una cantidad de artículos mayor a N;
%   por lo tanto se deberán eliminar de la lista a generar aquellos
%   nombres de oficinas/departamentos que llegaran a estar
%   repetidos. Predicado sugerido para esta regla: regla3/2. (20
%   puntos).

regla3(LO, V) :- pedido(_,NI,_, Lista,_,_), findall(DO, (oficina(NI,DO,_),length(Lista, Largo), Largo > V), R), sort(R, LO).

