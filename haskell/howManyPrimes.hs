main = do
	putStrLn "Enter the maximum integer: "
	max <- getLine
	print (howManyPrimes(read(max)))

howManyPrimes :: Int -> Int
howManyPrimes a = length [x| x<-[2..a], isPrime(x)]

isPrime :: Int -> Bool
isPrime a = length [x| x<-[2..(a-1)], a `mod` x == 0] == 0

