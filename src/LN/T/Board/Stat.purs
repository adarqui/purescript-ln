module LN.T.Board.Stat where



import LN.T.Prelude.Argonaut
import LN.T.Board
import LN.T.DateMaybe



newtype BoardStatResponse = BoardStatResponse {
  id   :: BoardId,
  threads :: Int,
  threadPosts :: Int,
  views :: Int
}

_BoardStatResponse :: LensP BoardStatResponse {
    id   :: BoardId,
    threads :: Int,
    threadPosts :: Int,
    views :: Int
  }
_BoardStatResponse f (BoardStatResponse o) = BoardStatResponse <$> f o



defaultBoardStatResponse :: BoardStatResponse
defaultBoardStatResponse = mkBoardStatResponse 0 0 0 0



mkBoardStatResponse :: Int -> Int -> Int -> Int -> BoardStatResponse
mkBoardStatResponse id threads threadPosts views =
  BoardStatResponse {id, threads, threadPosts, views}




instance encodeBoardStatResponse :: EncodeJson BoardStatResponse where
  encodeJson (BoardStatResponse o) =
       "board_id"    := o.id
    ~> "threads" := o.threads
    ~> "thread_posts" := o.threadPosts
    ~> "views" := o.views
    ~> jsonEmptyObject



instance decodeBoardStatResponse :: DecodeJson BoardStatResponse where
  decodeJson json = do
    obj <- decodeJson json
    id <- obj .? "board_id"
    threads <- obj .? "threads"
    threadPosts <- obj .? "thread_posts"
    views <- obj .? "views"
    pure $ BoardStatResponse {id, threads, threadPosts, views}



instance respondableBoardStatResponse :: Respondable BoardStatResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
    mkBoardStatResponse
      <$> readProp "board_id" json
      <*> readProp "threads" json
      <*> readProp "thread_posts" json
      <*> readProp "views" json



instance requestableBoardStatResponse :: Requestable BoardStatResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str



instance isForeignBoardStatResponse :: IsForeign BoardStatResponse where
  read f = mkBoardStatResponse
    <$> readProp "board_id" f
    <*> readProp "threads" f
    <*> readProp "thread_posts" f
    <*> readProp "views" f







newtype BoardStatResponses = BoardStatResponses {
  boardsStats :: Array BoardStatResponse
}

defaultBoardStatResponses :: BoardStatResponses
defaultBoardStatResponses = mkBoardStatResponses

mkBoardStatResponses :: BoardStatResponses
mkBoardStatResponses = BoardStatResponses { boardsStats: [] }

instance encodeBoardStatResponses :: EncodeJson BoardStatResponses where
  encodeJson (BoardStatResponses o) =
       boardsStatsTag := o.boardsStats
    ~> jsonEmptyObject

instance decodeBoardStatResponses :: DecodeJson BoardStatResponses where
  decodeJson json = do
    obj <- decodeJson json
    boardsStats <- obj .? boardsStatsTag
    pure $ BoardStatResponses { boardsStats: boardsStats }

instance respondableBoardStatResponses :: Respondable BoardStatResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    boardsStats <- readProp boardsStatsTag json
    pure $ BoardStatResponses { boardsStats: boardsStats }

instance requestableBoardStatResponses :: Requestable BoardStatResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str

instance isForeignBoardStatResponses :: IsForeign BoardStatResponses where
  read f = do
    boardsStats <- readProp boardsStatsTag f
    pure $ BoardStatResponses { boardsStats: boardsStats }
