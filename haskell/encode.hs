encode :: (Num b) => [Char] -> [(Char, b)]
encodeMe :: (Num b) => [(Char, b)] -> Char -> [(Char, b)] 

encode [] = [('?', 0)] 
encode (x:xs) = foldl encodeMe [(x,1)] xs
encodeMe res x = 
	if ( x == fst ( last res ) ) 
		then init res ++ [(x, (snd (last res) + 1))] 
		else res ++ [(x,1)] 

