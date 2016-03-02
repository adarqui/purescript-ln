module LN.T.DepList where

import Data.Array

infixr 9 +->

type DepList a = Array (Array a)

(+->) :: forall a. a -> Array a -> Array a
(+->) a as = a : as
