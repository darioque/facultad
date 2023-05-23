% hechos
accidente(1, 'AA582GE', fecha(05, 11, 2021), horario(09, 15), clima(1, 8.00), 1, 28965856, [36253654,56324569,
25412563]).
accidente(2, 'AB745HF', fecha(15, 08, 2020), horario(10, 22), clima(2, 0.00), 3, 27365895, [27365895,44652698]).
accidente(3, 'AA582GE', fecha(15, 08, 2020), horario(08, 32), clima(1, 4.75), 4, 20356987, [27365895,44652698]).
accidente(4, 'AA582GE', fecha(12, 05, 2021), horario(23, 47), clima(3, 8.23), 1, 48555785, [35698236]).
accidente(5, 'AE458JK', fecha(11, 06, 2019), horario(22, 35), clima(3, 4.95), 3, 28965856, []).
accidente(6, 'AC569LK', fecha(21, 12, 2020), horario(23, 12), clima(4, 0.00), 2, 20356987, [20356987,45236874,
36521452]).

condiciones(1, 'lluvia').
condiciones(2, 'nieve').
condiciones(3, 'tormenta').
condiciones(4, 'niebla').

conductor(28965856, 'Juan Soler', fecha(12, 01, 1982)).
conductor(20356987, 'Blanca Nieves', fecha(15, 03, 2006)).
conductor(27365895, 'Jose Curito', fecha(22, 06, 2000)).
conductor(48555785, 'Ana Crisol', fecha(21, 05, 2005)).

% conocer si existe algún accidente que haya ocurrido entre Agosto y Diciembre del 2020 pero no en el mes de Octubre de ese año, ademas, debe ter una severidad que sea menor a un valor pasado como argumento.
% accidenteEntreAgostoYDiciembre(Severidad).
regla1(Ref):-
	accidente(_, _, fecha(_, Mes, _), _, _, Severidad, _, _),
	Mes >= 8,
	Mes =< 12,
	Mes \= 10,
	Severidad < Ref.

% conocer la cantidad de accidentes que se han producido en días de lluvia en donde la precipitación no haya superado los 5.55 mm y que el conductor tenga menos de 18 años.
% accidentesLluvia(Edad).
accidentesLluvia(CantidadDeAccidentes):-
	findall(Conductor, (accidente(_, _, _, _, clima(1, Precipitacion), _, Conductor, _), Precipitacion < 5.55, conductor(Conductor, _, fecha(_, _, Anio)), Anio > 2003), Lista),
	length(Lista, CantidadDeAccidentes).

edad(DiaAct, MesAct, AnioAct, DiaNac, MesNac, AnioNac, Edad) :- 
	EdadProv is AnioAct - AnioNac - ( (MesAct < MesNac ; (MesAct =:= MesNac, DiaAct < DiaNac))).
