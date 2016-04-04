module LN.T.Packs.Board where



import LN.T.Prelude.Argonaut
import LN.T.Board
import LN.T.Board.Response
import LN.T.Thread
import LN.T.Thread.Response
import LN.T.ThreadPost
import LN.T.ThreadPost.Response
import LN.T.User
import LN.T.User.Response.Sanitized
import LN.T.DateMaybe



boardPackTag :: String
boardPackTag = "board_pack"



boardsPacksTag :: String
boardsPacksTag = "boards_packs"



newtype BoardPackResponse = BoardPackResponse {
  board :: BoardResponse,
  boardStat :: BoardStatResponse,
  latestThread :: Maybe ThreadResponse,
  latestThreadPost :: Maybe ThreadPostResponse,
  latestThreadPostUser :: Maybe UserResponseSanitized
}



_BoardPackResponse :: LensP BoardPackResponse {
    board :: BoardResponse,
    boardStat :: BoardStatResponse,
    latestThread :: Maybe ThreadResponse,
    latestThreadPost :: Maybe ThreadPostResponse,
    latestThreadPostUser :: Maybe UserResponseSanitized
  }
_BoardPackResponse f (BoardPackResponse o) = BoardPackResponse <$> f o



defaultBoardPackResponse :: BoardPackResponse
defaultBoardPackResponse = mkBoardPackResponse defaultBoardResponse defaultBoardStatResponse Nothing Nothing Nothing



mkBoardPackResponse :: BoardResponse -> BoardStatResponse -> Maybe ThreadResponse -> Maybe ThreadPostResponse -> Maybe UserResponseSanitized -> BoardPackResponse
mkBoardPackResponse board boardStat latestThread latestThreadPost latestThreadPostUser =
  BoardPackResponse {board, boardStat, latestThread, latestThreadPost, latestThreadPostUser}




instance encodeBoardPackResponse :: EncodeJson BoardPackResponse where
  encodeJson (BoardPackResponse o) =
       "board"    := o.board
    ~> "board_stat" := o.boardStat
    ~> "latest_thread" := o.latestThread
    ~> "latest_thread_post" := o.latestThreadPost
    ~> "latest_thread_post_user" := o.latestThreadPostUser
    ~> jsonEmptyObject



instance decodeBoardPackResponse :: DecodeJson BoardPackResponse where
  decodeJson json = do
    obj <- decodeJson json
    board <- obj .? "board"
    boardStat <- obj .? "board_stat"
    latestThread <- obj .? "latest_thread"
    latestThreadPost <- obj .? "latest_thread_post"
    latestThreadPostUser <- obj .? "latest_thread_post_user"
    pure $ BoardPackResponse {board, boardStat, latestThread, latestThreadPost, latestThreadPostUser}




instance respondableBoardPackResponse :: Respondable BoardPackResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse f =
    mkBoardPackResponse
      <$> readProp "board" f
      <*> readProp "board_stat" f
      <*> (runNullOrUndefined <$> readProp "latest_thread" f)
      <*> (runNullOrUndefined <$> readProp "latest_thread_post" f)
      <*> (runNullOrUndefined <$> readProp "latest_thread_post_user" f)



instance requestableBoardPackResponse :: Requestable BoardPackResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str



instance isForeignBoardPackResponse :: IsForeign BoardPackResponse where
  read f = mkBoardPackResponse
    <$> readProp "board" f
    <*> readProp "board_stat" f
    <*> (runNullOrUndefined <$> readProp "latest_thread" f)
    <*> (runNullOrUndefined <$> readProp "latest_thread_post" f)
    <*> (runNullOrUndefined <$> readProp "latest_thread_post_user" f)




newtype BoardPackResponses = BoardPackResponses {
  boardsPacks :: Array BoardPackResponse
}

defaultBoardPackResponses :: BoardPackResponses
defaultBoardPackResponses = mkBoardPackResponses

mkBoardPackResponses :: BoardPackResponses
mkBoardPackResponses = BoardPackResponses { boardsPacks: [] }

instance encodeBoardPackResponses :: EncodeJson BoardPackResponses where
  encodeJson (BoardPackResponses o) =
       boardsPacksTag  := o.boardsPacks
    ~> jsonEmptyObject

instance decodeBoardPackResponses :: DecodeJson BoardPackResponses where
  decodeJson json = do
    obj <- decodeJson json
    boardsPacks <- obj .? boardsPacksTag
    pure $ BoardPackResponses { boardsPacks: boardsPacks }

instance respondableBoardPackResponses :: Respondable BoardPackResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    boardsPacks <- readProp boardsPacksTag json
    pure $ BoardPackResponses { boardsPacks: boardsPacks }

instance requestableBoardPackResponses :: Requestable BoardPackResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str

instance isForeignBoardPackResponses :: IsForeign BoardPackResponses where
  read f = do
    boardsPacks <- readProp boardsPacksTag f
    pure $ BoardPackResponses { boardsPacks: boardsPacks }
