funcion1 :: Int -> String
funcion1 cant = case cant of
                     1 -> "paseo exclusivo"
                     2 -> "paseo de a dos"
                     3 -> "paseo triple"
                     4 -> "paseo de dos pares"
                     5 -> "paseo quintuple"
                     otherwise -> "paseo no definido"

funcion2 :: [Int] -> Int -> Int -> [Int]
funcion2 lista min max = [x | x <- lista, (x >= min && x <= max)]

funcion3 :: [Int] -> Int -> Int
funcion3 [] min = 0
funcion3 (x:xs) min = if x >= min then 1 + funcion3 xs min else funcion3 xs min