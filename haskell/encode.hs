encode :: (Num b) => [Char] -> [(Char, b)]
encode' :: (Num b) => [Char] -> [(Char, b)] -> [(Char, b)]
increment :: Int -> (Char, Int) -> (Char, Int)

increment x (k, v) = (k, v + x)

encode [] = [('?', 0)]
encode (x:xs) = encode' x [(x, 1)]  

encode' (x:y:[]) res = 
	if ( x /= y ) 
	then init(res) ++ increment(1, tail(res)) ++ (y, 1)
	else init(res) ++ increment(2, tail(res))
encode' (x:y:xs) res = 
	if ( x /= y )
	then encode' (y:xs) (init(res) ++ increment(1, tail(res)) ++ (y, 1))
	else encode' (y:xs) ( init(res) ++ increment(2, tail(res)))

--foldl (\(k, v) x -> if ( x == k ) then (k, v + 1) else (k, v)) ("a", 0) "aaabbbb"


--encode' [] y = y
--encode' (x:xs) y = encode' xs (map (\(k, v) -> if ( x == k ) then (k, v + 1) else (k, v)) y)
