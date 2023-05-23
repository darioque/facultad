-- 1. Definir la función esMultiploDe/2, que devuelve True si el segundo es múltiplo del primero.

esMultiploDe::Integer->Integer->Bool
esMultiploDe x y = mod(x) y ==0

{-Otra forma de utilizar la funciòn 'mod'
esMultiploDe::Integer->Integer->Bool
esMultiploDe x y = x `mod` y ==0
-}

{-2. Definir la función esBisiesto/1, indica si un año es bisiesto. (Un año es bisiesto si es 
 divisible por 400 o es divisible por 4 pero no es divisible por 100)-}
esBisiesto::Integer->Bool
esBisiesto x = esMultiploDe x 400 || (esMultiploDe x 4 && not (esMultiploDe x 100)) 

{-3.En una plantación de pinos, de cada árbol se conoce la altura expresada en cm. El peso de un pino
se puede calcular a partir de la altura así: 3 kg x cm hasta 3 metros, 2 kg x cm arriba de los 3 metros.
P.ej. 2 metros -> 600 kg, 5 metros -> 1300 kg. Los pinos se usan para llevarlos a una fábrica de
muebles, a la que le sirven árboles de entre 400 y 1000 kilos, un pino fuera de este rango no le sirve
a la fábrica.

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

{- 4. Se necesita diseñar una función que permita determinar la cantidad de raíces reales de la ecuación
ax2 +bx+c = 0
-}

raicesReales:: Float->Float->Float->Integer
raicesReales a b c 
	|discriminante == 0.0 = 1
	|discriminante > 0.0  = 2
	|otherwise 	    = 0
	where discriminante = b*b - 4*a*c
