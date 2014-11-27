-- huffmanCodes :: [(Char, Int)] -> [(Char, [Char])]
data Tree a = Node (Tree a) (Tree a) | Leaf a
          deriving (Show, Eq)


-- buildTree :: [(Char, Int)] -> [(Char, Int, )]

