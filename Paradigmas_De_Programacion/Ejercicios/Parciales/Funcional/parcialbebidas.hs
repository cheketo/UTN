-- PARCIAL - BEBIDAS
--module parcialbebidas where
--import Hugs.Prelude

carta 	= [("criadores",20,40),("jb",25,40),("quilmes",12,5),("gancia",12,5),("coca",8,0)]

cesar 	= ("cesar",[("criadores",(18,55)),("jb",(19,05))])
guille	= ("guille",[("quilmes",(20,50)),("quilmes",(21,10))])
nico 	= ("nico",[("coca",(19,0)),("coca",(20,15))])

bebidasHappyHour = ["quilmes","criadores","gancia"]

-- Ejercicio 1
-- A
tuplafst (x,_,_) = x
tuplasnd (_,x,_) = x
tuplatrd (_,_,x) = x


precioBase n = (tuplasnd.head.filter ((==n).tuplafst))

-- B
precioConsumo (nombre,(hora,_)) | (any (==nombre) bebidasHappyHour) && ((hora)>=18) && ((hora)<21) = (precioBase nombre carta)/2
								| otherwise = (precioBase nombre carta)

-- Ejercicio 2
cuantoPaga = (sum.map (precioConsumo).snd)

-- Ejercicio 3
-- A
alcoholBebida bebida = (head.map (tuplatrd).filter ((==bebida).tuplafst) ) carta
alcoholBebidas = (sum.map (alcoholBebida))
alcoholPersona = alcoholBebidas.(map (fst).snd)
sanito = ((<1).alcoholPersona)

-- B
sanitos = (map (fst).filter (sanito))

-- Ejercicio 4
terminoArruinado = (bebidasConsecutivas.snd)

bebidasConsecutivas bebidas | null bebidas = False
							| (teRompe (head bebidas) ((head.tail) bebidas)) = True
							| otherwise = bebidasConsecutivas (tail bebidas)

teRompe bebida1 bebida2 = (esBebidaBlanca bebida1) && (esBebidaBlanca bebida2) && (diferenciaHoraria (snd bebida1) (snd bebida2))
esBebidaBlanca = ((>34).alcoholBebida.fst)
diferenciaHoraria (hora1,minuto1) (hora2,minuto2) = (((hora1*60)+minuto1) - ((hora2*60)+minuto2)) < 15

-- Ejercicio 5
buscarSegun f1 f2 = (f2.head.filter (f1))

-- A
precioBase2 bebida = buscarSegun ((==bebida).tuplafst) tuplasnd carta

-- B
cuantoPaga2 persona personas = buscarSegun ((==persona).fst) (sum.map (precioConsumo).snd) personas