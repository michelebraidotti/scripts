-- A functor for appling a function to all
-- elements of a Data.Map should look like
-- this but  I'm not  good enough with Dat
-- a.Map to make this working right now.

import Data.Map (Map)
import qualified Data.Map as Map

instance (Ord k) => Functor (Map k) where 
	fmap f m = zip Map.keys m (map f (Map.elems m))
