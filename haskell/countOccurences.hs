-- countOccurence "aaaccbbbaaab" = [('a',6),('c',2),('b',4)]
countOccurences (Num b) => [Char] -> [(Char, b)]
countOccurences' (Num b) => [Char] -> [(Char, b)] -> [(Char, b)] 
isContained Char -> [Char] -> Boolean
flatten [(Char, a)] -> [Char]

foldr (\acc (k,v) -> acc ++ k) [] [('a',1),('b', 2)] 

countOccurences' [] res = res
countOccurences' (x:xs) res =
	if ( isContained x (flatten res) ) 
		then -- call a mapped function thah adds 1 to the proper element of res
		else res ++ [(x,1)]
