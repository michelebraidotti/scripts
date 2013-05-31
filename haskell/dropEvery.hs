dropEvery :: Int -> [a] -> [a]

dropEvery 0 xs  = xs
dropEvery 1 xs = []
dropEvery y xs = 
	if ( length xs < y ) 
	then xs
	else (take (y - 1) xs) ++ (dropEvery y (drop y xs))
