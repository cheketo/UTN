% PARCIAL LOGICO - MINECRAFT %

jugador(stuart, [piedra, piedra, piedra, piedra, piedra, piedra, piedra, piedra], 3).
jugador(tim, [madera, madera, madera, madera, madera, pan, carbon, carbon, carbon, pollo, pollo], 8).
jugador(steve, [madera, carbon, carbon, diamante, panceta, panceta, panceta], 2).

lugar(playa, [stuart, tim], 2).
lugar(mina, [steve], 8).
lugar(bosque, [], 6).

comestible(pan).
comestible(panceta).
comestible(pollo).
comestible(pescado).

persona(Jugador) :- jugador(Jugador,_,_).

sinRepetidos(Elemento,Lista) :- length(Elemento,Long), Long = 1, Lista is Elemento.
sinRepetidos([X|Xs],Lista) :- sinRepetidos(Xs,Lista1), not(member(X,Lista1)), Lista is [X,Lista1].
sinRepetidos([X|Xs],Lista) :- sinRepetidos(Xs,Lista1), member(X,Lista1), Lista is Lista1.

item(Item) :-  persona(Jugador), jugador(Jugador,Items,_), member(Item,Items).

tieneItem(Jugador,Item) :- jugador(Jugador,Items,_), member(Item,Items).

sePreocupaPorSuSalud(Jugador) :- jugador(Jugador,Items,_), tieneComida(Items).
tieneComida(Items) :- member(pan,Items).
tieneComida(Items) :- member(panceta,Items).
tieneComida(Items) :- member(pollo,Items).
tieneComida(Items) :- member(pescado,Items).

cantidadDeItems(Jugador,Item,Cantidad) :- jugador(Jugador,Items,_), sumarItems(Items,Item,Cantidad).

sumarItems([],_,Cantidad) :- Cantidad is 0.
sumarItems([X|Xs],Item,Cantidad) :- sumarItems(Xs,Item,Cantidad1), X = Item, Cantidad is Cantidad1 + 1. 
sumarItems([X|Xs],Item,Cantidad) :- sumarItems(Xs,Item,Cantidad1), X \= Item, Cantidad is Cantidad1. 

tieneMasDe(Jugador,Item) :- persona(Jugador), item(Item).














procesar(Lista,ListaFinal) :- findall(ListaFinal,ListaFinal>3,Lista).


sumatoria([X],Suma) :- Suma is X.
sumatoria([X|Xs],Suma) :- sumatoria(Xs, Suma1), Suma is Suma1 + X.

mayor([X],Mayor) :- Mayor is X.
mayor([X|Xs],Mayor) :- mayor(Xs,Mayor1), elMayor(X,Mayor1,Z), Mayor is Z.
elMayor(X,Y,Z) :- X>Y, Z is X.
elMayor(X,Y,Z) :- X<Y, Z is Y.

promedio(Lista,Promedio) :- sumatoria(Lista,Suma), length(Lista,Longitud), Promedio is (Suma/Longitud).

mujer(maria).
mujer(juana).
mujer(ana).
mujer(luisa).
mujer(ivanna).

edad(maria,20).
edad(juana,17).
edad(ana,36).
edad(luisa,52).
edad(ivanna,32).
