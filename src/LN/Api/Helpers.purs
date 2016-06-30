module LN.Api.Helpers (
  rd
) where



import Control.Monad.Reader.Trans (ReaderT)
import Control.Monad.Aff          (Aff())
import Control.Monad.Aff.Free     (class Affable, fromAff)
import Prelude                    ((<<<))
import Purescript.Api.Helpers     (ApiOptions, rD)



rd :: forall a b c. Affable a b => ReaderT ApiOptions (Aff a) c -> b c
rd = fromAff <<< rD
