-- huffmanCodes :: [(Char, Int)] -> [(Char, [Char])]
-- huffmanTree
data HuffmanTree = Empty | Leaf Char | HuffmanTree  { 
  value :: Int,
  left :: HuffmanTree,
  right :: HuffmanTree
} deriving (Show, Eq)

buildHt :: [(Char, Int)] -> HuffmanTree
buildHt [] = Empty
buildHt (x:xs) = insertHt x (buildHt xs)

insertHt :: (Char, Int) -> HuffmanTree -> HuffmanTree
insertHt (x,y) Empty = HuffmanTree y (Leaf x) Empty
insertHt (x,y) (HuffmanTree z lt rt)
  | (lt == Empty) && (y < z)  = HuffmanTree (z + y) (Leaf x) rt
  | (lt == Empty) && (y >= z) = HuffmanTree (z + y) rt (Leaf x)
  | (rt == Empty) && (y < z)  = HuffmanTree (z + y) (Leaf x) lt
  | (rt == Empty) && (y >= z) = HuffmanTree (z + y) lt (Leaf x)
  | y < z                     = HuffmanTree z (insertHt (x,y) lt) rt
  | y >= z                    = HuffmanTree z lt (insertHt (x,y) rt)
  | otherwise                 = Empty