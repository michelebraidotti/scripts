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

countOccurences :: [Int] -> [(Int, Int)] -> [(Int, Int)]
countOccurences (x:xs) []  = countOccurences xs [(x,1)]
countOccurences [] xs = xs
countOccurences (x:xs) ys = 
  if ( (fst(head ys)) == x )
    then countOccurences xs ([(x, (snd(head ys) + 1))] ++ (tail ys))
    else countOccurences xs ([(x,1)] ++ ys)

primeFactorsMult :: Int -> [(Int, Int)]
primeFactorsMult n = countOccurences (primeFactors n) []
