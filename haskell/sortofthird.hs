mySomething :: (Num a) => [a] -> a
mySomething [x] = x
mySomething [x,y] = x + y
mySomething (x:y:xs) = mySomething xs

isPal :: [Char] -> Bool
isPal xs = xs == reverse xs

isPald :: [Char] -> Bool
isPald [x] = True
isPald [x,y] 	
	| x == y = True
	| x /= y = False
isPald (x:xs) 
	| x == last(xs) = isPald(init(xs))
	| x/= last(xs)  = False 

isPrime :: Int -> Bool
isPrime a = length [x| x <- [ 2..(a-1) ], a `mod` x == 0] == 0

takeInt :: Int -> [Int] -> [Int]
takeInt 0 xs = []
takeInt n [] = []
takeInt 1 (x:xs) = [x]
takeInt n (x:xs) = x:takeInt n-1 xs
