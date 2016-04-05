module LN.T.Packs.Thread where



import LN.T.Prelude.Argonaut
import LN.T.Thread
import LN.T.Thread.Response
import LN.T.Thread
import LN.T.Thread.Response
import LN.T.ThreadPost
import LN.T.ThreadPost.Response
import LN.T.User
import LN.T.User.Response.Sanitized
import LN.T.DateMaybe



threadPackTag :: String
threadPackTag = "thread_pack"



threadsPacksTag :: String
threadsPacksTag = "threads_packs"



newtype ThreadPackResponse = ThreadPackResponse {
  thread :: ThreadResponse,
  threadStat :: ThreadStatResponse,
  latestThreadPost :: Maybe ThreadPostResponse,
  latestThreadPostUser :: Maybe UserSanitizedResponse
}



_ThreadPackResponse :: LensP ThreadPackResponse {
    thread :: ThreadResponse,
    threadStat :: ThreadStatResponse,
    latestThreadPost :: Maybe ThreadPostResponse,
    latestThreadPostUser :: Maybe UserSanitizedResponse
  }
_ThreadPackResponse f (ThreadPackResponse o) = ThreadPackResponse <$> f o



defaultThreadPackResponse :: ThreadPackResponse
defaultThreadPackResponse = mkThreadPackResponse defaultThreadResponse defaultThreadStatResponse Nothing Nothing



mkThreadPackResponse :: ThreadResponse -> ThreadStatResponse -> Maybe ThreadPostResponse -> Maybe UserSanitizedResponse -> ThreadPackResponse
mkThreadPackResponse thread threadStat latestThreadPost latestThreadPostUser =
  ThreadPackResponse {thread, threadStat, latestThreadPost, latestThreadPostUser}




instance encodeThreadPackResponse :: EncodeJson ThreadPackResponse where
  encodeJson (ThreadPackResponse o) =
       "thread"    := o.thread
    ~> "thread_stat" := o.threadStat
    ~> "latest_thread_post" := o.latestThreadPost
    ~> "latest_thread_post_user" := o.latestThreadPostUser
    ~> jsonEmptyObject



instance decodeThreadPackResponse :: DecodeJson ThreadPackResponse where
  decodeJson json = do
    obj <- decodeJson json
    thread <- obj .? "thread"
    threadStat <- obj .? "thread_stat"
    latestThreadPost <- obj .? "latest_thread_post"
    latestThreadPostUser <- obj .? "latest_thread_post_user"
    pure $ ThreadPackResponse {thread, threadStat, latestThreadPost, latestThreadPostUser}




instance respondableThreadPackResponse :: Respondable ThreadPackResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse f =
    mkThreadPackResponse
      <$> readProp "thread" f
      <*> readProp "thread_stat" f
      <*> (runNullOrUndefined <$> readProp "latest_thread_post" f)
      <*> (runNullOrUndefined <$> readProp "latest_thread_post_user" f)



instance requestableThreadPackResponse :: Requestable ThreadPackResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str



instance isForeignThreadPackResponse :: IsForeign ThreadPackResponse where
  read f = mkThreadPackResponse
    <$> readProp "thread" f
    <*> readProp "thread_stat" f
    <*> (runNullOrUndefined <$> readProp "latest_thread_post" f)
    <*> (runNullOrUndefined <$> readProp "latest_thread_post_user" f)




newtype ThreadPackResponses = ThreadPackResponses {
  threadsPacks :: Array ThreadPackResponse
}

defaultThreadPackResponses :: ThreadPackResponses
defaultThreadPackResponses = mkThreadPackResponses

mkThreadPackResponses :: ThreadPackResponses
mkThreadPackResponses = ThreadPackResponses { threadsPacks: [] }

instance encodeThreadPackResponses :: EncodeJson ThreadPackResponses where
  encodeJson (ThreadPackResponses o) =
       threadsPacksTag  := o.threadsPacks
    ~> jsonEmptyObject

instance decodeThreadPackResponses :: DecodeJson ThreadPackResponses where
  decodeJson json = do
    obj <- decodeJson json
    threadsPacks <- obj .? threadsPacksTag
    pure $ ThreadPackResponses { threadsPacks: threadsPacks }

instance respondableThreadPackResponses :: Respondable ThreadPackResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    threadsPacks <- readProp threadsPacksTag json
    pure $ ThreadPackResponses { threadsPacks: threadsPacks }

instance requestableThreadPackResponses :: Requestable ThreadPackResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str

instance isForeignThreadPackResponses :: IsForeign ThreadPackResponses where
  read f = do
    threadsPacks <- readProp threadsPacksTag f
    pure $ ThreadPackResponses { threadsPacks: threadsPacks }
