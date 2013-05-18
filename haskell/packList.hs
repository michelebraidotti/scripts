packList :: (Eq a) => [a] -> [[a]]
packList' :: (Eq a) => [a] -> [[a]] -> [[a]]

packList [] = [[]]
packList (x:xs) = packList' xs [[x]]
packList' [] y = y
packList' (x:xs) y
	| head(last(y)) == x = packList' xs ( init(y) ++ [(last(y) ++ [x])] )
	| otherwise 	     = packList' xs ( y ++ [[x]] )
