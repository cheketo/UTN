-- GUIA 3
--module Guia3 where
--import Hugs.Prelude

-- 1

-- 1.1
fib n | n==1	= 1
fib n | n==2	= 1
fib n | n>2		= fib(n-1) + fib(n-2)

-- 1.2
pertenece [] n		| null [] = False
pertenece (x:xs) n 	| n == x = True
			 		| otherwise = pertenece xs n

-- 1.3
interseccion [] _ = []
interseccion _ [] = [] 
interseccion (x:xs) (y:ys) 	| x==y = [x]++(interseccion xs ys)
							| otherwise = (interseccion xs ys)

-- 1.4
transformadaLoca [] 	= []
transformadaLoca (x:xs)	| x>19 = transformadaLoca xs
						| (x<=19) && (even x) 		= [x+2]++(transformadaLoca xs)
						| (x<=19) && ((not.even) x)	= [x+1]++(transformadaLoca xs)

-- 1.5
productList [] 		= 1
productList (x:xs) 	= x*(productList xs)

-- 1.6
maximo (x:[]) = x
maximo (x:xs) = max x (maximo xs)

-- 1.7
menoresA n (x:[]) 	| x<n = [x]
					| otherwise = []
menoresA n (x:xs) 	| x<n = [x]++(menoresA n xs)
					| otherwise = (menoresA n xs)

-- 1.8.1
promedios [] = []
promedios (x:xs) = [(sum x)/fromInteger(toInteger(length x))]++(promedios xs)

-- 1.8.2
mayoresA4 = (filter (>3))
promediosSinAplazos [] = []
promediosSinAplazos (x:xs) = [((sum.mayoresA4) x)/fromInteger(toInteger((length.mayoresA4) x))]++(promedios xs)

-- 1.9
diferencias [] = 0
diferencias (x:xs) = (diferencias xs) - x

-- 1.10
sinRepetidos [] = []
sinRepetidos (x:xs) = (take 1.filter (==x))(x:xs)++((sinRepetidos.filter (/=x)) xs)

-- 1.11.1
alVesre [] = []
alVesre (x:xs) = (alVesre xs)++[x]

-- 1.11.2
-- ["linda","puso","se","tarde","la"]
-- ["la tarde se puso linda"]

-- 1.12.1
sinExtremos l 	| (length l)>1 = filter (maximoOminimo l) l
				| otherwise = []
maximoOminimo l n = (maximum l) /= n && (minimum l) /= n

-- 1.12.2
sinPuntas n l 	| (length l)>1 && n>0 = sinPuntas (n-1) (filter (maximoOminimo l) l)
				| (length l)>1 && n==0 = l
				| (length l)==1 && n==0 = l
				| otherwise = []

-- 1.12.3
sonTodosIguales1 l = ((==1).length.sinRepetidos) l

dispersion lista = ((foldl min 999 lista),(foldl max (-999) lista))
sonTodosIguales2 l = ((fst.dispersion) l) == ((snd.dispersion) l)

sonTodosIguales3 [x] = True
sonTodosIguales3 (x:y:xs) = (x == y) && (sonTodosIguales3 (y:xs))

-- 1.13.1
esPar1 n = esParDesde n 0

esParDesde n c  | n>1 = esParDesde (n-2) c
				| otherwise = n==c

esPar2 n 	| n>1 = esPar2 (n-2)
			| otherwise = n==0

-- 1.13.2
esPar3 n 	| n>1 = esPar2 (n-2)
			| n<(-1) = esPar2 (n+2)
			| otherwise = n==0

-- 1.14.1
divr x y 	| y<=x = 1 + (divr (x-y) y)
			| otherwise = 0

-- 1.14.2
modr x y 	| y<=x = (modr (x-y) y)
			| otherwise = x

-- 1.14.3
devolverParDivMod x y = (divr x y, modr x y)

-- 1.15.1
primo n = noHayNumerosDivisoresDe n 2 (n - 1)
noHayNumerosDivisoresDe n minimo maximo 	| minimo >= maximo = True
											| rem n minimo == 0 = False
											| otherwise = noHayNumerosDivisoresDe n (minimo + 1) maximo

-- 1.15.2
siguientePrimo n 	| primo (n+1) = (n+1)
					| otherwise = siguientePrimo (n+1)

-- 1.15.3
















