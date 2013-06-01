split :: [a] -> Int -> ([a], [a])
split' :: [a] -> Int -> ([a], [a]) -> ([a], [a])


split x y = split' x y ([], [])
split' (x:xs) y z 
	| ( y > length (x:xs) )	= ((x:xs),[])
	| ( y > 0 ) 		= split' xs (y - 1) ((fst z) ++ [x], [])
	| otherwise 		= (fst z, x:xs)
