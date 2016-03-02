module LN.T.Owner where

import Prelude
import Data.JSON
import LN.T.Id

data Owner
  = OwnerUser Id
  | OwnerTeam Id
  | OwnerOrganization Id



instance ownerEq :: Eq Owner where
  eq (OwnerUser o1) (OwnerUser o2)                 = o1 == o2
  eq (OwnerTeam o1) (OwnerTeam o2)                 = o1 == o2
  eq (OwnerOrganization o1) (OwnerOrganization o2) = o1 == o2
  eq _                      _                      = false

instance ownerShow :: Show Owner where
  show (OwnerUser o)         = show o
  show (OwnerTeam o)         = show o
  show (OwnerOrganization o) = show o

instance ownerFromJSON :: FromJSON Owner where
  parseJSON (JObject o) = do
    tag <- o .: "tag"
    case tag of
         "OwnerUser"         -> OwnerUser <$> (o .: "contents")
         "OwnerTeam"         -> OwnerTeam <$> (o .: "contents")
         "OwnerOrganization" -> OwnerOrganization <$> (o .: "contents")

instance ownerToJSON :: ToJSON Owner where
  toJSON (OwnerUser uid)         = object ["tag".="OwnerUser","contents".=uid]
  toJSON (OwnerTeam tid)         = object ["tag".="OwnerTeam","contents".=tid]
  toJSON (OwnerOrganization oid) = object ["tag".="OwnerOrganization","contents".=oid]
