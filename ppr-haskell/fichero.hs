--ej 01, primeros ejemplos
-- Hacer la suma de dos números
suma::(Integer, Integer) -> Integer
suma(x, y) = x + y

-- Encontrar el cuadrado de un número
cuadrado::Integer -> Integer
cuadrado x = x * x

-- dado un número retornar el siguiente
siguiente :: Integer -> Integer
siguiente n = n+1

-- dado un número encontrar el siguiente del cuadrado
cuadradoSiguiente:: Integer -> Integer
cuadradoSiguiente x = siguiente(cuadrado(x))

-- dado u número encontrar el cuadrado del siguiente
siguienteCuadrado:: Integer -> Integer
siguienteCuadrado x = cuadrado(siguiente(x))

-- dados dos números ecotrar el menor
menor::(Integer, Integer) -> Integer
menor (x,y) = if x <= y then x else y

-- dados dos números ecotrar el mayor
mayor::(Integer, Integer) -> Integer
mayor (x,y) = if x >= y then x else y

-- dados tres números encontrar el mayor
mayorDeTres::(Integer, Integer, Integer) -> Integer
mayorDeTres(n1, n2, n3) = if n1 > n2 then 
				if n1 > n3 then n1 else n3
				else if n2 > n3 then n2 else n3

mayorDeTres2(n1, n2, n3) = if n1 > n2 then mayor(n1, n3) else mayor(n2, n3)


mayorDeTres3::(Integer, Integer, Integer) -> Integer
mayorDeTres3(n1, n2, n3) = if n1 > n2 && n1 > n3 then n1
				else if n2 > n3 then n2 else n3


-- dados dos numeros retornar la resta de manera que siempre de como resultado un valor positivo
resta(n1, n2) = if n1 > n2 then (n1 - n2) else (n2 - n1)

resta2(n1, n2) = if n1-n2 <= 0 then (n1 - n2) *(-1) else n1 - n2


-- dado un número retornar True si es positivo
positivo :: Integer -> Bool
positivo(n) = if n >=0 then True else False

positivo2 :: Integer -> Bool
positivo2(n) | n > 0 = True
             | otherwise = False

-- Evaluar un rango con guardas.
-- dado un número retornar 5 si está entre 0 y 10, 10 si está entre 11 y 20 y 15 si está etre 21 y 50. Retornar 0 si no está en estos intervalos.

rango(n) | n >= 1 && n <= 10 = 5
	 | n >= 11 && n <= 20 = 10
	 | n >= 21 && n <= 50 = 15
	 | otherwise = 0

-- retornar el estado de un alumno a partir de sus notas

estadoAlumno:: Integer -> String
estadoAlumno(nota) = if nota < 4 then "Libre" 
			else if nota >= 4 && nota < 7 then "Regular"
			  else if nota >= 7 && nota < 10 then "Promocionado"
			    else if nota == 10 then "Aprobado Directo" else "Nota no valida"

estadoAlumno2:: Integer -> String
estadoAlumno2(nota) | nota < 4 = "Libre"
		    | nota >= 4 && nota < 7 = "Regular"
		    | nota >= 7 && nota < 10 = "Promocionado"
		    | nota == 10 = "Aprobado Directo"
	     	| otherwise = "Nota no valida"

-- valuar un polinomio de segundo grado
cuadradoConstante:: (Integer, Integer) -> Integer
cuadradoConstante (c, x ) = c*x*x

constante:: (Integer, Integer) -> Integer
constante (c, x) = c*x

polinomio:: (Integer, Integer, Integer, Integer) -> Integer
polinomio (c1, c2, c3, x) = cuadradoConstante(c1, x) + constante(c2, x) + c3

-- concer la cantidad de raices de un polinomio
raices_reales::(Float, Float, Float)->Int
raices_reales (a,b,c)
	|disc == 0.0 = 1
	|disc > 0.0 = 2
	|disc < 0.0 = 0
	where disc = discriminante (a,b,c)

discriminante::(Float, Float, Float)->Float
discriminante (a,b,c) = b*b - 4 * a * c 

numeroDeRaices::(Float, Float, Float) -> Integer
numeroDeRaices(a, b, c) 
		| (b*b - 4*a*c)>0 = 2 
		| (b*b - 4*a*c)==0 = 1 
		| (b*b - 4*a*c)<0 = 0

numeroDeRaices2::(Float, Float, Float) -> Integer
numeroDeRaices2(a, b, c)
		| tipo(a, b, c)>0 = 2 
		| tipo(a, b, c)==0 = 1 
		| tipo(a, b, c)<0 = 0

tipo::(Float, Float, Float) -> Float
tipo(a, b, c) = b*b - 4*a*c


-- introducción a la recursividad
-- calcular el factorial de un número
fact::Integer -> Integer
fact n = if n == 0 then 1 else n * fact(n-1)

-- calcular el fibo de un número
fi::(Int) -> Int
fi(n)
	|n <= 2 = 1
	|otherwise = fi(n-1) + fi(n-2)


-- introduccion al concepto de lista
fact2::Integer ->Integer
fact2 n = product[1..n]

existe::(Integer, [Integer]) -> Bool
existe(n, lista) = elem n lista

-- introduccion a una función de orden superior
sumaCuadrados :: [Integer] -> Integer
sumaCuadrados lista = sum(map cuadrado lista)
