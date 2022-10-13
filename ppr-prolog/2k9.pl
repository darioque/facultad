% Realizar una regla que permita evualuar si el primer argumento
% numerico es mayor que el segundo argumento numerico que recibe el
% predicado.

%mayor/2.
mayor(X,Y) :- X > Y.

% Realizar una funcion que determine si un numero es par o impar.
%par/1.
par(Numero) :- integer(Numero), Numero mod 2 =:= 0.

% Realizar una regla llamada ++/2, que permita sumar en 1 al primer
% argumento entero que se reciba como parametro.
%++/2.
%++/(NumeroEntero, NumeroEnteroMasUno).
++(X,Y) :- integer(Y), Y is X + 1.

% Realizar una regla llamada pow/3, que permita elevar el primer
% argumento numerico al segundo argumento numerico que se reciba como
% parametro.
%pow/3.
%pow(Numero, Potencia, Resultado).
pow(B,E,Z) :- Z is B ** E.