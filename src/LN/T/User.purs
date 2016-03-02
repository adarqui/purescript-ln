module LN.T.User where

import Prelude
import Data.JSON
import Data.Maybe
import LN.T.Id
import LN.T.Timestamp

data User = User {
  userId         :: Maybe Id,
  userName       :: String,
--  userRegistered :: Boolean,
  userTs         :: Timestamp
}



defaultUser :: String -> User
defaultUser username = User {
  userId:       Nothing,
  userName: username,
  -- userRegistered
  userTs:  defaultTimestamp
}



instance timestampFromJSON :: FromJSON User where
  parseJSON (JObject o) = do
    return $ defaultUser "hi"
  parseJSON _           = fail "User: Invalid JSON"

instance timestampToJSON :: ToJSON User where
  toJSON (User t) = object []
