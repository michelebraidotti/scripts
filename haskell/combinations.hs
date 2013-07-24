combinations :: Int -> [a] -> [[a]]
combinations _ [] = [[]]
-- combinations x y  
--	| length y < x 	= y
--	| otherwise 	= [head y:combinations x-1 tail y]:combinations x-1 y

combinations 1 [x] = [[x]]  
combinations 1 (x:xs) = [x]:combinations 1 xs
combinations n xs = map (x,  -> [x]:combinations n-1 xs)
-- combinations y (x:xs) = [x:combinations (y-1) (x:xs)]:combinations y xs 

-- combinations n [x,y,z] = (x:combinations(n-1 xs))
