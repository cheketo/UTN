% Autor:
% Fecha: 6/9/2013
%ejercicio 1 guia 1
puedeAndar(comercioExterior,P):- habla(ingles,P), habla(frances,P), profesional(P).
puedeAndar(comercioExterior,P):- ambicioso(P).
puedeAndar(contaduria,P):- contador(P), honesto(P).
puedeAndar(ventas,P):- ambicioso(P), conExperiencia(P).
puedeAndar(ventas,lucia).
puedeAndar(proyectos,P) :- ingeniero(P),conExperiencia(P).
puedeAndar(proyectos,P) :- abogado(P),joven(P).
puedeAndar(logistica,P) :- profesional(P),joven(P).
puedeAndar(logistica,P) :- profesional(P), trabajoEn(P,omni).

profesional(P):- contador(P).
profesional(P):- abogado(P).
profesional(P):- ingeniero(P).
ambicioso(P):- contador(P), joven(P).
conExperiencia(P):- trabajoEn(P,_).
contador(roque).
joven(roque).
trabajoEn(roque,acme).
habla(roque,frances).
honesto(roque).
ingeniero(ana).
habla(ana,ingles).
habla(ana,frances).
trabajoEn(ana,omni).
habla(lucia,ingles).
habla(lucia,frances).
trabajoEn(lucia,omni).
abogado(cecilia).
ambicioso(cecilia).
habla(cecilia,frances).
ingeniero(jeanPaul).
trabajoEn(jeanPaul,gugul).
%-----ejercicio 2 guia 1

empleado(maria).
empleado(nora).
empleado(felipe).
empleado(hugo).
cadete(juan).
cadete(roque).
cadete(pedro).
cadete(ana).
ventas(maria).
ventas(roque).
ventas(juan).
compras(nora).
compras(pedro).
administracion(felipe).
administracion(hugo).
administracion(ana).
trabajaEn(compras,P):- compras(P).
trabajaEn(ventas,P):- ventas(P).
trabajaEn(administracion,P):-administracion(P).
companeros(P,Q):- trabajaEn(Depto,P),trabajaEn(Depto,Q).
ordenes(A,B):- companeros(A,B),empleado(A),cadete(B).

%ejercicio 3 guia 1---
grupoA(colombia).
grupoA(camerun).
grupoA(jamaica).
grupoA(italia).
grupoB(argentina).
grupoB(nigeria).
grupoB(japon).
grupoB(escocia).
grupo(a,X):- grupoA(X).
grupo(b,X):- grupoB(X).
mismogrupo(A,B):- grupo(G,A),grupo(G,B).
rivalesDe(A,B):- mismogrupo(A,B) , A\=B.
%ejercicio 4 guia 1 ------------------

varon(juan).
varon(pedro).
varon(jose).
mujer(maria).
mujer(ursula).
mujer(juana).
sereno(juan).
decidido(juan).
melancolico(maria).
decidido(ursula).
soniador(juana).
reflexivo(pedro).
melancolico(jose).
pareja(M,V):- mujer(M),varon(V).
compatible(M,V):- pareja(M,V),sereno(V),melancolico(M).
compatible(M,V):- pareja(M,V),decidido(M),reflexivo(V).
compatible(M,V):- pareja(M,V),soniador(M),decidido(V).
compatible(M,V):- pareja(M,V),melancolico(M),decidido(V).
compatible(M,V):- pareja(M,V),melancolico(V),decidido(M).
% punto c ------  no anda!!!!!!
esDeseable(Persona,_):- compatible(Persona,_).




