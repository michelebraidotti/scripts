quadraticFormula :: Double -> Double -> Double -> (Double, Double)
quadraticFormula a b c 
	| delta < 0 	= error "No real solutions found"
	| otherwise  	= ((0-b + sqrt(delta))/2*a, (0-b - sqrt(delta))/2*a)
	where delta =  b^2 - 4*a*c
