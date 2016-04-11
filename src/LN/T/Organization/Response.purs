module LN.T.Organization.Response where



import LN.T.Prelude
import LN.T.Prelude.Argonaut
import LN.T.Organization
import LN.T.DateMaybe



newtype OrganizationResponse = OrganizationResponse {
  id   :: OrganizationId,
  userId :: Int,
  name :: String,
  description :: Maybe String,
  company :: String,
  location :: String,
  email :: String,
  emailMD5 :: String,
  createdAt :: DateMaybe,
  modifiedAt :: DateMaybe
}

_OrganizationResponse :: LensP OrganizationResponse {
    id :: OrganizationId,
    userId :: Int,
    name :: String,
    description :: Maybe String,
    company :: String,
    location :: String,
    email :: String,
    emailMD5 :: String,
    createdAt :: DateMaybe,
    modifiedAt :: DateMaybe
  }
_OrganizationResponse f (OrganizationResponse o) = OrganizationResponse <$> f o



defaultOrganizationResponse :: OrganizationResponse
defaultOrganizationResponse = mkOrganizationResponse 0 0 "name" Nothing "company" "location" "email" "md5" defaultDateMaybe defaultDateMaybe



mkOrganizationResponse :: Int -> Int -> String -> Maybe String -> String -> String -> String -> String -> DateMaybe -> DateMaybe -> OrganizationResponse
mkOrganizationResponse id userId name description company location email emailMD5 createdAt modifiedAt =
  OrganizationResponse { id, userId, name, description, company, location, email, emailMD5, createdAt, modifiedAt }



instance encodeOrganizationResponse :: EncodeJson OrganizationResponse where
  encodeJson (OrganizationResponse u) =
       "id"    := u.id
    ~> "user_id" := u.userId
    ~> "name"  := u.name
    ~> "desc" := u.description
    ~> "company" := u.company
    ~> "location" := u.location
    ~> "email" := u.email
    ~> "email_md5" := u.emailMD5
    ~> "created_at" := toISOStringMaybe u.createdAt
    ~> "modified_at" := toISOStringMaybe u.modifiedAt
    ~> jsonEmptyObject



instance decodeOrganizationResponse :: DecodeJson OrganizationResponse where
  decodeJson json = do
    obj <- decodeJson json
    id <- obj .? "id"
    userId <- obj .? "user_id"
    name <- obj .? "name"
    description <- obj .? "description"
    company <- obj .? "company"
    location <- obj .? "location"
    email <- obj .? "email"
    emailMD5 <- obj .? "email_md5"
    createdAt <- obj .? "created_at"
    modifiedAt <- obj .? "modified_at"
    pure $ OrganizationResponse {id, userId, name, description, company, location, email, emailMD5, createdAt, modifiedAt}



instance respondableOrganizationResponse :: Respondable OrganizationResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
    mkOrganizationResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "name" json
      <*> (runNullOrUndefined <$> readProp "desc" json)
      <*> readProp "company" json
      <*> readProp "location" json
      <*> readProp "email" json
      <*> readProp "email_md5" json
      <*> readProp "created_at" json
      <*> readProp "modified_at" json



instance requestableOrganizationResponse :: Requestable OrganizationResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str



instance isForeignOrganizationResponse :: IsForeign OrganizationResponse where
  read f = mkOrganizationResponse
    <$> readProp "id" f
    <*> readProp "user_id" f
    <*> readProp "name" f
    <*> (runNullOrUndefined <$> readProp "description" f)
    <*> readProp "company" f
    <*> readProp "location" f
    <*> readProp "email" f
    <*> readProp "email_md5" f
    <*> readProp "created_at" f
    <*> readProp "modified_at" f







newtype OrganizationResponses = OrganizationResponses {
  organizations :: Array OrganizationResponse
}

defaultOrganizationResponses :: OrganizationResponses
defaultOrganizationResponses = mkOrganizationResponses

mkOrganizationResponses :: OrganizationResponses
mkOrganizationResponses = OrganizationResponses { organizations: [] }

instance encodeOrganizationResponses :: EncodeJson OrganizationResponses where
  encodeJson (OrganizationResponses u) =
       "orgs"    := u.organizations
    ~> jsonEmptyObject

instance decodeOrganizationResponses :: DecodeJson OrganizationResponses where
  decodeJson json = do
    obj <- decodeJson json
    organizations <- obj .? "orgs"
    pure $ OrganizationResponses { organizations: organizations }

instance respondableOrganizationResponses :: Respondable OrganizationResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    organizations <- readProp "orgs" json
    pure $ OrganizationResponses { organizations: organizations }

instance requestableOrganizationResponses :: Requestable OrganizationResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str

instance isForeignOrganizationResponses :: IsForeign OrganizationResponses where
  read f = do
    organizations <- readProp "orgs" f
    pure $ OrganizationResponses { organizations: organizations }
