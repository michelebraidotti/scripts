countNucl :: [Char] -> [(Char, Int)]
countNucl' :: [Char] -> [(Char,Int)] -> [(Char,Int)]

-- Don't know exaclty why we need to add the last tuple
-- suppose that has to do with ':' operator
countNucl xs = countNucl' xs [('a',0),('c',0),('t',0),('g',0),('?', 0)]
countNucl' [] ys = init ys 
countNucl' (x:xs) (a:b:c:d:e)
	| x == 'a'  = countNucl' xs ((fst(a), snd(a) + 1):b:c:d:e)
	| x == 'c'  = countNucl' xs (a:(fst(b), snd(b) + 1):c:d:e)
	| x == 't'  = countNucl' xs (a:b:(fst(c), snd(c) + 1):d:e)
	| x == 'g'  = countNucl' xs (a:b:c:(fst(d), snd(d) + 1):e)
	| otherwise = countNucl' xs (a:b:c:d:e)

