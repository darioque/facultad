{--
1. Realizar una función que reciba un código de tipo cliente, un monto base y que retorne el
monto final a pagar teniendo en cuenta el descuento que se detalla en la Tabla 1. En el caso
que el código de tipo de cliente no sea ninguno de los especificados en la Tabla1 la función
deberá retornar cero. 
--}

funcion1:: Int -> Float -> Float
funcion1 codigo monto = case codigo of 
                        1 -> monto * 0.97
                        2 -> monto * 0.95
                        3 -> monto * 0.93
                        otherwise -> 0

{--
2. Realizar una función que genere una nueva lista tomando como base los elementos de la
lista provista que estén comprendidos entre un valor desde y hasta (no se incluye los
extremos). Estos últimos deben ser pasados como argumentos a la función. 
--}


lista :: [Integer]
lista = [1808, 2619, 3295, 4428, 2448, 7811]

funcion2:: [Integer] -> Integer -> Integer -> [Integer]
funcion2 lista valor1 valor2 = [x | x <- lista, (x > valor1 && x < valor2)]

{--
3. Realizar una función que permita calcular el porcentaje de elementos de la lista provista
que cumplen con estas condiciones:
a. Sea superior a un determinado valor “p”.
b. Y que sea par.
Con respecto a la cantidad total de elementos de la misma. Implementar esta consigna
usando recursividad en todas las funciones que Ud. considere necesario realizar.
--}


funcion3:: [Integer] -> Integer -> Float
funcion3 [] valor = 0
funcion3 (x:xs) valor | x > valor && x `mod` 2 == 0 = i * 1
                      | otherwise = (funcion3 xs valor)
                        where i = (1 + (funcion3 xs valor))

