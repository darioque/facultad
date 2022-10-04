esDivisible :: Int -> Int -> Bool
esDivisible x y | y == 0 = False
				| x `mod` y == 0 = True
				| otherwise = False

-- chequear clase de variable x e y



listaFactoresDivisiblesDe :: Int -> [Int]
listaFactoresDivisiblesDe x = [y | y <- [1..x], esDivisible x y]

esPrimo :: Int -> Bool
esPrimo x | length (listaFactoresDivisiblesDe x) == 2 = True
		  | otherwise = False

listadoPrimosMenoresOIgualesQue :: Int -> [Int]
listadoPrimosMenoresOIgualesQue x = [y | y <- [1..x], esPrimo y]


factorizacion :: Int -> [Int]
factorizacion 1 = []
factorizacion x = if esPrimo num then num : factorizacion (x `div` num) else x : []
				  where num  = head (tail (listaFactoresDivisiblesDe x))

expansion :: [(Int, Int)] -> Int
expansion [] = 1
expansion ((x,y):xs) = x^y * expansion xs