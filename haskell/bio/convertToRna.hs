convertToRna :: [Char] -> [Char]

convertToRna xs = map (\x -> if x == 't' then 'u' else x ) xs
