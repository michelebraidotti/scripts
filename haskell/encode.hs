encode :: (Num b) => [Char] -> [(Char, b)]
encode' :: (Num b) => [Char] -> [(Char, b)] -> [(Char, b)]

encode [] = [('?', 0)]
encode (x:xs) = encode' xs [(x, 1)]
encode' (x:xs) y = encode' xs map (\x (k, v) -> if ( x == k ) then (k, v + 1) else (k, v)) y
