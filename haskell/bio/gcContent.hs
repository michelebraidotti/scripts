gcContent :: [Char] -> Float
gcContent' :: [Char] -> Float -> Float -> Float

gcContent [] = 0
gcContent xs = gcContent' xs 0 0
gcContent' [] gc tot = (gc/tot)*100
gcContent' (x:xs) gc tot = 
	if ( x == 'c' || x == 'g' )
	then gcContent' xs (gc + 1) (tot + 1) 
	else gcContent' xs gc (tot + 1)
