module LN.T.Size where



import LN.T.Prelude
import Data.Generic



data Size
  = XSmall
  | Small
  | Medium
  | Large
  | XLarge


derive instance genericSize :: Generic Size

instance eqSize :: Eq Size where
  eq = gEq

instance ordSize :: Ord Size where
  compare = gCompare

instance showSize :: Show Size where
  show = gShow
