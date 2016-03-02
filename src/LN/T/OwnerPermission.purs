module LN.T.OwnerPermission where

import Prelude
import LN.T.Owner
import LN.T.Permission
import Data.JSON

data OwnerPermission = OwnerPermission Owner Permission



instance ownerPermissionEq :: Eq OwnerPermission where
  eq (OwnerPermission owners1 perms1) (OwnerPermission owners2 perms2) = owners1 == owners2 && perms1 == perms2

instance ownerPermissionShow :: Show OwnerPermission where
  show (OwnerPermission owners perms) = show owners ++ show perms

instance ownerPermissionFromJSON :: FromJSON OwnerPermission where
  parseJSON _           = fail "Visiblity: Invalid JSON"

instance ownerPermissionToJSON :: ToJSON OwnerPermission where
  toJSON (OwnerPermission owners perms) = object ["tag".="OwnerPermission","content".=[toJSON owners, toJSON perms]]
