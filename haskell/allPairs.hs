allPairs :: [a] -> [[a]]
[] = []
[x] = [x]
(x:xs) = producePairs for x and xs: allPairs xs ()
