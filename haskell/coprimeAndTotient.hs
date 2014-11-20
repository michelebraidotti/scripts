import CustomMath.Utils

coprime :: Int -> Int -> Bool
coprime n m =
	if ( (myGCD n m) == 1 )
	then True
	else False

totient :: Int -> Int
totient n = length( totient' n n )

totient' :: Int -> Int -> [Int]
totient' n 1 = [1]
totient' n m = 
	if ( coprime n m )
	then [ m ] ++ (totient' n (m-1))
	else totient' n (m-1)
