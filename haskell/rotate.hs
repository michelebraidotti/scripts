rotate :: [a] -> Int -> [a]

rotate xs y = 
	if ( y > 0 )
	then (drop y xs) ++ (take y xs)
	else (drop (length xs + y) xs) ++ (take (length xs + y) xs)


