module LN.T.Permission where

import Prelude
import Data.JSON

data Permission
  = Read
  | Write



instance permissionEq :: Eq Permission where
  eq Read Read   = true
  eq Write Write = true
  eq _       _   = false

instance permissionShow :: Show Permission where
  show Read =  "Read"
  show Write = "Write"

instance permissionFromJSON :: FromJSON Permission where
  parseJSON (JString s) = case s of
                               "Read"  -> return Read
                               "Write" -> return Write
  parseJSON _           = fail "Visiblity: Invalid JSON"

instance permissionToJSON :: ToJSON Permission where
  toJSON Read  = JString "Read"
  toJSON Write = JString "Write"
