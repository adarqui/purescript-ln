module LN.Monad where

import Prelude

(>>) :: forall m a b. (Bind m) => m a -> m b -> m b
(>>) x y = x >>= const y
