module Main where 

import CustomMath.Primes

main = do
	putStrLn "Enter the maximum integer: "
	max <- getLine
	print (howManyPrimes(read(max)))

