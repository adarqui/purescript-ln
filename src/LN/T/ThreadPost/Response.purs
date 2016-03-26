module LN.T.ThreadPost.Response where



import LN.T.Prelude.Argonaut
import LN.T.ThreadPost
import LN.T.DateMaybe



newtype ThreadPostResponse = ThreadPostResponse {
  id   :: ThreadPostId,
  userId :: Int,
  threadId :: Int,
  parentId :: Maybe Int,
  title :: Maybe String,
  body :: String,
  createdBy :: Int,
  createdAt :: DateMaybe,
  modifiedBy :: Maybe Int,
  modifiedAt :: DateMaybe
}



defaultThreadPostResponse :: ThreadPostResponse
defaultThreadPostResponse = mkThreadPostResponse 0 0 0 Nothing Nothing "body" 0 defaultDate Nothing defaultDate



mkThreadPostResponse :: Int -> Int -> Int -> Maybe Int -> Maybe String -> String -> Int -> DateMaybe -> Maybe Int -> DateMaybe -> ThreadPostResponse
mkThreadPostResponse id userId threadId parentId title body createdBy createdAt modifiedBy modifiedAt =
  ThreadPostResponse { id, userId, threadId, parentId, title, body, createdBy, createdAt, modifiedBy, modifiedAt }




instance encodeThreadPostResponse :: EncodeJson ThreadPostResponse where
  encodeJson (ThreadPostResponse u) =
       "id"    := u.id
    ~> "user_id" := u.userId
    ~> "thread_id" := u.threadId
    ~> "parent_id" := u.parentId
    ~> "title" := u.title
    ~> "body" := u.body
    ~> "created_by" := u.createdBy
    ~> "created_at" := toISOString u.createdAt
    ~> "modified_by" := u.modifiedBy
    ~> "modified_at" := toISOString u.modifiedAt
    ~> jsonEmptyObject



instance decodeThreadPostResponse :: DecodeJson ThreadPostResponse where
  decodeJson json = do
    obj <- decodeJson json
    id <- obj .? "id"
    userId <- obj .? "user_id"
    threadId <- obj .? "thread_id"
    parentId <- obj .? "parent_id"
    title <- obj .? "title"
    body <- obj .? "body"
    createdBy <- obj .? "created_by"
    createdAt <- obj .? "created_at"
    modifiedBy <- obj .? "modified_by"
    modifiedAt <- obj .? "modified_at"
    pure $ ThreadPostResponse {id, userId, threadId, parentId, title, body, createdBy, createdAt, modifiedBy, modifiedAt}



instance respondableThreadPostResponse :: Respondable ThreadPostResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
    mkThreadPostResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "thread_id" json
      <*> (runNullOrUndefined <$> readProp "parent_id" json)
      <*> (runNullOrUndefined <$> readProp "title" json)
      <*> readProp "body" json
      <*> readProp "created_by" json
      <*> readProp "created_at" json
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> readProp "modified_at" json



instance requestableThreadPostResponse :: Requestable ThreadPostResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str



instance isForeignThreadPostResponse :: IsForeign ThreadPostResponse where
  read f = mkThreadPostResponse
    <$> readProp "id" f
    <*> readProp "user_id" f
    <*> readProp "thread_id" f
    <*> (runNullOrUndefined <$> readProp "parent_id" f)
    <*> (runNullOrUndefined <$> readProp "title" f)
    <*> readProp "body" f
    <*> readProp "created_by" f
    <*> readProp "created_at" f
    <*> (runNullOrUndefined <$> readProp "modified_by" f)
    <*> readProp "modified_at" f







newtype ThreadPostResponses = ThreadPostResponses {
  threadPosts :: Array ThreadPostResponse
}

defaultThreadPostResponses :: ThreadPostResponses
defaultThreadPostResponses = mkThreadPostResponses

mkThreadPostResponses :: ThreadPostResponses
mkThreadPostResponses = ThreadPostResponses { threadPosts: [] }

instance encodeThreadPostResponses :: EncodeJson ThreadPostResponses where
  encodeJson (ThreadPostResponses u) =
       "thread_posts"    := u.threadPosts
    ~> jsonEmptyObject

instance decodeThreadPostResponses :: DecodeJson ThreadPostResponses where
  decodeJson json = do
    obj <- decodeJson json
    threadPosts <- obj .? "thread_posts"
    pure $ ThreadPostResponses { threadPosts: threadPosts }

instance respondableThreadPostResponses :: Respondable ThreadPostResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    threadPosts <- readProp "thread_posts" json
    pure $ ThreadPostResponses { threadPosts: threadPosts }

instance requestableThreadPostResponses :: Requestable ThreadPostResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str

instance isForeignThreadPostResponses :: IsForeign ThreadPostResponses where
  read f = do
    threadPosts <- readProp "thread_posts" f
    pure $ ThreadPostResponses { threadPosts: threadPosts }
