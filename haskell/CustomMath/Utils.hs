module CustomMath.Utils ( myGCD ) where 

myGCD :: Int -> Int -> Int
myGCD n m = 
	if ( n > m) 
	then myGCD' n m 1
	else myGCD' m n 1

myGCD' :: Int -> Int -> Int -> Int
myGCD' n m p = 
	if ( (n - m*p) == 0 ) 
	then m
	else 
		if ( (n - m*p) > m ) 
		then myGCD' n m (p + 1) 
		else myGCD' m (n - m*p) 1
