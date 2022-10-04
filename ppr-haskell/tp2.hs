-- recibimos el nombre del paquete y devolvemos el precio
precioAlquiler :: String -> Float
precioAlquiler nombre = case nombre of
                            "Uso de inmobiliarios" -> 1 / fromIntegral(24) * fromIntegral(300)
                            "Acceso a internet" -> 1 / fromIntegral(3) * fromIntegral(100)
                            "Llamadas locales" -> 1 / 0.1 * fromIntegral(50)
                            "Alquiler de notebook" -> 1 / fromIntegral(24) * fromIntegral(500)
                            otherwise -> 0

-- Recibimos dos listas, chequeamos que sean de la misma longitud y sumamos el ingreso total utilizando recursividad con la funcion precio alquiler                            
ingresoTotal :: [String] -> [Int] -> Float
ingresoTotal [] [] = 0
ingresoTotal (x:xs) (a:as) = if length (x:xs) == length (a:as) 
                            then (precioAlquiler x) * fromIntegral(a) + ingresoTotal xs as
                            else -1.0

-- Utilizamos la funcion nativa sum para sumar todos los elementos de la lista y la dividimos por la cantidad de elementos para obtener el promedio
costoPromedio :: [Float] -> Float
costoPromedio lista = sum(lista) / fromIntegral(length lista)

-- Utilizamos la funcion nativa filter para devolver una lista con los elementos que cumplan la condicion
superiorAlCosto :: [Float] -> [Float]
superiorAlCosto lista = filter (> costoPromedio lista) lista

-- Recibimos una lista de numeros y un valor de referencia y usando recursividad buscamos un valor dentro de la lista que sea mayor a ese o se devuelve -1
superiorA :: [Float] -> Int -> Int
superiorA [] valor = -1
superiorA (x:xs) valor = if x > fromIntegral(valor) 
        	            then 0
                        else 1 + if superiorA xs valor < 0 then (-2)
                                else superiorA xs valor