module LN.T.Thread.Stat where



import LN.T.Prelude.Argonaut
import LN.T.Thread
import LN.T.DateMaybe



threadStatTag :: String
threadStatTag = "thread_stat"



threadsStatsTag :: String
threadsStatsTag = "threads_stats"




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
