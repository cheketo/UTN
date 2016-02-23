-- GUIA 2
-- ORDEN SUPERIOR
--1.1
existAny f 	= any(f).hacerLista
hacerLista (x,y,z)	= [x,y,z]

--1.2
mejor f1 f2 x	= maximum[(f1 x),(f2 x)]

cuadrado x = x*x
triple	x	= x+x+x

--1.3
aplicarPar f (x,y)	= (f x,f y)

--1.4
parDeFns f1 f2 x	= (f1 x,f2 x)

--LISTAS
--2.1
sumaLista	= sum

--2.2.0
frecuenciaCardiaca	= [80,100,120,128,130,123,125]

--2.2.1
promedioFrecuenciaCardiaca	= promedio frecuenciaCardiaca

--2.2.2
frecuenciaCardiacaMinuto x 	= frecuenciaCardiaca !! (div 10 x)

--2.2.3
frecuenciasHastaMomento x	= take ((div x 10)+1) frecuenciaCardiaca

--2.3
esCapicua x	= (concat x) == (reverse.concat)x

--2.4.0
duracionLlamadas =( ("horarioReducido", [20,10,25,15]), ("horarioNormal", [10,5,8,2,9,10]) )

--2.4.1
tuplaReducido	= fst
tuplaNormal		= snd
minutos			= snd
horario			= fst

cuandoHabloMasMinutos 
		| (minutos.tuplaReducido) duracionLlamadas >= (minutos.tuplaNormal) duracionLlamadas = (horario.tuplaReducido) duracionLlamadas
		| otherwise = (horario.tuplaNormal) duracionLlamadas
		
--2.4.2
cuandoHizoMasLlamadas 
		| (length.minutos.tuplaReducido) duracionLlamadas >= (length.minutos.tuplaNormal) duracionLlamadas = (horario.tuplaReducido) duracionLlamadas
		| otherwise = (horario.tuplaNormal) duracionLlamadas
		
		
--3.1
esMultiploDeAlguno x y	= length (filter (division x) y) >0

division x y	= mod x y == 0

--3.2
promedioos 	= map(promedioo)

promedioo x	= (sum x) / (fromInteger.toInteger.length)x

--3.3
promediosSinAplazos	= (filter(>4).map(promedioo))

--3.4
mejoresNotas x	= map maximum x

--3.5
aprobo  x	= minimum x > 3

--3.6
aprobaron	= filter (\ a -> minimum a > 3)

--3.7
divisores n	= filter (\ a -> mod n a == 0) [1..n]

--3.8
exists f	= (not.null.filter (f))

--3.9
hayAlgunNegativo x _	= (not.null.filter (<0) ) x

--3.10
aplicarFunciones x y	= map (\ a -> a y) x

--3.11
sumaF x y	= (sum.map (\ a -> a y)) x

--3.12
subirHabilidad x	=  (map(comparar12).map (+x))

comparar12 a	
			| a>=12 = 12
			| otherwise = a
			
			
--3.13
flimitada f = f

--GUIA 3
--1.4
transformadaLoca = map(sumaEven).filter(19>)

sumaEven x
		| even x 	=  2 + x
	   	| not (even x)	=  1 + x

--1.7
menoresA x	= filter(x>)

--1.8.1
promedios 	= map(promedio)

promedio x	= (sum x) / (fromInteger(toInteger(length x)))

cantidadLista []= 0.00;
cantidadLista (x:xs)	= 1.00 + cantidadLista xs


