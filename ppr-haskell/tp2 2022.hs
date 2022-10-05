esDivisible :: Int -> Int -> Bool
esDivisible nro exp | exp == 0 = False
				| nro `mod` exp == 0 = True
				| otherwise = False

-- listaFactoresDivisiblesDe :: Int -> [Int]
-- listaFactoresDivisiblesDe x = [y | y <- [1..x], esDivisible x y]

listaFactoresDivisiblesDe :: Int -> [Int]
listaFactoresDivisiblesDe n = listaFactoresDivisiblesDe' n 1
	where listaFactoresDivisiblesDe' n y | y > n = []
									     | esDivisible n y = y : listaFactoresDivisiblesDe' n (y+1)
									     | otherwise = listaFactoresDivisiblesDe' n (y+1)


-- esPrimo :: Int -> Bool
-- esPrimo x | length (listaFactoresDivisiblesDe x) == 2 = True
-- 		  | otherwise = False

esPrimo :: Int -> Bool
esPrimo 1 = False
esPrimo 2 = True
esPrimo nro = esPrimo' nro 2
  where esPrimo' nro i | i == nro = True
	                 | nro `mod` i == 0 = False
	             	 | otherwise = esPrimo' nro (i + 1)


listadoPrimosMenoresOIgualesQue :: Int -> [Int]
listadoPrimosMenoresOIgualesQue n = [y | y <- [1..n], esPrimo y]

factorizacion :: Int -> [Int]
factorizacion 1 = []
factorizacion n = if esPrimo num then num : factorizacion (n `div` num) else n : []
				  where num  = head (tail (listaFactoresDivisiblesDe n))

expansion :: [(Int, Int)] -> Int
expansion [] = 1
expansion ((x,y):xs) = x^y * expansion xs