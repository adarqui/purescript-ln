module LN.T.Profile.Response where



import LN.T.Prelude.Argonaut
import LN.T.Profile
import LN.T.DateMaybe



newtype ProfileResponse = ProfileResponse {
  id   :: ProfileId,
  boardId :: Int,
  name :: String,
  description :: Maybe String,
  sticky :: Boolean,
  locked :: Boolean,
  poll :: Maybe String,
  createdBy :: Int,
  createdAt :: DateMaybe,
  modifiedBy :: Maybe Int,
  modifiedAt :: DateMaybe
}

_ProfileResponse :: LensP ProfileResponse {
  id   :: ProfileId,
  boardId :: Int,
  name :: String,
  description :: Maybe String,
  sticky :: Boolean,
  locked :: Boolean,
  poll :: Maybe String,
  createdBy :: Int,
  createdAt :: DateMaybe,
  modifiedBy :: Maybe Int,
  modifiedAt :: DateMaybe
}

_ProfileResponse f (ProfileResponse o) = ProfileResponse <$> f o




defaultProfileResponse :: ProfileResponse
defaultProfileResponse = mkProfileResponse 0 0 "name" Nothing false false Nothing 0 defaultDate Nothing defaultDate



mkProfileResponse :: Int -> Int -> String -> Maybe String -> Boolean -> Boolean -> Maybe String -> Int -> DateMaybe -> Maybe Int -> DateMaybe -> ProfileResponse
mkProfileResponse id boardId name description sticky locked poll createdBy createdAt modifiedBy modifiedAt =
  ProfileResponse { id, boardId, name, description, sticky, locked, poll, createdBy, createdAt, modifiedBy, modifiedAt }




instance encodeProfileResponse :: EncodeJson ProfileResponse where
  encodeJson (ProfileResponse u) =
       "id"    := u.id
    ~> "board_id" := u.boardId
    ~> "name" := u.name
    ~> "desc" := u.description
    ~> "sticky" := u.sticky
    ~> "locked" := u.locked
    ~> "poll" := u.poll
    ~> "created_by" := u.createdBy
    ~> "created_at" := toISOString u.createdAt
    ~> "modified_by" := u.modifiedBy
    ~> "modified_at" := toISOString u.modifiedAt
    ~> jsonEmptyObject



instance decodeProfileResponse :: DecodeJson ProfileResponse where
  decodeJson json = do
    obj <- decodeJson json
    id <- obj .? "id"
    boardId <- obj .? "board_id"
    name <- obj .? "name"
    description <- obj .? "desc"
    sticky <- obj .? "sticky"
    locked <- obj .? "locked"
    poll <- obj .? "poll"
    createdBy <- obj .? "created_by"
    createdAt <- obj .? "created_at"
    modifiedBy <- obj .? "modified_by"
    modifiedAt <- obj .? "modified_at"
    pure $ ProfileResponse {id, boardId, name, description, sticky, locked, poll, createdBy, createdAt, modifiedBy, modifiedAt}




instance respondableProfileResponse :: Respondable ProfileResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
    mkProfileResponse
      <$> readProp "id" json
      <*> readProp "board_id" json
      <*> readProp "name" json
      <*> (runNullOrUndefined <$> readProp "desc" json)
      <*> readProp "sticky" json
      <*> readProp "locked" json
      <*> (runNullOrUndefined <$> readProp "poll" json)
      <*> readProp "created_by" json
      <*> readProp "created_at" json
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> readProp "modified_at" json



instance requestableProfileResponse :: Requestable ProfileResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str



instance isForeignProfileResponse :: IsForeign ProfileResponse where
  read f = mkProfileResponse
    <$> readProp "id" f
    <*> readProp "board_id" f
    <*> readProp "name" f
    <*> (runNullOrUndefined <$> readProp "desc" f)
    <*> readProp "sticky" f
    <*> readProp "locked" f
    <*> (runNullOrUndefined <$> readProp "poll" f)
    <*> readProp "created_by" f
    <*> readProp "created_at" f
    <*> (runNullOrUndefined <$> readProp "modified_by" f)
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
