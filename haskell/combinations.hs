combinations :: Int -> [a] -> [[a]]
combinations 1 xs = convertListToListOfList xs
combinations n xs
	| length xs == n	= [xs]
	| otherwise		= map ([head xs] ++) (combinations (n - 1) (tail xs)) ++ combinations n (tail xs)


convertListToListOfList :: [a] -> [[a]]
convertListToListOfList [] = [[]]
convertListToListOfList (x:xs) =
	if length xs == 0
		then [[x]]
		else [[x]] ++ convertListToListOfList xs

