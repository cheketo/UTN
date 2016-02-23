% GUIA 1 %

% EJERCICIO 1 %
puedeAndar(comercioExterior,P):- habla(ingles,P), habla(frances,P), profesional(P). puedeAndar(comercioExterior,P):- ambicioso(P).
puedeAndar(contaduria,P):- contador(P), honesto(P).
puedeAndar(ventas,P):- ambicioso(P), conExperiencia(P).
puedeAndar(ventas,lucia).
profesional(P):- contador(P). profesional(P):- abogado(P). profesional(P):- ingeniero(P). ambicioso(P):- contador(P), joven(P). conExperiencia(P):- trabajoEn(P,_).
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

% A) Los predicados son los que no tienen una igualdad %
% B) %

% EJERCICIO 2 %
persona(maria,empleado,ventas).
persona(juan,cadete,ventas).
persona(roque,cadete,ventas).
persona(nora,empleado,compras).
persona(pedro,cadete,compras).
persona(felipe,empleado,administracion).
persona(hugo,empleado,administracion).
persona(ana,cadete,administracion).

trabajaEn(Persona,Departamento) :- persona(Persona,_,Departamento).
mismoDepto(P1,P2) :- trabajaEn(P1,Departamento),trabajaEn(P2,Departamento),P1 \= P2.
puedeDarOrdenes(P1,P2) :- persona(P1,empleado,Departamento), persona(P2,cadete,Departamento).

% EJERCICIO 3 %
equipo(colombia,a).
equipo(camerun,a).
equipo(jamaica,a).
equipo(italia,a).
equipo(argentina,b).
equipo(nigeria,b).
equipo(japon,b).
equipo(escocia,b).

seleccion(Pais) :- equipo(Pais,_).

mismoGrupo(E1,E2) :- equipo(E1,Grupo),equipo(E2,Grupo), E1 \= E2.
rivales(Equipo,Rivales) :- seleccion(Equipo),findall(E,mismoGrupo(Equipo,E),Rivales).

% EJERCICIO 4 %
pareja(Mujer,Varon) :- persona(Mujer,melancolica,mujer), persona(Varon,serena,varon).
pareja(Mujer,Varon) :- persona(Mujer,decidida,mujer), persona(Varon,reflexiva,varon).
pareja(Mujer,Varon) :- persona(Mujer,soniadora,mujer), persona(Varon,decidida,varon).
pareja(Mujer,Varon) :- persona(Mujer,melancolica,_), persona(Varon,decidida,_).

persona(juan,serena,varon).
persona(juan,decidida,varon).
persona(maria,melancolica,mujer).
persona(jose,melancolica,varon).
persona(juana,soniadora,mujer).
persona(pedro,reflexiva,varon).
persona(ursula,decidida,mujer).

hacePareja(P1,P2) :- pareja(P1,P2).
hacePareja(P1,P2) :- pareja(P2,P1).

deseable(Persona) :- findall(P,hacePareja(Persona,P),Personas), length(Personas,Cantidad), Cantidad > 1.

% EJERCICIO 5 %
gustaDe(luis,nora).
gustaDe(roque,nora).
gustaDe(roque,ana).
gustaDe(marcos,zulema).
gustaDe(X,zulema):- gustaDe(X,ana).
gustaDe(juan,X):- gustaDe(roque,X).
gustaDe(X,Y):- gustaDe(X,ana).
gustaDe(juan,nuria).

compiten(X,Y):- gustaDe(X,Z), gustaDe(Y,Z).

debeDinero(juan,marcos).
debeDinero(juan,roque).

% EJERCICIO 6 %
alumno(luisa,daniel).
alumno(juan,daniel).
alumno(ana,luisa).
alumno(diana,nico).
alumno(nahuel,nico).
alumno(tamara,nahuel).
alumno(claudio,ruben).
alumno(jose,ruben).
alumno(alvaro,luisa).
alumno(alvaro,jose).
carilindo(brad).
carilindo(leo).
carilindo(johnny).
simpatico(lautaro).
simpatico(luciano).

puedeIr(nico).
puedeIr(daniel).
puedeIr(Persona) :- alumno(Persona,Profesor), puedeIr(Profesor).
puedeIr(Persona) :- carilindo(Persona).

% EJERCICIO 7 %
pastel(rosa).
pastel(lila).
pastel(celeste).

mujer(ana).
mujer(mabel).
mujer(mara).
varon(pablo).
varon(adrian).
varon(juan).

portenio(mabel).
portenio(mara).
portenio(pablo).

mayor(ana).
mayor(pablo).

atrae(mabel,rosa).
atrae(ana,rosa).
atrae(mara,celeste).
atrae(mara,lila).
atrae(juan,Color) :- pastel(Color).
atrae(pablo,azul).
atrae(Mujer,azul) :- mujer(Mujer).
atrae(mabel,rojo).
atrae(Varon,rojo) :- varon(Varon), mayor(Varon).
atrae(adrian,amarillo).
atrae(Portenio,amarillo) :- portenio(Portenio).
atrae(ana,naranja).
atrae(juan,naranja).

reunido(viernes,mabel).
reunido(viernes,ana).
reunido(viernes,adrian).
reunido(viernes,pablo).

reunido(sabado,mara).
reunido(sabado,mabel).
reunido(sabado,adrian).
reunido(sabado,juan).

reunido(domingo,juan).
reunido(domingo,Persona) :- mayor(Persona).


reunion(Dia,Color) :- reunido(Dia,Persona1), reunido(Dia,Persona2), Persona1\=Persona2, atraeMismoColor(Persona1,Persona2,Color).
atraeMismoColor(P1,P2,Color) :- atrae(P1,Color), atrae(P2,Color).


