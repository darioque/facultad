/*
Dada una lista de materias del ciclo básico, indicar si una materia pertenece a este ciclo
*/

ciclo_basico_lista([geografia, anatomia, historia, geometria, botanica]).

ciclo_basico(X) :- miembro(X, [geografia, anatomia, historia, geometria, botanica]).
ciclo_basico2(X) :- ciclo_basico_lista(L), miembro(X,L).
miembro(X, [A|B]) :- X = A ; miembro(X,B).














