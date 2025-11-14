% David Díaz | 20-10019 %

% dicta(Profesor, Materia)
dicta(leonardo, ci3661).
dicta(maria, ci3725).
dicta(pedro, ci2691).

% cursa(Estudiante, Materia)
cursa(ana, ci3661).
cursa(ana, ci3725).
cursa(juan, ci3661).
cursa(elena, ci2691).
cursa(elena, ci3725).

% nota(Estudiante, Materia, Nota)
nota(ana, ci3661, 88).
nota(ana, ci3725, 70).
nota(juan, ci3661, 40). % juan clavo :c
nota(elena, ci2691, 51).
% elena no tiene nota en ci3725 (la esta cursando)

% profesor_de verifica que un profesor dicte una materia y que dicha materia
% la curse un estudiante. No existe tiempo, si dicta es un registro histórico, 
% entonces la función profesor_de no refleja el hecho de que un profesor
% esté siendo profesor del estudiante dado, debemos suponer que dicta
% solo considera que el profesor dicta la materia en el presente.
profesor_de(Prof, Est) :-
    dicta(Prof, Mat),
    cursa(Est, Mat).

% aprobado verifica que un estudiante haya aprobado una materia, por lo cual,
% el estudiante debe haber cursado la materia (muestra que cursa es histórico) y
% debe tener nota en el mismo.
aprobado(Est, Mat) :-
    cursa(Est, Mat),
    nota(Est, Mat, Nota),
    Nota >= 50.

% aplazado verifica que un estudiante haya aplazado una materia, en este caso,
% se verifica que el estudiante curse alguna materia, tenga nota en esa materia y
% su nota sea reprobatoria, o sea, menor a 50.
aplazado(Est) :-
    cursa(Est, Mat),
    nota(Est, Mat, Nota),
    Nota < 50.

% cursando_sin_nota verifica si el estudiante está cursando la materia actualmente
% porque chequea que haya cursado la materia, pero también que no tenga nota en la
% KB, entonces eso implica que el estudiante está cursando la materia actualmente.
cursando_sin_nota(Est, Mat) :-
    cursa(Est, Mat),
    not(nota(Est, Mat, _)).