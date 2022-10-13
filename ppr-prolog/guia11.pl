% Realizar una regla que permita incrementar en 1 un numero X.
% ++/1.
++(X) :- X is X + 1.

% Realizar una regla que permita decrementar en 1 un numero X.
% --/1.
--(X) :- X is X - 1.

% Realizar una regla que permita sumar dos numeros X e Y.
% +=/3.
+=(X, Y, Z) :- Z is X + Y.

% Realizar una regla que pemirta obtener la raiz cuadrada de un numero X.
% sqrt/2.
sqrt(X, Y) :- Y is sqrt(X).

% Hechos a utilizar.
ciudad(1, 'Buenos Aires', 300).
ciudad(1, 'Cordoba', 200).
ciudad(1, 'Rosario', 150).

% Realizar una regla que permita obtener el nombre de todas las ciudades.
% ciudades/1.
ciudades(X) :- ciudad(_, X, _).

% Realizar una regla que obtenga el nombre de las ciudades que tengan más
% de 180 empleados.
% masDe180/1.
masDe180(X) :- ciudad(_, X, Y), Y > 180.

% Realizar una regla que permita obtener el nombre de las ciudades que
% tengan menos de 250 empleados.
% menosDe250/1.
menosDe250(X) :- ciudad(_, X, Y), Y < 250.

% Realizar una regla que permita obtener el nombre de las ciudades que
% tengan exactamente 200 empleados.
% exactamente200/1.
exactamente200(X) :- ciudad(_, X, Y), Y =:= 200.

% Realizar una regla que permita obtener el nombre de las ciudades que
% que no tengan exactamente 200 empleados.
% noExactamente200/1.
noExactamente200(X) :- ciudad(_, X, Y), Y =\= 200.






