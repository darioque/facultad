funcion1:: Int -> Float
funcion1 codigo = case codigo of 
                        1 -> 30
                        2 -> 15
                        3 -> 30
                        4 -> 15
                        5 -> 15
                        6 -> 30
                        otherwise -> 0

funcion2:: [Float] -> [Int] -> [Float]
funcion2 Lista1 Lista2 = [(x | x <- lista, x2 <- lista2]