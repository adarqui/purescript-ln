module LN.T.Thread.Response where



import LN.T.Prelude.Argonaut
import LN.T.Thread
import LN.T.DateMaybe



newtype ThreadResponse = ThreadResponse {
  id   :: ThreadId,
  userId :: Int,
  boardId :: Int,
  name :: String,
  description :: Maybe String,
  sticky :: Boolean,
  locked :: Boolean,
  poll :: Maybe String,
  createdAt :: DateMaybe,
  modifiedBy :: Maybe Int,
  modifiedAt :: DateMaybe
}

_ThreadResponse :: LensP ThreadResponse {
  id   :: ThreadId,
  userId :: Int,
  boardId :: Int,
  name :: String,
  description :: Maybe String,
  sticky :: Boolean,
  locked :: Boolean,
  poll :: Maybe String,
  createdAt :: DateMaybe,
  modifiedBy :: Maybe Int,
  modifiedAt :: DateMaybe
}
_ThreadResponse f (ThreadResponse o) = ThreadResponse <$> f o




defaultThreadResponse :: ThreadResponse
defaultThreadResponse = mkThreadResponse 0 0 0 "name" Nothing false false Nothing defaultDateMaybe Nothing defaultDateMaybe



mkThreadResponse :: Int -> Int -> Int -> String -> Maybe String -> Boolean -> Boolean -> Maybe String -> DateMaybe -> Maybe Int -> DateMaybe -> ThreadResponse
mkThreadResponse id userId boardId name description sticky locked poll createdAt modifiedBy modifiedAt =
  ThreadResponse { id, userId, boardId, name, description, sticky, locked, poll, createdAt, modifiedBy, modifiedAt }




instance encodeThreadResponse :: EncodeJson ThreadResponse where
  encodeJson (ThreadResponse u) =
       "id"    := u.id
    ~> "user_id" := u.userId
    ~> "board_id" := u.boardId
    ~> "name" := u.name
    ~> "desc" := u.description
    ~> "sticky" := u.sticky
    ~> "locked" := u.locked
    ~> "poll" := u.poll
    ~> "created_at" := toISOStringMaybe u.createdAt
    ~> "modified_by" := u.modifiedBy
    ~> "modified_at" := toISOStringMaybe u.modifiedAt
    ~> jsonEmptyObject



instance decodeThreadResponse :: DecodeJson ThreadResponse where
  decodeJson json = do
    obj <- decodeJson json
    id <- obj .? "id"
    userId <- obj .? "user_id"
    boardId <- obj .? "board_id"
    name <- obj .? "name"
    description <- obj .? "desc"
    sticky <- obj .? "sticky"
    locked <- obj .? "locked"
    poll <- obj .? "poll"
    createdAt <- obj .? "created_at"
    modifiedBy <- obj .? "modified_by"
    modifiedAt <- obj .? "modified_at"
    pure $ ThreadResponse {id, userId, boardId, name, description, sticky, locked, poll, createdAt, modifiedBy, modifiedAt}




instance respondableThreadResponse :: Respondable ThreadResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
    mkThreadResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "board_id" json
      <*> readProp "name" json
      <*> (runNullOrUndefined <$> readProp "desc" json)
      <*> readProp "sticky" json
      <*> readProp "locked" json
      <*> (runNullOrUndefined <$> readProp "poll" json)
      <*> readProp "created_at" json
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> readProp "modified_at" json



instance requestableThreadResponse :: Requestable ThreadResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str



instance isForeignThreadResponse :: IsForeign ThreadResponse where
  read f = mkThreadResponse
    <$> readProp "id" f
    <*> readProp "user_id" f
    <*> readProp "board_id" f
    <*> readProp "name" f
    <*> (runNullOrUndefined <$> readProp "desc" f)
    <*> readProp "sticky" f
    <*> readProp "locked" f
    <*> (runNullOrUndefined <$> readProp "poll" f)
    <*> readProp "created_at" f
    <*> (runNullOrUndefined <$> readProp "modified_by" f)
    <*> readProp "modified_at" f







newtype ThreadResponses = ThreadResponses {
  threads :: Array ThreadResponse
}

defaultThreadResponses :: ThreadResponses
defaultThreadResponses = mkThreadResponses

mkThreadResponses :: ThreadResponses
mkThreadResponses = ThreadResponses { threads: [] }

instance encodeThreadResponses :: EncodeJson ThreadResponses where
  encodeJson (ThreadResponses u) =
       "threads"    := u.threads
    ~> jsonEmptyObject

instance decodeThreadResponses :: DecodeJson ThreadResponses where
  decodeJson json = do
    obj <- decodeJson json
    threads <- obj .? "threads"
    pure $ ThreadResponses { threads: threads }

instance respondableThreadResponses :: Respondable ThreadResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    threads <- readProp "threads" json
    pure $ ThreadResponses { threads: threads }

instance requestableThreadResponses :: Requestable ThreadResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str

instance isForeignThreadResponses :: IsForeign ThreadResponses where
  read f = do
    threads <- readProp "threads" f
    pure $ ThreadResponses { threads: threads }
