module LN.T.Timestamp (
  Timestamp (..),
  defaultTimestamp
) where

import Prelude
import Data.JSON
import Data.Maybe



data Timestamp = Timestamp {
  createdAt :: Maybe String,
  updatedAt :: Maybe String,
  removedAt :: Maybe String
}



instance timestampFromJSON :: FromJSON Timestamp where
  parseJSON (JObject o) = do
    return defaultTimestamp
  parseJSON _           = fail "Timestamp: Invalid JSON"

instance timestampToJSON :: ToJSON Timestamp where
  toJSON (Timestamp t) = object []



defaultTimestamp :: Timestamp
defaultTimestamp = Timestamp {
  createdAt: Nothing,
  updatedAt: Nothing,
  removedAt: Nothing
}
