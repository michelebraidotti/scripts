grayCode :: Int -> [[Char]]
grayCode 0 = []
grayCode 1 = ["0", "1"]
grayCode n = map (\x ->  "0" ++ x) (grayCode (n -1)) ++ map (\x -> "1" ++ x) (reverse (grayCode (n - 1)))