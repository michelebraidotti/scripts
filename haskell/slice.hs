slice :: [a] -> Int -> Int -> [a]

slice xs x y = take (y - x) (drop x xs)
