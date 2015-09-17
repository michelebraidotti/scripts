data NaryTree a = Empty | NaryTree {  
  value :: a,
  parent :: NaryTree a
} deriving (Show, Eq)

pathToTheRoot :: NaryTree Int -> [Char]
pathToTheRoot Empty = []
pathToTheRoot (NaryTree x p) =
  if ( p == Empty) 
  then (show x)
  else (show x) ++ (pathToTheRoot p)

buildTree :: [Int] -> NaryTree Int
buildTree [] = Empty
buildTree (x:xs) = 