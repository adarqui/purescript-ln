module LN.T.Substitutions where

import Prelude
import Data.JSON
import Data.List
import Data.Maybe

data Substitutions
  = SubsExpr Substitutions Substitutions
  | SubsOneOf (Array String)
  | SubsAllOf (Array String)
  | SubsBoth Substitutions Substitutions

data XSubstitutions
  = XSubsOneOf String
  | XSubsAllOf String
  | XSubsBoth XSubstitutions XSubstitutions



instance xsubstitutionsShow :: Show XSubstitutions where
  show (XSubsOneOf s) = show $ "XSubsOneOf: " ++ s
  show (XSubsAllOf s) = show $ "XSubsAllOf: " ++ s
  show (XSubsBoth s1 s2) = "both" ++ show s1 ++ ", " ++ show s2

instance substitutionsShow :: Show Substitutions where
  show _ = "substitutions"

instance substitutionsFromJSON :: FromJSON Substitutions where
  parseJSON (JObject o) = do
    tag <- o .: "tag"
    case tag of
         "SubsExpr" -> do
           contents <- o .: "contents"
           return $ SubsAllOf contents
         "SubsOneOf" -> do
           contents <- o .: "contents"
           return $ SubsOneOf contents
         "SubsAllOf" -> do
           contents <- o .: "contents"
           return $ SubsAllOf contents
         "SubsBoth" -> do
           contents <- o .: "contents"
           return $ SubsAllOf contents
  parseJSON _ = fail "Substitutions: Invalid JSON"

instance substitutionsToJSON :: ToJSON Substitutions where
  toJSON (SubsExpr o1 o2) = object [ "tag" .= "SubsBoth", "contents" .= [o1, o2] ]
  toJSON (SubsOneOf arr) = object [ "tag" .= "SubsOneOf", "contents" .= arr ]
  toJSON (SubsAllOf arr) = object [ "tag" .= "SubsAllOf", "contents" .= arr ]
  toJSON (SubsBoth o1 o2) = object [ "tag" .= "SubsBoth", "contents" .= [o1, o2] ]
