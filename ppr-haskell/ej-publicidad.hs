-- usamos Float por ser un importe de dinero
-- fromIntegral convierte un Integer en un Float
precioPaquete::Int -> Int -> Float
precioPaquete cod dias = case cod of 
                            1 -> fromIntegral(1000 * dias)
                            2 -> fromIntegral(500 * dias)
                            3 -> fromIntegral(500 * dias)
                            4 -> fromIntegral(250 * dias)
                            otherwise -> 0.0

nombrePaquete::Int -> String
nombrePaquete cod = case (cod) of
                        1 -> "paquete 1"
                        2 -> "paquete 2"
                        3 -> "paquete 3" 
                        4 -> "paquete 4"