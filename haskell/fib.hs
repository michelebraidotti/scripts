fib :: Int -> Int

fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n -2)

fibList :: Int -> [Int]
fibList 0 = [0]
fibList 1 = [0,1]
fibList n =  fibList (n - 1) ++ [fib n]

-- what if instead of 1 rabbit per pair 
-- we generate k rabbits per pair? ...
fibExtra :: Int -> Int -> Int
fibExtra 0 k = 0
fibExtra 1 k = 1
fibExtra n k = fibExtra (n - 1) k + k*(fibExtra (n - 2) k)
