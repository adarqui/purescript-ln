module LN.T.Ping where

import Prelude
import Data.JSON
import Data.Maybe
import LN.T.Id

data Ping = Ping {
  pingId       :: Maybe Id,
  pingOwner    :: Maybe Id,
  pingTsClient :: Maybe Boolean,
  pingTsServer :: Maybe Boolean
}



defaultPing :: Ping
defaultPing = Ping {
  pingId:       Nothing,
  pingOwner:    Nothing,
  pingTsClient: Nothing,
  pingTsServer: Nothing
}



instance timestampFromJSON :: FromJSON Ping where
  parseJSON (JObject o) = do
    return defaultPing
  parseJSON _           = fail "Ping: Invalid JSON"

instance timestampToJSON :: ToJSON Ping where
  toJSON (Ping t) = object []
