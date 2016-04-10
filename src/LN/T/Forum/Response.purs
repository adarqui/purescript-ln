module LN.T.Forum.Response where



import LN.T.Prelude.Argonaut
import LN.T.Forum
import LN.T.DateMaybe



newtype ForumResponse = ForumResponse {
  id   :: ForumId,
  userId :: Int,
  orgId :: Int,
  name :: String,
  description :: Maybe String,
  createdAt :: DateMaybe,
  modifiedBy :: Maybe Int,
  modifiedAt :: DateMaybe
}

_ForumResponse :: LensP ForumResponse {
    id   :: ForumId,
    userId :: Int,
    orgId :: Int,
    name :: String,
    description :: Maybe String,
    createdAt :: DateMaybe,
    modifiedBy :: Maybe Int,
    modifiedAt :: DateMaybe
  }
_ForumResponse f (ForumResponse o) = ForumResponse <$> f o



defaultForumResponse :: ForumResponse
defaultForumResponse = mkForumResponse 0 0 0 "name" Nothing defaultDate Nothing defaultDate



mkForumResponse :: Int -> Int -> Int -> String -> Maybe String -> DateMaybe -> Maybe Int -> DateMaybe -> ForumResponse
mkForumResponse id userId orgId name description createdAt modifiedBy modifiedAt =
  ForumResponse { id, userId, orgId, name, description, createdAt, modifiedBy, modifiedAt }




instance encodeForumResponse :: EncodeJson ForumResponse where
  encodeJson (ForumResponse u) =
       "id"    := u.id
    ~> "user_id" := u.userId
    ~> "org_id" := u.orgId
    ~> "name" := u.name
    ~> "desc" := u.description
    ~> "created_at" := toISOString u.createdAt
    ~> "modified_by" := u.modifiedBy
    ~> "modified_at" := toISOString u.modifiedAt
    ~> jsonEmptyObject



instance decodeForumResponse :: DecodeJson ForumResponse where
  decodeJson json = do
    obj <- decodeJson json
    id <- obj .? "id"
    userId <- obj .? "user_id"
    orgId <- obj .? "org_id"
    name <- obj .? "name"
    description <- obj .? "desc"
    createdAt <- obj .? "created_at"
    modifiedBy <- obj .? "modified_by"
    modifiedAt <- obj .? "modified_at"
    pure $ ForumResponse {id, userId, orgId, name, description, createdAt, modifiedBy, modifiedAt}



instance respondableForumResponse :: Respondable ForumResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
    mkForumResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "org_id" json
      <*> readProp "name" json
      <*> (runNullOrUndefined <$> readProp "desc" json)
      <*> readProp "created_at" json
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> readProp "modified_at" json



instance requestableForumResponse :: Requestable ForumResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str



instance isForeignForumResponse :: IsForeign ForumResponse where
  read f = mkForumResponse
    <$> readProp "id" f
    <*> readProp "user_id" f
    <*> readProp "org_id" f
    <*> readProp "name" f
    <*> (runNullOrUndefined <$> readProp "desc" f)
    <*> readProp "created_at" f
    <*> (runNullOrUndefined <$> readProp "modified_by" f)
    <*> readProp "modified_at" f







newtype ForumResponses = ForumResponses {
  forums :: Array ForumResponse
}

defaultForumResponses :: ForumResponses
defaultForumResponses = mkForumResponses

mkForumResponses :: ForumResponses
mkForumResponses = ForumResponses { forums: [] }

instance encodeForumResponses :: EncodeJson ForumResponses where
  encodeJson (ForumResponses u) =
       "forums"    := u.forums
    ~> jsonEmptyObject

instance decodeForumResponses :: DecodeJson ForumResponses where
  decodeJson json = do
    obj <- decodeJson json
    forums <- obj .? "forums"
    pure $ ForumResponses { forums: forums }

instance respondableForumResponses :: Respondable ForumResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    forums <- readProp "forums" json
    pure $ ForumResponses { forums: forums }

instance requestableForumResponses :: Requestable ForumResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str

instance isForeignForumResponses :: IsForeign ForumResponses where
  read f = do
    forums <- readProp "forums" f
    pure $ ForumResponses { forums: forums }
