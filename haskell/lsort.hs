lsort :: [[a]] -> [[a]]
lsort [] = []
lsort (x:xs) =  
	let 
		smalls = lsort (filter (\y -> length(y)<=length(x)) xs)
		bigs = lsort (filter (\y ->  length(y)>length(x)) xs)
	in
		smalls ++ [x] ++ bigs

