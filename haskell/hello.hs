main = do
	putStrLn "Enter a string: "
	string <- getLine
	if (isPal string)
     		then do putStrLn "Palindrome!"
     		else do putStrLn "Not palindrome!"
	

-- Functions
isPal :: [Char] -> Bool
isPal xs = xs == reverse xs

isPald :: [Char] -> Bool
isPald [x] = True
isPald [x,y] 	
	| x == y = True
	| x /= y = False
isPald (x:xs) 
	| x == last(xs) = isPald(init(xs))
	| x/= last(xs) = False 

