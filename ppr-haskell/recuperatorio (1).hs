{- 
1.	Realizar una función que reciba el código de 
tipo de cobro y retorne el porcentaje de recargo correspondiente, 
tal como se especifica en la tabla 1. En el caso de 
que el código de tipo de cobro recibido como parámetro 
en la función, no se encuentre especificado en la tabla 1, 
la función deberá retornar -1. (15 puntos).
-}

recargo::String -> Float
recargo cod = case cod of 
                    "E" -> 0.0
                    "D" -> 0.10
                    "TC" -> 0.25
                    otherwise -> -1.0

{-
2.	Realizar una función que reciba 3 parámetros: 
una lista de importes de diferentes pedidos, un valor entero 
correspondiente al mínimo, y un valor entero correspondiente al 
máximo, y como resultado genere una nueva lista con aquellos 
importes de pedidos de la lista que pertenezcan al rango 
determinado por el mínimo y máximo recibos por parámetros, 
incluyendo ambos extremos. (15 puntos)
-}
rango::[Int] -> Int -> Int -> [Int]
rango lista v1 v2 = [x | x <- lista, (x >= v1 && x <= v2)]

{-
3.	Realizar una función que reciba 3 parámetros: 
una lista de importes de diferentes pedidos, un código de tipo 
de cobro, y un valor de referencia. La función deberá retornar 
la cantidad de importes finales (los cuales se deberán calcular) 
que sean superiores al valor de referencia recibido como tercer 
parámetro. Cada importe final se deberá calcular a partir de cada
importe de la lista de importes y del recargo correspondiente al 
código del tipo de cobro, que se reciben como primero y segundo 
parámetros. En caso de recibirse un código de tipo de cobro 
no válido, la función deberá retornar directamente 0. Recordar 
que el importe final de un pedido se calcula sumándole al importe 
del pedido el porcentaje de incremento del mismo correspondiente 
al tipo de cobro. Para resolver este punto debe definir una función 
recursiva. (20 puntos)
-}


valores :: [Float] -> String -> Float -> Int
valores [] cod valor = 0
valores (x:xs) cod valor = if recargo cod == -1 then 0 else if (x + (x * recargo cod)) > valor then 1 + valores xs cod valor
                                                              else valores xs cod valor