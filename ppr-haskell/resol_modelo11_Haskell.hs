funcion1::Char->Char
funcion1 car = case car of
               'A' -> '9'
               'E' -> '8'
               'I' -> '7'
               'O' -> '6'
               'U' -> '5'
               otherwise -> '0'

validar::Char->Bool
validar car = elem car "AEIOU"

validar_v2 car = car == 'A' || car == 'E' || car == 'I' || car == 'O' || car == 'U'

validar_v3 car = funcion1 car /= '0'


encriptar::[Char] -> [Char]
encriptar[] = []
encriptar(h:t) = if validar h then funcion1 h : encriptar t else h : encriptar t

encriptar_v2::String -> String
encriptar_v2 "" = ""
encriptar_v2 (h:t) = if validar h then funcion1 h : encriptar_v2 t else h : encriptar_v2 t

encriptar_v3::String -> String
encriptar_v3 "" = ""
encriptar_v3 (h:t) | validar h = funcion1 h : encriptar_v3 t 
                   | otherwise = h : encriptar_v3 t
             