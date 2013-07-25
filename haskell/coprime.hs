coprime :: Int -> Int -> Boolean
primesList :: Int -> [Int]

coprime x y =
	if ( x < y )  
	then coprime' x y pimesList x
	else coprime' x y pimesList y

primesList a = [x| x<-[2..(a-1)], a `mod` x == 0] 
coprime' Int -> Int -> [Int] -> Boolean
coprime' x y [p] = 
	if  (x `mod` p == 0  && y `mod` p == 0) -- p divides both x and y 
	then True
	else False
coprime' x y (p:xs) = 
	if  (x `mod` p == 0  && y `mod` p == 0) -- p divides both x and y 
	then True
	else coprime' x y xs
	
