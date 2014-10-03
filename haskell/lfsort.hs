lfsort :: [[a]] -> [[a]]
lfsort [] = []
lfsort (x:xs) =  
	let 
		lessFrequents = lfsort (lessFrequent x xs)
		moreFrequents = lsort (moreFrequent x xs)
	in
		lessFrequents ++ [x] ++ moreFrequents

lessFrequent :: [a] -> [[a]] -> [[a]] -> [[a]]

moreFrequent :: [a] -> [[a]] -> [[a]] -> [[a]]
