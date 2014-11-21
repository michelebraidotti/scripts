--Uncomment "module main" and "main" definition for command line interaction
--module Main where

import CustomMath.Primes

-- main = print (goldbach 14)

goldbach :: Int -> (Int, Int)

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

goldbachList :: Int -> Int -> [(Int, (Int, Int))]
goldbachList n m 
  | even n = map (\x -> (x, (goldbach x))) [n,n+2..m]  
  | odd n = map (\x -> (x, (goldbach x))) [n+1,n+3..m]