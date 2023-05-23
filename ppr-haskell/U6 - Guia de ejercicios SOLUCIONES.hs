-- 1. Definir la funci�n esMultiploDe/2, que devuelve True si el segundo es m�ltiplo del primero.

esMultiploDe::Integer->Integer->Bool
esMultiploDe x y = mod(x) y ==0

{-Otra forma de utilizar la funci�n 'mod'
esMultiploDe::Integer->Integer->Bool
esMultiploDe x y = x `mod` y ==0
-}

{-2. Definir la funci�n esBisiesto/1, indica si un a�o es bisiesto. (Un a�o es bisiesto si es 
 divisible por 400 o es divisible por 4 pero no es divisible por 100)-}
esBisiesto::Integer->Bool
esBisiesto x = esMultiploDe x 400 || (esMultiploDe x 4 && not (esMultiploDe x 100)) 

{-3.En una plantaci�n de pinos, de cada �rbol se conoce la altura expresada en cm. El peso de un pino
se puede calcular a partir de la altura as�: 3 kg x cm hasta 3 metros, 2 kg x cm arriba de los 3 metros.
P.ej. 2 metros -> 600 kg, 5 metros -> 1300 kg. Los pinos se usan para llevarlos a una f�brica de
muebles, a la que le sirven �rboles de entre 400 y 1000 kilos, un pino fuera de este rango no le sirve
a la f�brica.

NOTA: los pinos se miden en cm.
-}

pesoPino::Integer-> Integer
pesoPino x = if x<=300 then x*3 else (900 + 2*(x-300)) 

{- Usando 'guardas'

pesoPino::Integer-> Integer
pesoPino x |x<=300 = x*3 
	|otherwise = (900 + 2*(x-300)) 
-}

esPesoUtil::Integer->Bool
esPesoUtil y = y>=400 && y<=1000

sirvePino::Integer->Bool
sirvePino x = esPesoUtil(pesoPino x)

{- 4. Se necesita dise�ar una funci�n que permita determinar la cantidad de ra�ces reales de la ecuaci�n
ax2 +bx+c = 0
-}

raicesReales:: Float->Float->Float->Integer
raicesReales a b c 
	|discriminante == 0.0 = 1
	|discriminante > 0.0  = 2
	|otherwise 	    = 0
	where discriminante = b*b - 4*a*c

-- generar una funcion que calcule el promedio entre los valores de una lista de numeros usando recursividad
promedio::[Float]->Float
promedio [] = 0
promedio (x:xs) = (x + promedio xs) / fromIntegral(length(x:xs))

