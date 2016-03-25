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
  createdAt :: DateMaybe,
  modifiedAt :: DateMaybe
}



defaultOrganizationResponse :: OrganizationResponse
defaultOrganizationResponse = mkOrganizationResponse 0 0 "name" Nothing "company" "location" "email" defaultDate defaultDate



mkOrganizationResponse :: Int -> Int -> String -> Maybe String -> String -> String -> String -> DateMaybe -> DateMaybe -> OrganizationResponse
mkOrganizationResponse id userId name description location company email createdAt modifiedAt =
  OrganizationResponse { id, userId, description, name, location, company, email, createdAt, modifiedAt }



instance encodeOrganizationResponse :: EncodeJson OrganizationResponse where
  encodeJson (OrganizationResponse u) =
       "id"    := u.id
    ~> "user_id" := u.userId
    ~> "name"  := u.name
    ~> "desc" := u.description
    ~> "company" := u.company
    ~> "location" := u.location
    ~> "email" := u.email
    ~> "created_at" := toISOString u.createdAt
    ~> "modified_at" := toISOString u.modifiedAt
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
    createdAt <- obj .? "created_at"
    modifiedAt <- obj .? "modified_at"
    pure $ OrganizationResponse {id, userId, name, description, company, location, email, createdAt, modifiedAt}



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
    <*> readProp "created_at" f
    <*> readProp "modified_at" f






