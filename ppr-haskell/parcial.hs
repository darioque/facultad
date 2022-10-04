descuento:: Integer->Float
descuento x
	|x==1 = 0.03  			
	|x==2 = 0.05
	|x==3 = 0.07
	|otherwise = 0.0

punto1:: Integer->Float->Float
punto1 x y = y * (1-descuento(x))

lista::[Integer]
lista = [1808, 2619, 3995, 4428, 2448, 7811]

punto2::([Integer],Integer, Integer)->[Integer]
punto2(xs, desde, hasta) = [x|x<-xs, x>desde && x<hasta] 

--punto2b::([Integer],Integer, Integer, Integer)->[Float]
--punto2b(xs,cod, desde, hasta) = [(punto1 cod fromIntegral(x)) |x<-xs, x>desde && x<hasta]

punto3_aux::[Integer]->Integer->[Integer]
punto3_aux [] _ = []
punto3_aux (x:xs) p
	|even(x) && x > p = x : punto3_aux xs p
	|otherwise = punto3_aux xs p

contar::[Integer]->Float
contar[] = 0.0
contar (_:xs) = 1.0 + contar(xs)

punto_3 ::[Integer]->Integer->Float
punto_3 xs p = (contar(punto3_aux xs p) / contar(xs)) * 100
	
