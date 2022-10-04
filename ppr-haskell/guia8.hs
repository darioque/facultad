-- Realiza una función que permita obtener el estado académico de un estudiante de la materia
-- Paradigmas de Programación en función de las notas de sus trabajos prácticos integradores.
-- Puedes definir diferentes funciones que simplifiquen la operación.
-- El estado académico de un alumno se puede definir de acuerdo a las siguientes reglas:
--  Libre: si al menos una de las tres notas obtenidas fuese menor que 4.
--  Regular: si ninguna nota obtenida fuese menor que 4. Pero su promedio no fuese mayor o
-- igual que 8 ó tuviese alguna nota menor que 7.
--  Promocionado: si ninguna nota fuese menor que 7 y su promedio fuese mayor o igual que 8.

promedio:: Int -> Int -> Int -> Int
promedio a b c = (a + b + c) `div` 3

promedio2:: Int -> Int -> Int -> Float
promedio2 a b c = fromIntegral(a + b + c) / 3

hayNotaMenorA:: Int -> Int -> Int -> Int -> Bool
hayNotaMenorA valor n1 n2 n3 = n1 < valor || n2 < valor || n3 < valor

estadoAlumno:: Int -> Int -> Int -> String
estadoAlumno a b c
					| hayNotaMenorA 4 a b c = "Libre"
					| promedio a b c < 8 || hayNotaMenorA 7 a b c = "Regular"
					| promedio a b c >= 8 && not (hayNotaMenorA 7 a b c) = "Promocionado"
					-- | otherwise =  "Promocionado" tambien funciona

[(-2), (-1),0,1,2]
