removeAt :: Int -> [a] -> [a]

removeAt n xs = take (n - 1) xs ++ drop n xs
