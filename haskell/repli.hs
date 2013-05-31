repli :: (Num b, Eq b) => [a] -> b -> [a]
copy :: (Num b, Eq b) => a -> b -> [a]
copy x 0 = []
copy x y = x:copy x (y - 1)

repli [] y = []
repli (x:xs) y = (copy x y) ++ (repli xs y)
