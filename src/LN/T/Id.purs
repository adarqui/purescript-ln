module LN.T.Id where

import Prelude
import Data.Int
import Data.JSON

newtype Id = Id Int

instance idEq :: Eq Id where
  eq (Id x) (Id y) = x == y

instance showId :: Show Id where
  show (Id x) = show x

instance idFromJSON :: FromJSON Id where
  parseJSON (JInt i) = return $ Id i
  parseJSON _ = fail "Id: Invalid JSON"

instance idToJSON :: ToJSON Id where
  toJSON (Id x) = JInt x

toId :: Int -> Id
toId n = Id n

fromId :: Id -> Int
fromId (Id n) = n
