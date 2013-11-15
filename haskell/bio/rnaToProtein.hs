rnaToProtein :: [Char] -> [Char]
rnaToProtein rna = rnaToProtein' rna []

rnaToProtein' :: [Char] -> [Char] -> [Char]
rnaToProtein' rna prot = 
	if length rna < 3 
		then prot
		else rnaToProtein' (removeTriplet rna) (prot ++ convertToAa(getTriplet rna))

getTriplet :: [Char] -> [Char]
getTriplet l = [head l] ++ [head ( tail l)] ++ [head (tail (tail l))]

removeTriplet :: [Char] -> [Char]
removeTriplet l = tail (tail (tail l))


convertToAa :: [Char] -> [Char]
convertToAa rna
 | rna == "UUU" = "F"
 | rna == "CUU" = "L"
 | rna == "AUU" = "I"
 | rna == "GUU" = "V"
 | rna == "UUC" = "F"
 | rna == "CUC" = "L"
 | rna == "AUC" = "I"
 | rna == "GUC" = "V"
 | rna == "UUA" = "L"
 | rna == "CUA" = "L"
 | rna == "AUA" = "I"
 | rna == "GUA" = "V"
 | rna == "UUG" = "L"
 | rna == "CUG" = "L"
 | rna == "AUG" = "M"
 | rna == "GUG" = "V"
 | rna == "UCU" = "S"
 | rna == "CCU" = "P"
 | rna == "ACU" = "T"
 | rna == "GCU" = "A"
 | rna == "UCC" = "S"
 | rna == "CCC" = "P"
 | rna == "ACC" = "T"
 | rna == "GCC" = "A"
 | rna == "UCA" = "S"
 | rna == "CCA" = "P"
 | rna == "ACA" = "T"
 | rna == "GCA" = "A"
 | rna == "UCG" = "S"
 | rna == "CCG" = "P"
 | rna == "ACG" = "T"
 | rna == "GCG" = "A"
 | rna == "UAU" = "Y"
 | rna == "CAU" = "H"
 | rna == "AAU" = "N"
 | rna == "GAU" = "D"
 | rna == "UAC" = "Y"
 | rna == "CAC" = "H"
 | rna == "AAC" = "N"
 | rna == "GAC" = "D"
 | rna == "UAA" = "Stop"
 | rna == "CAA" = "Q"
 | rna == "AAA" = "K"
 | rna == "GAA" = "E"
 | rna == "UAG" = "Stop"
 | rna == "CAG" = "Q"
 | rna == "AAG" = "K"
 | rna == "GAG" = "E"
 | rna == "UGU" = "C"
 | rna == "CGU" = "R"
 | rna == "AGU" = "S"
 | rna == "GGU" = "G"
 | rna == "UGC" = "C"
 | rna == "CGC" = "R"
 | rna == "AGC" = "S"
 | rna == "GGC" = "G"
 | rna == "UGA" = "Stop"
 | rna == "CGA" = "R"
 | rna == "AGA" = "R"
 | rna == "GGA" = "G"
 | rna == "UGG" = "W"
 | rna == "CGG" = "R"
 | rna == "AGG" = "R"
 | rna == "GGG" = "G"
 | otherwise  = "ERR"