-- countOccurence "aaaccbbbaaab" = [('a',6),('c',2),('b',4)]
countOccurences :: (Num b) => [Char] -> [(Char, b)]
countOccurences' :: (Num b) => [Char] -> [(Char, b)] -> [(Char, b)] 

countOccurences [] = []
countOccurences (x:xs) = countOccurences' xs [(x,1)]
countOccurences' [] res = res
countOccurences' (x:xs) res =
	if ( x `elem` (foldl (\acc x -> acc ++ [fst x]) [] res) ) 
		then countOccurences'  xs  (map (\y-> if ( x == fst y) then (fst y, snd y + 1) else (fst y, snd y)) res)
		else countOccurences'  xs  res ++ [(x,1)]
