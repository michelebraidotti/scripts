listAverage :: (Num a) => [a] -> a
listAverage xs = sumList(xs)/length xs

sumList ::  (Num a) => [a] -> a
sumList [x] = x
sumList (x:xs) = x + sumList(xs)
