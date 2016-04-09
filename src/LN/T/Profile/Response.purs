module LN.T.Profile.Response where



import LN.T.Prelude.Argonaut
import LN.T.Profile
import LN.T.DateMaybe
import LN.T.Date as D



newtype ProfileResponse = ProfileResponse {
  id   :: ProfileId,
  entityId :: Int,
  gender :: ProfileGender,
  birthdate :: D.Date,
  website :: Maybe String,
  location :: Maybe String,
  signature :: Maybe String,
  karmaGood :: Int,
  karmaBad :: Int,
  createdAt :: DateMaybe,
  modifiedAt :: DateMaybe
}

_ProfileResponse :: LensP ProfileResponse {
  id   :: ProfileId,
  entityId :: Int,
  gender :: ProfileGender,
  birthdate :: D.Date,
  website :: Maybe String,
  location :: Maybe String,
  signature :: Maybe String,
  karmaGood :: Int,
  karmaBad :: Int,
  createdAt :: DateMaybe,
  modifiedAt :: DateMaybe
}

_ProfileResponse f (ProfileResponse o) = ProfileResponse <$> f o




defaultProfileResponse :: ProfileResponse
defaultProfileResponse = mkProfileResponse 0 0 GenderUnknown D.defaultDate Nothing Nothing Nothing 0 0 defaultDate defaultDate



mkProfileResponse :: Int -> Int -> ProfileGender -> D.Date -> Maybe String -> Maybe String -> Maybe String -> Int -> Int -> DateMaybe -> DateMaybe -> ProfileResponse
mkProfileResponse id entityId gender birthdate website location signature karmaGood karmaBad createdAt modifiedAt =
  ProfileResponse {id, entityId, gender, birthdate, website, location, signature, karmaGood, karmaBad, createdAt, modifiedAt}




instance encodeProfileResponse :: EncodeJson ProfileResponse where
  encodeJson (ProfileResponse u) =
       "id"    := u.id
    ~> "entity_id" := u.entityId
    ~> "gender" := u.gender
    ~> "birthdate" := u.birthdate
    ~> "website" := u.website
    ~> "location" := u.location
    ~> "signature" := u.signature
    ~> "karma_good" := u.karmaGood
    ~> "karma_bad" := u.karmaBad
    ~> "created_at" := toISOString u.createdAt
    ~> "modified_at" := toISOString u.modifiedAt
    ~> jsonEmptyObject



instance decodeProfileResponse :: DecodeJson ProfileResponse where
  decodeJson json = do
    obj <- decodeJson json
    id <- obj .? "id"
    entityId <- obj .? "entity_id"
    gender <- obj .? "gender"
    birthdate <- obj .? "birthdate"
    website <- obj .? "website"
    location <- obj .? "location"
    signature <- obj .? "signature"
    karmaGood <- obj .? "karma_good"
    karmaBad <- obj .? "karma_bad"
    createdAt <- obj .? "created_at"
    modifiedAt <- obj .? "modified_at"
    pure $ ProfileResponse {id, entityId, gender, birthdate, website, location, signature, karmaGood, karmaBad, createdAt, modifiedAt}




instance respondableProfileResponse :: Respondable ProfileResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
    mkProfileResponse
      <$> readProp "id" json
      <*> readProp "entity_id" json
      <*> readProp "gender" json
      <*> readProp "birthdate" json
      <*> (runNullOrUndefined <$> readProp "website" json)
      <*> (runNullOrUndefined <$> readProp "location" json)
      <*> (runNullOrUndefined <$> readProp "signature" json)
      <*> readProp "karma_good" json
      <*> readProp "karma_bad" json
      <*> readProp "created_at" json
      <*> readProp "modified_at" json



instance requestableProfileResponse :: Requestable ProfileResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str



instance isForeignProfileResponse :: IsForeign ProfileResponse where
  read f = mkProfileResponse
    <$> readProp "id" f
    <*> readProp "entity_id" f
    <*> readProp "gender" f
    <*> readProp "birthdate" f
    <*> (runNullOrUndefined <$> readProp "website" f)
    <*> (runNullOrUndefined <$> readProp "location" f)
    <*> (runNullOrUndefined <$> readProp "signature" f)
    <*> readProp "karma_good" f
    <*> readProp "karma_bad" f
    <*> readProp "created_at" f
    <*> readProp "modified_at" f







newtype ProfileResponses = ProfileResponses {
  profiles :: Array ProfileResponse
}

defaultProfileResponses :: ProfileResponses
defaultProfileResponses = mkProfileResponses

mkProfileResponses :: ProfileResponses
mkProfileResponses = ProfileResponses { profiles: [] }

instance encodeProfileResponses :: EncodeJson ProfileResponses where
  encodeJson (ProfileResponses u) =
       "profiles"    := u.profiles
    ~> jsonEmptyObject

instance decodeProfileResponses :: DecodeJson ProfileResponses where
  decodeJson json = do
    obj <- decodeJson json
    profiles <- obj .? "profiles"
    pure $ ProfileResponses { profiles: profiles }

instance respondableProfileResponses :: Respondable ProfileResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    profiles <- readProp "profiles" json
    pure $ ProfileResponses { profiles: profiles }

instance requestableProfileResponses :: Requestable ProfileResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str

instance isForeignProfileResponses :: IsForeign ProfileResponses where
  read f = do
    profiles <- readProp "profiles" f
    pure $ ProfileResponses { profiles: profiles }
