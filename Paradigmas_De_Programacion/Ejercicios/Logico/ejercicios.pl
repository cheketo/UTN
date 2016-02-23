% Autor:
% Fecha: 21/06/2013

% EJERCICIO 1 GUIA 1 %
puedeAndar(comercioExterior,P):- habla(ingles,P), habla(frances,P), profesional(P).
puedeAndar(comercioExterior,P):- ambicioso(P).
puedeAndar(contaduria,P):- contador(P), honesto(P).
puedeAndar(ventas,P):- ambicioso(P), conExperiencia(P).
puedeAndar(ventas,lucia).
puedeAndar(proyectos,P):- ingeniero(P), conExperiencia(P).
puedeAndar(proyectos,P):- abogado(P), joven(P).
puedeAndar(logistica,P):- profesional(P), joven(P).
puedeAndar(logistica,P):- profesional(P), trabajoEn(P,omni).
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
ingeniero(pepe).
trabajoEn(pepe,google).

% EJERCICIO 2 GUIA 1 %
empleado(maria).
empleado(nora).
empleado(felipe).
empleado(hugo).
cadete(ana).
cadete(pedro).
cadete(juan).
cadete(roque).
ventas(maria).
ventas(juan).
ventas(roque).
compras(nora).
compras(pedro).
administracion(felipe).
administracion(hugo).
administracion(ana).

trabajaEn(compras,P)         :- compras(P).
trabajaEn(ventas,P)          :- ventas(P).
trabajaEn(administracion,P)  :- administracion(P).
mismoDepto(P1,P2)            :- trabajaEn(D,P1), trabajaEn(D,P2).
daOrden(P1,P2)               :- mismoDepto(P1,P2), empleado(P1), cadete(P2).

%EJERCICIO 3 GUIA 1%
grupo(a,colombia).
grupo(a,camerun).
grupo(a,italia).
grupo(a,jamaica).
grupo(b,argentina).
grupo(b,nigeria).
grupo(b,japon).
grupo(b,escocia).

rivalesDe(E) :- grupo(G,E), forall(grupo(G,X),X\=E).

% EJERCICIO 4 GUIA 1 %
es(serena,juan).
es(decidida,juan).
es(melancolica,maria).
es(decidida,ursula).
es(soniadora,juana).
es(reflexiva,pedro).
es(melancolica,jose).

es(varon,juan).
es(mujer,maria).
es(mujer,ursula).
es(mujer,juana).
es(varon,pedro).
es(varon,jose).

sonOpuestos(P1,P2) :- es(varon,P1), es(mujer,P2).
sonOpuestos(P1,P2) :- es(mujer,P1), es(varon,P2).

esCompatible(P1,P2) :- es(melancolica,P1),es(serena,P2).
esCompatible(P1,P2) :- es(melancolica,P2),es(serena,P1).
esCompatible(P1,P2) :- es(decidida,P1),es(reflexiva,P2).
esCompatible(P1,P2) :- es(decidida,P2),es(reflexiva,P1).
esCompatible(P1,P2) :- es(soniadora,P2),es(decidida,P1).
esCompatible(P1,P2) :- es(soniadora,P1),es(decidida,P2).
esCompatible(P1,P2) :- es(melancolica,P1),es(decidida,P2).
esCompatible(P1,P2) :- es(melancolica,P2),es(decidida,P1).


compatible(P1,P2) :- sonOpuestos(P1,P2), esCompatible(P1,P2).

esDeseable(P1) :- findall(P1,compatible(P1,P2),Compatibles), length(Compatibles,Cant), Cant>1.

% EJERCICIO 6 GUIA 1 %
alumno(daniel,luisa).
alumno(daniel,juan).
alumno(luisa,ana).
alumno(nico,diana).
alumno(nico,nahuel).
alumno(nahuel,tamara).
alumno(ruben,claudio).
alumno(ruben,jose).
alumno(luisa,alvaro).
alumno(jose,alvaro).
carilindo(brad).
carilindo(leo).
carilindo(johnny).
simpatico(luciano).
simpatico(lautaro).
seguro(nico).
seguro(daniel).

puedeIr(P) :- carilindo(P).
puedeIr(P) :- seguro(P).
puedeIr(P) :- alumno(_,P), alumno(Profe,P), puedeIr(Profe).
puedeIr(nacho).

% EJERCICIO 7 GUIA 1 %
pastel(rosa).
pastel(celeste).
pastel(lila).

portenio(mabel).
portenio(mara).
portenio(pablo).

mayor(ana).
mayor(pablo).

persona(hombre,juan).
persona(hombre,pablo).
persona(hombre,adrian).
persona(mujer,mabel).
persona(mujer,mara).
persona(mujer,ana).

atrae(rosa,ana).
atrae(rosa,mabel).
atrae(celeste,mara).
atrae(lila,mara).
atrae(C,juan) :- pastel(C).
atrae(azul,P) :- persona(mujer,X).
atrae(azul,pablo).
atrae(rojo,mabel).
atrae(rojo,P) :- persona(hombre,P),mayor(P).
atrae(amarillo,P) :- portenio(P).
atrae(amarillo,adrian).
atrae(naranja,ana).
atrae(naranja,juan).


colores(Nombre,Color) :- atrae(Color,Nombre).



% EJERCICIO SIMULACRO %

entrada(socio(comun),10,[sillasVoladoras,autitosChocadores,elPulpo,...]).
entrada(socio(especial),15,[sillasVoladoras,autitosChocadores,elPulpo,boomerang,elDesafio,...]).
entrada(socio(gold),25,[sillasVoladoras,autitosChocadores,elPulpo,boomerang,elDesafio,vertigoXtremo,...]).
entrada(excepcional,30,[sillasVoladoras,autitosChocadores,elPulpo,boomerang,elDesafio,vertigoXtremo,...]).
entrada(invitado(mayor),40,[sillasVoladoras,autitosChocadores,elPulpo,boomerang,elDesafio,...]).
entrada(invitado(menor),30,[sillasVoladoras,autitosChocadores,elPulpo,...]).

dinero(ana,35).
dinero(carlos,40).
dinero(rodrigo,50).
dinero(marcelo,25).

edad(ana,24).
edad(carlos,19).
edad(rodrigo,11).

vertigoTolerable(ana,60).
vertigoTolerable(carlos,70).
vertigoTolerable(rodrigo,20).

vertigoDeJuego(elVigia,25).
vertigoDeJuego(elDesafio,40).
vertigoDeJuego(boomerang,60).

% EJ 1 %
puedePagar(Persona,Entrada) :- dinero(Persona,Presupuesto), entrada(Entrada,Costo,X), invitado(Entrada,Persona), Presupuesto>=Costo.

invitado(invitado(menor),Persona) :- not(mayor(Persona)).
invitado(invitado(mayor),Persona) :- mayor(Persona).
invitado(socio(_),_).
invitado(excepcional,_).

mayor(Persona) :- edad(Persona,Edad), Edad>12.

% EJ 2 %
subeACualquierJuego(Persona)       :- vertigoTolerable(Persona,Vertigop), forall(vertigoDeJuego(Juego,Vertigoj), Vertigop>=Vertigoj).

% EJ 3 %
%cualesContienen(Juego,ListaEntradas) :-  entrada(Entrada,Precio,ListaJuegos), findall(Entrada,member(Juego,ListaJuegos),ListaEntradas). %

cualesContienen(Juego,Lista)          :- findall(Entrada,permiteAcceder(Entrada,Juego),Lista).

permiteAcceder(Entrada,Juego)         :- entrada(Entrada,_,Lista),member(Juego,Lista).

% EJ 4 %
%rankingDeMaricotas([]).
%rankingDeMaricotas([X|Xs])            :- rankingDeMaricotas[Xs].

listaOrdenada([X]).
listaOrdenada([X,Y])                  :- X<Y.
listaOrdenada([X,Y,Ys])               :- X<Y, listaOrdenada([Y,Ys]).

% Correccion

%rankingDeMaricotas([P])               :- subeACualquierJuego(P).
%rankingDeMaricotas([P1|P2|Ps])        :- vertigoTolerable(P1,V1), vertigoTolerable(P2,V2), V1=<V2, rankingDeMaricotas([P2|Ps]).

% EJ 5 Correccion


%SILLAS%
%1%

amigo(juan,alberto).
amigo(juan,pedro).
amigo(pedro,mirta).
amigo(alberto,tomas).
amigo(tomas,mirta).

enemigo(mirta,ana).
enemigo(juan,nestor).
enemigo(juan,mirta).

mesaArmada(navidad2010,mesa(1,[juan,mirta,ana,nestor])).
mesaArmada(navidad2010,mesa(5,[andres,german,ludmila,elias])).
mesaArmada(navidad2010,mesa(8,[nestor,pedro])).

estaSentadaEn(Quien,Mesa) :- mesaArmada(_,Mesa),mesa(Mesa,Lista), member(Quien,Lista).
mesa(mesa(_,Lista),Lista).

%2%
esAmigo(Persona,Amigo)    :- amigo(Persona,Amigo).
esAmigo(Persona,Amigo)    :- amigo(Amigo,Persona).

esEnemigo(Persona,Enemigo):- enemigo(Persona,Enemigo).
esEnemigo(Persona,Enemigo):- enemigo(Enemigo,Persona).

sePuedeSentar(Persona,Mesa) :- mesa(Mesa,Lista), esAmigo(Persona,Amigo), member(Amigo,Lista), forall(member(Enemigo,Lista),not(esEnemigo(Persona,Enemigo))).


esAmigo2(Persona,Amigo)    :- amigo(Persona,Amigo).
esAmigo2(Persona,Amigo)    :- amigo(Amigo,Persona).
esAmigo2(Persona,Persona).
%3%
mesaDeCumple(Persona,Mesa)  :- findall(Amigo,esAmigo2(Persona,Amigo),Lista), mesaIdeal(Mesa,Lista).
mesaIdeal(mesa(1,Lista),Lista).

incompatible(P1,P2)            :- esAmigo(P1,Amigo), esEnemigo(P2,Amigo).

laPeorOpcion(Persona,Mesa)     :- mesa(Mesa,Lista),forall(member(Enemigo,Lista),esEnemigo(Persona,Enemigo)).