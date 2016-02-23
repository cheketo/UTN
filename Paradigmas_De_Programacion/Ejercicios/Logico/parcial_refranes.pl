% Autor:
% Fecha: 24/07/2013

cuchillo(juan,palo).
cuchillo(pedro,palo).
cuchillo(ana,metal).
cuchillo(oscar,metal).

profesion(ana,costurera).
profesion(juan,herrero).
profesion(pedro,carpintero).
profesion(oscar,herrero).

%1.a%
refrana(Persona) :- profesion(Persona,herrero),cuchillo(Persona,palo).

%1.b%
refranb(Persona) :- forall(profesion(Persona,herrero),cuchillo(Persona,palo)).

%1.c%
refranc(Persona) :- listaHerreros(Persona,ListaHerreros),listaCumple(Persona,ListaCumple),esMayoria(ListaCumple,ListaHerreros).

listaHerreros(P,L) :- findall(P,profesion(P,herrero),L).
listaCumple(P,L)   :- findall(P,refrana(P),L).

esMayoria(Lista1,Lista2) :- length(Lista1,Cant1),length(Lista2,Cant2),Cant is Cant2 / 2, Cant1>Cant.

%2%

anda(julia,daniel).
anda(julia,jorge).
anda(julia,raul).
anda(olga,jose).
anda(olga,claudio).
anda(olga,felipe).
anda(olga,carlos).

parece(daniel,buenaGente).
parece(jorge,buenaGente).
parece(raul,malandra).
parece(jose,ingeniero).
parece(claudio,periodista).
parece(felipe,ingeniero).
parece(carlos,contador).


quienEres(Persona,Es) :- findall(Es,queEs(Persona,P2,Es),LEs), esMayoria2(Es,LEs).
queEs(P1,P2,Es)       :- anda(P1,P2),parece(P2,Es).
esMayoria2(E,L)        :- findall(E,member(E,L),L2), length(L,C),length(L2,C2), Cant is C / 2, C2 >= Cant.
