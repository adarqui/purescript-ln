module LN.T.Visibility where

import Prelude
import Data.JSON

data Visibility
  = Public
  | Private



instance visibilityEq :: Eq Visibility where
  eq Public Public   = true
  eq Private Private = true
  eq _       _       = false

instance visibilityShow :: Show Visibility where
  show Public =  "Public"
  show Private = "Private"

instance visibilityFromJSON :: FromJSON Visibility where
  parseJSON (JString s) = case s of
                               "Public"  -> return Public
                               "Private" -> return Private
  parseJSON _           = fail "Visiblity: Invalid JSON"

instance visibilityToJSON :: ToJSON Visibility where
  toJSON Public  = JString "Public"
  toJSON Private = JString "Private"
