group :: [Int] -> [a] -> [[a]]
group (x:xs) ys = (combinations x ys) ++ 

combinations :: Int -> [a] -> [[a]]
combinations 0 _ = [[]]
combinations _ [] = []
combinations n xs = map ([head xs] ++) (combinations (n - 1) (tail xs)) ++ combinations n (tail xs)


