myLast :: [a] -> a
myLast [x] = x
myLast (x:xs) = myLast xs

myLast' :: [a] -> a
myLast' xs = xs!!((length xs) - 1)

myButList :: [a] -> a
myButList [x,y] = x
myButList (x:xs) = myButList xs

elementAt :: [a] -> n -> a
elementAt (x:xs) 0 = x
elementAt (x:xs) y = elementAt (xs) y-1
