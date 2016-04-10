module LN.T.Board.Response where



import LN.T.Prelude.Argonaut
import LN.T.Board
import LN.T.DateMaybe



newtype BoardResponse = BoardResponse {
  id   :: BoardId,
  userId :: Int,
  forumId :: Int,
  parentId :: Maybe Int,
  name :: String,
  description :: Maybe String,
  createdAt :: DateMaybe,
  modifiedBy :: Maybe Int,
  modifiedAt :: DateMaybe
}

_BoardResponse :: LensP BoardResponse {
    id   :: BoardId,
    userId :: Int,
    forumId :: Int,
    parentId :: Maybe Int,
    name :: String,
    description :: Maybe String,
    createdAt :: DateMaybe,
    modifiedBy :: Maybe Int,
    modifiedAt :: DateMaybe
  }
_BoardResponse f (BoardResponse o) = BoardResponse <$> f o



defaultBoardResponse :: BoardResponse
defaultBoardResponse = mkBoardResponse 0 0 0 Nothing "name" Nothing defaultDate Nothing defaultDate



mkBoardResponse :: Int -> Int -> Int -> Maybe Int -> String -> Maybe String -> DateMaybe -> Maybe Int -> DateMaybe -> BoardResponse
mkBoardResponse id userId forumId parentId name description createdAt modifiedBy modifiedAt =
  BoardResponse { id, userId, forumId, parentId, name, description, createdAt, modifiedBy, modifiedAt }




instance encodeBoardResponse :: EncodeJson BoardResponse where
  encodeJson (BoardResponse u) =
       "id"    := u.id
    ~> "user_id" := u.userId
    ~> "forum_id" := u.forumId
    ~> "parent_id" := u.parentId
    ~> "name" := u.name
    ~> "desc" := u.description
    ~> "created_at" := toISOString u.createdAt
    ~> "modified_by" := u.modifiedBy
    ~> "modified_at" := toISOString u.modifiedAt
    ~> jsonEmptyObject



instance decodeBoardResponse :: DecodeJson BoardResponse where
  decodeJson json = do
    obj <- decodeJson json
    id <- obj .? "id"
    userId <- obj .? "user_id"
    forumId <- obj .? "forum_id"
    parentId <- obj .? "parent_id"
    name <- obj .? "name"
    description <- obj .? "desc"
    createdAt <- obj .? "created_at"
    modifiedBy <- obj .? "modified_by"
    modifiedAt <- obj .? "modified_at"
    pure $ BoardResponse {id, userId, forumId, parentId, name, description, createdAt, modifiedBy, modifiedAt}



instance respondableBoardResponse :: Respondable BoardResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
    mkBoardResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "forum_id" json
      <*> (runNullOrUndefined <$> readProp "parent_id" json)
      <*> readProp "name" json
      <*> (runNullOrUndefined <$> readProp "desc" json)
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
    <*> readProp "user_id" f
    <*> readProp "forum_id" f
    <*> (runNullOrUndefined <$> readProp "parent_id" f)
    <*> readProp "name" f
    <*> (runNullOrUndefined <$> readProp "desc" f)
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
