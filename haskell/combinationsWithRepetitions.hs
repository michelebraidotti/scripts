combinationsWithRepetitions :: Int -> [a] -> [[a]]
combinationsWithRepetitions 0 _ = [[]]
combinationsWithRepetitions _ [] = []
combinationsWithRepetitions n xs ys = 
	combinationsWithRepetitions (n - 1) (tail xs)  (map ([head xs] ++) ys )
