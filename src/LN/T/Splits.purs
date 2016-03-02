module LN.T.Splits where

import Prelude
import Data.Array
import Data.JSON
import Data.Maybe

data Splits
  = SplitAt String String String
  | SplitNone



instance splitsShow :: Show Splits where
  show _ = "splits"

instance splitsFromJSON :: FromJSON Splits where
  parseJSON (JObject o) = do
    tag <- o .: "tag"
    case tag of
         "SplitAt" -> do
           contents <- o .: "contents"
           case (contents !! 0) of
                Nothing -> fail "Splits: Invalid JSON: SplitAt: c"
                Just c  -> case (contents !! 1) of
                                Nothing -> fail "Splits: Invalid JSON: SplitAt: s1"
                                Just s1 -> case (contents !! 2) of
                                                Nothing -> fail "Splits: Invalid JSON: SplitAt s2"
                                                Just s2 -> return $ SplitAt c s1 s2
         "SplitNone" -> return SplitNone
  parseJSON _ = fail "Splits: Invalid JSON"

instance splitsToJSON :: ToJSON Splits where
  toJSON (SplitAt c s1 s2) = object [ "tag" .= "SplitAt", "contents" .= [c, s1, s2] ]
  toJSON SplitNone = object [ "tag" .= "SplitNone" ]
