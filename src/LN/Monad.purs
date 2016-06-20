module LN.Monad (
  (>>)
) where



import Prelude (class Bind, const, (>>=))



(>>) :: forall m a b. (Bind m) => m a -> m b -> m b
(>>) x y = x >>= const y
