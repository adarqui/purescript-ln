module LN.T.Resource.Response where

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
  | SourceNone



data ResourceResponse = ResourceResponse {
  resourceId            :: Id,
  resourceTitle         :: String,
  resourceDescription   :: String,
  resourceSource        :: ResourceType,
  resourceAuthor        :: Maybe (Array String),
  resourcePrerequisites :: DepList String,
  resourceCategories    :: DepList String,
--  resourceOwners        :: Array Owner,
--  resourceParticipants  :: Array OwnerPermission,
  resourceVisibility    :: Visibility,
  resourceCounter       :: Int,
  resourceVersion       :: Maybe String,
--  resourceChildren      :: Maybe (Array Resource),
  resourceUrls          :: Maybe (Array String),
  resourceTs            :: Maybe Timestamp
}



unResourceResponse (ResourceResponse r) = r



defaultResourceResponse = ResourceResponse {
  resourceId            : toId 0,
  resourceTitle         : "",
  resourceDescription   : "",
  resourceSource        : SourceNone,
  resourceAuthor        : Nothing,
--  resourceOwners        : [],
--  resourceParticipants  : [],
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
  show SourceNone = "SourceNone"
  show _       = "Unknown Resource Type"

instance resourceTypeEq :: Eq ResourceType where
  eq (ISBN13 s1) (ISBN13 s2) = s1 == s2
  eq (ISBN10 s1) (ISBN10 s2) = s1 == s2
  eq (ISBN s1) (ISBN s2)     = s1 == s2
  eq (URL s1) (URL s2)       = s1 == s2
  eq SourceNone SourceNone   = true
  eq _ _                     = false

instance resourceTypeFromJSON :: FromJSON ResourceType where
  parseJSON (JObject o) = do
    tag <- o .: "tag"
    case tag of
         "ISBN13"     -> ISBN13 <$> (o .: "contents")
         "ISBN10"     -> ISBN10 <$> (o .: "contents")
         "ISBN"       -> ISBN <$> (o .: "contents")
         "URL"        -> URL <$> (o .: "contents")
         "SourceNone" -> pure SourceNone
  parseJSON _ = fail "ResourceType: Invalid JSON"

instance resourceTypeToJSON :: ToJSON ResourceType where
  toJSON (ISBN13 s) = object ["tag".="ISBN13","contents".=s]
  toJSON (ISBN10 s) = object ["tag".="ISBN10","contents".=s]
  toJSON (ISBN s)   = object ["tag".="ISBN","contents".=s]
  toJSON (URL s)    = object ["tag".="URL","contents".=s]
  toJSON SourceNone = object ["tag".="SourceNone"]

instance resourceResponseShow :: Show ResourceResponse where
  show (ResourceResponse r) = "Resource, title="<>r.resourceTitle<>", description="<>r.resourceDescription

instance resourceEq :: Eq ResourceResponse where
  eq (ResourceResponse r1) (ResourceResponse r2) = r1.resourceId == r2.resourceId

instance resourceFromJSON :: FromJSON ResourceResponse where
  parseJSON (JObject o) = do
    resource_id            <- o .: "id"
    resource_title         <- o .: "title"
    resource_description   <- o .: "desc"
    resource_source        <- o .: "source"
    resource_author        <- o .:? "author"
--    resource_owners        <- o .: "owners"
--    resource_participants  <- o .: "participants"
    resource_visibility    <- o .: "visibility"
    resource_prerequisites <- o .: "prereqs"
    resource_categories    <- o .: "categories"
    resource_counter       <- o .: "counter"
    resource_version       <- o .:? "version"
    resource_urls          <- o .:? "urls"
    resource_ts            <- o .:? "ts"
    return $ ResourceResponse {
      resourceId:            resource_id,
      resourceTitle:         resource_title,
      resourceDescription:   resource_description,
      resourceSource:        resource_source,
      resourceAuthor:        resource_author,
--      resourceOwners:        resource_owners,
--      resourceParticipants:  resource_participants,
      resourceVisibility:    resource_visibility,
      resourcePrerequisites: resource_prerequisites,
      resourceCategories:    resource_categories,
      resourceCounter:       resource_counter,
      resourceVersion:       resource_version,
      resourceUrls:          resource_urls,
      resourceTs:            resource_ts
    }
  parseJSON _ = fail "Resource: Invalid JSON"

instance resourceToJSON :: ToJSON ResourceResponse where
  toJSON (ResourceResponse {resourceId=x1, resourceTitle=x2, resourceDescription=x3, resourceAuthor=x4, resourcePrerequisites=x5, resourceCategories=x6, resourceCounter=x7, resourceVersion=x8, resourceUrls=x9, resourceSource=x10, resourceVisibility=x13, resourceTs=x14})
    = object [ "id".=x1, "title".=x2, "desc".=x3, "author".=x4, "prereqs".=x5, "categories".=x6, "counter".=x7, "version".=x8, "urls".=x9, "source".=x10, "visibility".=x13, "ts".=x14 ]
