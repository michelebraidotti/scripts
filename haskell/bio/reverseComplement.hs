reverseComplement :: [Char] -> [Char]

reverseNucl :: Char -> Char
reverseNucl n  
	| n == 'a'   = 't'
	| n == 't'   = 'a'
	| n == 'c'   = 'g'
	| n == 'g'   = 'c'
	| otherwise  = '?'

reverseList :: [a] -> [a]
reverseList [] = []
reverseList (x:xs) = reverseList xs ++ [x]

reverseComplement xs = reverseList ( map reverseNucl xs )
