module CustomMath.Primes ( howManyPrimes
, isPrime
, divisors
, primeTest
, primesList
) where 

howManyPrimes :: Int -> Int
howManyPrimes a = length (listAllPrimes(a))

listAllPrimes :: Int -> [Int]
listAllPrimes a = [x| x<-[2..a], isPrime(x)]

isPrime :: Int -> Bool
isPrime a = length (divisors a) == 0

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

primesList :: Int -> [Int]
primesList a = [x| x<-[1..(a-1)], isPrime(x)]

