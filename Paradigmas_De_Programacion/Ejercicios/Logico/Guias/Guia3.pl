% GUIA 3 %

% EJERCICIO 1 %
puntajes(hernan,[3,5,8,6,9]).
puntajes(julio,[9,7,3,9,10,2]).
puntajes(ruben,[3,5,3,8,3]).
puntajes(roque,[7,10,10]).

puntajeSalto(Competidor,Salto,Puntaje) :- puntajes(Competidor,Puntajes), nth1(Salto,Puntajes,Puntaje).

descalificado(Competidor) :- puntajes(Competidor,Saltos), length(Saltos,Cantidad), Cantidad > 5.

clasifica(Competidor) :- not(descalificado(Competidor)), puntajes(Competidor,Saltos), sumlist(Saltos,Sumatoria), Sumatoria > 27.
clasifica(Competidor) :- not(descalificado(Competidor)), puntajes(Competidor,Saltos), findall(S,verificar(S,Saltos),SaltosBuenos), length(SaltosBuenos,Cantidad), Cantidad>1.

verificar(Pos,Lista) :- nth0(Pos,Lista,Elem), Elem>8.

% EJERCICIO 2 %
ingreso(roque,enero,2000).
ingreso(roque,febrero,2501).
ingreso(roque,marzo,2501).
ingreso(luisa,enero,2500).
ingreso(luisa,febrero,850).

persona(roque).
persona(luisa).

padre(roque,luisa).

buenPasar(Persona) :- ingreso(Persona,enero,Ingreso), Ingreso > 2200.
buenPasar(Persona) :- ingreso(Persona,_,Ingreso), Ingreso > 3000.
buenPasar(Persona) :- persona(Persona), findall(Mes,chequearIngreso(Persona,Mes),Ingresos), length(Ingresos,Long), Long>1.

chequearIngreso(Persona,Mes) :- ingreso(Persona,Mes,Ingreso), Ingreso>2500.

areIdentical(X,Y) :- X == Y.
filterList(A,In,Out) :- exclude(areIdentical(A),In,Out).

mesFilial(Persona,Mes) :- padre(Hijo,Persona), ingreso(Hijo,Mes,Ingreso), ingreso(Persona,Mes,Ingreso1), Ingreso > Ingreso1.

ingresoTotal(Persona,Total) :- findall(I,ingreso(Persona,_,I),Ingresos), sumlist(Ingresos,Total).

ingresoFamiliar(Persona,Total) :- ingresoTotal(Persona,TotalPersona), findall(H,padre(H,Persona),Hijos), sumaHijos(Hijos,Suma), Total is Suma + TotalPersona.

sumaHijos([],0).
sumaHijos([X|Xs],Suma) :- ingresoTotal(X,Total), sumaHijos(Xs,Suma1), Suma is Total + Suma1.

% EJERCICIO 3 %

