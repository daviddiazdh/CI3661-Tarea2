% David Díaz | 20-10019 %

% prela(Materia, Prelacion)
prela(ci2691, ci3661). % ci2691 prela a ci3661
prela(ci2525, ci2691).
prela(ci2691, ci3641).
prela(ci3641, ci3725).
prela(ci3725, ci3825). % ci3725 prela a ci3825
prela(ma1111, ci2525).
prela(ci3661, ci3662).
prela(ci3662, ci3663).
prela(ci3663, ci3662).


% prelacion directa es completamente equivalente a la función prela.
prelacion_directa(A, B) :-
    prela(A, B).

% prelacion_total simplemente llama a prelacion_total_helper que hara el recorrido
% DFS con cuidado con ciclos.
prelacion_total(A, B) :-
    prelacion_total_helper(A, B, [A]).

% Caso base de prelacion_total_helper, si hay un camino directo, 
% se devuelve dicho camino sin importar visitados.
prelacion_total_helper(A, B, _) :-
    prela(A, B).

% Caso recursivo de prelacion_total_helper, si no hay un camino directo,
% entonces se verifican los vecinos de A que no han sido visitados y se intenta
% por ese camino.
prelacion_total_helper(A, B, Visitados) :-
    prela(A, C),
    not(member(C, Visitados)),
    prelacion_total_helper(C, B, [C | Visitados]).