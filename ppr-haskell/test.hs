cambiarCaracter :: Char -> Char
cambiarCaracter vocal = case vocal of
                             'A' -> '9'
                             'E' -> '8'
                             'I' -> '7'
                             'O' -> '6'
                             'U' -> '5'
                             otherwise -> '0'

funcion2 :: Char -> Bool
funcion2 vocal = if cambiarCaracter vocal == '0' then False else True

funcion3 :: String -> String
funcion3 [] = ""
funcion3 (x:xs) =  if funcion2 x then cambiarCaracter x : funcion3 xs else x : funcion3 xs



