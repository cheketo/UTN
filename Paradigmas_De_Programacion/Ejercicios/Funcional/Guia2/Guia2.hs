-- GUIA 2
--module Guia2 where
--import Hugs.Prelude
--{-# LANGUAGE FlexibleContexts #-}

-- 1 *************************** ORDEN SUPERIOR **************************
-- 1.1
existsAny f (x,y,z) = (f x) || (f y) || (f z)

-- 1.2
mejor f g x = max (f x) (g x)

-- 1.3
aplicarPar f x = ((f.fst) x,(f.snd) x)

-- 1.4
parDeFns f g x = (f x, g x)

-- 2 ****************************** LISTAS ******************************
-- 2.1
sumaLista l = sum l

-- 2.2
frecuenciaCardiaca = [80,100,120,128,130,123,125]

-- 2.2.1
promedioFrecuenciaCardiaca = (sum frecuenciaCardiaca) / fromInteger(toInteger(length frecuenciaCardiaca))

-- 2.2.2
frecuenciaCardiacaMinuto = ((!!) frecuenciaCardiaca.posicionMinuto)
posicionMinuto x = (div x 10)

-- 2.2.3
frecuenciasHastaMomento x = take ((+1)(posicionMinuto x)) frecuenciaCardiaca

--2.3
esCapicua l = ((reverse.concat) l) == (concat l)

-- 2.4
duracionLlamadas = (("horarioReducido",[20,10,25,15]),("horarioNormal",[10,5,8,2,9,10]))

-- 2.4.1
cuandoHabloMasMinutos 	| ((maximum.snd.fst) duracionLlamadas) > ((maximum.snd.snd) duracionLlamadas) = (fst.fst) duracionLlamadas
						| otherwise = (fst.snd) duracionLlamadas

-- 2.4.2
cuandoHizoMasLlamadas 	| ((length.snd.fst) duracionLlamadas) > ((length.snd.snd) duracionLlamadas) = (fst.fst) duracionLlamadas
						| otherwise = (fst.snd) duracionLlamadas

-- ***************************** FUNCIONES DE ORDEN SUPERIOR CON LISTAS ***************************************

-- 3.1
esMultiploDeAlguno x = any ((==) 0.(mod x))

-- 3.2
promedio l = (sum l) / fromInteger(toInteger(length l))
promedios l = map (promedio) l

-- 3.3
promediosSinAplazos xs = (filter (>4).promedios) xs

-- 3.4
mejoresNotas l = map (maximum) l

-- 3.5
aprobo l = all (>3) l

-- 3.6
aprobaron l = filter aprobo l

-- 3.7
divisores n = filter ((==) 0.(mod n)) [1..n]

-- 3.8
exists f = (any f)

-- 3.9
hayAlgunNegativo l x = any (<0) l

-- 3.10
aplicarFunciones l x = map (aplicarFuncion x) l
aplicarFuncion x f = f x

-- 3.11
sumaF l = (sum.aplicarFunciones l)

-- 3.12
subirHabilidad n = (map (min 12.max 0.(+n)))

-- 3.13
flimitada f = (min 12.max 0.f)

-- 3.13.1
cambiarHabilidad f = (map (flimitada f))

-- 3.13.2
-- cambiarHabilidad (max 4) [2,4,6,8,10]

-- 3.14
-- takeWhile: Devuelve el listado de los primeros elementos que hacen verdadera a la funciona booleana dada. Esta funcion acepta una funcion booleana y una lista.

-- 3.15
primerosPares = (takeWhile (even))
primerosDivisores l n = takeWhile ((==) 0.(mod n)) l
primerosNoDivisores l n = takeWhile ((/=) 0.(mod n)) l

-- 3.16
huboMesMejor l1 l2 n = any (>n) (restarListas l1 l2)
restarListas l1 l2 	| (null l1) || (null l2)  = [] 
						| otherwise = ((head l1) - (head l2)):(restarListas (tail l1) (tail l2))

-- 3.17
-- crecimiento = [22,20..6,4,4,4,4,4,2,2,1,1]
-- 3.17.1
crecimientoAnual edad 	| edad<10 = 24 - (edad*2)
						| edad>9 && edad<16 = 4
						| edad>15 && edad<18 = 2
						| edad>17 && edad<20 = 1
						| otherwise = 0

-- 3.17.2
crecimientoEntreEdades x y = (sum.map (crecimientoAnual)) [x..y]

-- 3.17.3
alturasEnUnAnio edad alturas = map (+(crecimientoAnual edad)) alturas

-- 3.17.4
alturasEnEdades altura edad = (map ((+altura).crecimientoEntreEdades (edad+1) ))

-- 3.18
lluviasEnero = [0,2,5,1,34,2,0,21,0,0,0,5,9,18,4,0]

-- 3.18.1
rachasLluvia [] = []
rachasLluvia (x:xs) | x /= 0 = [takeWhile (/=0) (x:xs)] ++ (rachasLluvia (dropWhile (/=0) (x:xs)))
					| x == 0 = rachasLluvia xs

-- 3.19
sume1 lista = foldl (+) 0 lista
sume2 lista = foldr (+) 0 lista

-- 3.20
productoria1 lista = foldl (*) 1 lista
productoria2 lista = foldr (*) 1 lista

-- 3.21
dispersion lista = ((foldl min 999 lista),(foldl max (-999) lista))

-- ***************************** LISTAS POR COMPRENSION ***************************************

-- 4.1
multiplos l n = [ x | x <- l, (mod x n)==0 ]

-- 4.2
doblesDeLosPares l = [ (x*2) | x <- l, even x ]

-- 4.3
menoresA n l = [x | x <- l, x<n]

-- 4.4
diferencia l1 l2 = [x | x <- l1, (not.elem x) l2]

-- 4.5
interseccion l1 l2 = [x | x <- l1, (elem x l2) ]

-- 4.6

-- 4.6.1
resultados l1 l2 = [ ((l1!!x) - (l2!!x)) | x <- [0..((length l1)-1)]]

-- 4.6.2
resultado l1 l2 mes = (resultados l1 l2)!!(mes-1)

-- 4.7
-- 4.7.1
diasLluviosos l 	= [x|x<-l,x/=0]
cantDiasLluviosos   = (length.diasLluviosos)
cantDiasSecos l 	= length ([x|x<-l,x==0])

-- 4.7.2
diasLluviosos2 l 	= [x|x<-l,x>2]
sumaLluviasSignificativas = (sum.diasLluviosos2)










