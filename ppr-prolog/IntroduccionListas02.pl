/*
 Este programa muestra las funciones basicas recursivas de listas.

*/

primerElemento([X|Y],X).

miembro(X,[X|_]).
miembro(X,[_|Y]) :- miembro(X,Y).
/* miembro(X,L) :- member(X,L). */

cuenta([],0).
cuenta([_|Y],N) :- cuenta(Y,M), N is M+1.
/* cuenta(L,X) :- length(L,X). */

ultimo([X],X).
ultimo([_|Y],X) :- ultimo(Y,X).
/* ultimo(L,X) :- last(L,X). */

suma([],0).
suma([X|Y],S):- suma(Y, Y1), S is Y1+X.
/*suma(L, S) :- sum_list([L],S).*/



































