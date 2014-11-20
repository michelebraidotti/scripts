import CustomMath.Primes

primeFactors :: Int -> [Int]
primeFactors n = primeFactors' n (primesList n)

primeFactors' :: Int -> [Int] -> [Int]
primeFactors' n [] = []
primeFactors' n (m:ms) =
	if (m == 1)
	then primeFactors' n ms
	else
		if ( n `mod`m == 0 )
		then [m] ++ primeFactors' (quot n m) ([m] ++ ms) 
		else primeFactors' n ms

primeFactorsMult :: Int -> [(Int, Int)]

-- WORK IN PROGRESS
countOccurences :: [Int] -> [(Int, Int)]
countOccurences [] = []
countOccurences (x:xs) = [(x,1)] ++ countOccurences xs
