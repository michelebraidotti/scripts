data BinaryNode a = Empty | BinaryNode { 
  value :: a,
  left :: BinaryNode a,
  right :: BinaryNode a
} deriving (Show, Eq)

buildBst :: [Int] -> BinaryNode Int
buildBst [] = Empty
buildBst (x:xs) = insertBst x (buildBst xs)

insertBst :: Int -> BinaryNode Int -> BinaryNode Int
insertBst x Empty = BinaryNode x Empty Empty 
insertBst x (BinaryNode y ln rn) 
  | x < y = BinaryNode y (insertBst x ln) rn
  | otherwise  = BinaryNode y ln (insertBst x rn)

printBstValues :: BinaryNode Int -> [Int]
printBstValues Empty = []
printBstValues (BinaryNode x lt rt) = (printBstValues lt) ++ [x] ++ (printBstValues rt)

