fib 1	= 1
fib 2	= 1
fib x	= fib(x-1) + fib(x-2)



transformar x = map modificar (interseccion [1..19] x) --(interseccion (1:19) x)



modificar y	| even y	= y+2
			| otherwise	= y+1
			
interseccion (x:xs)	= filter (pertenece (x:xs))

--pertence :: [Int] -> Int -> Bool
pertenece [] _ 	   	= False
pertenece (x:xs) y  = x==y || pertenece xs y