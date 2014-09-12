binomial :: Int -> Int -> Int
binomial n 0 = 1
binomial n k  
	| n == k 	= 1
	| n < k 	= 0
	| otherwise 	= (binomial (n-1) (k-1)) + (binomial (n - 1) k)
