top3EstaOrdenado (x:xs)	= estaOrdenado (select3(x:xs))

estaOrdenado [x,y,z]	= x > y && y > z

select3(x:y:z:xs)	= [sumaLista (third x), sumaLista (third y), sumaLista (third z)]

sumaLista (x:xs) 	= sum (x:xs)

third (_, _, z) 	= z



