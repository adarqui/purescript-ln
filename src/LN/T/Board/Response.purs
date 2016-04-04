module LN.T.Board.Response where



import LN.T.Prelude.Argonaut
import LN.T.Board
import LN.T.DateMaybe



newtype BoardResponse = BoardResponse {
  id   :: BoardId,
  forumId :: Int,
  parentId :: Maybe Int,
  name :: String,
  description :: Maybe String,
  createdBy :: Int,
  createdAt :: DateMaybe,
  modifiedBy :: Maybe Int,
  modifiedAt :: DateMaybe
}

_BoardResponse :: LensP BoardResponse {
    id   :: BoardId,
    forumId :: Int,
    parentId :: Maybe Int,
    name :: String,
    description :: Maybe String,
    createdBy :: Int,
    createdAt :: DateMaybe,
    modifiedBy :: Maybe Int,
    modifiedAt :: DateMaybe
  }
_BoardResponse f (BoardResponse o) = BoardResponse <$> f o



defaultBoardResponse :: BoardResponse
defaultBoardResponse = mkBoardResponse 0 0 Nothing "name" Nothing 0 defaultDate Nothing defaultDate



mkBoardResponse :: Int -> Int -> Maybe Int -> String -> Maybe String -> Int -> DateMaybe -> Maybe Int -> DateMaybe -> BoardResponse
mkBoardResponse id forumId parentId name description createdBy createdAt modifiedBy modifiedAt =
  BoardResponse { id, forumId, parentId, name, description, createdBy, createdAt, modifiedBy, modifiedAt }




instance encodeBoardResponse :: EncodeJson BoardResponse where
  encodeJson (BoardResponse u) =
       "id"    := u.id
    ~> "forum_id" := u.forumId
    ~> "parent_id" := u.parentId
    ~> "name" := u.name
    ~> "desc" := u.description
    ~> "created_by" := u.createdBy
    ~> "created_at" := toISOString u.createdAt
    ~> "modified_by" := u.modifiedBy
    ~> "modified_at" := toISOString u.modifiedAt
    ~> jsonEmptyObject



instance decodeBoardResponse :: DecodeJson BoardResponse where
  decodeJson json = do
    obj <- decodeJson json
    id <- obj .? "id"
    forumId <- obj .? "forum_id"
    parentId <- obj .? "parent_id"
    name <- obj .? "name"
    description <- obj .? "desc"
    createdBy <- obj .? "created_by"
    createdAt <- obj .? "created_at"
    modifiedBy <- obj .? "modified_by"
    modifiedAt <- obj .? "modified_at"
    pure $ BoardResponse {id, forumId, parentId, name, description, createdBy, createdAt, modifiedBy, modifiedAt}



instance respondableBoardResponse :: Respondable BoardResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
    mkBoardResponse
      <$> readProp "id" json
      <*> readProp "forum_id" json
      <*> (runNullOrUndefined <$> readProp "parent_id" json)
      <*> readProp "name" json
      <*> (runNullOrUndefined <$> readProp "desc" json)
      <*> readProp "created_by" json
      <*> readProp "created_at" json
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> readProp "modified_at" json



instance requestableBoardResponse :: Requestable BoardResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str



instance isForeignBoardResponse :: IsForeign BoardResponse where
  read f = mkBoardResponse
    <$> readProp "id" f
    <*> readProp "forum_id" f
    <*> (runNullOrUndefined <$> readProp "parent_id" f)
    <*> readProp "name" f
    <*> (runNullOrUndefined <$> readProp "desc" f)
    <*> readProp "created_by" f
    <*> readProp "created_at" f
    <*> (runNullOrUndefined <$> readProp "modified_by" f)
    <*> readProp "modified_at" f







newtype BoardResponses = BoardResponses {
  boards :: Array BoardResponse
}

defaultBoardResponses :: BoardResponses
defaultBoardResponses = mkBoardResponses

mkBoardResponses :: BoardResponses
mkBoardResponses = BoardResponses { boards: [] }

instance encodeBoardResponses :: EncodeJson BoardResponses where
  encodeJson (BoardResponses o) =
       boardsTag := o.boards
    ~> jsonEmptyObject

instance decodeBoardResponses :: DecodeJson BoardResponses where
  decodeJson json = do
    obj <- decodeJson json
    boards <- obj .? boardsTag
    pure $ BoardResponses { boards: boards }

instance respondableBoardResponses :: Respondable BoardResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    boards <- readProp boardsTag json
    pure $ BoardResponses { boards: boards }

instance requestableBoardResponses :: Requestable BoardResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str

instance isForeignBoardResponses :: IsForeign BoardResponses where
  read f = do
    boards <- readProp boardsTag f
    pure $ BoardResponses { boards: boards }











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
       "id"    := o.id
    ~> "threads" := o.threads
    ~> "thread_posts" := o.threadPosts
    ~> "views" := o.views
    ~> jsonEmptyObject



instance decodeBoardStatResponse :: DecodeJson BoardStatResponse where
  decodeJson json = do
    obj <- decodeJson json
    id <- obj .? "id"
    threads <- obj .? "threads"
    threadPosts <- obj .? "thread_posts"
    views <- obj .? "views"
    pure $ BoardStatResponse {id, threads, threadPosts, views}



instance respondableBoardStatResponse :: Respondable BoardStatResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
    mkBoardStatResponse
      <$> readProp "id" json
      <*> readProp "threads" json
      <*> readProp "thread_posts" json
      <*> readProp "views" json



instance requestableBoardStatResponse :: Requestable BoardStatResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str



instance isForeignBoardStatResponse :: IsForeign BoardStatResponse where
  read f = mkBoardStatResponse
    <$> readProp "id" f
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
