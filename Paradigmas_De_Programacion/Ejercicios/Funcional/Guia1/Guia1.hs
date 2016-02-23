-- GUIA 1
--module Guia1 where
--import Hugs.Prelude

-- 1.1
esMultiploDeTres x = mod x 3 == 0

-- 1.2
esMultiplo x y = mod x y == 0

-- 1.3
cubo x = x * x

-- 1.4
area x y = x * y

-- 1.5
esBisiesto x =  ((esMultiplo x 4) || (esMultiplo x 400)) && (not (esMultiplo x 100))

-- 1.6
celsiusToFahr x = ( 9 / 5 ) * x + 32

-- 1.7
fahrToCelsius x = (5/9)*(x - 32)

-- 1.8
haceFrioF x = (fahrToCelsius x) < 8

-- 1.9 *** RECURSIVIDAD ***
mcd x y | rem x y == 0 = y
		| rem x y /= 0 = mcd y (rem x y)

mcm x y = div (x * y) (mcd x y)

-- 1.10
---- 1.10.a
masAlto x y z = max (max x y) z

masBajo x y z = min (min x y) z

dispersion x y z = (masAlto x y z) - (masBajo x y z)

--- 1.10.b
diasParejos x y z = (dispersion x y z) < 30
diasLocos x y z = (dispersion x y z) < 100
diasNormales x y z = not (diasParejos x y z) && not (diasLocos x y z)

-- 1.11
pesoPino x | x <= 300 = 3 * x
		   | otherwise = 2 * x

esPesoUtil x = x>399 && x<1001

sirvePino x = esPesoUtil (pesoPino x)

-- 1.12 *** ORDEN SUPERIOR ***
aux::Int->Int->Int
aux x 0 = 0
aux x y = x + aux x (y-1) 
esCuadradoPerfecto x = aux x x

-- 2 *********************** APLICACIÓN PARCIAL *****************************************

-- 2.1 *** APLICACIÓN PARCIAL ***
siguiente = (+1)

-- 2.2 *** APLICACIÓN PARCIAL ***
mitad = (/2)

-- 2.3 *** APLICACIÓN PARCIAL ***
inversa = (1/)

-- 2.4 *** APLICACIÓN PARCIAL ***
triple = (*3)

-- 2.5 *** APLICACIÓN PARCIAL ***
esNumeroPositivo = (>0)

-- 3 ******************** COMPOSICIÓN ********************************************

-- 3.1
esMultiploDe x = not.esNumeroPositivo.mod x

-- 3.2
esAnioBisiesto x = ((esMultiploDe x 4) || (esMultiploDe x 400)) && (not.esMultiploDe x) 100

-- 3.3
inversaRaizCuadrada = inversa.sqrt

--3.4
incrementMCuadradoN x = (+)((*) x x)

-- 3.5
esMultiploDe2 x = (not.esNumeroPositivo.mod x) 2
esResultadoPar x = esMultiploDe2.(^) x

-- 4 ******************** TUPLAS ********************************************

-- 4.1
fst3 (x,_,_) = x
snd3 (_,x,_) = x
trd3 (_,_,x) = x

-- 4.2
aplicar (f1,f2) x = (f1 x,f2 x)

-- 4.3
cuentaBizarra (x,y) | x>=y = x+y
					| (y-x)>=10 = y-x
					| (y-x)<10 = x*y

--4.4
esNotaBochazo = (<4)
aprobo (x,y) = (not.esNotaBochazo)x && (not.esNotaBochazo)y
promociono (x,y) = x>=6 && y>=6 && (x+y)>13
--- CONSULTA: (not.esNotaBochazo.fst) (5,8)

-- 4.5
notasFinales ((x,y),(z,w)) 	= (maximum [x,z],maximum [y,w])
--- CONSULTA 1: (not.aprobo.notasFinales) ((8,2),(-1,4))
--- CONSULTA 2: ((>0).fst.snd) ((8,2),(-1,4))
-- recuperoDeGusto x = ((promociono.fst) x) && (((aprobo.fst.snd) x) || ((aprobo.snd.snd) x))
aproboAlguno (x,y) = (not.esNotaBochazo)x || (not.esNotaBochazo)y
recuperoDeGusto x = ((promociono.fst) x) && ((aproboAlguno.snd) x)

-- 4.6
esMayorDeEdad = ((>21).snd)

-- 4.7
calcular (x,y) = (calcularPrimero x, calcularSegundo y)
calcularPrimero x 	| esMultiploDe2 x = ((*) 2) x
					| otherwise =  x
calcularSegundo x 	| (not.esMultiploDe2) x = (+1) x
					| otherwise = x