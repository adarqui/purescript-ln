module LN.Api.Helpers (
  rd
) where



import Halogen (liftAff')
import Prelude ((<<<))
import Purescript.Api.Helpers (rD)



rd = liftAff' <<< rD
