% Hechos a utilizar.
competidores('Silvia Porras', 1, [3,5,8,6,9], [101, 104, 102]).
competidores('Nelsi Alejandra Gonzalez', 1, [9,7,3,9,10,2], [101, 104, 102]).
competidores('Ramiro Esparza', 1, [3,5,3,8,3], [101, 103, 102]).
competidores('Guadalupe Luna', 2, [7,10,10] , [101, 100, 104]).
competidores('Hugo Lenin', 2, [7,8,8,5], [101, 100, 104]).
competidores('Rafael Fregoso Cardenas', 2, [9,7,3,9,2,2], [101, 105, 104]).
competidores('Viviana Juarez', 2, [4,3,3,9], [101, 104, 102]).
competidores('Ramiro Lopez', 3, [1,3,9] , [103, 104, 105]).
competidores('Hugo Lenin', 3, [9,7,3], [103, 104, 105]).
competidores('Mario Soliz', 3, [7,8,8,4], [103, 104, 105]).

saltos(1,'Salto Largo', 4).
saltos(2,'Salto Alto', 5).
saltos(3,'Salto con garrocha', 3).

jueces(100,'Mario Filippo').
jueces(101,'Sebastian Lerda').
jueces(102,'Dario Chesta').
jueces(103,'Paula Lopez').
jueces(104,'Julio Zurdo').
jueces(105,'Miriam Vergara').

% aux1/3. Predicado auxiliar para conseguir el indice de un elemento
% (comenzando en 1) en una lista.
aux1([Elemento|_], Elemento, 1):- !.
aux1([_|B], Elemento, Indice) :-
    aux1(B, Elemento, Indice1),
    !,
    Indice is Indice1 + 1.

% regla1/4. Predicado para recibir una categoria, un nombre de
% competidor, un puntaje y devolver el numero salto (si lo hubiera)
% donde obtuvo ese puntaje.
regla1(Categoria, Competidor, Puntaje, Salto) :-
    competidores(Competidor, Categoria, Lista,_),
    aux1(Lista, Puntaje, Salto), ! ; Salto is -1.

% regla2/3. Predicado para recibir una categoria, el nombre de un
% competidor y el nombre de un juez, y devolver true/false determinado
% si fue evaluado o no por ese juez.
regla2(Categoria, Competidor, Juez) :-
    competidores(Competidor, Categoria,_,Jueces),
    jueces(Legajo,Juez),
    member(Legajo, Jueces),!.

% aux2/2. Predicado para recibir una lista y devolver el largo de otra
% lista generada con los elementos de la primera que sean mayores o
% iguales a 9.
aux2(Lista, Largo) :-
    findall(X, (member(X, Lista), X >= 9), L),
    length(L, Largo).

% regla3/1. Predicado para devolver los nombres de los competidores
% calificados para la final (suma de puntajes mayores a 30 o dos saltos
% de 9 ó más puntos).
regla3(Competidores) :-
    competidores(Competidores,_,Puntajes,_),
    (sum_list(Puntajes, Suma), Suma >= 30 ;
    not((sum_list(Puntajes, Suma), Suma >= 30)),
    aux2(Puntajes, Largo), Largo >= 2).

regla3_w:-
    regla3(Competidores),
    write('Competidor: '),
    write(Competidores),
    nl,
    fail.

% aux3/3. Predicado auxiliar para recibir dos listas y devolver el largo
% de una lista nueva creada a partir de los elementos en comun.
aux3(Lista1, Lista2, Largo) :-
    findall(X, (member(X, Lista1), member(X, Lista2)), R),
    length(R, Largo).

% regla4/3. Predicado para recibir una categoria y una lista de legajos,
% y devolver el nombre de los competidores descalificados para la final
% que no hayan sido calificados por los jueces pasados como parámetro.
regla4(Categoria, Jueces2, Competidores) :-
    competidores(Competidores,Categoria,_,Jueces1),
    not(regla3(Competidores)),
    aux3(Jueces1, Jueces2, Largo),
    Largo < 1.

% regla5/1. Predicado para listar los nombres de los competidores
% clasificados con una cantidad de saltos inferior al 60% de los
% intentos permitidos por su categoria. Se devuelva una lista con un
% SORT para que elimine los repetidos (más allá de que nadie cumple con
% las condiciones en este caso).
regla5(LO) :-
    findall(Competidores,(
    competidores(Competidores,Categoria,Saltos,_),
    regla3(Competidores),
    length(Saltos, Largo),
    saltos(Categoria,_,IM),
    CM is (IM * 0.60),
    Largo < CM), L), sort(L, LO).



