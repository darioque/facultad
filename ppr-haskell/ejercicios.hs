esMultiploDe::(Integer, Integer) -> Bool
esMultiploDe(n1, n2) = n1 `mod` n2 == 0

esBisiesto::Integer -> Bool
esBisiesto(n) = esMultiploDe(n, 400)

pesoPino::Integer -> Integer
pesoPino(altura) | altura <= 3 = altura * 3
                 | otherwise = altura * 2

esPesoUtil::Integer -> Bool
esPesoUtil(peso) = if peso >= 400 && peso <= 1000 then True else False

sirvePino::Integer -> Bool
sirvePino(altura) = esPesoUtil(pesoPino(altura))

penultimo::[Int] -> Int
penultimo lista = lista !! (length lista - 2) 

multiplicar x = x*x

cuadrados:: [Int] -> Int -> [Int]
cuadrados (x:xs) valor = map (multiplicar) (filter (> valor) (x:xs))

-- otra forma de hacerlo
esCuadrado (x:xs) valor = [x*2 | x <- xs, x > valor]

paridad::Int -> String
paridad x = if x `mod` 2 == 0 then "par" else "impar"

-- forma de hacerlo por funcion superior
lista_parMap::[Int] -> [String]
lista_parMap lista = map (paridad) lista

-- otra forma de hacerlo (por recursion)
lista_par::[Int] -> [String]
lista_par[] = []
lista_par (x:xs) = [paridad x] ++ lista_par xs

-- forma de comprension
lista_parComp::[Int] -> [String]
lista_parComp xs = [paridad x | x <- xs]

-- dada 2 listas generar una tercera con los elementos de la primera que se encuentren
-- en la segunda
-- funcion para recibir un valor y una lista y devolver un True si el valor está
existe::[Integer] -> Integer -> Bool
existe [] x = False
existe (x:xs) y
        |x == y = True
        |otherwise = existe xs y

presentes::[Int] -> [Int] -> [Int]
presentes xs ys = [x | x<-xs, existe ys x]

-- dada lista de tuplas retornar otra lista (ver ejercicio en UV)

nombre_sucursal::Integer -> String
nombre_sucursal x
        |x==1 = "CENTRO"
        |X==2 = "NORTE"
        |X==3 = "SUR"
        |otherwise = "ERROR"

-- fst es el primer elemento de la lista (sucursales) y snd el segundo (facturacion)
sucursales_mayor::[(Integer, Float)] -> Float -> [String]
sucursales_mayor xs y = [nombre_sucursal (fst x) | x<-xs, (snd x) >=y]

-- Devolver True si es capicua
capicua::Integer -> Bool
capicua x = reverse(show(x)) == show(x)







