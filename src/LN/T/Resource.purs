module LN.T.Resource where

import Prelude
import Data.JSON
import Data.Maybe
import LN.T.DepList
import LN.T.Id
import LN.T.Owner
import LN.T.OwnerPermission
import LN.T.Timestamp
import LN.T.Visibility

type ResourceId = Id

data ResourceType
  = ISBN13 String
  | ISBN10 String
  | ISBN String
  | URL String

data Resource = Resource {
  resourceId            :: Id,
  resourceTitle         :: String,
  resourceDescription   :: String,
  resourceSource        :: ResourceType,
  resourceAuthor        :: Maybe (Array String),
  resourcePrerequisites :: DepList String,
  resourceCategories    :: DepList String,
  resourceOwners        :: Array Owner,
  resourceParticipants  :: Array OwnerPermission,
  resourceVisibility    :: Visibility,
  resourceCounter       :: Int,
  resourceVersion       :: Maybe String,
--  resourceChildren      :: Maybe (Array Resource),
  resourceUrls          :: Maybe (Array String),
  resourceTs            :: Maybe Timestamp
}



defaultResource = Resource {
  resourceId            : toId 0,
  resourceTitle         : "empty",
  resourceDescription   : "empty",
  resourceSource        : URL "http://empty",
  resourceAuthor        : Nothing,
  resourceOwners        : [],
  resourceParticipants  : [],
  resourceVisibility    : Public,
  resourcePrerequisites : [],
  resourceCategories    : [],
  resourceCounter       : 0,
  resourceVersion       : Just "1.0",
  resourceUrls          : Nothing,
  resourceTs            : Nothing
}



instance resourceTypeShow :: Show ResourceType where
  show (ISBN13 s) = s
  show (ISBN10 s) = s
  show (ISBN s)   = s
  show (URL s)    = s
  show _       = "Unknown Resource Type"

instance resourceTypeEq :: Eq ResourceType where
  eq (ISBN13 s1) (ISBN13 s2) = s1 == s2
  eq (ISBN10 s1) (ISBN10 s2) = s1 == s2
  eq (ISBN s1) (ISBN s2)     = s1 == s2
  eq (URL s1) (URL s2)       = s1 == s2

instance resourceTypeFromJSON :: FromJSON ResourceType where
  parseJSON (JObject o) = do
    tag <- o .: "tag"
    case tag of
         "ISBN13" -> ISBN13 <$> (o .: "contents")
         "ISBN10" -> ISBN10 <$> (o .: "contents")
         "ISBN"   -> ISBN <$> (o .: "contents")
         "URL"    -> URL <$> (o .: "contents")
  parseJSON _ = fail "ResourceType: Invalid JSON"

instance resourceTypeToJSON :: ToJSON ResourceType where
  toJSON (ISBN13 s) = object ["tag".="ISBN13","contents".=s]
  toJSON (ISBN10 s) = object ["tag".="ISBN10","contents".=s]
  toJSON (ISBN s)   = object ["tag".="ISBN","contents".=s]
  toJSON (URL s) = object ["tag".="URL","contents".=s]

instance resourceShow :: Show Resource where
  show _ = "Resource"

instance resourceEq :: Eq Resource where
  eq (Resource r1) (Resource r2) = r1.resourceId == r2.resourceId

instance resourceFromJSON :: FromJSON Resource where
  parseJSON (JObject o) = do
    resource_id            <- o .: "resourceId"
    resource_title         <- o .: "resourceTitle"
    resource_description   <- o .: "resourceDescription"
    resource_source        <- o .: "resourceSource"
    resource_author        <- o .:? "resourceAuthor"
    resource_owners        <- o .: "resourceOwners"
    resource_participants  <- o .: "resourceParticipants"
    resource_visibility    <- o .: "resourceVisibility"
    resource_prerequisites <- o .: "resourcePrerequisites"
    resource_categories    <- o .: "resourceCategories"
    resource_counter       <- o .: "resourceCounter"
    resource_version       <- o .:? "resourceVersion"
    resource_urls          <- o .:? "resourceUrls"
    resource_ts            <- o .:? "resourceTs"
    return $ Resource {
      resourceId:            resource_id,
      resourceTitle:         resource_title,
      resourceDescription:   resource_description,
      resourceSource:        resource_source,
      resourceAuthor:        resource_author,
      resourceOwners:        resource_owners,
      resourceParticipants:  resource_participants,
      resourceVisibility:    resource_visibility,
      resourcePrerequisites: resource_prerequisites,
      resourceCategories:    resource_categories,
      resourceCounter:       resource_counter,
      resourceVersion:       resource_version,
      resourceUrls:          resource_urls,
      resourceTs:            resource_ts
    }
  parseJSON _ = fail "Resource: Invalid JSON"

instance resourceToJSON :: ToJSON Resource where
  toJSON (Resource {resourceId=x1, resourceTitle=x2, resourceDescription=x3, resourceAuthor=x4, resourcePrerequisites=x5, resourceCategories=x6, resourceCounter=x7, resourceVersion=x8, resourceUrls=x9, resourceSource=x10, resourceOwners=x11, resourceParticipants=x12, resourceVisibility=x13, resourceTs=x14})
    = object [ "resourceId".=x1, "resourceTitle".=x2, "resourceDescription".=x3, "resourceAuthor".=x4, "resourcePrerequisites".=x5, "resourceCategories".=x6, "resourceCounter".=x7, "resourceVersion".=x8, "resourceUrls".=x9, "resourceSource".=x10, "resourceOwners".=x11, "resourceParticipants".=x12, "resourceVisibility".=x13, "resourceTs".=x14 ]
