--myLast [x] = x
--myLast (x:xs) = myLast(xs)

--myLast [] = 0
--myLast [x] = 0
--myLast [x,y] = x
--myLast (_:xs) = myLast(xs)

kElem:: [a] -> Int -> a
kElem (x:_) 1 = x
kElem (_:xs) y = kElem xs (y - 1)

myLength:: [a] -> Int
myLength []  = 0
myLength (_:xs) = 1 + myLength xs

revList::[a] -> [a]
revList [] = []
revList (x:xs) = revList xs ++ [x]

isPalindrome::(Eq a) => [a] -> Bool
isPalindrome [] = True
isPalindrome [x] = True
isPalindrome (x:xs) = x == last xs && isPalindrome (init xs)

isPal::(Eq a) => [a] -> Bool
isPal xs = xs == (reverse xs)


myflatten::[a]->[a]
myflatten [] = []
myflatten [x] = [x]
myflatten [x,[xs]] = [x] ++ myflatten xs
myflatten [[xs], x] = myflatten xs ++ [x]
