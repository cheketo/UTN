--TP Pociones
personas	= [("Harry",(11,5,4)),("Ron",(6,4,6)),("Hermione",(8,12,2)),("Draco",(7,9,6))]

fst3 (a,_,_)		= a
snd3 (_,b,_)		= b
trd3 (_,_,c)		= c

suerte				= fst3
convencimiento		= snd3
fuerza				= trd3

aplicar3 f (a,b,c)	= (f a, f b, f c)
invertir3 (a,b,c)	= (c,b,a)

nombre (nomb,_)		= nomb
habilidad (_,hab)	= hab

sinRepetidos []		= []
sinRepetidos (x:xs)
	| elem x xs		= sinRepetidos xs
	| otherwise		= x : sinRepetidos xs
	
maximoF _ [x]		= x
maximoF f (x:y:xs)
	| f x > f y		= maximoF f (x:xs)
	| otherwise		= maximoF f (y:xs)
	
pocion				= fst
ingredientes		= snd

ingrediente			= fst3
cantidad			= snd3
efectos				= trd3

vocales				= "aeiou"

aLista3	(a,b,c)		= [a,b,c]
	
f1 (ns,nc,nf)		= (ns+1,nc+2,nf+3)
f2					= aplicar3 (max 7)
f3 (ns,nc,nf)
	| ns >= 8		= (ns,nc,nf+5)
	| otherwise		= (ns,nc,nf-3)

misPociones			= 	[
							("Felix Felices",
								[
								("Escarabajos Machacados",52,[f1,f2]),
								("Ojo de Tigre Sucio",2,[f3])
								]
							),
							("Multijugos",
								[
								("Cuerno de Bicornio en Polvo",10,[invertir3,(\(a,b,c)->(a,a,c))]),
								("Sanguijuela hormonal",54,[(aplicar3 (*2)),(\(a,b,c)->(a,a,c))])
								]
							),
							("Flores de Bach",
								[
								("Orquidea Salvaje",8,[f3]),
								("Rosita",1,[f1])
								]
							)
						]

--1.a						
sumaNiveles	n1	n2				= ((suerte n1) + (suerte n2),(convencimiento n1) + (convencimiento n2),(fuerza n1) + (fuerza n2))

--1.b
diferenciaNiveles n1 n2			= ((max (suerte n1) (suerte n2)) - (min (suerte n1) (suerte n2)),(max (convencimiento n1) (convencimiento n2)) - (min (convencimiento n1) (convencimiento n2)),(max (fuerza n1) (fuerza n2)) - (min (fuerza n1) (fuerza n2)))

--1.c
sumaNivelesPersona				= (sum.aLista3.habilidad)

--1.d
diferenciaNivelesPersona per	= (maximum.aLista3.habilidad)per - (minimum.aLista3.habilidad)per

--2
efectosDePocion					= (foldr (++) [].map(map(\f -> f (1,2,3)).efectos).ingredientes)

--3
pocionesHeavies					= (map(pocion).filter(\lista -> 3<(length.efectosDePocion) lista))

--4.a
incluyeA l1 l2					= filter (\num -> any (num==) l2) l1 == l1

--4.b
esPocionMagica	pocion			= 0<(length.filter(incluyeA("aeiou")).map(ingrediente).ingredientes) pocion

--5
tomarPocion (nomber,habilidad) pocion		= (nombre,foldl(aux) habilidad ((foldr (++) [].map(efectos).ingredientes) pocion))

aux hab func								=  func hab