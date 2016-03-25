module LN.T.Board.Response where



import LN.T.Prelude.Argonaut
import LN.T.Board
import LN.T.DateMaybe



newtype BoardResponse = BoardResponse {
  id   :: BoardId,
  forumId :: Int,
  parentId :: Int,
  name :: String,
  description :: Maybe String,
  createdBy :: Int,
  createdAt :: DateMaybe,
  modifiedBy :: Maybe Int,
  modifiedAt :: DateMaybe
}



defaultBoardResponse :: BoardResponse
defaultBoardResponse = mkBoardResponse 0 0 0 "name" Nothing 0 defaultDate Nothing defaultDate



mkBoardResponse :: Int -> Int -> Int -> String -> Maybe String -> Int -> DateMaybe -> Maybe Int -> DateMaybe -> BoardResponse
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
      <*> readProp "parent_id" json
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
    <*> readProp "parent_id" f
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
  encodeJson (BoardResponses u) =
       "boards"    := u.boards
    ~> jsonEmptyObject

instance decodeBoardResponses :: DecodeJson BoardResponses where
  decodeJson json = do
    obj <- decodeJson json
    boards <- obj .? "boards"
    pure $ BoardResponses { boards: boards }

instance respondableBoardResponses :: Respondable BoardResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    boards <- readProp "boards" json
    pure $ BoardResponses { boards: boards }

instance requestableBoardResponses :: Requestable BoardResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str

instance isForeignBoardResponses :: IsForeign BoardResponses where
  read f = do
    boards <- readProp "boards" f
    pure $ BoardResponses { boards: boards }
