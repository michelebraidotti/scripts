combinations :: Int -> [a] -> [[a]]
combinations 1 xs = listOfLists xs
-- TODO, doesn't work yet 
combinations 2 xs = listCombine (combinations 1 xs) xs
  

listCombine :: [a] -> [a] -> [[a]]
listCombine xs ys = listCombine' xs ys []
listCombine' :: [a] -> [a] -> [[a]] -> [[a]]
listCombine' xs [] zs = zs
listCombine' xs  (y:ys) zs = listCombine' xs ys [xs ++ [y]] ++ zs
--Main> map (\x -> listCombine x ['a','b','c']) [['a','a'],['b','b'],['c','c']]
--[["aac","aab","aaa"],["bbc","bbb","bba"],["ccc","ccb","cca"]

-- take a list and conver it in a list of lists with one element per sublist
--Main> listOfLists [1,2,3]
--[[1],[2],[3]]
listOfLists :: [a] -> [[a]]
listOfLists [] = [[]]
listOfLists [x] = [[x]]
listOfLists (x:xs) = [[x]] ++ listOfLists xs



