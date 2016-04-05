module LN.T.Thread.Response where



import LN.T.Prelude.Argonaut
import LN.T.Thread
import LN.T.DateMaybe



newtype ThreadResponse = ThreadResponse {
  id   :: ThreadId,
  boardId :: Int,
  name :: String,
  description :: Maybe String,
  sticky :: Boolean,
  locked :: Boolean,
  poll :: Maybe String,
  createdBy :: Int,
  createdAt :: DateMaybe,
  createdAtMoment :: String,
  modifiedBy :: Maybe Int,
  modifiedAt :: DateMaybe
}

_ThreadResponse :: LensP ThreadResponse {
  id   :: ThreadId,
  boardId :: Int,
  name :: String,
  description :: Maybe String,
  sticky :: Boolean,
  locked :: Boolean,
  poll :: Maybe String,
  createdBy :: Int,
  createdAt :: DateMaybe,
  createdAtMoment :: String,
  modifiedBy :: Maybe Int,
  modifiedAt :: DateMaybe
}

_ThreadResponse f (ThreadResponse o) = ThreadResponse <$> f o




defaultThreadResponse :: ThreadResponse
defaultThreadResponse = mkThreadResponse 0 0 "name" Nothing false false Nothing 0 defaultDate "moment" Nothing defaultDate



mkThreadResponse :: Int -> Int -> String -> Maybe String -> Boolean -> Boolean -> Maybe String -> Int -> DateMaybe -> String -> Maybe Int -> DateMaybe -> ThreadResponse
mkThreadResponse id boardId name description sticky locked poll createdBy createdAt createdAtMoment modifiedBy modifiedAt =
  ThreadResponse { id, boardId, name, description, sticky, locked, poll, createdBy, createdAt, createdAtMoment, modifiedBy, modifiedAt }




instance encodeThreadResponse :: EncodeJson ThreadResponse where
  encodeJson (ThreadResponse u) =
       "id"    := u.id
    ~> "board_id" := u.boardId
    ~> "name" := u.name
    ~> "desc" := u.description
    ~> "sticky" := u.sticky
    ~> "locked" := u.locked
    ~> "poll" := u.poll
    ~> "created_by" := u.createdBy
    ~> "created_at" := toISOString u.createdAt
    ~> "created_at_moment" := u.createdAtMoment
    ~> "modified_by" := u.modifiedBy
    ~> "modified_at" := toISOString u.modifiedAt
    ~> jsonEmptyObject



instance decodeThreadResponse :: DecodeJson ThreadResponse where
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
    pure $ ThreadResponse {id, boardId, name, description, sticky, locked, poll, createdBy, createdAt, createdAtMoment, modifiedBy, modifiedAt}
    where
    createdAtMoment = "moment"




instance respondableThreadResponse :: Respondable ThreadResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
    mkThreadResponse
      <$> readProp "id" json
      <*> readProp "board_id" json
      <*> readProp "name" json
      <*> (runNullOrUndefined <$> readProp "desc" json)
      <*> readProp "sticky" json
      <*> readProp "locked" json
      <*> (runNullOrUndefined <$> readProp "poll" json)
      <*> readProp "created_by" json
      <*> readProp "created_at" json
      <*> pure "moment"
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> readProp "modified_at" json



instance requestableThreadResponse :: Requestable ThreadResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str



instance isForeignThreadResponse :: IsForeign ThreadResponse where
  read f = mkThreadResponse
    <$> readProp "id" f
    <*> readProp "board_id" f
    <*> readProp "name" f
    <*> (runNullOrUndefined <$> readProp "desc" f)
    <*> readProp "sticky" f
    <*> readProp "locked" f
    <*> (runNullOrUndefined <$> readProp "poll" f)
    <*> readProp "created_by" f
    <*> readProp "created_at" f
    <*> pure "moment"
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






newtype ThreadStatResponse = ThreadStatResponse {
  id   :: ThreadId,
  threadPosts :: Int,
  views :: Int
}

_ThreadStatResponse :: LensP ThreadStatResponse {
    id   :: ThreadId,
    threadPosts :: Int,
    views :: Int
  }
_ThreadStatResponse f (ThreadStatResponse o) = ThreadStatResponse <$> f o



defaultThreadStatResponse :: ThreadStatResponse
defaultThreadStatResponse = mkThreadStatResponse 0 0 0



mkThreadStatResponse :: Int -> Int -> Int -> ThreadStatResponse
mkThreadStatResponse id threadPosts views =
  ThreadStatResponse {id, threadPosts, views}




instance encodeThreadStatResponse :: EncodeJson ThreadStatResponse where
  encodeJson (ThreadStatResponse o) =
       "thread_id"    := o.id
    ~> "thread_posts" := o.threadPosts
    ~> "views" := o.views
    ~> jsonEmptyObject



instance decodeThreadStatResponse :: DecodeJson ThreadStatResponse where
  decodeJson json = do
    obj <- decodeJson json
    id <- obj .? "thread_id"
    threadPosts <- obj .? "thread_posts"
    views <- obj .? "views"
    pure $ ThreadStatResponse {id, threadPosts, views}



instance respondableThreadStatResponse :: Respondable ThreadStatResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
    mkThreadStatResponse
      <$> readProp "thread_id" json
      <*> readProp "thread_posts" json
      <*> readProp "views" json



instance requestableThreadStatResponse :: Requestable ThreadStatResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str



instance isForeignThreadStatResponse :: IsForeign ThreadStatResponse where
  read f = mkThreadStatResponse
    <$> readProp "thread_id" f
    <*> readProp "thread_posts" f
    <*> readProp "views" f






newtype ThreadStatResponses = ThreadStatResponses {
  threadsStats :: Array ThreadStatResponse
}

defaultThreadStatResponses :: ThreadStatResponses
defaultThreadStatResponses = mkThreadStatResponses

mkThreadStatResponses :: ThreadStatResponses
mkThreadStatResponses = ThreadStatResponses { threadsStats: [] }

instance encodeThreadStatResponses :: EncodeJson ThreadStatResponses where
  encodeJson (ThreadStatResponses o) =
       threadsStatsTag := o.threadsStats
    ~> jsonEmptyObject

instance decodeThreadStatResponses :: DecodeJson ThreadStatResponses where
  decodeJson json = do
    obj <- decodeJson json
    threadsStats <- obj .? threadsStatsTag
    pure $ ThreadStatResponses { threadsStats: threadsStats }

instance respondableThreadStatResponses :: Respondable ThreadStatResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    threadsStats <- readProp threadsStatsTag json
    pure $ ThreadStatResponses { threadsStats: threadsStats }

instance requestableThreadStatResponses :: Requestable ThreadStatResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str

instance isForeignThreadStatResponses :: IsForeign ThreadStatResponses where
  read f = do
    threadsStats <- readProp threadsStatsTag f
    pure $ ThreadStatResponses { threadsStats: threadsStats }
