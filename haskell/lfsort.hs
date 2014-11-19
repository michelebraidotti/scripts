lfsort :: [[a]] -> [[a]]
lfsort [] = []
lfsort xs = map snd (lfsort' (computeFrequencies xs))

lfsort' :: [(Int, [a])] -> [(Int, [a])]
lfsort' [] = []
lfsort' (x:xs) =
	let 
	  smalls = lfsort' (filter (\y -> fst y <= fst x) xs)
	  bigs = lfsort' (filter (\y -> fst y > fst x) xs)
	in 
	  smalls ++ [x] ++ bigs


computeFrequencies :: [[a]] -> [(Int, [a])]
computeFrequencies xs = computeFrequencies' xs xs

computeFrequencies' :: [[a]] -> [[a]] -> [(Int, [a])]
computeFrequencies' (x:xs) ys = 
	if ( length xs == 0 ) 
	then [((frequency x ys), x)]
	else [((frequency x ys), x)] ++ (computeFrequencies' xs ys)


frequency :: [a] -> [[a]] -> Int
frequency _ [] = 0
frequency x (y:ys) =
	if (length x == length y) 
	then 1 + (frequency x ys)
	else 0 + (frequency x ys)
