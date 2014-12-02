data BinaryNode = Empty | BinaryNode { value :: Int,
                               left :: BinaryNode,
                               right :: BinaryNode
                               }
                          deriving (Show, Eq)

buildBst :: [Int] -> BinaryNode
buildBst [] = Empty
buildBst (x:xs) = insertBst x (buildBst xs)

insertBst :: Int -> BinaryNode -> BinaryNode
insertBst x Empty = BinaryNode x Empty Empty 
insertBst x (BinaryNode y ln rn) 
  | x < y = BinaryNode y (insertBst x ln) rn
  | otherwise  = BinaryNode y ln (insertBst x rn)

printBstValues :: BinaryNode -> [Int]
printBstValues Empty = []
printBstValues (BinaryNode x lt rt) = (printBstValues lt) ++ [x] ++ (printBstValues rt)

