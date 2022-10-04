-- :load List
-- length [(-2), (-1),0,1,2]
-- [-2..2]
-- 7:(2:(9:[]))
-- elem (-1) [(-2), (-1),0,1,2]
-- elem 5 [(-2), (-1),0,1,2]

cuadrado::Integer -> Integer
cuadrado x = x * x

--map cuadrado [(-2), (-1),0,1,2]

-- [(-2), (-1),0,1,2] ++ [1,2,3,4,5]

-- head [(-2), (-1),0,1,2]

-- tail [(-2), (-1),0,1,2]

-- sum [(-2), (-1),0,1,2]

-- maximum [(-2), (-1),0,1,2]

--[1.5,1.6,2.1] ++ [] ++ [2.4,2.6]

-- take 3 [(-2), (-1),0,1,2]

-- drop 3 [(-2), (-1),0,1,2]

agregarValor::[Integer] -> [Integer]
agregarValor valor lista = insert valor lista

unirListas :: [Integer] -> [Integer]
unirListas lista = concat (lista,[1..5])

ordernarLista :: [Integer] -> [Integer]
ordernarLista lista = sort lista