truthTable :: (Bool -> Bool -> Bool) -> IO ()
truthTable f = mapM_ putStrLn [show a ++ " " ++ show b ++ " " ++ show (f a b)
                                | a <- [True, False], b <- [True, False]]


orTable :: Bool -> Bool -> Bool
orTable False False = False 
orTable _ _ = True 

andTable :: Bool -> Bool -> Bool
andTable True True = True 
andTable _ _ = False 