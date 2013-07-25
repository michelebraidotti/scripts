goldbach :: Int -> (Int, Int)

divisors :: Int -> [Int]
divisors a = [x| x<-[2..(a-1)], a `mod` x == 0] 

primeTest :: Int -> Int -> Bool
primeTest x y
	| y == 1    = True
	| x == 1    = True
	| x == 2    = True
	| otherwise = if ( x `mod` y == 0 )
			then False
			else primeTest x (y - 1) 

isPrime :: Int -> Bool
isPrime a = length (divisors a) == 0

primesList :: Int -> [Int]
-- primesList a = [x| x<-[1..(a-1)], primeTest x (x-1)]  
primesList a = [x| x<-[1..(a-1)], isPrime(x)]

goldbach' :: Int -> [Int] -> (Int, Int) -> (Int, Int)
goldbach a = 
	if ( a `mod` 2 == 0 )
	then goldbach' a (primesList a) (0,0)
	else (-1,-1) -- Error odd numbers are not considered
goldbach' a [] res = res
goldbach' a (x:xs) res = 
	if isPrime (a - x) 
	then goldbach' a xs (x, a-x)
	else goldbach' a xs res 

-- isNotPrime may be faster
-- by checking a boolean flag that tells us
-- if the number is not prime (has a divisor)
-- and recurring on the second integer var

