module LN.Api.Helpers (
  rd
) where



import Control.Monad.Aff.Free (fromAff)
import Prelude                ((<<<))
import Purescript.Api.Helpers (rD)



rd = fromAff <<< rD
