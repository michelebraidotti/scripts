split :: [a] -> Int -> ([a], [a])

split x y = split' x y ([], [])
split' (x:xs) y z 
	| ( y > 0 ) 		= split' xs (y - 1) ((fst z) ++ [x], [])
	| ( y > length (x:xs) )	= (y,[])
	| otherwise 		= (fst z, x:xs)
