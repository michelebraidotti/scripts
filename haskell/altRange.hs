altRange :: Int -> Int -> [Int]
altRange a b
	| a > b	    = []
	| otherwise = altRange a (b - 1) ++ [b]
