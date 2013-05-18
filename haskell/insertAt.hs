insertAt :: a -> [a] -> Int -> [a]
insertAt _ [] _ = []
insertAt _ xs 0 = xs
insertAt x xs 1 = x:tail xs
insertAt a (x:xs) y = x:insertAt a xs (y-1)
