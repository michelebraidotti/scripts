encode :: (Num b) => [Char] -> [(Char, b)]
encode' :: (Num b) => [Char] -> [(Char, b)] -> [(Char, b)]
increment :: Int -> (Char, Int) -> (Char, Int)

increment x (k, v) = (k, v + x)

encode [] = [('?', 0)]
encode (x:xs) = encode' xs [(x, 1)]
encode' [] res = res
encode' (x:xs) res =
	if ( x == fst ( last res ) ) 
		then encode' xs ( init res ++ [(x, (snd (last res) + 1))] )
		else encode' xs ( res ++ [(x,1)] )

