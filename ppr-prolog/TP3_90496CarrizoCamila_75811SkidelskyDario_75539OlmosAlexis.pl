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

%Conocer si existe algún accidente que haya ocurrido entre Agosto y Diciembre del 2020
% pero no en el mes de Octubre de ese año además, debe tener una
% severidad que sea menor
% a un valor pasado como argumento. Predicado sugerido para esta regla:
% regla1/1. (15
%puntos)


regla1(Ref):-
    accidente(_,_,fecha(_,Mes,_),_,_,Severidad,_,_),
    Mes >= 8,
    Mes =< 12,
    Mes =\= 10,
    Severidad < Ref.

% Conocer la cantidad de accidentes que se han producido en días de
% lluvia en donde la
% precipitación no haya superado los 5.55 mm y que el conductor tenga
% menos de 18 años.
%Predicado sugerido para esta regla: regla1/1. (8 puntos)
% a. Para resolver este punto se debe realizar una regla que determine la
% edad/7:
% edad(DiaAct, MesAct, AnioAct, DiaNac, MesNac, AñoNac, Edad) Aquí se
% calcular la
% edad de acuerdo al año, mes y día de nacimiento con respecto al
% dd/mm/aaaa actual
%(7 puntos).

edad(DiaAct, MesAct, AnioAct, DiaNac, MesNac, AnioNac, Edad) :-
             EdadProv is( AnioAct - AnioNac),( (MesAct < MesNac ; (MesAct =:= MesNac, DiaAct < DiaNac)) -> Edad is EdadProv - 1 ; Edad is EdadProv - 0 ).


regla2(CantAcc):- get_time(X), convert_time(X, AnioAct, MesAct, DiaAct,_,_,_,_),findall(CodCond,(accidente(_,_,_,_,clima(1,Precip),_,CodCond,_),Precip < 5.55,conductor(CodCond,_,fecha(Dia,Mes,Anio)),edad(DiaAct,MesAct,AnioAct,Dia,Mes,Anio,Edad), Edad < 18 ), ListaAcc), length(ListaAcc, CantAcc).


%3) Dado un Dni y Día, Mes, Año como argumentos, informar si ese Dni corresponde a un
% conductor que haya cometido un accidente en el que no hayan existido
% lesionados; en el
%día, mes y año indicados: regla3/4 (20 puntos)

regla3(Dni,Dia,Mes,Anio):-accidente(_,_,fecha(Dia,Mes,Anio),_,_,_,Dni,ListLes), length(ListLes, CantLes), CantLes =:= 0,!.

%4) Genere una lista con todos los nombres de los conductores (no repetidos) que hayan tenido
% un accidente en Junio, o que hayan tenido un accidente en Mayo pero sin
% lesionados.
%Predicado sugerido para esta regla: regla4/1. (25 puntos).

regla4(ListNom):-findall(Nom, (accidente(_,_,fecha(_,Mes,_),_,_,_,DniCond,_),conductor(DniCond,Nom,_),(Mes =:=06;(Mes=:=05,regla3(DniCond,_,Mes,_)))),Nombres),sort(Nombres,ListNom).

%5) Se recibe del Juzgado una lista con las Patentes de los vehículos que han intervenido en
%accidentes y requiere conocer si en el siniestro hubo lesionados.
%Para ello se recibe como argumento una lista de Patentes y se debe generar una nueva lista
% en la que cada elemento sea una tupla compuesta por los siguientes tres
% datos: (id del
%accidente, patente, cantidad de lesionados). Predicado sugerido para esta regla: regla5/2.
%(25 puntos).

regla5(ListPat,ListAcc):-findall((IdAcc,Pat,CantLes),(accidente(IdAcc,Pat,_,_,_,_,_,ListLes),member(Pat,ListPat),length(ListLes, CantLes)), ListAcc).
