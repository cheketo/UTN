% GUIA 2 %

% EJERCICIO 1 %
bebida(villavicencio,agua,nacional,2).
bebida(glaciar,agua,nacional,3).
bebida(cocacola,gaseosa,nacional,4).
bebida(goliat,gaseosa,nacional,1).
bebida(bianchi,vino,nacional,7).
bebida(trapiche,vino,nacional,12).
bebida(richelieu,vino,importado,13).
bebida(cucagna,vino,importado,18).
bebida(criadores,whisky,nacional,20).
bebida(grants,whisky,importado,30).

cliente(luisa,particular).
cliente(ruben,particular).
cliente(zoraida,comerciante).
cliente(ramon,comerciante).

conAlcohol(Bebida) :- bebida(Bebida,vino,_,_).
conAlcohol(Bebida) :- bebida(Bebida,whisky,_,_).
sinAlcohol(Bebida) :- bebida(Bebida,agua,_,_).
sinAlcohol(Bebida) :- bebida(Bebida,gaseosa,_,_).

variacionVino(Costo,Porcentaje) :- (Costo * 20/100) > 3, Porcentaje is 3.
variacionVino(Costo,Porcentaje) :- (Costo * 20/100) =< 3, Porcentaje is Costo * 20/100.

precioComerciante(Bebida,Precio) :- sinAlcohol(Bebida), bebida(Bebida,_,_,Costo), Porcentaje is Costo * 25/100, Precio is Costo + Porcentaje.
precioComerciante(Bebida,Precio) :- bebida(Bebida,vino,nacional,Costo), Porcentaje is Costo * 30/100, Precio is Costo + Porcentaje + 1.
precioComerciante(Bebida,Precio) :- bebida(Bebida,vino,importado,Costo), variacionVino(Costo,Porcentaje), Precio is Costo + Porcentaje.
precioComerciante(Bebida,Precio) :- bebida(Bebida,whisky,_,Costo), Porcentaje is Costo * 50/100, Precio is Costo + Porcentaje.

precioParticular(Bebida,Precio) :- bebida(Bebida,agua,_,Costo), Porcentaje is Costo * 30/100, Precio is Costo + Porcentaje.
precioParticular(Bebida,Precio) :- bebida(Bebida,gaseosa,_,Costo), Porcentaje is Costo * 40/100, Precio is Costo + Porcentaje.
precioParticular(Bebida,Precio) :- conAlcohol(Bebida),bebida(Bebida,_,nacional,Costo), Porcentaje is Costo * 60/100, Precio is Costo + Porcentaje.
precioParticular(Bebida,Precio) :- conAlcohol(Bebida),bebida(Bebida,_,importado,Costo), Porcentaje is Costo * 70/100, Precio is Costo + Porcentaje.

precio(Persona,Bebida,Precio) :- cliente(Persona,particular), precioParticular(Bebida,Precio).
precio(Persona,Bebida,Precio) :- cliente(Persona,comerciante), precioComerciante(Bebida,Precio).

% EJERCICIO 2 %
puntajeLanzamiento(Metros,Puntos) :- Metros >= 9, Metros =< 11, Puntos is 10.
puntajeLanzamiento(Metros,Puntos) :- Metros > 7, Metros < 9, Puntos is 6.
puntajeLanzamiento(Metros,Puntos) :- Metros > 11, Metros < 15, Puntos is 6.
puntajeLanzamiento(Metros,Puntos) :- Metros =< 7, Puntos is 0.
puntajeLanzamiento(Metros,Puntos) :- Metros >= 15, Puntos is 0.

puntajeFuerza(Metros,Puntos) :- Metros =< 5, Puntos is 3.
puntajeFuerza(Metros,Puntos) :- Metros > 5, Metros =< 10, Puntos is 6.
puntajeFuerza(Metros,Puntos) :- Metros > 10, MetrosBonus is Metros - 10, puntajeBonus(MetrosBonus,Bonus), Puntos is 10 + Bonus.

puntajeBonus(Metros,Puntos) :- Puntos is Metros * 20/100.

puntajeEquilibrio(Metros,Puntos) :- Puntos is Metros/3.

puntajeTotal(Persona,Puntaje) :- competidor(Persona,Lanzamiento,Fuerza,Equilibrio), puntajeLanzamiento(Lanzamiento,PuntosLanzamiento), puntajeFuerza(Fuerza,PuntosFuerza), puntajeEquilibrio(Equilibrio,PuntosEquilibrio), analizarPuntaje(PuntosLanzamiento,PuntosFuerza,PuntosEquilibrio,Puntaje).

analizarPuntaje(Lanzamiento,Fuerza,Equilibrio,Puntaje) :- Lanzamiento >= 5, Equilibrio >= 5, Fuerza >= 5, Puntaje is Lanzamiento + Equilibrio + Fuerza.

analizarPuntaje(Lanzamiento,_,_,Puntaje) :- Lanzamiento < 5, Puntaje is 0.
analizarPuntaje(_,_,Equilibrio,Puntaje) :- Equilibrio < 5, Puntaje is 0.
analizarPuntaje(_,Fuerza,_,Puntaje) :- Fuerza < 5, Puntaje is 0.


competidor(pepe,8,8,15).
competidor(mogui,10,10,1).
competidor(carlos,10,30,30).
competidor(rodolfa,1,100,1).
competidor(debilucho,1,1,50).
competidor(gustavo,8,28,37).

% EJERCICIO 3 %

asesino(Persona) :- odia(Persona,tia), not(masRico(Persona)).

persona(charles).
persona(tia).
persona(carnicero).

odia(tia,Persona) :- persona(Persona), Persona \= carnicero.
odia(charles,carnicero).
odia(carnicero,Persona) :- odia(tia,Persona).
masRico(Persona) :- persona(Persona), not(odia(carnicero,Persona)).














