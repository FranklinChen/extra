
-- | Extra functions for working with pairs and triples.
--   Some of these functions are available in the "Control.Arrow" module,
--   but here are available specialised to pairs. Some operations work on triples.
module Data.Tuple.Extra(
    module Data.Tuple,
    -- * Specialised 'Arrow' functions
    first, second, (***), (&&&),
    -- * More pair operations
    dupe, both,
    -- * Extract from a triple
    fst3, snd3, thd3
    ) where

import Data.Tuple
import qualified Control.Arrow as Arrow

infixr 3 ***, &&&

-- | Update the first component of a pair.
--
-- > first succ (1,"test") == (2,"test")
first :: (a -> a') -> (a, b) -> (a', b)
first = Arrow.first

-- | Update the second component of a pair.
--
-- > second reverse (1,"test") == (1,"tset")
second :: (b -> b') -> (a, b) -> (a, b')
second = Arrow.second

-- | Given two functions, apply one to the first component and one to the second.
--   A specialised version of 'Control.Arrow.***'.
--
-- > (succ *** reverse) (1,"test") == (2,"tset")
(***) :: (a -> a') -> (b -> b') -> (a, b) -> (a', b')
(***) = (Arrow.***)

-- | Given two functions, apply both to a single argument to form a pair.
--   A specialised version of 'Control.Arrow.&&&'.
--
-- > (succ &&& pred) 1 == (2,0)
(&&&) :: (a -> b) -> (a -> c) -> a -> (b, c)
(&&&) = (Arrow.&&&)

-- | Duplicate a single value into a pair.
--
-- > dupe 12 == (12, 12)
dupe :: a -> (a,a)
dupe x = (x,x)

-- | Apply a single function to both components of a pair.
--
-- > both succ (1,2) == (2,3)
both :: (a -> b) -> (a, a) -> (b, b)
both f (x,y) = (f x, f y)

-- | Extract the 'fst' of a triple.
fst3 :: (a,b,c) -> a
fst3 (a,b,c) = a

-- | Extract the 'snd' of a triple.
snd3 :: (a,b,c) -> b
snd3 (a,b,c) = b

-- | Extract the final element of a triple.
thd3 :: (a,b,c) -> c
thd3 (a,b,c) = c
