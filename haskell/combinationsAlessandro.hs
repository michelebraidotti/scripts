combinationsAlessandro :: [a] -> Int -> [[a]]
combinationsAlessandro xs y = combinationsAlessandro' (divideInBlocks xs y) [[]]

combinationsAlessandro' :: [[a]] -> [[a]] -> [[a]]
combinationsAlessandro' [[]] ys = ys
combinationsAlessandro' (x:xs) ys = 	
	if length xs == 0
		then addToResults x ys
		else combinationsAlessandro' xs (addToResults x ys)

addToResults :: [a] -> [[a]] -> [[a]]
addToResults [] ys = ys
addToResults x (y:ys) = 
	if length ys == 0
		then combineList y x
		else combineList y x ++ addToResults x ys

combineList :: [a] -> [a] -> [[a]]
combineList xs [] = []
combineList ys (x:xs) = [ys ++ [x]] ++ combineList ys xs

divideInBlocks :: [a] -> Int -> [[a]]
divideInBlocks [] y = [[]]
divideInBlocks xs y =
	if length xs == y
		then [xs]
		else [take y xs] ++ divideInBlocks (drop y xs) y
