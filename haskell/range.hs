range :: Int -> Int -> [Int]
range 0 0 = []
range x y
	| x == y 	= [y]
	| x > y		= []
	| otherwise	= [x] ++ range (x+1) y

