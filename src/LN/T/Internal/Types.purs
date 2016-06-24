module LN.T.Internal.Types where


import Control.Monad.Aff
import Data.Argonaut.Combinators
import Data.Argonaut.Core
import Data.Argonaut.Decode
import Data.Argonaut.Encode
import Data.Argonaut.Printer
import Data.Date.Helpers
import Data.Either
import Data.Foreign
import Data.Foreign.NullOrUndefined
import Data.Foreign.Class
import Data.JSON
import Data.List (List ())
import Data.Maybe
import Data.Set (Set ())
import Data.Tuple
import Network.HTTP.Affjax.Request
import Network.HTTP.Affjax.Response
import Optic.Lens
import Optic.Core
import Prelude

import Purescript.Api.Helpers

data ACL
  = ACL_Grant Permissions
  | ACL_Deny 



instance aCLEncodeJson :: EncodeJson ACL where
  encodeJson (ACL_Grant x0) =
       "tag" := "ACL_Grant"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ACL_Deny ) =
       "tag" := "ACL_Deny"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject


instance aCLDecodeJson :: DecodeJson ACL where
  decodeJson json = do
    obj <- decodeJson json
    tag <- obj .? "tag"
    case tag of
        "ACL_Grant" -> do
          x0 <- obj .? "contents"
          ACL_Grant <$> decodeJson x0

        "ACL_Deny" -> do
          return ACL_Deny

  decodeJson x = fail $ "Could not parse object: " ++ show x


instance aCLRequestable :: Requestable ACL where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance aCLRespondable :: Respondable ACL where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    tag <- readProp "tag" json
    case tag of
        "ACL_Grant" -> do
          x0 <- readProp "contents" json
          ACL_Grant <$> read x0

        "ACL_Deny" -> do
          return ACL_Deny



instance aCLIsForeign :: IsForeign ACL where
  read json = do
    tag <- readProp "tag" json
    case tag of
        "ACL_Grant" -> do
          x0 <- readProp "contents" json
          ACL_Grant <$> read x0

        "ACL_Deny" -> do
          return ACL_Deny



instance aCLShow :: Show ACL where
  show (ACL_Grant x0) = "ACL_Grant: " ++ show x0
  show (ACL_Deny) = "ACL_Deny"


instance aCLEq :: Eq ACL where
  eq (ACL_Grant x0a) (ACL_Grant x0b) = x0a == x0b
  eq (ACL_Deny) (ACL_Deny) = true
  eq _ _ = false

newtype ApiRequest = ApiRequest {
  comment :: (Maybe String),
  guard :: Int
}


type ApiRequestR = {
  comment :: (Maybe String),
  guard :: Int
}


_ApiRequest :: LensP ApiRequest {
  comment :: (Maybe String),
  guard :: Int
}
_ApiRequest f (ApiRequest o) = ApiRequest <$> f o


mkApiRequest :: (Maybe String) -> Int -> ApiRequest
mkApiRequest comment guard =
  ApiRequest{comment, guard}


unwrapApiRequest (ApiRequest r) = r

instance apiRequestEncodeJson :: EncodeJson ApiRequest where
  encodeJson (ApiRequest o) =
       "tag" := "ApiRequest"
    ~> "comment" := o.comment
    ~> "guard" := o.guard
    ~> jsonEmptyObject


instance apiRequestDecodeJson :: DecodeJson ApiRequest where
  decodeJson o = do
    obj <- decodeJson o
    comment <- obj .? "comment"
    guard <- obj .? "guard"
    pure $ ApiRequest {
      comment,
      guard
    }


instance apiRequestRequestable :: Requestable ApiRequest where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance apiRequestRespondable :: Respondable ApiRequest where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkApiRequest
      <$> (runNullOrUndefined <$> readProp "comment" json)
      <*> readProp "guard" json


instance apiRequestIsForeign :: IsForeign ApiRequest where
  read json =
      mkApiRequest
      <$> (runNullOrUndefined <$> readProp "comment" json)
      <*> readProp "guard" json


instance apiRequestShow :: Show ApiRequest where
    show (ApiRequest o) = show "comment: " ++ show o.comment ++ ", " ++ show "guard: " ++ show o.guard

newtype ApiResponse = ApiResponse {
  id :: Int,
  userId :: Int,
  key :: String,
  comment :: (Maybe String),
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}


type ApiResponseR = {
  id :: Int,
  userId :: Int,
  key :: String,
  comment :: (Maybe String),
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}


_ApiResponse :: LensP ApiResponse {
  id :: Int,
  userId :: Int,
  key :: String,
  comment :: (Maybe String),
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}
_ApiResponse f (ApiResponse o) = ApiResponse <$> f o


mkApiResponse :: Int -> Int -> String -> (Maybe String) -> Int -> (Maybe Date) -> (Maybe Date) -> ApiResponse
mkApiResponse id userId key comment guard createdAt modifiedAt =
  ApiResponse{id, userId, key, comment, guard, createdAt, modifiedAt}


unwrapApiResponse (ApiResponse r) = r

instance apiResponseEncodeJson :: EncodeJson ApiResponse where
  encodeJson (ApiResponse o) =
       "tag" := "ApiResponse"
    ~> "id" := o.id
    ~> "user_id" := o.userId
    ~> "key" := o.key
    ~> "comment" := o.comment
    ~> "guard" := o.guard
    ~> "created_at" := o.createdAt
    ~> "modified_at" := o.modifiedAt
    ~> jsonEmptyObject


instance apiResponseDecodeJson :: DecodeJson ApiResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    userId <- obj .? "user_id"
    key <- obj .? "key"
    comment <- obj .? "comment"
    guard <- obj .? "guard"
    createdAt <- obj .? "created_at"
    modifiedAt <- obj .? "modified_at"
    pure $ ApiResponse {
      id,
      userId,
      key,
      comment,
      guard,
      createdAt,
      modifiedAt
    }


instance apiResponseRequestable :: Requestable ApiResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance apiResponseRespondable :: Respondable ApiResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkApiResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "key" json
      <*> (runNullOrUndefined <$> readProp "comment" json)
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance apiResponseIsForeign :: IsForeign ApiResponse where
  read json =
      mkApiResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "key" json
      <*> (runNullOrUndefined <$> readProp "comment" json)
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance apiResponseShow :: Show ApiResponse where
    show (ApiResponse o) = show "id: " ++ show o.id ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "key: " ++ show o.key ++ ", " ++ show "comment: " ++ show o.comment ++ ", " ++ show "guard: " ++ show o.guard ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt

newtype ApiResponses = ApiResponses {
  apiResponses :: (Array ApiResponse)
}


type ApiResponsesR = {
  apiResponses :: (Array ApiResponse)
}


_ApiResponses :: LensP ApiResponses {
  apiResponses :: (Array ApiResponse)
}
_ApiResponses f (ApiResponses o) = ApiResponses <$> f o


mkApiResponses :: (Array ApiResponse) -> ApiResponses
mkApiResponses apiResponses =
  ApiResponses{apiResponses}


unwrapApiResponses (ApiResponses r) = r

instance apiResponsesEncodeJson :: EncodeJson ApiResponses where
  encodeJson (ApiResponses o) =
       "tag" := "ApiResponses"
    ~> "api_responses" := o.apiResponses
    ~> jsonEmptyObject


instance apiResponsesDecodeJson :: DecodeJson ApiResponses where
  decodeJson o = do
    obj <- decodeJson o
    apiResponses <- obj .? "api_responses"
    pure $ ApiResponses {
      apiResponses
    }


instance apiResponsesRequestable :: Requestable ApiResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance apiResponsesRespondable :: Respondable ApiResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkApiResponses
      <$> readProp "api_responses" json


instance apiResponsesIsForeign :: IsForeign ApiResponses where
  read json =
      mkApiResponses
      <$> readProp "api_responses" json


instance apiResponsesShow :: Show ApiResponses where
    show (ApiResponses o) = show "apiResponses: " ++ show o.apiResponses

newtype BoardRequest = BoardRequest {
  displayName :: String,
  description :: (Maybe String),
  isAnonymous :: Boolean,
  canCreateSubBoards :: Boolean,
  canCreateThreads :: Boolean,
  suggestedTags :: (Array String),
  icon :: (Maybe String),
  tags :: (Array String),
  guard :: Int
}


type BoardRequestR = {
  displayName :: String,
  description :: (Maybe String),
  isAnonymous :: Boolean,
  canCreateSubBoards :: Boolean,
  canCreateThreads :: Boolean,
  suggestedTags :: (Array String),
  icon :: (Maybe String),
  tags :: (Array String),
  guard :: Int
}


_BoardRequest :: LensP BoardRequest {
  displayName :: String,
  description :: (Maybe String),
  isAnonymous :: Boolean,
  canCreateSubBoards :: Boolean,
  canCreateThreads :: Boolean,
  suggestedTags :: (Array String),
  icon :: (Maybe String),
  tags :: (Array String),
  guard :: Int
}
_BoardRequest f (BoardRequest o) = BoardRequest <$> f o


mkBoardRequest :: String -> (Maybe String) -> Boolean -> Boolean -> Boolean -> (Array String) -> (Maybe String) -> (Array String) -> Int -> BoardRequest
mkBoardRequest displayName description isAnonymous canCreateSubBoards canCreateThreads suggestedTags icon tags guard =
  BoardRequest{displayName, description, isAnonymous, canCreateSubBoards, canCreateThreads, suggestedTags, icon, tags, guard}


unwrapBoardRequest (BoardRequest r) = r

instance boardRequestEncodeJson :: EncodeJson BoardRequest where
  encodeJson (BoardRequest o) =
       "tag" := "BoardRequest"
    ~> "display_name" := o.displayName
    ~> "description" := o.description
    ~> "is_anonymous" := o.isAnonymous
    ~> "can_create_sub_boards" := o.canCreateSubBoards
    ~> "can_create_threads" := o.canCreateThreads
    ~> "suggested_tags" := o.suggestedTags
    ~> "icon" := o.icon
    ~> "tags" := o.tags
    ~> "guard" := o.guard
    ~> jsonEmptyObject


instance boardRequestDecodeJson :: DecodeJson BoardRequest where
  decodeJson o = do
    obj <- decodeJson o
    displayName <- obj .? "display_name"
    description <- obj .? "description"
    isAnonymous <- obj .? "is_anonymous"
    canCreateSubBoards <- obj .? "can_create_sub_boards"
    canCreateThreads <- obj .? "can_create_threads"
    suggestedTags <- obj .? "suggested_tags"
    icon <- obj .? "icon"
    tags <- obj .? "tags"
    guard <- obj .? "guard"
    pure $ BoardRequest {
      displayName,
      description,
      isAnonymous,
      canCreateSubBoards,
      canCreateThreads,
      suggestedTags,
      icon,
      tags,
      guard
    }


instance boardRequestRequestable :: Requestable BoardRequest where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance boardRequestRespondable :: Respondable BoardRequest where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkBoardRequest
      <$> readProp "display_name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "is_anonymous" json
      <*> readProp "can_create_sub_boards" json
      <*> readProp "can_create_threads" json
      <*> readProp "suggested_tags" json
      <*> (runNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "guard" json


instance boardRequestIsForeign :: IsForeign BoardRequest where
  read json =
      mkBoardRequest
      <$> readProp "display_name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "is_anonymous" json
      <*> readProp "can_create_sub_boards" json
      <*> readProp "can_create_threads" json
      <*> readProp "suggested_tags" json
      <*> (runNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "guard" json


instance boardRequestShow :: Show BoardRequest where
    show (BoardRequest o) = show "displayName: " ++ show o.displayName ++ ", " ++ show "description: " ++ show o.description ++ ", " ++ show "isAnonymous: " ++ show o.isAnonymous ++ ", " ++ show "canCreateSubBoards: " ++ show o.canCreateSubBoards ++ ", " ++ show "canCreateThreads: " ++ show o.canCreateThreads ++ ", " ++ show "suggestedTags: " ++ show o.suggestedTags ++ ", " ++ show "icon: " ++ show o.icon ++ ", " ++ show "tags: " ++ show o.tags ++ ", " ++ show "guard: " ++ show o.guard

newtype BoardResponse = BoardResponse {
  id :: Int,
  userId :: Int,
  forumId :: Int,
  parentId :: (Maybe Int),
  name :: String,
  displayName :: String,
  description :: (Maybe String),
  isAnonymous :: Boolean,
  canCreateSubBoards :: Boolean,
  canCreateThreads :: Boolean,
  suggestedTags :: (Array String),
  icon :: (Maybe String),
  tags :: (Array String),
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


type BoardResponseR = {
  id :: Int,
  userId :: Int,
  forumId :: Int,
  parentId :: (Maybe Int),
  name :: String,
  displayName :: String,
  description :: (Maybe String),
  isAnonymous :: Boolean,
  canCreateSubBoards :: Boolean,
  canCreateThreads :: Boolean,
  suggestedTags :: (Array String),
  icon :: (Maybe String),
  tags :: (Array String),
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


_BoardResponse :: LensP BoardResponse {
  id :: Int,
  userId :: Int,
  forumId :: Int,
  parentId :: (Maybe Int),
  name :: String,
  displayName :: String,
  description :: (Maybe String),
  isAnonymous :: Boolean,
  canCreateSubBoards :: Boolean,
  canCreateThreads :: Boolean,
  suggestedTags :: (Array String),
  icon :: (Maybe String),
  tags :: (Array String),
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}
_BoardResponse f (BoardResponse o) = BoardResponse <$> f o


mkBoardResponse :: Int -> Int -> Int -> (Maybe Int) -> String -> String -> (Maybe String) -> Boolean -> Boolean -> Boolean -> (Array String) -> (Maybe String) -> (Array String) -> Boolean -> Int -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> BoardResponse
mkBoardResponse id userId forumId parentId name displayName description isAnonymous canCreateSubBoards canCreateThreads suggestedTags icon tags active guard createdAt modifiedBy modifiedAt activityAt =
  BoardResponse{id, userId, forumId, parentId, name, displayName, description, isAnonymous, canCreateSubBoards, canCreateThreads, suggestedTags, icon, tags, active, guard, createdAt, modifiedBy, modifiedAt, activityAt}


unwrapBoardResponse (BoardResponse r) = r

instance boardResponseEncodeJson :: EncodeJson BoardResponse where
  encodeJson (BoardResponse o) =
       "tag" := "BoardResponse"
    ~> "id" := o.id
    ~> "user_id" := o.userId
    ~> "forum_id" := o.forumId
    ~> "parent_id" := o.parentId
    ~> "name" := o.name
    ~> "display_name" := o.displayName
    ~> "description" := o.description
    ~> "is_anonymous" := o.isAnonymous
    ~> "can_create_sub_boards" := o.canCreateSubBoards
    ~> "can_create_threads" := o.canCreateThreads
    ~> "suggested_tags" := o.suggestedTags
    ~> "icon" := o.icon
    ~> "tags" := o.tags
    ~> "active" := o.active
    ~> "guard" := o.guard
    ~> "created_at" := o.createdAt
    ~> "modified_by" := o.modifiedBy
    ~> "modified_at" := o.modifiedAt
    ~> "activity_at" := o.activityAt
    ~> jsonEmptyObject


instance boardResponseDecodeJson :: DecodeJson BoardResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    userId <- obj .? "user_id"
    forumId <- obj .? "forum_id"
    parentId <- obj .? "parent_id"
    name <- obj .? "name"
    displayName <- obj .? "display_name"
    description <- obj .? "description"
    isAnonymous <- obj .? "is_anonymous"
    canCreateSubBoards <- obj .? "can_create_sub_boards"
    canCreateThreads <- obj .? "can_create_threads"
    suggestedTags <- obj .? "suggested_tags"
    icon <- obj .? "icon"
    tags <- obj .? "tags"
    active <- obj .? "active"
    guard <- obj .? "guard"
    createdAt <- obj .? "created_at"
    modifiedBy <- obj .? "modified_by"
    modifiedAt <- obj .? "modified_at"
    activityAt <- obj .? "activity_at"
    pure $ BoardResponse {
      id,
      userId,
      forumId,
      parentId,
      name,
      displayName,
      description,
      isAnonymous,
      canCreateSubBoards,
      canCreateThreads,
      suggestedTags,
      icon,
      tags,
      active,
      guard,
      createdAt,
      modifiedBy,
      modifiedAt,
      activityAt
    }


instance boardResponseRequestable :: Requestable BoardResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance boardResponseRespondable :: Respondable BoardResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkBoardResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "forum_id" json
      <*> (runNullOrUndefined <$> readProp "parent_id" json)
      <*> readProp "name" json
      <*> readProp "display_name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "is_anonymous" json
      <*> readProp "can_create_sub_boards" json
      <*> readProp "can_create_threads" json
      <*> readProp "suggested_tags" json
      <*> (runNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance boardResponseIsForeign :: IsForeign BoardResponse where
  read json =
      mkBoardResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "forum_id" json
      <*> (runNullOrUndefined <$> readProp "parent_id" json)
      <*> readProp "name" json
      <*> readProp "display_name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "is_anonymous" json
      <*> readProp "can_create_sub_boards" json
      <*> readProp "can_create_threads" json
      <*> readProp "suggested_tags" json
      <*> (runNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance boardResponseShow :: Show BoardResponse where
    show (BoardResponse o) = show "id: " ++ show o.id ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "forumId: " ++ show o.forumId ++ ", " ++ show "parentId: " ++ show o.parentId ++ ", " ++ show "name: " ++ show o.name ++ ", " ++ show "displayName: " ++ show o.displayName ++ ", " ++ show "description: " ++ show o.description ++ ", " ++ show "isAnonymous: " ++ show o.isAnonymous ++ ", " ++ show "canCreateSubBoards: " ++ show o.canCreateSubBoards ++ ", " ++ show "canCreateThreads: " ++ show o.canCreateThreads ++ ", " ++ show "suggestedTags: " ++ show o.suggestedTags ++ ", " ++ show "icon: " ++ show o.icon ++ ", " ++ show "tags: " ++ show o.tags ++ ", " ++ show "active: " ++ show o.active ++ ", " ++ show "guard: " ++ show o.guard ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedBy: " ++ show o.modifiedBy ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt ++ ", " ++ show "activityAt: " ++ show o.activityAt

newtype BoardResponses = BoardResponses {
  boardResponses :: (Array BoardResponse)
}


type BoardResponsesR = {
  boardResponses :: (Array BoardResponse)
}


_BoardResponses :: LensP BoardResponses {
  boardResponses :: (Array BoardResponse)
}
_BoardResponses f (BoardResponses o) = BoardResponses <$> f o


mkBoardResponses :: (Array BoardResponse) -> BoardResponses
mkBoardResponses boardResponses =
  BoardResponses{boardResponses}


unwrapBoardResponses (BoardResponses r) = r

instance boardResponsesEncodeJson :: EncodeJson BoardResponses where
  encodeJson (BoardResponses o) =
       "tag" := "BoardResponses"
    ~> "board_responses" := o.boardResponses
    ~> jsonEmptyObject


instance boardResponsesDecodeJson :: DecodeJson BoardResponses where
  decodeJson o = do
    obj <- decodeJson o
    boardResponses <- obj .? "board_responses"
    pure $ BoardResponses {
      boardResponses
    }


instance boardResponsesRequestable :: Requestable BoardResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance boardResponsesRespondable :: Respondable BoardResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkBoardResponses
      <$> readProp "board_responses" json


instance boardResponsesIsForeign :: IsForeign BoardResponses where
  read json =
      mkBoardResponses
      <$> readProp "board_responses" json


instance boardResponsesShow :: Show BoardResponses where
    show (BoardResponses o) = show "boardResponses: " ++ show o.boardResponses

newtype BoardStatResponse = BoardStatResponse {
  boardId :: Int,
  threads :: Int,
  threadPosts :: Int,
  views :: Int
}


type BoardStatResponseR = {
  boardId :: Int,
  threads :: Int,
  threadPosts :: Int,
  views :: Int
}


_BoardStatResponse :: LensP BoardStatResponse {
  boardId :: Int,
  threads :: Int,
  threadPosts :: Int,
  views :: Int
}
_BoardStatResponse f (BoardStatResponse o) = BoardStatResponse <$> f o


mkBoardStatResponse :: Int -> Int -> Int -> Int -> BoardStatResponse
mkBoardStatResponse boardId threads threadPosts views =
  BoardStatResponse{boardId, threads, threadPosts, views}


unwrapBoardStatResponse (BoardStatResponse r) = r

instance boardStatResponseEncodeJson :: EncodeJson BoardStatResponse where
  encodeJson (BoardStatResponse o) =
       "tag" := "BoardStatResponse"
    ~> "board_id" := o.boardId
    ~> "threads" := o.threads
    ~> "thread_posts" := o.threadPosts
    ~> "views" := o.views
    ~> jsonEmptyObject


instance boardStatResponseDecodeJson :: DecodeJson BoardStatResponse where
  decodeJson o = do
    obj <- decodeJson o
    boardId <- obj .? "board_id"
    threads <- obj .? "threads"
    threadPosts <- obj .? "thread_posts"
    views <- obj .? "views"
    pure $ BoardStatResponse {
      boardId,
      threads,
      threadPosts,
      views
    }


instance boardStatResponseRequestable :: Requestable BoardStatResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance boardStatResponseRespondable :: Respondable BoardStatResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkBoardStatResponse
      <$> readProp "board_id" json
      <*> readProp "threads" json
      <*> readProp "thread_posts" json
      <*> readProp "views" json


instance boardStatResponseIsForeign :: IsForeign BoardStatResponse where
  read json =
      mkBoardStatResponse
      <$> readProp "board_id" json
      <*> readProp "threads" json
      <*> readProp "thread_posts" json
      <*> readProp "views" json


instance boardStatResponseShow :: Show BoardStatResponse where
    show (BoardStatResponse o) = show "boardId: " ++ show o.boardId ++ ", " ++ show "threads: " ++ show o.threads ++ ", " ++ show "threadPosts: " ++ show o.threadPosts ++ ", " ++ show "views: " ++ show o.views

newtype BoardStatResponses = BoardStatResponses {
  boardStatResponses :: (Array BoardStatResponse)
}


type BoardStatResponsesR = {
  boardStatResponses :: (Array BoardStatResponse)
}


_BoardStatResponses :: LensP BoardStatResponses {
  boardStatResponses :: (Array BoardStatResponse)
}
_BoardStatResponses f (BoardStatResponses o) = BoardStatResponses <$> f o


mkBoardStatResponses :: (Array BoardStatResponse) -> BoardStatResponses
mkBoardStatResponses boardStatResponses =
  BoardStatResponses{boardStatResponses}


unwrapBoardStatResponses (BoardStatResponses r) = r

instance boardStatResponsesEncodeJson :: EncodeJson BoardStatResponses where
  encodeJson (BoardStatResponses o) =
       "tag" := "BoardStatResponses"
    ~> "board_stat_responses" := o.boardStatResponses
    ~> jsonEmptyObject


instance boardStatResponsesDecodeJson :: DecodeJson BoardStatResponses where
  decodeJson o = do
    obj <- decodeJson o
    boardStatResponses <- obj .? "board_stat_responses"
    pure $ BoardStatResponses {
      boardStatResponses
    }


instance boardStatResponsesRequestable :: Requestable BoardStatResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance boardStatResponsesRespondable :: Respondable BoardStatResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkBoardStatResponses
      <$> readProp "board_stat_responses" json


instance boardStatResponsesIsForeign :: IsForeign BoardStatResponses where
  read json =
      mkBoardStatResponses
      <$> readProp "board_stat_responses" json


instance boardStatResponsesShow :: Show BoardStatResponses where
    show (BoardStatResponses o) = show "boardStatResponses: " ++ show o.boardStatResponses

newtype BucketRequest = BucketRequest {
  displayName :: String,
  description :: (Maybe String),
  scoreLo :: Int,
  scoreHi :: Int,
  leurons :: (Array Int),
  resources :: (Array Int),
  categories :: (Array String),
  filters :: (Array Int),
  guard :: Int
}


type BucketRequestR = {
  displayName :: String,
  description :: (Maybe String),
  scoreLo :: Int,
  scoreHi :: Int,
  leurons :: (Array Int),
  resources :: (Array Int),
  categories :: (Array String),
  filters :: (Array Int),
  guard :: Int
}


_BucketRequest :: LensP BucketRequest {
  displayName :: String,
  description :: (Maybe String),
  scoreLo :: Int,
  scoreHi :: Int,
  leurons :: (Array Int),
  resources :: (Array Int),
  categories :: (Array String),
  filters :: (Array Int),
  guard :: Int
}
_BucketRequest f (BucketRequest o) = BucketRequest <$> f o


mkBucketRequest :: String -> (Maybe String) -> Int -> Int -> (Array Int) -> (Array Int) -> (Array String) -> (Array Int) -> Int -> BucketRequest
mkBucketRequest displayName description scoreLo scoreHi leurons resources categories filters guard =
  BucketRequest{displayName, description, scoreLo, scoreHi, leurons, resources, categories, filters, guard}


unwrapBucketRequest (BucketRequest r) = r

instance bucketRequestEncodeJson :: EncodeJson BucketRequest where
  encodeJson (BucketRequest o) =
       "tag" := "BucketRequest"
    ~> "display_name" := o.displayName
    ~> "description" := o.description
    ~> "score_lo" := o.scoreLo
    ~> "score_hi" := o.scoreHi
    ~> "leurons" := o.leurons
    ~> "resources" := o.resources
    ~> "categories" := o.categories
    ~> "filters" := o.filters
    ~> "guard" := o.guard
    ~> jsonEmptyObject


instance bucketRequestDecodeJson :: DecodeJson BucketRequest where
  decodeJson o = do
    obj <- decodeJson o
    displayName <- obj .? "display_name"
    description <- obj .? "description"
    scoreLo <- obj .? "score_lo"
    scoreHi <- obj .? "score_hi"
    leurons <- obj .? "leurons"
    resources <- obj .? "resources"
    categories <- obj .? "categories"
    filters <- obj .? "filters"
    guard <- obj .? "guard"
    pure $ BucketRequest {
      displayName,
      description,
      scoreLo,
      scoreHi,
      leurons,
      resources,
      categories,
      filters,
      guard
    }


instance bucketRequestRequestable :: Requestable BucketRequest where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance bucketRequestRespondable :: Respondable BucketRequest where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkBucketRequest
      <$> readProp "display_name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "score_lo" json
      <*> readProp "score_hi" json
      <*> readProp "leurons" json
      <*> readProp "resources" json
      <*> readProp "categories" json
      <*> readProp "filters" json
      <*> readProp "guard" json


instance bucketRequestIsForeign :: IsForeign BucketRequest where
  read json =
      mkBucketRequest
      <$> readProp "display_name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "score_lo" json
      <*> readProp "score_hi" json
      <*> readProp "leurons" json
      <*> readProp "resources" json
      <*> readProp "categories" json
      <*> readProp "filters" json
      <*> readProp "guard" json


instance bucketRequestShow :: Show BucketRequest where
    show (BucketRequest o) = show "displayName: " ++ show o.displayName ++ ", " ++ show "description: " ++ show o.description ++ ", " ++ show "scoreLo: " ++ show o.scoreLo ++ ", " ++ show "scoreHi: " ++ show o.scoreHi ++ ", " ++ show "leurons: " ++ show o.leurons ++ ", " ++ show "resources: " ++ show o.resources ++ ", " ++ show "categories: " ++ show o.categories ++ ", " ++ show "filters: " ++ show o.filters ++ ", " ++ show "guard: " ++ show o.guard

newtype BucketResponse = BucketResponse {
  id :: Int,
  userId :: Int,
  name :: String,
  displayName :: String,
  description :: (Maybe String),
  scoreLo :: Int,
  scoreHi :: Int,
  leurons :: (Array Int),
  resources :: (Array Int),
  categories :: (Array String),
  filters :: (Array Int),
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


type BucketResponseR = {
  id :: Int,
  userId :: Int,
  name :: String,
  displayName :: String,
  description :: (Maybe String),
  scoreLo :: Int,
  scoreHi :: Int,
  leurons :: (Array Int),
  resources :: (Array Int),
  categories :: (Array String),
  filters :: (Array Int),
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


_BucketResponse :: LensP BucketResponse {
  id :: Int,
  userId :: Int,
  name :: String,
  displayName :: String,
  description :: (Maybe String),
  scoreLo :: Int,
  scoreHi :: Int,
  leurons :: (Array Int),
  resources :: (Array Int),
  categories :: (Array String),
  filters :: (Array Int),
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}
_BucketResponse f (BucketResponse o) = BucketResponse <$> f o


mkBucketResponse :: Int -> Int -> String -> String -> (Maybe String) -> Int -> Int -> (Array Int) -> (Array Int) -> (Array String) -> (Array Int) -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> BucketResponse
mkBucketResponse id userId name displayName description scoreLo scoreHi leurons resources categories filters active guard createdAt modifiedAt activityAt =
  BucketResponse{id, userId, name, displayName, description, scoreLo, scoreHi, leurons, resources, categories, filters, active, guard, createdAt, modifiedAt, activityAt}


unwrapBucketResponse (BucketResponse r) = r

instance bucketResponseEncodeJson :: EncodeJson BucketResponse where
  encodeJson (BucketResponse o) =
       "tag" := "BucketResponse"
    ~> "id" := o.id
    ~> "user_id" := o.userId
    ~> "name" := o.name
    ~> "display_name" := o.displayName
    ~> "description" := o.description
    ~> "score_lo" := o.scoreLo
    ~> "score_hi" := o.scoreHi
    ~> "leurons" := o.leurons
    ~> "resources" := o.resources
    ~> "categories" := o.categories
    ~> "filters" := o.filters
    ~> "active" := o.active
    ~> "guard" := o.guard
    ~> "created_at" := o.createdAt
    ~> "modified_at" := o.modifiedAt
    ~> "activity_at" := o.activityAt
    ~> jsonEmptyObject


instance bucketResponseDecodeJson :: DecodeJson BucketResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    userId <- obj .? "user_id"
    name <- obj .? "name"
    displayName <- obj .? "display_name"
    description <- obj .? "description"
    scoreLo <- obj .? "score_lo"
    scoreHi <- obj .? "score_hi"
    leurons <- obj .? "leurons"
    resources <- obj .? "resources"
    categories <- obj .? "categories"
    filters <- obj .? "filters"
    active <- obj .? "active"
    guard <- obj .? "guard"
    createdAt <- obj .? "created_at"
    modifiedAt <- obj .? "modified_at"
    activityAt <- obj .? "activity_at"
    pure $ BucketResponse {
      id,
      userId,
      name,
      displayName,
      description,
      scoreLo,
      scoreHi,
      leurons,
      resources,
      categories,
      filters,
      active,
      guard,
      createdAt,
      modifiedAt,
      activityAt
    }


instance bucketResponseRequestable :: Requestable BucketResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance bucketResponseRespondable :: Respondable BucketResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkBucketResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "name" json
      <*> readProp "display_name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "score_lo" json
      <*> readProp "score_hi" json
      <*> readProp "leurons" json
      <*> readProp "resources" json
      <*> readProp "categories" json
      <*> readProp "filters" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance bucketResponseIsForeign :: IsForeign BucketResponse where
  read json =
      mkBucketResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "name" json
      <*> readProp "display_name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "score_lo" json
      <*> readProp "score_hi" json
      <*> readProp "leurons" json
      <*> readProp "resources" json
      <*> readProp "categories" json
      <*> readProp "filters" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance bucketResponseShow :: Show BucketResponse where
    show (BucketResponse o) = show "id: " ++ show o.id ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "name: " ++ show o.name ++ ", " ++ show "displayName: " ++ show o.displayName ++ ", " ++ show "description: " ++ show o.description ++ ", " ++ show "scoreLo: " ++ show o.scoreLo ++ ", " ++ show "scoreHi: " ++ show o.scoreHi ++ ", " ++ show "leurons: " ++ show o.leurons ++ ", " ++ show "resources: " ++ show o.resources ++ ", " ++ show "categories: " ++ show o.categories ++ ", " ++ show "filters: " ++ show o.filters ++ ", " ++ show "active: " ++ show o.active ++ ", " ++ show "guard: " ++ show o.guard ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt ++ ", " ++ show "activityAt: " ++ show o.activityAt

newtype BucketResponses = BucketResponses {
  bucketResponses :: (Array BucketResponse)
}


type BucketResponsesR = {
  bucketResponses :: (Array BucketResponse)
}


_BucketResponses :: LensP BucketResponses {
  bucketResponses :: (Array BucketResponse)
}
_BucketResponses f (BucketResponses o) = BucketResponses <$> f o


mkBucketResponses :: (Array BucketResponse) -> BucketResponses
mkBucketResponses bucketResponses =
  BucketResponses{bucketResponses}


unwrapBucketResponses (BucketResponses r) = r

instance bucketResponsesEncodeJson :: EncodeJson BucketResponses where
  encodeJson (BucketResponses o) =
       "tag" := "BucketResponses"
    ~> "bucket_responses" := o.bucketResponses
    ~> jsonEmptyObject


instance bucketResponsesDecodeJson :: DecodeJson BucketResponses where
  decodeJson o = do
    obj <- decodeJson o
    bucketResponses <- obj .? "bucket_responses"
    pure $ BucketResponses {
      bucketResponses
    }


instance bucketResponsesRequestable :: Requestable BucketResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance bucketResponsesRespondable :: Respondable BucketResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkBucketResponses
      <$> readProp "bucket_responses" json


instance bucketResponsesIsForeign :: IsForeign BucketResponses where
  read json =
      mkBucketResponses
      <$> readProp "bucket_responses" json


instance bucketResponsesShow :: Show BucketResponses where
    show (BucketResponses o) = show "bucketResponses: " ++ show o.bucketResponses

newtype CountResponse = CountResponse {
  id :: Int,
  n :: Int
}


type CountResponseR = {
  id :: Int,
  n :: Int
}


_CountResponse :: LensP CountResponse {
  id :: Int,
  n :: Int
}
_CountResponse f (CountResponse o) = CountResponse <$> f o


mkCountResponse :: Int -> Int -> CountResponse
mkCountResponse id n =
  CountResponse{id, n}


unwrapCountResponse (CountResponse r) = r

instance countResponseEncodeJson :: EncodeJson CountResponse where
  encodeJson (CountResponse o) =
       "tag" := "CountResponse"
    ~> "id" := o.id
    ~> "n" := o.n
    ~> jsonEmptyObject


instance countResponseDecodeJson :: DecodeJson CountResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    n <- obj .? "n"
    pure $ CountResponse {
      id,
      n
    }


instance countResponseRequestable :: Requestable CountResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance countResponseRespondable :: Respondable CountResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkCountResponse
      <$> readProp "id" json
      <*> readProp "n" json


instance countResponseIsForeign :: IsForeign CountResponse where
  read json =
      mkCountResponse
      <$> readProp "id" json
      <*> readProp "n" json


instance countResponseShow :: Show CountResponse where
    show (CountResponse o) = show "id: " ++ show o.id ++ ", " ++ show "n: " ++ show o.n

newtype CountResponses = CountResponses {
  countResponses :: (Array CountResponse)
}


type CountResponsesR = {
  countResponses :: (Array CountResponse)
}


_CountResponses :: LensP CountResponses {
  countResponses :: (Array CountResponse)
}
_CountResponses f (CountResponses o) = CountResponses <$> f o


mkCountResponses :: (Array CountResponse) -> CountResponses
mkCountResponses countResponses =
  CountResponses{countResponses}


unwrapCountResponses (CountResponses r) = r

instance countResponsesEncodeJson :: EncodeJson CountResponses where
  encodeJson (CountResponses o) =
       "tag" := "CountResponses"
    ~> "count_responses" := o.countResponses
    ~> jsonEmptyObject


instance countResponsesDecodeJson :: DecodeJson CountResponses where
  decodeJson o = do
    obj <- decodeJson o
    countResponses <- obj .? "count_responses"
    pure $ CountResponses {
      countResponses
    }


instance countResponsesRequestable :: Requestable CountResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance countResponsesRespondable :: Respondable CountResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkCountResponses
      <$> readProp "count_responses" json


instance countResponsesIsForeign :: IsForeign CountResponses where
  read json =
      mkCountResponses
      <$> readProp "count_responses" json


instance countResponsesShow :: Show CountResponses where
    show (CountResponses o) = show "countResponses: " ++ show o.countResponses

type DepList a = (Array (Array a))


newtype EmptyRequest = EmptyRequest {
  value :: Boolean
}


type EmptyRequestR = {
  value :: Boolean
}


_EmptyRequest :: LensP EmptyRequest {
  value :: Boolean
}
_EmptyRequest f (EmptyRequest o) = EmptyRequest <$> f o


mkEmptyRequest :: Boolean -> EmptyRequest
mkEmptyRequest value =
  EmptyRequest{value}


unwrapEmptyRequest (EmptyRequest r) = r

instance emptyRequestEncodeJson :: EncodeJson EmptyRequest where
  encodeJson (EmptyRequest o) =
       "tag" := "EmptyRequest"
    ~> "value" := o.value
    ~> jsonEmptyObject


instance emptyRequestDecodeJson :: DecodeJson EmptyRequest where
  decodeJson o = do
    obj <- decodeJson o
    value <- obj .? "value"
    pure $ EmptyRequest {
      value
    }


instance emptyRequestRequestable :: Requestable EmptyRequest where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance emptyRequestRespondable :: Respondable EmptyRequest where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkEmptyRequest
      <$> readProp "value" json


instance emptyRequestIsForeign :: IsForeign EmptyRequest where
  read json =
      mkEmptyRequest
      <$> readProp "value" json


instance emptyRequestShow :: Show EmptyRequest where
    show (EmptyRequest o) = show "value: " ++ show o.value

newtype EmptyResponse = EmptyResponse {
  id :: Int,
  userId :: Int,
  value :: Boolean,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}


type EmptyResponseR = {
  id :: Int,
  userId :: Int,
  value :: Boolean,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}


_EmptyResponse :: LensP EmptyResponse {
  id :: Int,
  userId :: Int,
  value :: Boolean,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}
_EmptyResponse f (EmptyResponse o) = EmptyResponse <$> f o


mkEmptyResponse :: Int -> Int -> Boolean -> (Maybe Date) -> (Maybe Date) -> EmptyResponse
mkEmptyResponse id userId value createdAt modifiedAt =
  EmptyResponse{id, userId, value, createdAt, modifiedAt}


unwrapEmptyResponse (EmptyResponse r) = r

instance emptyResponseEncodeJson :: EncodeJson EmptyResponse where
  encodeJson (EmptyResponse o) =
       "tag" := "EmptyResponse"
    ~> "id" := o.id
    ~> "user_id" := o.userId
    ~> "value" := o.value
    ~> "created_at" := o.createdAt
    ~> "modified_at" := o.modifiedAt
    ~> jsonEmptyObject


instance emptyResponseDecodeJson :: DecodeJson EmptyResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    userId <- obj .? "user_id"
    value <- obj .? "value"
    createdAt <- obj .? "created_at"
    modifiedAt <- obj .? "modified_at"
    pure $ EmptyResponse {
      id,
      userId,
      value,
      createdAt,
      modifiedAt
    }


instance emptyResponseRequestable :: Requestable EmptyResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance emptyResponseRespondable :: Respondable EmptyResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkEmptyResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "value" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance emptyResponseIsForeign :: IsForeign EmptyResponse where
  read json =
      mkEmptyResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "value" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance emptyResponseShow :: Show EmptyResponse where
    show (EmptyResponse o) = show "id: " ++ show o.id ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "value: " ++ show o.value ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt

newtype EmptyResponses = EmptyResponses {
  emptyResponses :: (Array EmptyResponse)
}


type EmptyResponsesR = {
  emptyResponses :: (Array EmptyResponse)
}


_EmptyResponses :: LensP EmptyResponses {
  emptyResponses :: (Array EmptyResponse)
}
_EmptyResponses f (EmptyResponses o) = EmptyResponses <$> f o


mkEmptyResponses :: (Array EmptyResponse) -> EmptyResponses
mkEmptyResponses emptyResponses =
  EmptyResponses{emptyResponses}


unwrapEmptyResponses (EmptyResponses r) = r

instance emptyResponsesEncodeJson :: EncodeJson EmptyResponses where
  encodeJson (EmptyResponses o) =
       "tag" := "EmptyResponses"
    ~> "empty_responses" := o.emptyResponses
    ~> jsonEmptyObject


instance emptyResponsesDecodeJson :: DecodeJson EmptyResponses where
  decodeJson o = do
    obj <- decodeJson o
    emptyResponses <- obj .? "empty_responses"
    pure $ EmptyResponses {
      emptyResponses
    }


instance emptyResponsesRequestable :: Requestable EmptyResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance emptyResponsesRespondable :: Respondable EmptyResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkEmptyResponses
      <$> readProp "empty_responses" json


instance emptyResponsesIsForeign :: IsForeign EmptyResponses where
  read json =
      mkEmptyResponses
      <$> readProp "empty_responses" json


instance emptyResponsesShow :: Show EmptyResponses where
    show (EmptyResponses o) = show "emptyResponses: " ++ show o.emptyResponses

data Ent
  = Ent_Organization 
  | Ent_Team 
  | Ent_TeamMember 
  | Ent_GlobalGroup 
  | Ent_Group 
  | Ent_GroupMember 
  | Ent_User 
  | Ent_UserSanitized 
  | Ent_Forum 
  | Ent_Board 
  | Ent_Thread 
  | Ent_ThreadPost 
  | Ent_Blog 
  | Ent_BlogPost 
  | Ent_BlogComment 
  | Ent_Resource 
  | Ent_Leuron 
  | Ent_Comment 
  | Ent_Api 
  | Ent_Like 
  | Ent_Star 
  | Ent_None 



instance entEncodeJson :: EncodeJson Ent where
  encodeJson (Ent_Organization ) =
       "tag" := "Ent_Organization"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Ent_Team ) =
       "tag" := "Ent_Team"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Ent_TeamMember ) =
       "tag" := "Ent_TeamMember"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Ent_GlobalGroup ) =
       "tag" := "Ent_GlobalGroup"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Ent_Group ) =
       "tag" := "Ent_Group"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Ent_GroupMember ) =
       "tag" := "Ent_GroupMember"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Ent_User ) =
       "tag" := "Ent_User"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Ent_UserSanitized ) =
       "tag" := "Ent_UserSanitized"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Ent_Forum ) =
       "tag" := "Ent_Forum"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Ent_Board ) =
       "tag" := "Ent_Board"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Ent_Thread ) =
       "tag" := "Ent_Thread"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Ent_ThreadPost ) =
       "tag" := "Ent_ThreadPost"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Ent_Blog ) =
       "tag" := "Ent_Blog"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Ent_BlogPost ) =
       "tag" := "Ent_BlogPost"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Ent_BlogComment ) =
       "tag" := "Ent_BlogComment"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Ent_Resource ) =
       "tag" := "Ent_Resource"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Ent_Leuron ) =
       "tag" := "Ent_Leuron"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Ent_Comment ) =
       "tag" := "Ent_Comment"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Ent_Api ) =
       "tag" := "Ent_Api"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Ent_Like ) =
       "tag" := "Ent_Like"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Ent_Star ) =
       "tag" := "Ent_Star"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Ent_None ) =
       "tag" := "Ent_None"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject


instance entDecodeJson :: DecodeJson Ent where
  decodeJson json = do
    obj <- decodeJson json
    tag <- obj .? "tag"
    case tag of
        "Ent_Organization" -> do
          return Ent_Organization

        "Ent_Team" -> do
          return Ent_Team

        "Ent_TeamMember" -> do
          return Ent_TeamMember

        "Ent_GlobalGroup" -> do
          return Ent_GlobalGroup

        "Ent_Group" -> do
          return Ent_Group

        "Ent_GroupMember" -> do
          return Ent_GroupMember

        "Ent_User" -> do
          return Ent_User

        "Ent_UserSanitized" -> do
          return Ent_UserSanitized

        "Ent_Forum" -> do
          return Ent_Forum

        "Ent_Board" -> do
          return Ent_Board

        "Ent_Thread" -> do
          return Ent_Thread

        "Ent_ThreadPost" -> do
          return Ent_ThreadPost

        "Ent_Blog" -> do
          return Ent_Blog

        "Ent_BlogPost" -> do
          return Ent_BlogPost

        "Ent_BlogComment" -> do
          return Ent_BlogComment

        "Ent_Resource" -> do
          return Ent_Resource

        "Ent_Leuron" -> do
          return Ent_Leuron

        "Ent_Comment" -> do
          return Ent_Comment

        "Ent_Api" -> do
          return Ent_Api

        "Ent_Like" -> do
          return Ent_Like

        "Ent_Star" -> do
          return Ent_Star

        "Ent_None" -> do
          return Ent_None

  decodeJson x = fail $ "Could not parse object: " ++ show x


instance entRequestable :: Requestable Ent where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance entRespondable :: Respondable Ent where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    tag <- readProp "tag" json
    case tag of
        "Ent_Organization" -> do
          return Ent_Organization

        "Ent_Team" -> do
          return Ent_Team

        "Ent_TeamMember" -> do
          return Ent_TeamMember

        "Ent_GlobalGroup" -> do
          return Ent_GlobalGroup

        "Ent_Group" -> do
          return Ent_Group

        "Ent_GroupMember" -> do
          return Ent_GroupMember

        "Ent_User" -> do
          return Ent_User

        "Ent_UserSanitized" -> do
          return Ent_UserSanitized

        "Ent_Forum" -> do
          return Ent_Forum

        "Ent_Board" -> do
          return Ent_Board

        "Ent_Thread" -> do
          return Ent_Thread

        "Ent_ThreadPost" -> do
          return Ent_ThreadPost

        "Ent_Blog" -> do
          return Ent_Blog

        "Ent_BlogPost" -> do
          return Ent_BlogPost

        "Ent_BlogComment" -> do
          return Ent_BlogComment

        "Ent_Resource" -> do
          return Ent_Resource

        "Ent_Leuron" -> do
          return Ent_Leuron

        "Ent_Comment" -> do
          return Ent_Comment

        "Ent_Api" -> do
          return Ent_Api

        "Ent_Like" -> do
          return Ent_Like

        "Ent_Star" -> do
          return Ent_Star

        "Ent_None" -> do
          return Ent_None



instance entIsForeign :: IsForeign Ent where
  read json = do
    tag <- readProp "tag" json
    case tag of
        "Ent_Organization" -> do
          return Ent_Organization

        "Ent_Team" -> do
          return Ent_Team

        "Ent_TeamMember" -> do
          return Ent_TeamMember

        "Ent_GlobalGroup" -> do
          return Ent_GlobalGroup

        "Ent_Group" -> do
          return Ent_Group

        "Ent_GroupMember" -> do
          return Ent_GroupMember

        "Ent_User" -> do
          return Ent_User

        "Ent_UserSanitized" -> do
          return Ent_UserSanitized

        "Ent_Forum" -> do
          return Ent_Forum

        "Ent_Board" -> do
          return Ent_Board

        "Ent_Thread" -> do
          return Ent_Thread

        "Ent_ThreadPost" -> do
          return Ent_ThreadPost

        "Ent_Blog" -> do
          return Ent_Blog

        "Ent_BlogPost" -> do
          return Ent_BlogPost

        "Ent_BlogComment" -> do
          return Ent_BlogComment

        "Ent_Resource" -> do
          return Ent_Resource

        "Ent_Leuron" -> do
          return Ent_Leuron

        "Ent_Comment" -> do
          return Ent_Comment

        "Ent_Api" -> do
          return Ent_Api

        "Ent_Like" -> do
          return Ent_Like

        "Ent_Star" -> do
          return Ent_Star

        "Ent_None" -> do
          return Ent_None



instance entShow :: Show Ent where
  show (Ent_Organization) = "Ent_Organization"
  show (Ent_Team) = "Ent_Team"
  show (Ent_TeamMember) = "Ent_TeamMember"
  show (Ent_GlobalGroup) = "Ent_GlobalGroup"
  show (Ent_Group) = "Ent_Group"
  show (Ent_GroupMember) = "Ent_GroupMember"
  show (Ent_User) = "Ent_User"
  show (Ent_UserSanitized) = "Ent_UserSanitized"
  show (Ent_Forum) = "Ent_Forum"
  show (Ent_Board) = "Ent_Board"
  show (Ent_Thread) = "Ent_Thread"
  show (Ent_ThreadPost) = "Ent_ThreadPost"
  show (Ent_Blog) = "Ent_Blog"
  show (Ent_BlogPost) = "Ent_BlogPost"
  show (Ent_BlogComment) = "Ent_BlogComment"
  show (Ent_Resource) = "Ent_Resource"
  show (Ent_Leuron) = "Ent_Leuron"
  show (Ent_Comment) = "Ent_Comment"
  show (Ent_Api) = "Ent_Api"
  show (Ent_Like) = "Ent_Like"
  show (Ent_Star) = "Ent_Star"
  show (Ent_None) = "Ent_None"


newtype ForumRequest = ForumRequest {
  displayName :: String,
  description :: (Maybe String),
  threadsPerBoard :: Int,
  threadPostsPerThread :: Int,
  icon :: (Maybe String),
  tags :: (Array String),
  visibility :: Visibility,
  guard :: Int
}


type ForumRequestR = {
  displayName :: String,
  description :: (Maybe String),
  threadsPerBoard :: Int,
  threadPostsPerThread :: Int,
  icon :: (Maybe String),
  tags :: (Array String),
  visibility :: Visibility,
  guard :: Int
}


_ForumRequest :: LensP ForumRequest {
  displayName :: String,
  description :: (Maybe String),
  threadsPerBoard :: Int,
  threadPostsPerThread :: Int,
  icon :: (Maybe String),
  tags :: (Array String),
  visibility :: Visibility,
  guard :: Int
}
_ForumRequest f (ForumRequest o) = ForumRequest <$> f o


mkForumRequest :: String -> (Maybe String) -> Int -> Int -> (Maybe String) -> (Array String) -> Visibility -> Int -> ForumRequest
mkForumRequest displayName description threadsPerBoard threadPostsPerThread icon tags visibility guard =
  ForumRequest{displayName, description, threadsPerBoard, threadPostsPerThread, icon, tags, visibility, guard}


unwrapForumRequest (ForumRequest r) = r

instance forumRequestEncodeJson :: EncodeJson ForumRequest where
  encodeJson (ForumRequest o) =
       "tag" := "ForumRequest"
    ~> "display_name" := o.displayName
    ~> "description" := o.description
    ~> "threads_per_board" := o.threadsPerBoard
    ~> "thread_posts_per_thread" := o.threadPostsPerThread
    ~> "icon" := o.icon
    ~> "tags" := o.tags
    ~> "visibility" := o.visibility
    ~> "guard" := o.guard
    ~> jsonEmptyObject


instance forumRequestDecodeJson :: DecodeJson ForumRequest where
  decodeJson o = do
    obj <- decodeJson o
    displayName <- obj .? "display_name"
    description <- obj .? "description"
    threadsPerBoard <- obj .? "threads_per_board"
    threadPostsPerThread <- obj .? "thread_posts_per_thread"
    icon <- obj .? "icon"
    tags <- obj .? "tags"
    visibility <- obj .? "visibility"
    guard <- obj .? "guard"
    pure $ ForumRequest {
      displayName,
      description,
      threadsPerBoard,
      threadPostsPerThread,
      icon,
      tags,
      visibility,
      guard
    }


instance forumRequestRequestable :: Requestable ForumRequest where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance forumRequestRespondable :: Respondable ForumRequest where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkForumRequest
      <$> readProp "display_name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "threads_per_board" json
      <*> readProp "thread_posts_per_thread" json
      <*> (runNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "visibility" json
      <*> readProp "guard" json


instance forumRequestIsForeign :: IsForeign ForumRequest where
  read json =
      mkForumRequest
      <$> readProp "display_name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "threads_per_board" json
      <*> readProp "thread_posts_per_thread" json
      <*> (runNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "visibility" json
      <*> readProp "guard" json


instance forumRequestShow :: Show ForumRequest where
    show (ForumRequest o) = show "displayName: " ++ show o.displayName ++ ", " ++ show "description: " ++ show o.description ++ ", " ++ show "threadsPerBoard: " ++ show o.threadsPerBoard ++ ", " ++ show "threadPostsPerThread: " ++ show o.threadPostsPerThread ++ ", " ++ show "icon: " ++ show o.icon ++ ", " ++ show "tags: " ++ show o.tags ++ ", " ++ show "visibility: " ++ show o.visibility ++ ", " ++ show "guard: " ++ show o.guard

newtype ForumResponse = ForumResponse {
  id :: Int,
  userId :: Int,
  orgId :: Int,
  name :: String,
  displayName :: String,
  description :: (Maybe String),
  threadsPerBoard :: Int,
  threadPostsPerThread :: Int,
  icon :: (Maybe String),
  tags :: (Array String),
  visibility :: Visibility,
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


type ForumResponseR = {
  id :: Int,
  userId :: Int,
  orgId :: Int,
  name :: String,
  displayName :: String,
  description :: (Maybe String),
  threadsPerBoard :: Int,
  threadPostsPerThread :: Int,
  icon :: (Maybe String),
  tags :: (Array String),
  visibility :: Visibility,
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


_ForumResponse :: LensP ForumResponse {
  id :: Int,
  userId :: Int,
  orgId :: Int,
  name :: String,
  displayName :: String,
  description :: (Maybe String),
  threadsPerBoard :: Int,
  threadPostsPerThread :: Int,
  icon :: (Maybe String),
  tags :: (Array String),
  visibility :: Visibility,
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}
_ForumResponse f (ForumResponse o) = ForumResponse <$> f o


mkForumResponse :: Int -> Int -> Int -> String -> String -> (Maybe String) -> Int -> Int -> (Maybe String) -> (Array String) -> Visibility -> Boolean -> Int -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> ForumResponse
mkForumResponse id userId orgId name displayName description threadsPerBoard threadPostsPerThread icon tags visibility active guard createdAt modifiedBy modifiedAt activityAt =
  ForumResponse{id, userId, orgId, name, displayName, description, threadsPerBoard, threadPostsPerThread, icon, tags, visibility, active, guard, createdAt, modifiedBy, modifiedAt, activityAt}


unwrapForumResponse (ForumResponse r) = r

instance forumResponseEncodeJson :: EncodeJson ForumResponse where
  encodeJson (ForumResponse o) =
       "tag" := "ForumResponse"
    ~> "id" := o.id
    ~> "user_id" := o.userId
    ~> "org_id" := o.orgId
    ~> "name" := o.name
    ~> "display_name" := o.displayName
    ~> "description" := o.description
    ~> "threads_per_board" := o.threadsPerBoard
    ~> "thread_posts_per_thread" := o.threadPostsPerThread
    ~> "icon" := o.icon
    ~> "tags" := o.tags
    ~> "visibility" := o.visibility
    ~> "active" := o.active
    ~> "guard" := o.guard
    ~> "created_at" := o.createdAt
    ~> "modified_by" := o.modifiedBy
    ~> "modified_at" := o.modifiedAt
    ~> "activity_at" := o.activityAt
    ~> jsonEmptyObject


instance forumResponseDecodeJson :: DecodeJson ForumResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    userId <- obj .? "user_id"
    orgId <- obj .? "org_id"
    name <- obj .? "name"
    displayName <- obj .? "display_name"
    description <- obj .? "description"
    threadsPerBoard <- obj .? "threads_per_board"
    threadPostsPerThread <- obj .? "thread_posts_per_thread"
    icon <- obj .? "icon"
    tags <- obj .? "tags"
    visibility <- obj .? "visibility"
    active <- obj .? "active"
    guard <- obj .? "guard"
    createdAt <- obj .? "created_at"
    modifiedBy <- obj .? "modified_by"
    modifiedAt <- obj .? "modified_at"
    activityAt <- obj .? "activity_at"
    pure $ ForumResponse {
      id,
      userId,
      orgId,
      name,
      displayName,
      description,
      threadsPerBoard,
      threadPostsPerThread,
      icon,
      tags,
      visibility,
      active,
      guard,
      createdAt,
      modifiedBy,
      modifiedAt,
      activityAt
    }


instance forumResponseRequestable :: Requestable ForumResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance forumResponseRespondable :: Respondable ForumResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkForumResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "org_id" json
      <*> readProp "name" json
      <*> readProp "display_name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "threads_per_board" json
      <*> readProp "thread_posts_per_thread" json
      <*> (runNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "visibility" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance forumResponseIsForeign :: IsForeign ForumResponse where
  read json =
      mkForumResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "org_id" json
      <*> readProp "name" json
      <*> readProp "display_name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "threads_per_board" json
      <*> readProp "thread_posts_per_thread" json
      <*> (runNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "visibility" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance forumResponseShow :: Show ForumResponse where
    show (ForumResponse o) = show "id: " ++ show o.id ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "orgId: " ++ show o.orgId ++ ", " ++ show "name: " ++ show o.name ++ ", " ++ show "displayName: " ++ show o.displayName ++ ", " ++ show "description: " ++ show o.description ++ ", " ++ show "threadsPerBoard: " ++ show o.threadsPerBoard ++ ", " ++ show "threadPostsPerThread: " ++ show o.threadPostsPerThread ++ ", " ++ show "icon: " ++ show o.icon ++ ", " ++ show "tags: " ++ show o.tags ++ ", " ++ show "visibility: " ++ show o.visibility ++ ", " ++ show "active: " ++ show o.active ++ ", " ++ show "guard: " ++ show o.guard ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedBy: " ++ show o.modifiedBy ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt ++ ", " ++ show "activityAt: " ++ show o.activityAt

newtype ForumResponses = ForumResponses {
  forumResponses :: (Array ForumResponse)
}


type ForumResponsesR = {
  forumResponses :: (Array ForumResponse)
}


_ForumResponses :: LensP ForumResponses {
  forumResponses :: (Array ForumResponse)
}
_ForumResponses f (ForumResponses o) = ForumResponses <$> f o


mkForumResponses :: (Array ForumResponse) -> ForumResponses
mkForumResponses forumResponses =
  ForumResponses{forumResponses}


unwrapForumResponses (ForumResponses r) = r

instance forumResponsesEncodeJson :: EncodeJson ForumResponses where
  encodeJson (ForumResponses o) =
       "tag" := "ForumResponses"
    ~> "forum_responses" := o.forumResponses
    ~> jsonEmptyObject


instance forumResponsesDecodeJson :: DecodeJson ForumResponses where
  decodeJson o = do
    obj <- decodeJson o
    forumResponses <- obj .? "forum_responses"
    pure $ ForumResponses {
      forumResponses
    }


instance forumResponsesRequestable :: Requestable ForumResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance forumResponsesRespondable :: Respondable ForumResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkForumResponses
      <$> readProp "forum_responses" json


instance forumResponsesIsForeign :: IsForeign ForumResponses where
  read json =
      mkForumResponses
      <$> readProp "forum_responses" json


instance forumResponsesShow :: Show ForumResponses where
    show (ForumResponses o) = show "forumResponses: " ++ show o.forumResponses

newtype ForumStatResponse = ForumStatResponse {
  forumId :: Int,
  boards :: Int,
  threads :: Int,
  threadPosts :: Int,
  views :: Int
}


type ForumStatResponseR = {
  forumId :: Int,
  boards :: Int,
  threads :: Int,
  threadPosts :: Int,
  views :: Int
}


_ForumStatResponse :: LensP ForumStatResponse {
  forumId :: Int,
  boards :: Int,
  threads :: Int,
  threadPosts :: Int,
  views :: Int
}
_ForumStatResponse f (ForumStatResponse o) = ForumStatResponse <$> f o


mkForumStatResponse :: Int -> Int -> Int -> Int -> Int -> ForumStatResponse
mkForumStatResponse forumId boards threads threadPosts views =
  ForumStatResponse{forumId, boards, threads, threadPosts, views}


unwrapForumStatResponse (ForumStatResponse r) = r

instance forumStatResponseEncodeJson :: EncodeJson ForumStatResponse where
  encodeJson (ForumStatResponse o) =
       "tag" := "ForumStatResponse"
    ~> "forum_id" := o.forumId
    ~> "boards" := o.boards
    ~> "threads" := o.threads
    ~> "thread_posts" := o.threadPosts
    ~> "views" := o.views
    ~> jsonEmptyObject


instance forumStatResponseDecodeJson :: DecodeJson ForumStatResponse where
  decodeJson o = do
    obj <- decodeJson o
    forumId <- obj .? "forum_id"
    boards <- obj .? "boards"
    threads <- obj .? "threads"
    threadPosts <- obj .? "thread_posts"
    views <- obj .? "views"
    pure $ ForumStatResponse {
      forumId,
      boards,
      threads,
      threadPosts,
      views
    }


instance forumStatResponseRequestable :: Requestable ForumStatResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance forumStatResponseRespondable :: Respondable ForumStatResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkForumStatResponse
      <$> readProp "forum_id" json
      <*> readProp "boards" json
      <*> readProp "threads" json
      <*> readProp "thread_posts" json
      <*> readProp "views" json


instance forumStatResponseIsForeign :: IsForeign ForumStatResponse where
  read json =
      mkForumStatResponse
      <$> readProp "forum_id" json
      <*> readProp "boards" json
      <*> readProp "threads" json
      <*> readProp "thread_posts" json
      <*> readProp "views" json


instance forumStatResponseShow :: Show ForumStatResponse where
    show (ForumStatResponse o) = show "forumId: " ++ show o.forumId ++ ", " ++ show "boards: " ++ show o.boards ++ ", " ++ show "threads: " ++ show o.threads ++ ", " ++ show "threadPosts: " ++ show o.threadPosts ++ ", " ++ show "views: " ++ show o.views

newtype ForumStatResponses = ForumStatResponses {
  forumStatResponses :: (Array ForumStatResponse)
}


type ForumStatResponsesR = {
  forumStatResponses :: (Array ForumStatResponse)
}


_ForumStatResponses :: LensP ForumStatResponses {
  forumStatResponses :: (Array ForumStatResponse)
}
_ForumStatResponses f (ForumStatResponses o) = ForumStatResponses <$> f o


mkForumStatResponses :: (Array ForumStatResponse) -> ForumStatResponses
mkForumStatResponses forumStatResponses =
  ForumStatResponses{forumStatResponses}


unwrapForumStatResponses (ForumStatResponses r) = r

instance forumStatResponsesEncodeJson :: EncodeJson ForumStatResponses where
  encodeJson (ForumStatResponses o) =
       "tag" := "ForumStatResponses"
    ~> "forum_stat_responses" := o.forumStatResponses
    ~> jsonEmptyObject


instance forumStatResponsesDecodeJson :: DecodeJson ForumStatResponses where
  decodeJson o = do
    obj <- decodeJson o
    forumStatResponses <- obj .? "forum_stat_responses"
    pure $ ForumStatResponses {
      forumStatResponses
    }


instance forumStatResponsesRequestable :: Requestable ForumStatResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance forumStatResponsesRespondable :: Respondable ForumStatResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkForumStatResponses
      <$> readProp "forum_stat_responses" json


instance forumStatResponsesIsForeign :: IsForeign ForumStatResponses where
  read json =
      mkForumStatResponses
      <$> readProp "forum_stat_responses" json


instance forumStatResponsesShow :: Show ForumStatResponses where
    show (ForumStatResponses o) = show "forumStatResponses: " ++ show o.forumStatResponses

newtype GlobalGroupRequest = GlobalGroupRequest {
  displayName :: String,
  description :: (Maybe String),
  membership :: Membership,
  icon :: (Maybe String),
  tags :: (Array String),
  visibility :: Visibility,
  guard :: Int
}


type GlobalGroupRequestR = {
  displayName :: String,
  description :: (Maybe String),
  membership :: Membership,
  icon :: (Maybe String),
  tags :: (Array String),
  visibility :: Visibility,
  guard :: Int
}


_GlobalGroupRequest :: LensP GlobalGroupRequest {
  displayName :: String,
  description :: (Maybe String),
  membership :: Membership,
  icon :: (Maybe String),
  tags :: (Array String),
  visibility :: Visibility,
  guard :: Int
}
_GlobalGroupRequest f (GlobalGroupRequest o) = GlobalGroupRequest <$> f o


mkGlobalGroupRequest :: String -> (Maybe String) -> Membership -> (Maybe String) -> (Array String) -> Visibility -> Int -> GlobalGroupRequest
mkGlobalGroupRequest displayName description membership icon tags visibility guard =
  GlobalGroupRequest{displayName, description, membership, icon, tags, visibility, guard}


unwrapGlobalGroupRequest (GlobalGroupRequest r) = r

instance globalGroupRequestEncodeJson :: EncodeJson GlobalGroupRequest where
  encodeJson (GlobalGroupRequest o) =
       "tag" := "GlobalGroupRequest"
    ~> "display_name" := o.displayName
    ~> "description" := o.description
    ~> "membership" := o.membership
    ~> "icon" := o.icon
    ~> "tags" := o.tags
    ~> "visibility" := o.visibility
    ~> "guard" := o.guard
    ~> jsonEmptyObject


instance globalGroupRequestDecodeJson :: DecodeJson GlobalGroupRequest where
  decodeJson o = do
    obj <- decodeJson o
    displayName <- obj .? "display_name"
    description <- obj .? "description"
    membership <- obj .? "membership"
    icon <- obj .? "icon"
    tags <- obj .? "tags"
    visibility <- obj .? "visibility"
    guard <- obj .? "guard"
    pure $ GlobalGroupRequest {
      displayName,
      description,
      membership,
      icon,
      tags,
      visibility,
      guard
    }


instance globalGroupRequestRequestable :: Requestable GlobalGroupRequest where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance globalGroupRequestRespondable :: Respondable GlobalGroupRequest where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkGlobalGroupRequest
      <$> readProp "display_name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "membership" json
      <*> (runNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "visibility" json
      <*> readProp "guard" json


instance globalGroupRequestIsForeign :: IsForeign GlobalGroupRequest where
  read json =
      mkGlobalGroupRequest
      <$> readProp "display_name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "membership" json
      <*> (runNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "visibility" json
      <*> readProp "guard" json


instance globalGroupRequestShow :: Show GlobalGroupRequest where
    show (GlobalGroupRequest o) = show "displayName: " ++ show o.displayName ++ ", " ++ show "description: " ++ show o.description ++ ", " ++ show "membership: " ++ show o.membership ++ ", " ++ show "icon: " ++ show o.icon ++ ", " ++ show "tags: " ++ show o.tags ++ ", " ++ show "visibility: " ++ show o.visibility ++ ", " ++ show "guard: " ++ show o.guard

newtype GlobalGroupResponse = GlobalGroupResponse {
  id :: Int,
  userId :: Int,
  name :: String,
  displayName :: String,
  description :: (Maybe String),
  membership :: Membership,
  icon :: (Maybe String),
  tags :: (Array String),
  visibility :: Visibility,
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


type GlobalGroupResponseR = {
  id :: Int,
  userId :: Int,
  name :: String,
  displayName :: String,
  description :: (Maybe String),
  membership :: Membership,
  icon :: (Maybe String),
  tags :: (Array String),
  visibility :: Visibility,
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


_GlobalGroupResponse :: LensP GlobalGroupResponse {
  id :: Int,
  userId :: Int,
  name :: String,
  displayName :: String,
  description :: (Maybe String),
  membership :: Membership,
  icon :: (Maybe String),
  tags :: (Array String),
  visibility :: Visibility,
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}
_GlobalGroupResponse f (GlobalGroupResponse o) = GlobalGroupResponse <$> f o


mkGlobalGroupResponse :: Int -> Int -> String -> String -> (Maybe String) -> Membership -> (Maybe String) -> (Array String) -> Visibility -> Boolean -> Int -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> GlobalGroupResponse
mkGlobalGroupResponse id userId name displayName description membership icon tags visibility active guard createdAt modifiedBy modifiedAt activityAt =
  GlobalGroupResponse{id, userId, name, displayName, description, membership, icon, tags, visibility, active, guard, createdAt, modifiedBy, modifiedAt, activityAt}


unwrapGlobalGroupResponse (GlobalGroupResponse r) = r

instance globalGroupResponseEncodeJson :: EncodeJson GlobalGroupResponse where
  encodeJson (GlobalGroupResponse o) =
       "tag" := "GlobalGroupResponse"
    ~> "id" := o.id
    ~> "user_id" := o.userId
    ~> "name" := o.name
    ~> "display_name" := o.displayName
    ~> "description" := o.description
    ~> "membership" := o.membership
    ~> "icon" := o.icon
    ~> "tags" := o.tags
    ~> "visibility" := o.visibility
    ~> "active" := o.active
    ~> "guard" := o.guard
    ~> "created_at" := o.createdAt
    ~> "modified_by" := o.modifiedBy
    ~> "modified_at" := o.modifiedAt
    ~> "activity_at" := o.activityAt
    ~> jsonEmptyObject


instance globalGroupResponseDecodeJson :: DecodeJson GlobalGroupResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    userId <- obj .? "user_id"
    name <- obj .? "name"
    displayName <- obj .? "display_name"
    description <- obj .? "description"
    membership <- obj .? "membership"
    icon <- obj .? "icon"
    tags <- obj .? "tags"
    visibility <- obj .? "visibility"
    active <- obj .? "active"
    guard <- obj .? "guard"
    createdAt <- obj .? "created_at"
    modifiedBy <- obj .? "modified_by"
    modifiedAt <- obj .? "modified_at"
    activityAt <- obj .? "activity_at"
    pure $ GlobalGroupResponse {
      id,
      userId,
      name,
      displayName,
      description,
      membership,
      icon,
      tags,
      visibility,
      active,
      guard,
      createdAt,
      modifiedBy,
      modifiedAt,
      activityAt
    }


instance globalGroupResponseRequestable :: Requestable GlobalGroupResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance globalGroupResponseRespondable :: Respondable GlobalGroupResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkGlobalGroupResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "name" json
      <*> readProp "display_name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "membership" json
      <*> (runNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "visibility" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance globalGroupResponseIsForeign :: IsForeign GlobalGroupResponse where
  read json =
      mkGlobalGroupResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "name" json
      <*> readProp "display_name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "membership" json
      <*> (runNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "visibility" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance globalGroupResponseShow :: Show GlobalGroupResponse where
    show (GlobalGroupResponse o) = show "id: " ++ show o.id ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "name: " ++ show o.name ++ ", " ++ show "displayName: " ++ show o.displayName ++ ", " ++ show "description: " ++ show o.description ++ ", " ++ show "membership: " ++ show o.membership ++ ", " ++ show "icon: " ++ show o.icon ++ ", " ++ show "tags: " ++ show o.tags ++ ", " ++ show "visibility: " ++ show o.visibility ++ ", " ++ show "active: " ++ show o.active ++ ", " ++ show "guard: " ++ show o.guard ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedBy: " ++ show o.modifiedBy ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt ++ ", " ++ show "activityAt: " ++ show o.activityAt

newtype GlobalGroupResponses = GlobalGroupResponses {
  globalGroupResponses :: (Array GlobalGroupResponse)
}


type GlobalGroupResponsesR = {
  globalGroupResponses :: (Array GlobalGroupResponse)
}


_GlobalGroupResponses :: LensP GlobalGroupResponses {
  globalGroupResponses :: (Array GlobalGroupResponse)
}
_GlobalGroupResponses f (GlobalGroupResponses o) = GlobalGroupResponses <$> f o


mkGlobalGroupResponses :: (Array GlobalGroupResponse) -> GlobalGroupResponses
mkGlobalGroupResponses globalGroupResponses =
  GlobalGroupResponses{globalGroupResponses}


unwrapGlobalGroupResponses (GlobalGroupResponses r) = r

instance globalGroupResponsesEncodeJson :: EncodeJson GlobalGroupResponses where
  encodeJson (GlobalGroupResponses o) =
       "tag" := "GlobalGroupResponses"
    ~> "global_group_responses" := o.globalGroupResponses
    ~> jsonEmptyObject


instance globalGroupResponsesDecodeJson :: DecodeJson GlobalGroupResponses where
  decodeJson o = do
    obj <- decodeJson o
    globalGroupResponses <- obj .? "global_group_responses"
    pure $ GlobalGroupResponses {
      globalGroupResponses
    }


instance globalGroupResponsesRequestable :: Requestable GlobalGroupResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance globalGroupResponsesRespondable :: Respondable GlobalGroupResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkGlobalGroupResponses
      <$> readProp "global_group_responses" json


instance globalGroupResponsesIsForeign :: IsForeign GlobalGroupResponses where
  read json =
      mkGlobalGroupResponses
      <$> readProp "global_group_responses" json


instance globalGroupResponsesShow :: Show GlobalGroupResponses where
    show (GlobalGroupResponses o) = show "globalGroupResponses: " ++ show o.globalGroupResponses

newtype GlobalGroupStatResponse = GlobalGroupStatResponse {
  groups :: Int
}


type GlobalGroupStatResponseR = {
  groups :: Int
}


_GlobalGroupStatResponse :: LensP GlobalGroupStatResponse {
  groups :: Int
}
_GlobalGroupStatResponse f (GlobalGroupStatResponse o) = GlobalGroupStatResponse <$> f o


mkGlobalGroupStatResponse :: Int -> GlobalGroupStatResponse
mkGlobalGroupStatResponse groups =
  GlobalGroupStatResponse{groups}


unwrapGlobalGroupStatResponse (GlobalGroupStatResponse r) = r

instance globalGroupStatResponseEncodeJson :: EncodeJson GlobalGroupStatResponse where
  encodeJson (GlobalGroupStatResponse o) =
       "tag" := "GlobalGroupStatResponse"
    ~> "groups" := o.groups
    ~> jsonEmptyObject


instance globalGroupStatResponseDecodeJson :: DecodeJson GlobalGroupStatResponse where
  decodeJson o = do
    obj <- decodeJson o
    groups <- obj .? "groups"
    pure $ GlobalGroupStatResponse {
      groups
    }


instance globalGroupStatResponseRequestable :: Requestable GlobalGroupStatResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance globalGroupStatResponseRespondable :: Respondable GlobalGroupStatResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkGlobalGroupStatResponse
      <$> readProp "groups" json


instance globalGroupStatResponseIsForeign :: IsForeign GlobalGroupStatResponse where
  read json =
      mkGlobalGroupStatResponse
      <$> readProp "groups" json


instance globalGroupStatResponseShow :: Show GlobalGroupStatResponse where
    show (GlobalGroupStatResponse o) = show "groups: " ++ show o.groups

newtype GlobalGroupStatResponses = GlobalGroupStatResponses {
  globalGroupStatResponses :: (Array GlobalGroupStatResponse)
}


type GlobalGroupStatResponsesR = {
  globalGroupStatResponses :: (Array GlobalGroupStatResponse)
}


_GlobalGroupStatResponses :: LensP GlobalGroupStatResponses {
  globalGroupStatResponses :: (Array GlobalGroupStatResponse)
}
_GlobalGroupStatResponses f (GlobalGroupStatResponses o) = GlobalGroupStatResponses <$> f o


mkGlobalGroupStatResponses :: (Array GlobalGroupStatResponse) -> GlobalGroupStatResponses
mkGlobalGroupStatResponses globalGroupStatResponses =
  GlobalGroupStatResponses{globalGroupStatResponses}


unwrapGlobalGroupStatResponses (GlobalGroupStatResponses r) = r

instance globalGroupStatResponsesEncodeJson :: EncodeJson GlobalGroupStatResponses where
  encodeJson (GlobalGroupStatResponses o) =
       "tag" := "GlobalGroupStatResponses"
    ~> "global_group_stat_responses" := o.globalGroupStatResponses
    ~> jsonEmptyObject


instance globalGroupStatResponsesDecodeJson :: DecodeJson GlobalGroupStatResponses where
  decodeJson o = do
    obj <- decodeJson o
    globalGroupStatResponses <- obj .? "global_group_stat_responses"
    pure $ GlobalGroupStatResponses {
      globalGroupStatResponses
    }


instance globalGroupStatResponsesRequestable :: Requestable GlobalGroupStatResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance globalGroupStatResponsesRespondable :: Respondable GlobalGroupStatResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkGlobalGroupStatResponses
      <$> readProp "global_group_stat_responses" json


instance globalGroupStatResponsesIsForeign :: IsForeign GlobalGroupStatResponses where
  read json =
      mkGlobalGroupStatResponses
      <$> readProp "global_group_stat_responses" json


instance globalGroupStatResponsesShow :: Show GlobalGroupStatResponses where
    show (GlobalGroupStatResponses o) = show "globalGroupStatResponses: " ++ show o.globalGroupStatResponses

newtype GroupRequest = GroupRequest {
  guard :: Int
}


type GroupRequestR = {
  guard :: Int
}


_GroupRequest :: LensP GroupRequest {
  guard :: Int
}
_GroupRequest f (GroupRequest o) = GroupRequest <$> f o


mkGroupRequest :: Int -> GroupRequest
mkGroupRequest guard =
  GroupRequest{guard}


unwrapGroupRequest (GroupRequest r) = r

instance groupRequestEncodeJson :: EncodeJson GroupRequest where
  encodeJson (GroupRequest o) =
       "tag" := "GroupRequest"
    ~> "guard" := o.guard
    ~> jsonEmptyObject


instance groupRequestDecodeJson :: DecodeJson GroupRequest where
  decodeJson o = do
    obj <- decodeJson o
    guard <- obj .? "guard"
    pure $ GroupRequest {
      guard
    }


instance groupRequestRequestable :: Requestable GroupRequest where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance groupRequestRespondable :: Respondable GroupRequest where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkGroupRequest
      <$> readProp "guard" json


instance groupRequestIsForeign :: IsForeign GroupRequest where
  read json =
      mkGroupRequest
      <$> readProp "guard" json


instance groupRequestShow :: Show GroupRequest where
    show (GroupRequest o) = show "guard: " ++ show o.guard

newtype GroupResponse = GroupResponse {
  id :: Int,
  userId :: Int,
  globalGroupId :: Int,
  organizationId :: Int,
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


type GroupResponseR = {
  id :: Int,
  userId :: Int,
  globalGroupId :: Int,
  organizationId :: Int,
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


_GroupResponse :: LensP GroupResponse {
  id :: Int,
  userId :: Int,
  globalGroupId :: Int,
  organizationId :: Int,
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}
_GroupResponse f (GroupResponse o) = GroupResponse <$> f o


mkGroupResponse :: Int -> Int -> Int -> Int -> Boolean -> Int -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> GroupResponse
mkGroupResponse id userId globalGroupId organizationId active guard createdAt modifiedBy modifiedAt activityAt =
  GroupResponse{id, userId, globalGroupId, organizationId, active, guard, createdAt, modifiedBy, modifiedAt, activityAt}


unwrapGroupResponse (GroupResponse r) = r

instance groupResponseEncodeJson :: EncodeJson GroupResponse where
  encodeJson (GroupResponse o) =
       "tag" := "GroupResponse"
    ~> "id" := o.id
    ~> "user_id" := o.userId
    ~> "global_group_id" := o.globalGroupId
    ~> "organization_id" := o.organizationId
    ~> "active" := o.active
    ~> "guard" := o.guard
    ~> "created_at" := o.createdAt
    ~> "modified_by" := o.modifiedBy
    ~> "modified_at" := o.modifiedAt
    ~> "activity_at" := o.activityAt
    ~> jsonEmptyObject


instance groupResponseDecodeJson :: DecodeJson GroupResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    userId <- obj .? "user_id"
    globalGroupId <- obj .? "global_group_id"
    organizationId <- obj .? "organization_id"
    active <- obj .? "active"
    guard <- obj .? "guard"
    createdAt <- obj .? "created_at"
    modifiedBy <- obj .? "modified_by"
    modifiedAt <- obj .? "modified_at"
    activityAt <- obj .? "activity_at"
    pure $ GroupResponse {
      id,
      userId,
      globalGroupId,
      organizationId,
      active,
      guard,
      createdAt,
      modifiedBy,
      modifiedAt,
      activityAt
    }


instance groupResponseRequestable :: Requestable GroupResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance groupResponseRespondable :: Respondable GroupResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkGroupResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "global_group_id" json
      <*> readProp "organization_id" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance groupResponseIsForeign :: IsForeign GroupResponse where
  read json =
      mkGroupResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "global_group_id" json
      <*> readProp "organization_id" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance groupResponseShow :: Show GroupResponse where
    show (GroupResponse o) = show "id: " ++ show o.id ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "globalGroupId: " ++ show o.globalGroupId ++ ", " ++ show "organizationId: " ++ show o.organizationId ++ ", " ++ show "active: " ++ show o.active ++ ", " ++ show "guard: " ++ show o.guard ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedBy: " ++ show o.modifiedBy ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt ++ ", " ++ show "activityAt: " ++ show o.activityAt

newtype GroupResponses = GroupResponses {
  groupResponses :: (Array GroupResponse)
}


type GroupResponsesR = {
  groupResponses :: (Array GroupResponse)
}


_GroupResponses :: LensP GroupResponses {
  groupResponses :: (Array GroupResponse)
}
_GroupResponses f (GroupResponses o) = GroupResponses <$> f o


mkGroupResponses :: (Array GroupResponse) -> GroupResponses
mkGroupResponses groupResponses =
  GroupResponses{groupResponses}


unwrapGroupResponses (GroupResponses r) = r

instance groupResponsesEncodeJson :: EncodeJson GroupResponses where
  encodeJson (GroupResponses o) =
       "tag" := "GroupResponses"
    ~> "group_responses" := o.groupResponses
    ~> jsonEmptyObject


instance groupResponsesDecodeJson :: DecodeJson GroupResponses where
  decodeJson o = do
    obj <- decodeJson o
    groupResponses <- obj .? "group_responses"
    pure $ GroupResponses {
      groupResponses
    }


instance groupResponsesRequestable :: Requestable GroupResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance groupResponsesRespondable :: Respondable GroupResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkGroupResponses
      <$> readProp "group_responses" json


instance groupResponsesIsForeign :: IsForeign GroupResponses where
  read json =
      mkGroupResponses
      <$> readProp "group_responses" json


instance groupResponsesShow :: Show GroupResponses where
    show (GroupResponses o) = show "groupResponses: " ++ show o.groupResponses

newtype GroupStatResponse = GroupStatResponse {
  members :: Int
}


type GroupStatResponseR = {
  members :: Int
}


_GroupStatResponse :: LensP GroupStatResponse {
  members :: Int
}
_GroupStatResponse f (GroupStatResponse o) = GroupStatResponse <$> f o


mkGroupStatResponse :: Int -> GroupStatResponse
mkGroupStatResponse members =
  GroupStatResponse{members}


unwrapGroupStatResponse (GroupStatResponse r) = r

instance groupStatResponseEncodeJson :: EncodeJson GroupStatResponse where
  encodeJson (GroupStatResponse o) =
       "tag" := "GroupStatResponse"
    ~> "members" := o.members
    ~> jsonEmptyObject


instance groupStatResponseDecodeJson :: DecodeJson GroupStatResponse where
  decodeJson o = do
    obj <- decodeJson o
    members <- obj .? "members"
    pure $ GroupStatResponse {
      members
    }


instance groupStatResponseRequestable :: Requestable GroupStatResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance groupStatResponseRespondable :: Respondable GroupStatResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkGroupStatResponse
      <$> readProp "members" json


instance groupStatResponseIsForeign :: IsForeign GroupStatResponse where
  read json =
      mkGroupStatResponse
      <$> readProp "members" json


instance groupStatResponseShow :: Show GroupStatResponse where
    show (GroupStatResponse o) = show "members: " ++ show o.members

newtype GroupStatResponses = GroupStatResponses {
  groupStatResponses :: (Array GroupStatResponse)
}


type GroupStatResponsesR = {
  groupStatResponses :: (Array GroupStatResponse)
}


_GroupStatResponses :: LensP GroupStatResponses {
  groupStatResponses :: (Array GroupStatResponse)
}
_GroupStatResponses f (GroupStatResponses o) = GroupStatResponses <$> f o


mkGroupStatResponses :: (Array GroupStatResponse) -> GroupStatResponses
mkGroupStatResponses groupStatResponses =
  GroupStatResponses{groupStatResponses}


unwrapGroupStatResponses (GroupStatResponses r) = r

instance groupStatResponsesEncodeJson :: EncodeJson GroupStatResponses where
  encodeJson (GroupStatResponses o) =
       "tag" := "GroupStatResponses"
    ~> "group_stat_responses" := o.groupStatResponses
    ~> jsonEmptyObject


instance groupStatResponsesDecodeJson :: DecodeJson GroupStatResponses where
  decodeJson o = do
    obj <- decodeJson o
    groupStatResponses <- obj .? "group_stat_responses"
    pure $ GroupStatResponses {
      groupStatResponses
    }


instance groupStatResponsesRequestable :: Requestable GroupStatResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance groupStatResponsesRespondable :: Respondable GroupStatResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkGroupStatResponses
      <$> readProp "group_stat_responses" json


instance groupStatResponsesIsForeign :: IsForeign GroupStatResponses where
  read json =
      mkGroupStatResponses
      <$> readProp "group_stat_responses" json


instance groupStatResponsesShow :: Show GroupStatResponses where
    show (GroupStatResponses o) = show "groupStatResponses: " ++ show o.groupStatResponses

newtype GroupMemberRequest = GroupMemberRequest {
  guard :: Int
}


type GroupMemberRequestR = {
  guard :: Int
}


_GroupMemberRequest :: LensP GroupMemberRequest {
  guard :: Int
}
_GroupMemberRequest f (GroupMemberRequest o) = GroupMemberRequest <$> f o


mkGroupMemberRequest :: Int -> GroupMemberRequest
mkGroupMemberRequest guard =
  GroupMemberRequest{guard}


unwrapGroupMemberRequest (GroupMemberRequest r) = r

instance groupMemberRequestEncodeJson :: EncodeJson GroupMemberRequest where
  encodeJson (GroupMemberRequest o) =
       "tag" := "GroupMemberRequest"
    ~> "guard" := o.guard
    ~> jsonEmptyObject


instance groupMemberRequestDecodeJson :: DecodeJson GroupMemberRequest where
  decodeJson o = do
    obj <- decodeJson o
    guard <- obj .? "guard"
    pure $ GroupMemberRequest {
      guard
    }


instance groupMemberRequestRequestable :: Requestable GroupMemberRequest where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance groupMemberRequestRespondable :: Respondable GroupMemberRequest where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkGroupMemberRequest
      <$> readProp "guard" json


instance groupMemberRequestIsForeign :: IsForeign GroupMemberRequest where
  read json =
      mkGroupMemberRequest
      <$> readProp "guard" json


instance groupMemberRequestShow :: Show GroupMemberRequest where
    show (GroupMemberRequest o) = show "guard: " ++ show o.guard

newtype GroupMemberResponse = GroupMemberResponse {
  id :: Int,
  userId :: Int,
  globalGroupId :: Int,
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


type GroupMemberResponseR = {
  id :: Int,
  userId :: Int,
  globalGroupId :: Int,
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


_GroupMemberResponse :: LensP GroupMemberResponse {
  id :: Int,
  userId :: Int,
  globalGroupId :: Int,
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}
_GroupMemberResponse f (GroupMemberResponse o) = GroupMemberResponse <$> f o


mkGroupMemberResponse :: Int -> Int -> Int -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> GroupMemberResponse
mkGroupMemberResponse id userId globalGroupId createdAt modifiedBy modifiedAt activityAt =
  GroupMemberResponse{id, userId, globalGroupId, createdAt, modifiedBy, modifiedAt, activityAt}


unwrapGroupMemberResponse (GroupMemberResponse r) = r

instance groupMemberResponseEncodeJson :: EncodeJson GroupMemberResponse where
  encodeJson (GroupMemberResponse o) =
       "tag" := "GroupMemberResponse"
    ~> "id" := o.id
    ~> "user_id" := o.userId
    ~> "global_group_id" := o.globalGroupId
    ~> "created_at" := o.createdAt
    ~> "modified_by" := o.modifiedBy
    ~> "modified_at" := o.modifiedAt
    ~> "activity_at" := o.activityAt
    ~> jsonEmptyObject


instance groupMemberResponseDecodeJson :: DecodeJson GroupMemberResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    userId <- obj .? "user_id"
    globalGroupId <- obj .? "global_group_id"
    createdAt <- obj .? "created_at"
    modifiedBy <- obj .? "modified_by"
    modifiedAt <- obj .? "modified_at"
    activityAt <- obj .? "activity_at"
    pure $ GroupMemberResponse {
      id,
      userId,
      globalGroupId,
      createdAt,
      modifiedBy,
      modifiedAt,
      activityAt
    }


instance groupMemberResponseRequestable :: Requestable GroupMemberResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance groupMemberResponseRespondable :: Respondable GroupMemberResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkGroupMemberResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "global_group_id" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance groupMemberResponseIsForeign :: IsForeign GroupMemberResponse where
  read json =
      mkGroupMemberResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "global_group_id" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance groupMemberResponseShow :: Show GroupMemberResponse where
    show (GroupMemberResponse o) = show "id: " ++ show o.id ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "globalGroupId: " ++ show o.globalGroupId ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedBy: " ++ show o.modifiedBy ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt ++ ", " ++ show "activityAt: " ++ show o.activityAt

newtype GroupMemberResponses = GroupMemberResponses {
  groupMemberResponses :: (Array GroupMemberResponse)
}


type GroupMemberResponsesR = {
  groupMemberResponses :: (Array GroupMemberResponse)
}


_GroupMemberResponses :: LensP GroupMemberResponses {
  groupMemberResponses :: (Array GroupMemberResponse)
}
_GroupMemberResponses f (GroupMemberResponses o) = GroupMemberResponses <$> f o


mkGroupMemberResponses :: (Array GroupMemberResponse) -> GroupMemberResponses
mkGroupMemberResponses groupMemberResponses =
  GroupMemberResponses{groupMemberResponses}


unwrapGroupMemberResponses (GroupMemberResponses r) = r

instance groupMemberResponsesEncodeJson :: EncodeJson GroupMemberResponses where
  encodeJson (GroupMemberResponses o) =
       "tag" := "GroupMemberResponses"
    ~> "group_member_responses" := o.groupMemberResponses
    ~> jsonEmptyObject


instance groupMemberResponsesDecodeJson :: DecodeJson GroupMemberResponses where
  decodeJson o = do
    obj <- decodeJson o
    groupMemberResponses <- obj .? "group_member_responses"
    pure $ GroupMemberResponses {
      groupMemberResponses
    }


instance groupMemberResponsesRequestable :: Requestable GroupMemberResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance groupMemberResponsesRespondable :: Respondable GroupMemberResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkGroupMemberResponses
      <$> readProp "group_member_responses" json


instance groupMemberResponsesIsForeign :: IsForeign GroupMemberResponses where
  read json =
      mkGroupMemberResponses
      <$> readProp "group_member_responses" json


instance groupMemberResponsesShow :: Show GroupMemberResponses where
    show (GroupMemberResponses o) = show "groupMemberResponses: " ++ show o.groupMemberResponses

data GroupMemberStatResponse
  = GroupMemberStatResponse 



instance groupMemberStatResponseEncodeJson :: EncodeJson GroupMemberStatResponse where
  encodeJson (GroupMemberStatResponse ) =
       "tag" := "GroupMemberStatResponse"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject


instance groupMemberStatResponseDecodeJson :: DecodeJson GroupMemberStatResponse where
  decodeJson json = do
    obj <- decodeJson json
    tag <- obj .? "tag"
    case tag of
        "GroupMemberStatResponse" -> do
          return GroupMemberStatResponse

  decodeJson x = fail $ "Could not parse object: " ++ show x


instance groupMemberStatResponseRequestable :: Requestable GroupMemberStatResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance groupMemberStatResponseRespondable :: Respondable GroupMemberStatResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    tag <- readProp "tag" json
    case tag of
        "GroupMemberStatResponse" -> do
          return GroupMemberStatResponse



instance groupMemberStatResponseIsForeign :: IsForeign GroupMemberStatResponse where
  read json = do
    tag <- readProp "tag" json
    case tag of
        "GroupMemberStatResponse" -> do
          return GroupMemberStatResponse



instance groupMemberStatResponseShow :: Show GroupMemberStatResponse where
  show (GroupMemberStatResponse) = "GroupMemberStatResponse"


data GroupMemberStatResponses
  = GroupMemberStatResponses 



instance groupMemberStatResponsesEncodeJson :: EncodeJson GroupMemberStatResponses where
  encodeJson (GroupMemberStatResponses ) =
       "tag" := "GroupMemberStatResponses"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject


instance groupMemberStatResponsesDecodeJson :: DecodeJson GroupMemberStatResponses where
  decodeJson json = do
    obj <- decodeJson json
    tag <- obj .? "tag"
    case tag of
        "GroupMemberStatResponses" -> do
          return GroupMemberStatResponses

  decodeJson x = fail $ "Could not parse object: " ++ show x


instance groupMemberStatResponsesRequestable :: Requestable GroupMemberStatResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance groupMemberStatResponsesRespondable :: Respondable GroupMemberStatResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    tag <- readProp "tag" json
    case tag of
        "GroupMemberStatResponses" -> do
          return GroupMemberStatResponses



instance groupMemberStatResponsesIsForeign :: IsForeign GroupMemberStatResponses where
  read json = do
    tag <- readProp "tag" json
    case tag of
        "GroupMemberStatResponses" -> do
          return GroupMemberStatResponses



instance groupMemberStatResponsesShow :: Show GroupMemberStatResponses where
  show (GroupMemberStatResponses) = "GroupMemberStatResponses"


newtype LeuronRequest = LeuronRequest {
  dataP :: LeuronData,
  title :: (Maybe String),
  description :: (Maybe String),
  section :: (Maybe String),
  page :: (Maybe String),
  examples :: (Maybe (Array String)),
  strengths :: (Maybe (Array String)),
  categories :: (DepList String),
  splits :: (Maybe (Array Splits)),
  substitutions :: (Maybe (Array Substitutions)),
  tags :: (Array String),
  style :: (Maybe (Array String)),
  guard :: Int
}


type LeuronRequestR = {
  dataP :: LeuronData,
  title :: (Maybe String),
  description :: (Maybe String),
  section :: (Maybe String),
  page :: (Maybe String),
  examples :: (Maybe (Array String)),
  strengths :: (Maybe (Array String)),
  categories :: (DepList String),
  splits :: (Maybe (Array Splits)),
  substitutions :: (Maybe (Array Substitutions)),
  tags :: (Array String),
  style :: (Maybe (Array String)),
  guard :: Int
}


_LeuronRequest :: LensP LeuronRequest {
  dataP :: LeuronData,
  title :: (Maybe String),
  description :: (Maybe String),
  section :: (Maybe String),
  page :: (Maybe String),
  examples :: (Maybe (Array String)),
  strengths :: (Maybe (Array String)),
  categories :: (DepList String),
  splits :: (Maybe (Array Splits)),
  substitutions :: (Maybe (Array Substitutions)),
  tags :: (Array String),
  style :: (Maybe (Array String)),
  guard :: Int
}
_LeuronRequest f (LeuronRequest o) = LeuronRequest <$> f o


mkLeuronRequest :: LeuronData -> (Maybe String) -> (Maybe String) -> (Maybe String) -> (Maybe String) -> (Maybe (Array String)) -> (Maybe (Array String)) -> (DepList String) -> (Maybe (Array Splits)) -> (Maybe (Array Substitutions)) -> (Array String) -> (Maybe (Array String)) -> Int -> LeuronRequest
mkLeuronRequest dataP title description section page examples strengths categories splits substitutions tags style guard =
  LeuronRequest{dataP, title, description, section, page, examples, strengths, categories, splits, substitutions, tags, style, guard}


unwrapLeuronRequest (LeuronRequest r) = r

instance leuronRequestEncodeJson :: EncodeJson LeuronRequest where
  encodeJson (LeuronRequest o) =
       "tag" := "LeuronRequest"
    ~> "data" := o.dataP
    ~> "title" := o.title
    ~> "description" := o.description
    ~> "section" := o.section
    ~> "page" := o.page
    ~> "examples" := o.examples
    ~> "strengths" := o.strengths
    ~> "categories" := o.categories
    ~> "splits" := o.splits
    ~> "substitutions" := o.substitutions
    ~> "tags" := o.tags
    ~> "style" := o.style
    ~> "guard" := o.guard
    ~> jsonEmptyObject


instance leuronRequestDecodeJson :: DecodeJson LeuronRequest where
  decodeJson o = do
    obj <- decodeJson o
    dataP <- obj .? "data"
    title <- obj .? "title"
    description <- obj .? "description"
    section <- obj .? "section"
    page <- obj .? "page"
    examples <- obj .? "examples"
    strengths <- obj .? "strengths"
    categories <- obj .? "categories"
    splits <- obj .? "splits"
    substitutions <- obj .? "substitutions"
    tags <- obj .? "tags"
    style <- obj .? "style"
    guard <- obj .? "guard"
    pure $ LeuronRequest {
      dataP,
      title,
      description,
      section,
      page,
      examples,
      strengths,
      categories,
      splits,
      substitutions,
      tags,
      style,
      guard
    }


instance leuronRequestRequestable :: Requestable LeuronRequest where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance leuronRequestRespondable :: Respondable LeuronRequest where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkLeuronRequest
      <$> readProp "data" json
      <*> (runNullOrUndefined <$> readProp "title" json)
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> (runNullOrUndefined <$> readProp "section" json)
      <*> (runNullOrUndefined <$> readProp "page" json)
      <*> (runNullOrUndefined <$> readProp "examples" json)
      <*> (runNullOrUndefined <$> readProp "strengths" json)
      <*> readProp "categories" json
      <*> (runNullOrUndefined <$> readProp "splits" json)
      <*> (runNullOrUndefined <$> readProp "substitutions" json)
      <*> readProp "tags" json
      <*> (runNullOrUndefined <$> readProp "style" json)
      <*> readProp "guard" json


instance leuronRequestIsForeign :: IsForeign LeuronRequest where
  read json =
      mkLeuronRequest
      <$> readProp "data" json
      <*> (runNullOrUndefined <$> readProp "title" json)
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> (runNullOrUndefined <$> readProp "section" json)
      <*> (runNullOrUndefined <$> readProp "page" json)
      <*> (runNullOrUndefined <$> readProp "examples" json)
      <*> (runNullOrUndefined <$> readProp "strengths" json)
      <*> readProp "categories" json
      <*> (runNullOrUndefined <$> readProp "splits" json)
      <*> (runNullOrUndefined <$> readProp "substitutions" json)
      <*> readProp "tags" json
      <*> (runNullOrUndefined <$> readProp "style" json)
      <*> readProp "guard" json


instance leuronRequestShow :: Show LeuronRequest where
    show (LeuronRequest o) = show "dataP: " ++ show o.dataP ++ ", " ++ show "title: " ++ show o.title ++ ", " ++ show "description: " ++ show o.description ++ ", " ++ show "section: " ++ show o.section ++ ", " ++ show "page: " ++ show o.page ++ ", " ++ show "examples: " ++ show o.examples ++ ", " ++ show "strengths: " ++ show o.strengths ++ ", " ++ show "categories: " ++ show o.categories ++ ", " ++ show "splits: " ++ show o.splits ++ ", " ++ show "substitutions: " ++ show o.substitutions ++ ", " ++ show "tags: " ++ show o.tags ++ ", " ++ show "style: " ++ show o.style ++ ", " ++ show "guard: " ++ show o.guard

newtype LeuronResponse = LeuronResponse {
  id :: Int,
  userId :: Int,
  resourceId :: Int,
  dataP :: LeuronData,
  title :: (Maybe String),
  description :: (Maybe String),
  section :: (Maybe String),
  page :: (Maybe String),
  examples :: (Maybe (Array String)),
  strengths :: (Maybe (Array String)),
  categories :: (DepList String),
  splits :: (Maybe (Array Splits)),
  substitutions :: (Maybe (Array Substitutions)),
  tags :: (Array String),
  style :: (Maybe (Array String)),
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


type LeuronResponseR = {
  id :: Int,
  userId :: Int,
  resourceId :: Int,
  dataP :: LeuronData,
  title :: (Maybe String),
  description :: (Maybe String),
  section :: (Maybe String),
  page :: (Maybe String),
  examples :: (Maybe (Array String)),
  strengths :: (Maybe (Array String)),
  categories :: (DepList String),
  splits :: (Maybe (Array Splits)),
  substitutions :: (Maybe (Array Substitutions)),
  tags :: (Array String),
  style :: (Maybe (Array String)),
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


_LeuronResponse :: LensP LeuronResponse {
  id :: Int,
  userId :: Int,
  resourceId :: Int,
  dataP :: LeuronData,
  title :: (Maybe String),
  description :: (Maybe String),
  section :: (Maybe String),
  page :: (Maybe String),
  examples :: (Maybe (Array String)),
  strengths :: (Maybe (Array String)),
  categories :: (DepList String),
  splits :: (Maybe (Array Splits)),
  substitutions :: (Maybe (Array Substitutions)),
  tags :: (Array String),
  style :: (Maybe (Array String)),
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}
_LeuronResponse f (LeuronResponse o) = LeuronResponse <$> f o


mkLeuronResponse :: Int -> Int -> Int -> LeuronData -> (Maybe String) -> (Maybe String) -> (Maybe String) -> (Maybe String) -> (Maybe (Array String)) -> (Maybe (Array String)) -> (DepList String) -> (Maybe (Array Splits)) -> (Maybe (Array Substitutions)) -> (Array String) -> (Maybe (Array String)) -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> LeuronResponse
mkLeuronResponse id userId resourceId dataP title description section page examples strengths categories splits substitutions tags style active guard createdAt modifiedAt activityAt =
  LeuronResponse{id, userId, resourceId, dataP, title, description, section, page, examples, strengths, categories, splits, substitutions, tags, style, active, guard, createdAt, modifiedAt, activityAt}


unwrapLeuronResponse (LeuronResponse r) = r

instance leuronResponseEncodeJson :: EncodeJson LeuronResponse where
  encodeJson (LeuronResponse o) =
       "tag" := "LeuronResponse"
    ~> "id" := o.id
    ~> "user_id" := o.userId
    ~> "resource_id" := o.resourceId
    ~> "data" := o.dataP
    ~> "title" := o.title
    ~> "description" := o.description
    ~> "section" := o.section
    ~> "page" := o.page
    ~> "examples" := o.examples
    ~> "strengths" := o.strengths
    ~> "categories" := o.categories
    ~> "splits" := o.splits
    ~> "substitutions" := o.substitutions
    ~> "tags" := o.tags
    ~> "style" := o.style
    ~> "active" := o.active
    ~> "guard" := o.guard
    ~> "created_at" := o.createdAt
    ~> "modified_at" := o.modifiedAt
    ~> "activity_at" := o.activityAt
    ~> jsonEmptyObject


instance leuronResponseDecodeJson :: DecodeJson LeuronResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    userId <- obj .? "user_id"
    resourceId <- obj .? "resource_id"
    dataP <- obj .? "data"
    title <- obj .? "title"
    description <- obj .? "description"
    section <- obj .? "section"
    page <- obj .? "page"
    examples <- obj .? "examples"
    strengths <- obj .? "strengths"
    categories <- obj .? "categories"
    splits <- obj .? "splits"
    substitutions <- obj .? "substitutions"
    tags <- obj .? "tags"
    style <- obj .? "style"
    active <- obj .? "active"
    guard <- obj .? "guard"
    createdAt <- obj .? "created_at"
    modifiedAt <- obj .? "modified_at"
    activityAt <- obj .? "activity_at"
    pure $ LeuronResponse {
      id,
      userId,
      resourceId,
      dataP,
      title,
      description,
      section,
      page,
      examples,
      strengths,
      categories,
      splits,
      substitutions,
      tags,
      style,
      active,
      guard,
      createdAt,
      modifiedAt,
      activityAt
    }


instance leuronResponseRequestable :: Requestable LeuronResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance leuronResponseRespondable :: Respondable LeuronResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkLeuronResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "resource_id" json
      <*> readProp "data" json
      <*> (runNullOrUndefined <$> readProp "title" json)
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> (runNullOrUndefined <$> readProp "section" json)
      <*> (runNullOrUndefined <$> readProp "page" json)
      <*> (runNullOrUndefined <$> readProp "examples" json)
      <*> (runNullOrUndefined <$> readProp "strengths" json)
      <*> readProp "categories" json
      <*> (runNullOrUndefined <$> readProp "splits" json)
      <*> (runNullOrUndefined <$> readProp "substitutions" json)
      <*> readProp "tags" json
      <*> (runNullOrUndefined <$> readProp "style" json)
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance leuronResponseIsForeign :: IsForeign LeuronResponse where
  read json =
      mkLeuronResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "resource_id" json
      <*> readProp "data" json
      <*> (runNullOrUndefined <$> readProp "title" json)
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> (runNullOrUndefined <$> readProp "section" json)
      <*> (runNullOrUndefined <$> readProp "page" json)
      <*> (runNullOrUndefined <$> readProp "examples" json)
      <*> (runNullOrUndefined <$> readProp "strengths" json)
      <*> readProp "categories" json
      <*> (runNullOrUndefined <$> readProp "splits" json)
      <*> (runNullOrUndefined <$> readProp "substitutions" json)
      <*> readProp "tags" json
      <*> (runNullOrUndefined <$> readProp "style" json)
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance leuronResponseShow :: Show LeuronResponse where
    show (LeuronResponse o) = show "id: " ++ show o.id ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "resourceId: " ++ show o.resourceId ++ ", " ++ show "dataP: " ++ show o.dataP ++ ", " ++ show "title: " ++ show o.title ++ ", " ++ show "description: " ++ show o.description ++ ", " ++ show "section: " ++ show o.section ++ ", " ++ show "page: " ++ show o.page ++ ", " ++ show "examples: " ++ show o.examples ++ ", " ++ show "strengths: " ++ show o.strengths ++ ", " ++ show "categories: " ++ show o.categories ++ ", " ++ show "splits: " ++ show o.splits ++ ", " ++ show "substitutions: " ++ show o.substitutions ++ ", " ++ show "tags: " ++ show o.tags ++ ", " ++ show "style: " ++ show o.style ++ ", " ++ show "active: " ++ show o.active ++ ", " ++ show "guard: " ++ show o.guard ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt ++ ", " ++ show "activityAt: " ++ show o.activityAt

newtype LeuronResponses = LeuronResponses {
  leuronResponses :: (Array LeuronResponse)
}


type LeuronResponsesR = {
  leuronResponses :: (Array LeuronResponse)
}


_LeuronResponses :: LensP LeuronResponses {
  leuronResponses :: (Array LeuronResponse)
}
_LeuronResponses f (LeuronResponses o) = LeuronResponses <$> f o


mkLeuronResponses :: (Array LeuronResponse) -> LeuronResponses
mkLeuronResponses leuronResponses =
  LeuronResponses{leuronResponses}


unwrapLeuronResponses (LeuronResponses r) = r

instance leuronResponsesEncodeJson :: EncodeJson LeuronResponses where
  encodeJson (LeuronResponses o) =
       "tag" := "LeuronResponses"
    ~> "leuron_responses" := o.leuronResponses
    ~> jsonEmptyObject


instance leuronResponsesDecodeJson :: DecodeJson LeuronResponses where
  decodeJson o = do
    obj <- decodeJson o
    leuronResponses <- obj .? "leuron_responses"
    pure $ LeuronResponses {
      leuronResponses
    }


instance leuronResponsesRequestable :: Requestable LeuronResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance leuronResponsesRespondable :: Respondable LeuronResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkLeuronResponses
      <$> readProp "leuron_responses" json


instance leuronResponsesIsForeign :: IsForeign LeuronResponses where
  read json =
      mkLeuronResponses
      <$> readProp "leuron_responses" json


instance leuronResponsesShow :: Show LeuronResponses where
    show (LeuronResponses o) = show "leuronResponses: " ++ show o.leuronResponses

newtype LeuronStatResponse = LeuronStatResponse {
  leuronId :: Int,
  likes :: Int,
  neutral :: Int,
  dislikes :: Int,
  stars :: Int,
  views :: Int
}


type LeuronStatResponseR = {
  leuronId :: Int,
  likes :: Int,
  neutral :: Int,
  dislikes :: Int,
  stars :: Int,
  views :: Int
}


_LeuronStatResponse :: LensP LeuronStatResponse {
  leuronId :: Int,
  likes :: Int,
  neutral :: Int,
  dislikes :: Int,
  stars :: Int,
  views :: Int
}
_LeuronStatResponse f (LeuronStatResponse o) = LeuronStatResponse <$> f o


mkLeuronStatResponse :: Int -> Int -> Int -> Int -> Int -> Int -> LeuronStatResponse
mkLeuronStatResponse leuronId likes neutral dislikes stars views =
  LeuronStatResponse{leuronId, likes, neutral, dislikes, stars, views}


unwrapLeuronStatResponse (LeuronStatResponse r) = r

instance leuronStatResponseEncodeJson :: EncodeJson LeuronStatResponse where
  encodeJson (LeuronStatResponse o) =
       "tag" := "LeuronStatResponse"
    ~> "leuron_id" := o.leuronId
    ~> "likes" := o.likes
    ~> "neutral" := o.neutral
    ~> "dislikes" := o.dislikes
    ~> "stars" := o.stars
    ~> "views" := o.views
    ~> jsonEmptyObject


instance leuronStatResponseDecodeJson :: DecodeJson LeuronStatResponse where
  decodeJson o = do
    obj <- decodeJson o
    leuronId <- obj .? "leuron_id"
    likes <- obj .? "likes"
    neutral <- obj .? "neutral"
    dislikes <- obj .? "dislikes"
    stars <- obj .? "stars"
    views <- obj .? "views"
    pure $ LeuronStatResponse {
      leuronId,
      likes,
      neutral,
      dislikes,
      stars,
      views
    }


instance leuronStatResponseRequestable :: Requestable LeuronStatResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance leuronStatResponseRespondable :: Respondable LeuronStatResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkLeuronStatResponse
      <$> readProp "leuron_id" json
      <*> readProp "likes" json
      <*> readProp "neutral" json
      <*> readProp "dislikes" json
      <*> readProp "stars" json
      <*> readProp "views" json


instance leuronStatResponseIsForeign :: IsForeign LeuronStatResponse where
  read json =
      mkLeuronStatResponse
      <$> readProp "leuron_id" json
      <*> readProp "likes" json
      <*> readProp "neutral" json
      <*> readProp "dislikes" json
      <*> readProp "stars" json
      <*> readProp "views" json


instance leuronStatResponseShow :: Show LeuronStatResponse where
    show (LeuronStatResponse o) = show "leuronId: " ++ show o.leuronId ++ ", " ++ show "likes: " ++ show o.likes ++ ", " ++ show "neutral: " ++ show o.neutral ++ ", " ++ show "dislikes: " ++ show o.dislikes ++ ", " ++ show "stars: " ++ show o.stars ++ ", " ++ show "views: " ++ show o.views

newtype LeuronStatResponses = LeuronStatResponses {
  leuronStatResponses :: (Array LeuronStatResponse)
}


type LeuronStatResponsesR = {
  leuronStatResponses :: (Array LeuronStatResponse)
}


_LeuronStatResponses :: LensP LeuronStatResponses {
  leuronStatResponses :: (Array LeuronStatResponse)
}
_LeuronStatResponses f (LeuronStatResponses o) = LeuronStatResponses <$> f o


mkLeuronStatResponses :: (Array LeuronStatResponse) -> LeuronStatResponses
mkLeuronStatResponses leuronStatResponses =
  LeuronStatResponses{leuronStatResponses}


unwrapLeuronStatResponses (LeuronStatResponses r) = r

instance leuronStatResponsesEncodeJson :: EncodeJson LeuronStatResponses where
  encodeJson (LeuronStatResponses o) =
       "tag" := "LeuronStatResponses"
    ~> "leuron_stat_responses" := o.leuronStatResponses
    ~> jsonEmptyObject


instance leuronStatResponsesDecodeJson :: DecodeJson LeuronStatResponses where
  decodeJson o = do
    obj <- decodeJson o
    leuronStatResponses <- obj .? "leuron_stat_responses"
    pure $ LeuronStatResponses {
      leuronStatResponses
    }


instance leuronStatResponsesRequestable :: Requestable LeuronStatResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance leuronStatResponsesRespondable :: Respondable LeuronStatResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkLeuronStatResponses
      <$> readProp "leuron_stat_responses" json


instance leuronStatResponsesIsForeign :: IsForeign LeuronStatResponses where
  read json =
      mkLeuronStatResponses
      <$> readProp "leuron_stat_responses" json


instance leuronStatResponsesShow :: Show LeuronStatResponses where
    show (LeuronStatResponses o) = show "leuronStatResponses: " ++ show o.leuronStatResponses

data LeuronTrainingSummary
  = LTS_View 
  | LTS_Skip 
  | LTS_Know 
  | LTS_DontKnow 
  | LTS_DontUnderstand 
  | LTS_DontCare 
  | LTS_Protest 



instance leuronTrainingSummaryEncodeJson :: EncodeJson LeuronTrainingSummary where
  encodeJson (LTS_View ) =
       "tag" := "LTS_View"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (LTS_Skip ) =
       "tag" := "LTS_Skip"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (LTS_Know ) =
       "tag" := "LTS_Know"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (LTS_DontKnow ) =
       "tag" := "LTS_DontKnow"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (LTS_DontUnderstand ) =
       "tag" := "LTS_DontUnderstand"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (LTS_DontCare ) =
       "tag" := "LTS_DontCare"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (LTS_Protest ) =
       "tag" := "LTS_Protest"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject


instance leuronTrainingSummaryDecodeJson :: DecodeJson LeuronTrainingSummary where
  decodeJson json = do
    obj <- decodeJson json
    tag <- obj .? "tag"
    case tag of
        "LTS_View" -> do
          return LTS_View

        "LTS_Skip" -> do
          return LTS_Skip

        "LTS_Know" -> do
          return LTS_Know

        "LTS_DontKnow" -> do
          return LTS_DontKnow

        "LTS_DontUnderstand" -> do
          return LTS_DontUnderstand

        "LTS_DontCare" -> do
          return LTS_DontCare

        "LTS_Protest" -> do
          return LTS_Protest

  decodeJson x = fail $ "Could not parse object: " ++ show x


instance leuronTrainingSummaryRequestable :: Requestable LeuronTrainingSummary where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance leuronTrainingSummaryRespondable :: Respondable LeuronTrainingSummary where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    tag <- readProp "tag" json
    case tag of
        "LTS_View" -> do
          return LTS_View

        "LTS_Skip" -> do
          return LTS_Skip

        "LTS_Know" -> do
          return LTS_Know

        "LTS_DontKnow" -> do
          return LTS_DontKnow

        "LTS_DontUnderstand" -> do
          return LTS_DontUnderstand

        "LTS_DontCare" -> do
          return LTS_DontCare

        "LTS_Protest" -> do
          return LTS_Protest



instance leuronTrainingSummaryIsForeign :: IsForeign LeuronTrainingSummary where
  read json = do
    tag <- readProp "tag" json
    case tag of
        "LTS_View" -> do
          return LTS_View

        "LTS_Skip" -> do
          return LTS_Skip

        "LTS_Know" -> do
          return LTS_Know

        "LTS_DontKnow" -> do
          return LTS_DontKnow

        "LTS_DontUnderstand" -> do
          return LTS_DontUnderstand

        "LTS_DontCare" -> do
          return LTS_DontCare

        "LTS_Protest" -> do
          return LTS_Protest



instance leuronTrainingSummaryShow :: Show LeuronTrainingSummary where
  show (LTS_View) = "LTS_View"
  show (LTS_Skip) = "LTS_Skip"
  show (LTS_Know) = "LTS_Know"
  show (LTS_DontKnow) = "LTS_DontKnow"
  show (LTS_DontUnderstand) = "LTS_DontUnderstand"
  show (LTS_DontCare) = "LTS_DontCare"
  show (LTS_Protest) = "LTS_Protest"


newtype LeuronTrainingRequest = LeuronTrainingRequest {
  summary :: LeuronTrainingSummary,
  guard :: Int
}


type LeuronTrainingRequestR = {
  summary :: LeuronTrainingSummary,
  guard :: Int
}


_LeuronTrainingRequest :: LensP LeuronTrainingRequest {
  summary :: LeuronTrainingSummary,
  guard :: Int
}
_LeuronTrainingRequest f (LeuronTrainingRequest o) = LeuronTrainingRequest <$> f o


mkLeuronTrainingRequest :: LeuronTrainingSummary -> Int -> LeuronTrainingRequest
mkLeuronTrainingRequest summary guard =
  LeuronTrainingRequest{summary, guard}


unwrapLeuronTrainingRequest (LeuronTrainingRequest r) = r

instance leuronTrainingRequestEncodeJson :: EncodeJson LeuronTrainingRequest where
  encodeJson (LeuronTrainingRequest o) =
       "tag" := "LeuronTrainingRequest"
    ~> "summary" := o.summary
    ~> "guard" := o.guard
    ~> jsonEmptyObject


instance leuronTrainingRequestDecodeJson :: DecodeJson LeuronTrainingRequest where
  decodeJson o = do
    obj <- decodeJson o
    summary <- obj .? "summary"
    guard <- obj .? "guard"
    pure $ LeuronTrainingRequest {
      summary,
      guard
    }


instance leuronTrainingRequestRequestable :: Requestable LeuronTrainingRequest where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance leuronTrainingRequestRespondable :: Respondable LeuronTrainingRequest where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkLeuronTrainingRequest
      <$> readProp "summary" json
      <*> readProp "guard" json


instance leuronTrainingRequestIsForeign :: IsForeign LeuronTrainingRequest where
  read json =
      mkLeuronTrainingRequest
      <$> readProp "summary" json
      <*> readProp "guard" json


instance leuronTrainingRequestShow :: Show LeuronTrainingRequest where
    show (LeuronTrainingRequest o) = show "summary: " ++ show o.summary ++ ", " ++ show "guard: " ++ show o.guard

newtype LeuronTrainingResponse = LeuronTrainingResponse {
  id :: Int,
  userId :: Int,
  leuronId :: Int,
  summary :: LeuronTrainingSummary,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}


type LeuronTrainingResponseR = {
  id :: Int,
  userId :: Int,
  leuronId :: Int,
  summary :: LeuronTrainingSummary,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}


_LeuronTrainingResponse :: LensP LeuronTrainingResponse {
  id :: Int,
  userId :: Int,
  leuronId :: Int,
  summary :: LeuronTrainingSummary,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}
_LeuronTrainingResponse f (LeuronTrainingResponse o) = LeuronTrainingResponse <$> f o


mkLeuronTrainingResponse :: Int -> Int -> Int -> LeuronTrainingSummary -> Int -> (Maybe Date) -> (Maybe Date) -> LeuronTrainingResponse
mkLeuronTrainingResponse id userId leuronId summary guard createdAt modifiedAt =
  LeuronTrainingResponse{id, userId, leuronId, summary, guard, createdAt, modifiedAt}


unwrapLeuronTrainingResponse (LeuronTrainingResponse r) = r

instance leuronTrainingResponseEncodeJson :: EncodeJson LeuronTrainingResponse where
  encodeJson (LeuronTrainingResponse o) =
       "tag" := "LeuronTrainingResponse"
    ~> "id" := o.id
    ~> "user_id" := o.userId
    ~> "leuron_id" := o.leuronId
    ~> "summary" := o.summary
    ~> "guard" := o.guard
    ~> "created_at" := o.createdAt
    ~> "modified_at" := o.modifiedAt
    ~> jsonEmptyObject


instance leuronTrainingResponseDecodeJson :: DecodeJson LeuronTrainingResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    userId <- obj .? "user_id"
    leuronId <- obj .? "leuron_id"
    summary <- obj .? "summary"
    guard <- obj .? "guard"
    createdAt <- obj .? "created_at"
    modifiedAt <- obj .? "modified_at"
    pure $ LeuronTrainingResponse {
      id,
      userId,
      leuronId,
      summary,
      guard,
      createdAt,
      modifiedAt
    }


instance leuronTrainingResponseRequestable :: Requestable LeuronTrainingResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance leuronTrainingResponseRespondable :: Respondable LeuronTrainingResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkLeuronTrainingResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "leuron_id" json
      <*> readProp "summary" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance leuronTrainingResponseIsForeign :: IsForeign LeuronTrainingResponse where
  read json =
      mkLeuronTrainingResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "leuron_id" json
      <*> readProp "summary" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance leuronTrainingResponseShow :: Show LeuronTrainingResponse where
    show (LeuronTrainingResponse o) = show "id: " ++ show o.id ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "leuronId: " ++ show o.leuronId ++ ", " ++ show "summary: " ++ show o.summary ++ ", " ++ show "guard: " ++ show o.guard ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt

newtype LeuronTrainingResponses = LeuronTrainingResponses {
  leuronTrainingResponses :: (Array LeuronTrainingResponse)
}


type LeuronTrainingResponsesR = {
  leuronTrainingResponses :: (Array LeuronTrainingResponse)
}


_LeuronTrainingResponses :: LensP LeuronTrainingResponses {
  leuronTrainingResponses :: (Array LeuronTrainingResponse)
}
_LeuronTrainingResponses f (LeuronTrainingResponses o) = LeuronTrainingResponses <$> f o


mkLeuronTrainingResponses :: (Array LeuronTrainingResponse) -> LeuronTrainingResponses
mkLeuronTrainingResponses leuronTrainingResponses =
  LeuronTrainingResponses{leuronTrainingResponses}


unwrapLeuronTrainingResponses (LeuronTrainingResponses r) = r

instance leuronTrainingResponsesEncodeJson :: EncodeJson LeuronTrainingResponses where
  encodeJson (LeuronTrainingResponses o) =
       "tag" := "LeuronTrainingResponses"
    ~> "leuron_training_responses" := o.leuronTrainingResponses
    ~> jsonEmptyObject


instance leuronTrainingResponsesDecodeJson :: DecodeJson LeuronTrainingResponses where
  decodeJson o = do
    obj <- decodeJson o
    leuronTrainingResponses <- obj .? "leuron_training_responses"
    pure $ LeuronTrainingResponses {
      leuronTrainingResponses
    }


instance leuronTrainingResponsesRequestable :: Requestable LeuronTrainingResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance leuronTrainingResponsesRespondable :: Respondable LeuronTrainingResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkLeuronTrainingResponses
      <$> readProp "leuron_training_responses" json


instance leuronTrainingResponsesIsForeign :: IsForeign LeuronTrainingResponses where
  read json =
      mkLeuronTrainingResponses
      <$> readProp "leuron_training_responses" json


instance leuronTrainingResponsesShow :: Show LeuronTrainingResponses where
    show (LeuronTrainingResponses o) = show "leuronTrainingResponses: " ++ show o.leuronTrainingResponses

newtype LeuronTrainingStatResponse = LeuronTrainingStatResponse {
  leuronTrainingId :: Int
}


type LeuronTrainingStatResponseR = {
  leuronTrainingId :: Int
}


_LeuronTrainingStatResponse :: LensP LeuronTrainingStatResponse {
  leuronTrainingId :: Int
}
_LeuronTrainingStatResponse f (LeuronTrainingStatResponse o) = LeuronTrainingStatResponse <$> f o


mkLeuronTrainingStatResponse :: Int -> LeuronTrainingStatResponse
mkLeuronTrainingStatResponse leuronTrainingId =
  LeuronTrainingStatResponse{leuronTrainingId}


unwrapLeuronTrainingStatResponse (LeuronTrainingStatResponse r) = r

instance leuronTrainingStatResponseEncodeJson :: EncodeJson LeuronTrainingStatResponse where
  encodeJson (LeuronTrainingStatResponse o) =
       "tag" := "LeuronTrainingStatResponse"
    ~> "leuron_training_id" := o.leuronTrainingId
    ~> jsonEmptyObject


instance leuronTrainingStatResponseDecodeJson :: DecodeJson LeuronTrainingStatResponse where
  decodeJson o = do
    obj <- decodeJson o
    leuronTrainingId <- obj .? "leuron_training_id"
    pure $ LeuronTrainingStatResponse {
      leuronTrainingId
    }


instance leuronTrainingStatResponseRequestable :: Requestable LeuronTrainingStatResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance leuronTrainingStatResponseRespondable :: Respondable LeuronTrainingStatResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkLeuronTrainingStatResponse
      <$> readProp "leuron_training_id" json


instance leuronTrainingStatResponseIsForeign :: IsForeign LeuronTrainingStatResponse where
  read json =
      mkLeuronTrainingStatResponse
      <$> readProp "leuron_training_id" json


instance leuronTrainingStatResponseShow :: Show LeuronTrainingStatResponse where
    show (LeuronTrainingStatResponse o) = show "leuronTrainingId: " ++ show o.leuronTrainingId

newtype LeuronTrainingStatResponses = LeuronTrainingStatResponses {
  leuronTrainingStatResponses :: (Array LeuronTrainingStatResponse)
}


type LeuronTrainingStatResponsesR = {
  leuronTrainingStatResponses :: (Array LeuronTrainingStatResponse)
}


_LeuronTrainingStatResponses :: LensP LeuronTrainingStatResponses {
  leuronTrainingStatResponses :: (Array LeuronTrainingStatResponse)
}
_LeuronTrainingStatResponses f (LeuronTrainingStatResponses o) = LeuronTrainingStatResponses <$> f o


mkLeuronTrainingStatResponses :: (Array LeuronTrainingStatResponse) -> LeuronTrainingStatResponses
mkLeuronTrainingStatResponses leuronTrainingStatResponses =
  LeuronTrainingStatResponses{leuronTrainingStatResponses}


unwrapLeuronTrainingStatResponses (LeuronTrainingStatResponses r) = r

instance leuronTrainingStatResponsesEncodeJson :: EncodeJson LeuronTrainingStatResponses where
  encodeJson (LeuronTrainingStatResponses o) =
       "tag" := "LeuronTrainingStatResponses"
    ~> "leuron_training_stat_responses" := o.leuronTrainingStatResponses
    ~> jsonEmptyObject


instance leuronTrainingStatResponsesDecodeJson :: DecodeJson LeuronTrainingStatResponses where
  decodeJson o = do
    obj <- decodeJson o
    leuronTrainingStatResponses <- obj .? "leuron_training_stat_responses"
    pure $ LeuronTrainingStatResponses {
      leuronTrainingStatResponses
    }


instance leuronTrainingStatResponsesRequestable :: Requestable LeuronTrainingStatResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance leuronTrainingStatResponsesRespondable :: Respondable LeuronTrainingStatResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkLeuronTrainingStatResponses
      <$> readProp "leuron_training_stat_responses" json


instance leuronTrainingStatResponsesIsForeign :: IsForeign LeuronTrainingStatResponses where
  read json =
      mkLeuronTrainingStatResponses
      <$> readProp "leuron_training_stat_responses" json


instance leuronTrainingStatResponsesShow :: Show LeuronTrainingStatResponses where
    show (LeuronTrainingStatResponses o) = show "leuronTrainingStatResponses: " ++ show o.leuronTrainingStatResponses

data LikeOpt
  = Like 
  | Neutral 
  | Dislike 



instance likeOptEncodeJson :: EncodeJson LikeOpt where
  encodeJson (Like ) =
       "tag" := "Like"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Neutral ) =
       "tag" := "Neutral"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Dislike ) =
       "tag" := "Dislike"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject


instance likeOptDecodeJson :: DecodeJson LikeOpt where
  decodeJson json = do
    obj <- decodeJson json
    tag <- obj .? "tag"
    case tag of
        "Like" -> do
          return Like

        "Neutral" -> do
          return Neutral

        "Dislike" -> do
          return Dislike

  decodeJson x = fail $ "Could not parse object: " ++ show x


instance likeOptRequestable :: Requestable LikeOpt where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance likeOptRespondable :: Respondable LikeOpt where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    tag <- readProp "tag" json
    case tag of
        "Like" -> do
          return Like

        "Neutral" -> do
          return Neutral

        "Dislike" -> do
          return Dislike



instance likeOptIsForeign :: IsForeign LikeOpt where
  read json = do
    tag <- readProp "tag" json
    case tag of
        "Like" -> do
          return Like

        "Neutral" -> do
          return Neutral

        "Dislike" -> do
          return Dislike



instance likeOptShow :: Show LikeOpt where
  show (Like) = "Like"
  show (Neutral) = "Neutral"
  show (Dislike) = "Dislike"


newtype LikeRequest = LikeRequest {
  opt :: LikeOpt,
  reason :: (Maybe String),
  guard :: Int
}


type LikeRequestR = {
  opt :: LikeOpt,
  reason :: (Maybe String),
  guard :: Int
}


_LikeRequest :: LensP LikeRequest {
  opt :: LikeOpt,
  reason :: (Maybe String),
  guard :: Int
}
_LikeRequest f (LikeRequest o) = LikeRequest <$> f o


mkLikeRequest :: LikeOpt -> (Maybe String) -> Int -> LikeRequest
mkLikeRequest opt reason guard =
  LikeRequest{opt, reason, guard}


unwrapLikeRequest (LikeRequest r) = r

instance likeRequestEncodeJson :: EncodeJson LikeRequest where
  encodeJson (LikeRequest o) =
       "tag" := "LikeRequest"
    ~> "opt" := o.opt
    ~> "reason" := o.reason
    ~> "guard" := o.guard
    ~> jsonEmptyObject


instance likeRequestDecodeJson :: DecodeJson LikeRequest where
  decodeJson o = do
    obj <- decodeJson o
    opt <- obj .? "opt"
    reason <- obj .? "reason"
    guard <- obj .? "guard"
    pure $ LikeRequest {
      opt,
      reason,
      guard
    }


instance likeRequestRequestable :: Requestable LikeRequest where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance likeRequestRespondable :: Respondable LikeRequest where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkLikeRequest
      <$> readProp "opt" json
      <*> (runNullOrUndefined <$> readProp "reason" json)
      <*> readProp "guard" json


instance likeRequestIsForeign :: IsForeign LikeRequest where
  read json =
      mkLikeRequest
      <$> readProp "opt" json
      <*> (runNullOrUndefined <$> readProp "reason" json)
      <*> readProp "guard" json


instance likeRequestShow :: Show LikeRequest where
    show (LikeRequest o) = show "opt: " ++ show o.opt ++ ", " ++ show "reason: " ++ show o.reason ++ ", " ++ show "guard: " ++ show o.guard

newtype LikeResponse = LikeResponse {
  id :: Int,
  ent :: Ent,
  entId :: Int,
  userId :: Int,
  opt :: LikeOpt,
  score :: Int,
  reason :: (Maybe String),
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}


type LikeResponseR = {
  id :: Int,
  ent :: Ent,
  entId :: Int,
  userId :: Int,
  opt :: LikeOpt,
  score :: Int,
  reason :: (Maybe String),
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}


_LikeResponse :: LensP LikeResponse {
  id :: Int,
  ent :: Ent,
  entId :: Int,
  userId :: Int,
  opt :: LikeOpt,
  score :: Int,
  reason :: (Maybe String),
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}
_LikeResponse f (LikeResponse o) = LikeResponse <$> f o


mkLikeResponse :: Int -> Ent -> Int -> Int -> LikeOpt -> Int -> (Maybe String) -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> LikeResponse
mkLikeResponse id ent entId userId opt score reason active guard createdAt modifiedAt =
  LikeResponse{id, ent, entId, userId, opt, score, reason, active, guard, createdAt, modifiedAt}


unwrapLikeResponse (LikeResponse r) = r

instance likeResponseEncodeJson :: EncodeJson LikeResponse where
  encodeJson (LikeResponse o) =
       "tag" := "LikeResponse"
    ~> "id" := o.id
    ~> "ent" := o.ent
    ~> "ent_id" := o.entId
    ~> "user_id" := o.userId
    ~> "opt" := o.opt
    ~> "score" := o.score
    ~> "reason" := o.reason
    ~> "active" := o.active
    ~> "guard" := o.guard
    ~> "created_at" := o.createdAt
    ~> "modified_at" := o.modifiedAt
    ~> jsonEmptyObject


instance likeResponseDecodeJson :: DecodeJson LikeResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    ent <- obj .? "ent"
    entId <- obj .? "ent_id"
    userId <- obj .? "user_id"
    opt <- obj .? "opt"
    score <- obj .? "score"
    reason <- obj .? "reason"
    active <- obj .? "active"
    guard <- obj .? "guard"
    createdAt <- obj .? "created_at"
    modifiedAt <- obj .? "modified_at"
    pure $ LikeResponse {
      id,
      ent,
      entId,
      userId,
      opt,
      score,
      reason,
      active,
      guard,
      createdAt,
      modifiedAt
    }


instance likeResponseRequestable :: Requestable LikeResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance likeResponseRespondable :: Respondable LikeResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkLikeResponse
      <$> readProp "id" json
      <*> readProp "ent" json
      <*> readProp "ent_id" json
      <*> readProp "user_id" json
      <*> readProp "opt" json
      <*> readProp "score" json
      <*> (runNullOrUndefined <$> readProp "reason" json)
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance likeResponseIsForeign :: IsForeign LikeResponse where
  read json =
      mkLikeResponse
      <$> readProp "id" json
      <*> readProp "ent" json
      <*> readProp "ent_id" json
      <*> readProp "user_id" json
      <*> readProp "opt" json
      <*> readProp "score" json
      <*> (runNullOrUndefined <$> readProp "reason" json)
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance likeResponseShow :: Show LikeResponse where
    show (LikeResponse o) = show "id: " ++ show o.id ++ ", " ++ show "ent: " ++ show o.ent ++ ", " ++ show "entId: " ++ show o.entId ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "opt: " ++ show o.opt ++ ", " ++ show "score: " ++ show o.score ++ ", " ++ show "reason: " ++ show o.reason ++ ", " ++ show "active: " ++ show o.active ++ ", " ++ show "guard: " ++ show o.guard ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt

newtype LikeResponses = LikeResponses {
  likeResponses :: (Array LikeResponse)
}


type LikeResponsesR = {
  likeResponses :: (Array LikeResponse)
}


_LikeResponses :: LensP LikeResponses {
  likeResponses :: (Array LikeResponse)
}
_LikeResponses f (LikeResponses o) = LikeResponses <$> f o


mkLikeResponses :: (Array LikeResponse) -> LikeResponses
mkLikeResponses likeResponses =
  LikeResponses{likeResponses}


unwrapLikeResponses (LikeResponses r) = r

instance likeResponsesEncodeJson :: EncodeJson LikeResponses where
  encodeJson (LikeResponses o) =
       "tag" := "LikeResponses"
    ~> "like_responses" := o.likeResponses
    ~> jsonEmptyObject


instance likeResponsesDecodeJson :: DecodeJson LikeResponses where
  decodeJson o = do
    obj <- decodeJson o
    likeResponses <- obj .? "like_responses"
    pure $ LikeResponses {
      likeResponses
    }


instance likeResponsesRequestable :: Requestable LikeResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance likeResponsesRespondable :: Respondable LikeResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkLikeResponses
      <$> readProp "like_responses" json


instance likeResponsesIsForeign :: IsForeign LikeResponses where
  read json =
      mkLikeResponses
      <$> readProp "like_responses" json


instance likeResponsesShow :: Show LikeResponses where
    show (LikeResponses o) = show "likeResponses: " ++ show o.likeResponses

newtype LikeStatResponse = LikeStatResponse {
  ent :: Ent,
  entId :: Int,
  score :: Int,
  like :: Int,
  neutral :: Int,
  dislike :: Int
}


type LikeStatResponseR = {
  ent :: Ent,
  entId :: Int,
  score :: Int,
  like :: Int,
  neutral :: Int,
  dislike :: Int
}


_LikeStatResponse :: LensP LikeStatResponse {
  ent :: Ent,
  entId :: Int,
  score :: Int,
  like :: Int,
  neutral :: Int,
  dislike :: Int
}
_LikeStatResponse f (LikeStatResponse o) = LikeStatResponse <$> f o


mkLikeStatResponse :: Ent -> Int -> Int -> Int -> Int -> Int -> LikeStatResponse
mkLikeStatResponse ent entId score like neutral dislike =
  LikeStatResponse{ent, entId, score, like, neutral, dislike}


unwrapLikeStatResponse (LikeStatResponse r) = r

instance likeStatResponseEncodeJson :: EncodeJson LikeStatResponse where
  encodeJson (LikeStatResponse o) =
       "tag" := "LikeStatResponse"
    ~> "ent" := o.ent
    ~> "ent_id" := o.entId
    ~> "score" := o.score
    ~> "like" := o.like
    ~> "neutral" := o.neutral
    ~> "dislike" := o.dislike
    ~> jsonEmptyObject


instance likeStatResponseDecodeJson :: DecodeJson LikeStatResponse where
  decodeJson o = do
    obj <- decodeJson o
    ent <- obj .? "ent"
    entId <- obj .? "ent_id"
    score <- obj .? "score"
    like <- obj .? "like"
    neutral <- obj .? "neutral"
    dislike <- obj .? "dislike"
    pure $ LikeStatResponse {
      ent,
      entId,
      score,
      like,
      neutral,
      dislike
    }


instance likeStatResponseRequestable :: Requestable LikeStatResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance likeStatResponseRespondable :: Respondable LikeStatResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkLikeStatResponse
      <$> readProp "ent" json
      <*> readProp "ent_id" json
      <*> readProp "score" json
      <*> readProp "like" json
      <*> readProp "neutral" json
      <*> readProp "dislike" json


instance likeStatResponseIsForeign :: IsForeign LikeStatResponse where
  read json =
      mkLikeStatResponse
      <$> readProp "ent" json
      <*> readProp "ent_id" json
      <*> readProp "score" json
      <*> readProp "like" json
      <*> readProp "neutral" json
      <*> readProp "dislike" json


instance likeStatResponseShow :: Show LikeStatResponse where
    show (LikeStatResponse o) = show "ent: " ++ show o.ent ++ ", " ++ show "entId: " ++ show o.entId ++ ", " ++ show "score: " ++ show o.score ++ ", " ++ show "like: " ++ show o.like ++ ", " ++ show "neutral: " ++ show o.neutral ++ ", " ++ show "dislike: " ++ show o.dislike

newtype LikeStatResponses = LikeStatResponses {
  likeStatResponses :: (Array LikeStatResponse)
}


type LikeStatResponsesR = {
  likeStatResponses :: (Array LikeStatResponse)
}


_LikeStatResponses :: LensP LikeStatResponses {
  likeStatResponses :: (Array LikeStatResponse)
}
_LikeStatResponses f (LikeStatResponses o) = LikeStatResponses <$> f o


mkLikeStatResponses :: (Array LikeStatResponse) -> LikeStatResponses
mkLikeStatResponses likeStatResponses =
  LikeStatResponses{likeStatResponses}


unwrapLikeStatResponses (LikeStatResponses r) = r

instance likeStatResponsesEncodeJson :: EncodeJson LikeStatResponses where
  encodeJson (LikeStatResponses o) =
       "tag" := "LikeStatResponses"
    ~> "like_stat_responses" := o.likeStatResponses
    ~> jsonEmptyObject


instance likeStatResponsesDecodeJson :: DecodeJson LikeStatResponses where
  decodeJson o = do
    obj <- decodeJson o
    likeStatResponses <- obj .? "like_stat_responses"
    pure $ LikeStatResponses {
      likeStatResponses
    }


instance likeStatResponsesRequestable :: Requestable LikeStatResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance likeStatResponsesRespondable :: Respondable LikeStatResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkLikeStatResponses
      <$> readProp "like_stat_responses" json


instance likeStatResponsesIsForeign :: IsForeign LikeStatResponses where
  read json =
      mkLikeStatResponses
      <$> readProp "like_stat_responses" json


instance likeStatResponsesShow :: Show LikeStatResponses where
    show (LikeStatResponses o) = show "likeStatResponses: " ++ show o.likeStatResponses

data LeuronData
  = LnFact Fact
  | LnFactList FactList
  | LnCard Card
  | LnDCard DCard
  | LnDCardX DCardX
  | LnAcronym Acronym
  | LnSynonym Synonym
  | LnAntonym Antonym
  | LnTemplate Template
  | LnImageAssociation ImageAssociation
  | LnLinearDemo LinearDemo
  | LnTable Table
  | LnScript Script
  | LnQA QA
  | LnExamples 
  | LnEmpty 



instance leuronDataEncodeJson :: EncodeJson LeuronData where
  encodeJson (LnFact x0) =
       "tag" := "LnFact"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (LnFactList x0) =
       "tag" := "LnFactList"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (LnCard x0) =
       "tag" := "LnCard"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (LnDCard x0) =
       "tag" := "LnDCard"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (LnDCardX x0) =
       "tag" := "LnDCardX"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (LnAcronym x0) =
       "tag" := "LnAcronym"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (LnSynonym x0) =
       "tag" := "LnSynonym"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (LnAntonym x0) =
       "tag" := "LnAntonym"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (LnTemplate x0) =
       "tag" := "LnTemplate"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (LnImageAssociation x0) =
       "tag" := "LnImageAssociation"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (LnLinearDemo x0) =
       "tag" := "LnLinearDemo"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (LnTable x0) =
       "tag" := "LnTable"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (LnScript x0) =
       "tag" := "LnScript"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (LnQA x0) =
       "tag" := "LnQA"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (LnExamples ) =
       "tag" := "LnExamples"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (LnEmpty ) =
       "tag" := "LnEmpty"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject


instance leuronDataDecodeJson :: DecodeJson LeuronData where
  decodeJson json = do
    obj <- decodeJson json
    tag <- obj .? "tag"
    case tag of
        "LnFact" -> do
          x0 <- obj .? "contents"
          LnFact <$> decodeJson x0

        "LnFactList" -> do
          x0 <- obj .? "contents"
          LnFactList <$> decodeJson x0

        "LnCard" -> do
          x0 <- obj .? "contents"
          LnCard <$> decodeJson x0

        "LnDCard" -> do
          x0 <- obj .? "contents"
          LnDCard <$> decodeJson x0

        "LnDCardX" -> do
          x0 <- obj .? "contents"
          LnDCardX <$> decodeJson x0

        "LnAcronym" -> do
          x0 <- obj .? "contents"
          LnAcronym <$> decodeJson x0

        "LnSynonym" -> do
          x0 <- obj .? "contents"
          LnSynonym <$> decodeJson x0

        "LnAntonym" -> do
          x0 <- obj .? "contents"
          LnAntonym <$> decodeJson x0

        "LnTemplate" -> do
          x0 <- obj .? "contents"
          LnTemplate <$> decodeJson x0

        "LnImageAssociation" -> do
          x0 <- obj .? "contents"
          LnImageAssociation <$> decodeJson x0

        "LnLinearDemo" -> do
          x0 <- obj .? "contents"
          LnLinearDemo <$> decodeJson x0

        "LnTable" -> do
          x0 <- obj .? "contents"
          LnTable <$> decodeJson x0

        "LnScript" -> do
          x0 <- obj .? "contents"
          LnScript <$> decodeJson x0

        "LnQA" -> do
          x0 <- obj .? "contents"
          LnQA <$> decodeJson x0

        "LnExamples" -> do
          return LnExamples

        "LnEmpty" -> do
          return LnEmpty

  decodeJson x = fail $ "Could not parse object: " ++ show x


instance leuronDataRequestable :: Requestable LeuronData where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance leuronDataRespondable :: Respondable LeuronData where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    tag <- readProp "tag" json
    case tag of
        "LnFact" -> do
          x0 <- readProp "contents" json
          LnFact <$> read x0

        "LnFactList" -> do
          x0 <- readProp "contents" json
          LnFactList <$> read x0

        "LnCard" -> do
          x0 <- readProp "contents" json
          LnCard <$> read x0

        "LnDCard" -> do
          x0 <- readProp "contents" json
          LnDCard <$> read x0

        "LnDCardX" -> do
          x0 <- readProp "contents" json
          LnDCardX <$> read x0

        "LnAcronym" -> do
          x0 <- readProp "contents" json
          LnAcronym <$> read x0

        "LnSynonym" -> do
          x0 <- readProp "contents" json
          LnSynonym <$> read x0

        "LnAntonym" -> do
          x0 <- readProp "contents" json
          LnAntonym <$> read x0

        "LnTemplate" -> do
          x0 <- readProp "contents" json
          LnTemplate <$> read x0

        "LnImageAssociation" -> do
          x0 <- readProp "contents" json
          LnImageAssociation <$> read x0

        "LnLinearDemo" -> do
          x0 <- readProp "contents" json
          LnLinearDemo <$> read x0

        "LnTable" -> do
          x0 <- readProp "contents" json
          LnTable <$> read x0

        "LnScript" -> do
          x0 <- readProp "contents" json
          LnScript <$> read x0

        "LnQA" -> do
          x0 <- readProp "contents" json
          LnQA <$> read x0

        "LnExamples" -> do
          return LnExamples

        "LnEmpty" -> do
          return LnEmpty



instance leuronDataIsForeign :: IsForeign LeuronData where
  read json = do
    tag <- readProp "tag" json
    case tag of
        "LnFact" -> do
          x0 <- readProp "contents" json
          LnFact <$> read x0

        "LnFactList" -> do
          x0 <- readProp "contents" json
          LnFactList <$> read x0

        "LnCard" -> do
          x0 <- readProp "contents" json
          LnCard <$> read x0

        "LnDCard" -> do
          x0 <- readProp "contents" json
          LnDCard <$> read x0

        "LnDCardX" -> do
          x0 <- readProp "contents" json
          LnDCardX <$> read x0

        "LnAcronym" -> do
          x0 <- readProp "contents" json
          LnAcronym <$> read x0

        "LnSynonym" -> do
          x0 <- readProp "contents" json
          LnSynonym <$> read x0

        "LnAntonym" -> do
          x0 <- readProp "contents" json
          LnAntonym <$> read x0

        "LnTemplate" -> do
          x0 <- readProp "contents" json
          LnTemplate <$> read x0

        "LnImageAssociation" -> do
          x0 <- readProp "contents" json
          LnImageAssociation <$> read x0

        "LnLinearDemo" -> do
          x0 <- readProp "contents" json
          LnLinearDemo <$> read x0

        "LnTable" -> do
          x0 <- readProp "contents" json
          LnTable <$> read x0

        "LnScript" -> do
          x0 <- readProp "contents" json
          LnScript <$> read x0

        "LnQA" -> do
          x0 <- readProp "contents" json
          LnQA <$> read x0

        "LnExamples" -> do
          return LnExamples

        "LnEmpty" -> do
          return LnEmpty



instance leuronDataShow :: Show LeuronData where
  show (LnFact x0) = "LnFact: " ++ show x0
  show (LnFactList x0) = "LnFactList: " ++ show x0
  show (LnCard x0) = "LnCard: " ++ show x0
  show (LnDCard x0) = "LnDCard: " ++ show x0
  show (LnDCardX x0) = "LnDCardX: " ++ show x0
  show (LnAcronym x0) = "LnAcronym: " ++ show x0
  show (LnSynonym x0) = "LnSynonym: " ++ show x0
  show (LnAntonym x0) = "LnAntonym: " ++ show x0
  show (LnTemplate x0) = "LnTemplate: " ++ show x0
  show (LnImageAssociation x0) = "LnImageAssociation: " ++ show x0
  show (LnLinearDemo x0) = "LnLinearDemo: " ++ show x0
  show (LnTable x0) = "LnTable: " ++ show x0
  show (LnScript x0) = "LnScript: " ++ show x0
  show (LnQA x0) = "LnQA: " ++ show x0
  show (LnExamples) = "LnExamples"
  show (LnEmpty) = "LnEmpty"


data TyLeuron
  = TyLnFact 
  | TyLnFactList 
  | TyLnCard 
  | TyLnDCard 
  | TyLnDCardX 
  | TyLnAcronym 
  | TyLnSynonym 
  | TyLnAntonym 
  | TyLnTemplate 
  | TyLnImageAssociation 
  | TyLnLinearDemo 
  | TyLnTable 
  | TyLnScript 
  | TyLnQA 
  | TyLnExamples 
  | TyLnEmpty 



instance tyLeuronEncodeJson :: EncodeJson TyLeuron where
  encodeJson (TyLnFact ) =
       "tag" := "TyLnFact"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (TyLnFactList ) =
       "tag" := "TyLnFactList"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (TyLnCard ) =
       "tag" := "TyLnCard"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (TyLnDCard ) =
       "tag" := "TyLnDCard"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (TyLnDCardX ) =
       "tag" := "TyLnDCardX"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (TyLnAcronym ) =
       "tag" := "TyLnAcronym"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (TyLnSynonym ) =
       "tag" := "TyLnSynonym"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (TyLnAntonym ) =
       "tag" := "TyLnAntonym"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (TyLnTemplate ) =
       "tag" := "TyLnTemplate"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (TyLnImageAssociation ) =
       "tag" := "TyLnImageAssociation"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (TyLnLinearDemo ) =
       "tag" := "TyLnLinearDemo"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (TyLnTable ) =
       "tag" := "TyLnTable"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (TyLnScript ) =
       "tag" := "TyLnScript"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (TyLnQA ) =
       "tag" := "TyLnQA"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (TyLnExamples ) =
       "tag" := "TyLnExamples"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (TyLnEmpty ) =
       "tag" := "TyLnEmpty"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject


instance tyLeuronDecodeJson :: DecodeJson TyLeuron where
  decodeJson json = do
    obj <- decodeJson json
    tag <- obj .? "tag"
    case tag of
        "TyLnFact" -> do
          return TyLnFact

        "TyLnFactList" -> do
          return TyLnFactList

        "TyLnCard" -> do
          return TyLnCard

        "TyLnDCard" -> do
          return TyLnDCard

        "TyLnDCardX" -> do
          return TyLnDCardX

        "TyLnAcronym" -> do
          return TyLnAcronym

        "TyLnSynonym" -> do
          return TyLnSynonym

        "TyLnAntonym" -> do
          return TyLnAntonym

        "TyLnTemplate" -> do
          return TyLnTemplate

        "TyLnImageAssociation" -> do
          return TyLnImageAssociation

        "TyLnLinearDemo" -> do
          return TyLnLinearDemo

        "TyLnTable" -> do
          return TyLnTable

        "TyLnScript" -> do
          return TyLnScript

        "TyLnQA" -> do
          return TyLnQA

        "TyLnExamples" -> do
          return TyLnExamples

        "TyLnEmpty" -> do
          return TyLnEmpty

  decodeJson x = fail $ "Could not parse object: " ++ show x


instance tyLeuronRequestable :: Requestable TyLeuron where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance tyLeuronRespondable :: Respondable TyLeuron where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    tag <- readProp "tag" json
    case tag of
        "TyLnFact" -> do
          return TyLnFact

        "TyLnFactList" -> do
          return TyLnFactList

        "TyLnCard" -> do
          return TyLnCard

        "TyLnDCard" -> do
          return TyLnDCard

        "TyLnDCardX" -> do
          return TyLnDCardX

        "TyLnAcronym" -> do
          return TyLnAcronym

        "TyLnSynonym" -> do
          return TyLnSynonym

        "TyLnAntonym" -> do
          return TyLnAntonym

        "TyLnTemplate" -> do
          return TyLnTemplate

        "TyLnImageAssociation" -> do
          return TyLnImageAssociation

        "TyLnLinearDemo" -> do
          return TyLnLinearDemo

        "TyLnTable" -> do
          return TyLnTable

        "TyLnScript" -> do
          return TyLnScript

        "TyLnQA" -> do
          return TyLnQA

        "TyLnExamples" -> do
          return TyLnExamples

        "TyLnEmpty" -> do
          return TyLnEmpty



instance tyLeuronIsForeign :: IsForeign TyLeuron where
  read json = do
    tag <- readProp "tag" json
    case tag of
        "TyLnFact" -> do
          return TyLnFact

        "TyLnFactList" -> do
          return TyLnFactList

        "TyLnCard" -> do
          return TyLnCard

        "TyLnDCard" -> do
          return TyLnDCard

        "TyLnDCardX" -> do
          return TyLnDCardX

        "TyLnAcronym" -> do
          return TyLnAcronym

        "TyLnSynonym" -> do
          return TyLnSynonym

        "TyLnAntonym" -> do
          return TyLnAntonym

        "TyLnTemplate" -> do
          return TyLnTemplate

        "TyLnImageAssociation" -> do
          return TyLnImageAssociation

        "TyLnLinearDemo" -> do
          return TyLnLinearDemo

        "TyLnTable" -> do
          return TyLnTable

        "TyLnScript" -> do
          return TyLnScript

        "TyLnQA" -> do
          return TyLnQA

        "TyLnExamples" -> do
          return TyLnExamples

        "TyLnEmpty" -> do
          return TyLnEmpty



instance tyLeuronShow :: Show TyLeuron where
  show (TyLnFact) = "TyLnFact"
  show (TyLnFactList) = "TyLnFactList"
  show (TyLnCard) = "TyLnCard"
  show (TyLnDCard) = "TyLnDCard"
  show (TyLnDCardX) = "TyLnDCardX"
  show (TyLnAcronym) = "TyLnAcronym"
  show (TyLnSynonym) = "TyLnSynonym"
  show (TyLnAntonym) = "TyLnAntonym"
  show (TyLnTemplate) = "TyLnTemplate"
  show (TyLnImageAssociation) = "TyLnImageAssociation"
  show (TyLnLinearDemo) = "TyLnLinearDemo"
  show (TyLnTable) = "TyLnTable"
  show (TyLnScript) = "TyLnScript"
  show (TyLnQA) = "TyLnQA"
  show (TyLnExamples) = "TyLnExamples"
  show (TyLnEmpty) = "TyLnEmpty"


instance tyLeuronEq :: Eq TyLeuron where
  eq (TyLnFact) (TyLnFact) = true
  eq (TyLnFactList) (TyLnFactList) = true
  eq (TyLnCard) (TyLnCard) = true
  eq (TyLnDCard) (TyLnDCard) = true
  eq (TyLnDCardX) (TyLnDCardX) = true
  eq (TyLnAcronym) (TyLnAcronym) = true
  eq (TyLnSynonym) (TyLnSynonym) = true
  eq (TyLnAntonym) (TyLnAntonym) = true
  eq (TyLnTemplate) (TyLnTemplate) = true
  eq (TyLnImageAssociation) (TyLnImageAssociation) = true
  eq (TyLnLinearDemo) (TyLnLinearDemo) = true
  eq (TyLnTable) (TyLnTable) = true
  eq (TyLnScript) (TyLnScript) = true
  eq (TyLnQA) (TyLnQA) = true
  eq (TyLnExamples) (TyLnExamples) = true
  eq (TyLnEmpty) (TyLnEmpty) = true
  eq _ _ = false

newtype Fact = Fact {
  text :: String
}


type FactR = {
  text :: String
}


_Fact :: LensP Fact {
  text :: String
}
_Fact f (Fact o) = Fact <$> f o


mkFact :: String -> Fact
mkFact text =
  Fact{text}


unwrapFact (Fact r) = r

instance factEncodeJson :: EncodeJson Fact where
  encodeJson (Fact o) =
       "tag" := "Fact"
    ~> "text" := o.text
    ~> jsonEmptyObject


instance factDecodeJson :: DecodeJson Fact where
  decodeJson o = do
    obj <- decodeJson o
    text <- obj .? "text"
    pure $ Fact {
      text
    }


instance factRequestable :: Requestable Fact where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance factRespondable :: Respondable Fact where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkFact
      <$> readProp "text" json


instance factIsForeign :: IsForeign Fact where
  read json =
      mkFact
      <$> readProp "text" json


instance factShow :: Show Fact where
    show (Fact o) = show "text: " ++ show o.text

newtype FactList = FactList {
  fact :: String,
  list :: (Array String)
}


type FactListR = {
  fact :: String,
  list :: (Array String)
}


_FactList :: LensP FactList {
  fact :: String,
  list :: (Array String)
}
_FactList f (FactList o) = FactList <$> f o


mkFactList :: String -> (Array String) -> FactList
mkFactList fact list =
  FactList{fact, list}


unwrapFactList (FactList r) = r

instance factListEncodeJson :: EncodeJson FactList where
  encodeJson (FactList o) =
       "tag" := "FactList"
    ~> "fact" := o.fact
    ~> "list" := o.list
    ~> jsonEmptyObject


instance factListDecodeJson :: DecodeJson FactList where
  decodeJson o = do
    obj <- decodeJson o
    fact <- obj .? "fact"
    list <- obj .? "list"
    pure $ FactList {
      fact,
      list
    }


instance factListRequestable :: Requestable FactList where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance factListRespondable :: Respondable FactList where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkFactList
      <$> readProp "fact" json
      <*> readProp "list" json


instance factListIsForeign :: IsForeign FactList where
  read json =
      mkFactList
      <$> readProp "fact" json
      <*> readProp "list" json


instance factListShow :: Show FactList where
    show (FactList o) = show "fact: " ++ show o.fact ++ ", " ++ show "list: " ++ show o.list

newtype Card = Card {
  front :: String,
  back :: String
}


type CardR = {
  front :: String,
  back :: String
}


_Card :: LensP Card {
  front :: String,
  back :: String
}
_Card f (Card o) = Card <$> f o


mkCard :: String -> String -> Card
mkCard front back =
  Card{front, back}


unwrapCard (Card r) = r

instance cardEncodeJson :: EncodeJson Card where
  encodeJson (Card o) =
       "tag" := "Card"
    ~> "front" := o.front
    ~> "back" := o.back
    ~> jsonEmptyObject


instance cardDecodeJson :: DecodeJson Card where
  decodeJson o = do
    obj <- decodeJson o
    front <- obj .? "front"
    back <- obj .? "back"
    pure $ Card {
      front,
      back
    }


instance cardRequestable :: Requestable Card where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance cardRespondable :: Respondable Card where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkCard
      <$> readProp "front" json
      <*> readProp "back" json


instance cardIsForeign :: IsForeign Card where
  read json =
      mkCard
      <$> readProp "front" json
      <*> readProp "back" json


instance cardShow :: Show Card where
    show (Card o) = show "front: " ++ show o.front ++ ", " ++ show "back: " ++ show o.back

newtype DCard = DCard {
  front :: String,
  back :: String
}


type DCardR = {
  front :: String,
  back :: String
}


_DCard :: LensP DCard {
  front :: String,
  back :: String
}
_DCard f (DCard o) = DCard <$> f o


mkDCard :: String -> String -> DCard
mkDCard front back =
  DCard{front, back}


unwrapDCard (DCard r) = r

instance dCardEncodeJson :: EncodeJson DCard where
  encodeJson (DCard o) =
       "tag" := "DCard"
    ~> "front" := o.front
    ~> "back" := o.back
    ~> jsonEmptyObject


instance dCardDecodeJson :: DecodeJson DCard where
  decodeJson o = do
    obj <- decodeJson o
    front <- obj .? "front"
    back <- obj .? "back"
    pure $ DCard {
      front,
      back
    }


instance dCardRequestable :: Requestable DCard where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance dCardRespondable :: Respondable DCard where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkDCard
      <$> readProp "front" json
      <*> readProp "back" json


instance dCardIsForeign :: IsForeign DCard where
  read json =
      mkDCard
      <$> readProp "front" json
      <*> readProp "back" json


instance dCardShow :: Show DCard where
    show (DCard o) = show "front: " ++ show o.front ++ ", " ++ show "back: " ++ show o.back

newtype DCardX = DCardX {
  front :: (Array String),
  back :: (Array String)
}


type DCardXR = {
  front :: (Array String),
  back :: (Array String)
}


_DCardX :: LensP DCardX {
  front :: (Array String),
  back :: (Array String)
}
_DCardX f (DCardX o) = DCardX <$> f o


mkDCardX :: (Array String) -> (Array String) -> DCardX
mkDCardX front back =
  DCardX{front, back}


unwrapDCardX (DCardX r) = r

instance dCardXEncodeJson :: EncodeJson DCardX where
  encodeJson (DCardX o) =
       "tag" := "DCardX"
    ~> "front" := o.front
    ~> "back" := o.back
    ~> jsonEmptyObject


instance dCardXDecodeJson :: DecodeJson DCardX where
  decodeJson o = do
    obj <- decodeJson o
    front <- obj .? "front"
    back <- obj .? "back"
    pure $ DCardX {
      front,
      back
    }


instance dCardXRequestable :: Requestable DCardX where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance dCardXRespondable :: Respondable DCardX where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkDCardX
      <$> readProp "front" json
      <*> readProp "back" json


instance dCardXIsForeign :: IsForeign DCardX where
  read json =
      mkDCardX
      <$> readProp "front" json
      <*> readProp "back" json


instance dCardXShow :: Show DCardX where
    show (DCardX o) = show "front: " ++ show o.front ++ ", " ++ show "back: " ++ show o.back

newtype Acronym = Acronym {
  abbreviation :: String,
  meaning :: String
}


type AcronymR = {
  abbreviation :: String,
  meaning :: String
}


_Acronym :: LensP Acronym {
  abbreviation :: String,
  meaning :: String
}
_Acronym f (Acronym o) = Acronym <$> f o


mkAcronym :: String -> String -> Acronym
mkAcronym abbreviation meaning =
  Acronym{abbreviation, meaning}


unwrapAcronym (Acronym r) = r

instance acronymEncodeJson :: EncodeJson Acronym where
  encodeJson (Acronym o) =
       "tag" := "Acronym"
    ~> "abbreviation" := o.abbreviation
    ~> "meaning" := o.meaning
    ~> jsonEmptyObject


instance acronymDecodeJson :: DecodeJson Acronym where
  decodeJson o = do
    obj <- decodeJson o
    abbreviation <- obj .? "abbreviation"
    meaning <- obj .? "meaning"
    pure $ Acronym {
      abbreviation,
      meaning
    }


instance acronymRequestable :: Requestable Acronym where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance acronymRespondable :: Respondable Acronym where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkAcronym
      <$> readProp "abbreviation" json
      <*> readProp "meaning" json


instance acronymIsForeign :: IsForeign Acronym where
  read json =
      mkAcronym
      <$> readProp "abbreviation" json
      <*> readProp "meaning" json


instance acronymShow :: Show Acronym where
    show (Acronym o) = show "abbreviation: " ++ show o.abbreviation ++ ", " ++ show "meaning: " ++ show o.meaning

newtype Synonym = Synonym {
  a :: String,
  b :: String
}


type SynonymR = {
  a :: String,
  b :: String
}


_Synonym :: LensP Synonym {
  a :: String,
  b :: String
}
_Synonym f (Synonym o) = Synonym <$> f o


mkSynonym :: String -> String -> Synonym
mkSynonym a b =
  Synonym{a, b}


unwrapSynonym (Synonym r) = r

instance synonymEncodeJson :: EncodeJson Synonym where
  encodeJson (Synonym o) =
       "tag" := "Synonym"
    ~> "a" := o.a
    ~> "b" := o.b
    ~> jsonEmptyObject


instance synonymDecodeJson :: DecodeJson Synonym where
  decodeJson o = do
    obj <- decodeJson o
    a <- obj .? "a"
    b <- obj .? "b"
    pure $ Synonym {
      a,
      b
    }


instance synonymRequestable :: Requestable Synonym where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance synonymRespondable :: Respondable Synonym where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkSynonym
      <$> readProp "a" json
      <*> readProp "b" json


instance synonymIsForeign :: IsForeign Synonym where
  read json =
      mkSynonym
      <$> readProp "a" json
      <*> readProp "b" json


instance synonymShow :: Show Synonym where
    show (Synonym o) = show "a: " ++ show o.a ++ ", " ++ show "b: " ++ show o.b

newtype Antonym = Antonym {
  a :: String,
  b :: String
}


type AntonymR = {
  a :: String,
  b :: String
}


_Antonym :: LensP Antonym {
  a :: String,
  b :: String
}
_Antonym f (Antonym o) = Antonym <$> f o


mkAntonym :: String -> String -> Antonym
mkAntonym a b =
  Antonym{a, b}


unwrapAntonym (Antonym r) = r

instance antonymEncodeJson :: EncodeJson Antonym where
  encodeJson (Antonym o) =
       "tag" := "Antonym"
    ~> "a" := o.a
    ~> "b" := o.b
    ~> jsonEmptyObject


instance antonymDecodeJson :: DecodeJson Antonym where
  decodeJson o = do
    obj <- decodeJson o
    a <- obj .? "a"
    b <- obj .? "b"
    pure $ Antonym {
      a,
      b
    }


instance antonymRequestable :: Requestable Antonym where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance antonymRespondable :: Respondable Antonym where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkAntonym
      <$> readProp "a" json
      <*> readProp "b" json


instance antonymIsForeign :: IsForeign Antonym where
  read json =
      mkAntonym
      <$> readProp "a" json
      <*> readProp "b" json


instance antonymShow :: Show Antonym where
    show (Antonym o) = show "a: " ++ show o.a ++ ", " ++ show "b: " ++ show o.b

newtype Template = Template {
  template :: String,
  values :: (Array TemplateValue)
}


type TemplateR = {
  template :: String,
  values :: (Array TemplateValue)
}


_Template :: LensP Template {
  template :: String,
  values :: (Array TemplateValue)
}
_Template f (Template o) = Template <$> f o


mkTemplate :: String -> (Array TemplateValue) -> Template
mkTemplate template values =
  Template{template, values}


unwrapTemplate (Template r) = r

instance templateEncodeJson :: EncodeJson Template where
  encodeJson (Template o) =
       "tag" := "Template"
    ~> "template" := o.template
    ~> "values" := o.values
    ~> jsonEmptyObject


instance templateDecodeJson :: DecodeJson Template where
  decodeJson o = do
    obj <- decodeJson o
    template <- obj .? "template"
    values <- obj .? "values"
    pure $ Template {
      template,
      values
    }


instance templateRequestable :: Requestable Template where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance templateRespondable :: Respondable Template where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkTemplate
      <$> readProp "template" json
      <*> readProp "values" json


instance templateIsForeign :: IsForeign Template where
  read json =
      mkTemplate
      <$> readProp "template" json
      <*> readProp "values" json


instance templateShow :: Show Template where
    show (Template o) = show "template: " ++ show o.template ++ ", " ++ show "values: " ++ show o.values

type TemplateValue  = ((Tuple String) (Array String))


newtype ImageAssociation = ImageAssociation {
  imageUrl :: (Array String),
  assocBy :: (Array String),
  assocResult :: (Array String)
}


type ImageAssociationR = {
  imageUrl :: (Array String),
  assocBy :: (Array String),
  assocResult :: (Array String)
}


_ImageAssociation :: LensP ImageAssociation {
  imageUrl :: (Array String),
  assocBy :: (Array String),
  assocResult :: (Array String)
}
_ImageAssociation f (ImageAssociation o) = ImageAssociation <$> f o


mkImageAssociation :: (Array String) -> (Array String) -> (Array String) -> ImageAssociation
mkImageAssociation imageUrl assocBy assocResult =
  ImageAssociation{imageUrl, assocBy, assocResult}


unwrapImageAssociation (ImageAssociation r) = r

instance imageAssociationEncodeJson :: EncodeJson ImageAssociation where
  encodeJson (ImageAssociation o) =
       "tag" := "ImageAssociation"
    ~> "image_url" := o.imageUrl
    ~> "assoc_by" := o.assocBy
    ~> "assoc_result" := o.assocResult
    ~> jsonEmptyObject


instance imageAssociationDecodeJson :: DecodeJson ImageAssociation where
  decodeJson o = do
    obj <- decodeJson o
    imageUrl <- obj .? "image_url"
    assocBy <- obj .? "assoc_by"
    assocResult <- obj .? "assoc_result"
    pure $ ImageAssociation {
      imageUrl,
      assocBy,
      assocResult
    }


instance imageAssociationRequestable :: Requestable ImageAssociation where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance imageAssociationRespondable :: Respondable ImageAssociation where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkImageAssociation
      <$> readProp "image_url" json
      <*> readProp "assoc_by" json
      <*> readProp "assoc_result" json


instance imageAssociationIsForeign :: IsForeign ImageAssociation where
  read json =
      mkImageAssociation
      <$> readProp "image_url" json
      <*> readProp "assoc_by" json
      <*> readProp "assoc_result" json


instance imageAssociationShow :: Show ImageAssociation where
    show (ImageAssociation o) = show "imageUrl: " ++ show o.imageUrl ++ ", " ++ show "assocBy: " ++ show o.assocBy ++ ", " ++ show "assocResult: " ++ show o.assocResult

newtype Script = Script {
  title :: String,
  desc :: String,
  url :: String
}


type ScriptR = {
  title :: String,
  desc :: String,
  url :: String
}


_Script :: LensP Script {
  title :: String,
  desc :: String,
  url :: String
}
_Script f (Script o) = Script <$> f o


mkScript :: String -> String -> String -> Script
mkScript title desc url =
  Script{title, desc, url}


unwrapScript (Script r) = r

instance scriptEncodeJson :: EncodeJson Script where
  encodeJson (Script o) =
       "tag" := "Script"
    ~> "title" := o.title
    ~> "desc" := o.desc
    ~> "url" := o.url
    ~> jsonEmptyObject


instance scriptDecodeJson :: DecodeJson Script where
  decodeJson o = do
    obj <- decodeJson o
    title <- obj .? "title"
    desc <- obj .? "desc"
    url <- obj .? "url"
    pure $ Script {
      title,
      desc,
      url
    }


instance scriptRequestable :: Requestable Script where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance scriptRespondable :: Respondable Script where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkScript
      <$> readProp "title" json
      <*> readProp "desc" json
      <*> readProp "url" json


instance scriptIsForeign :: IsForeign Script where
  read json =
      mkScript
      <$> readProp "title" json
      <*> readProp "desc" json
      <*> readProp "url" json


instance scriptShow :: Show Script where
    show (Script o) = show "title: " ++ show o.title ++ ", " ++ show "desc: " ++ show o.desc ++ ", " ++ show "url: " ++ show o.url

type LDContent  = String


type LDHint  = (Maybe String)


type LinearDemoNode  = ((Tuple LDContent) LDHint)


newtype LinearDemo = LinearDemo {
  label :: String,
  content :: (Array LinearDemoNode)
}


type LinearDemoR = {
  label :: String,
  content :: (Array LinearDemoNode)
}


_LinearDemo :: LensP LinearDemo {
  label :: String,
  content :: (Array LinearDemoNode)
}
_LinearDemo f (LinearDemo o) = LinearDemo <$> f o


mkLinearDemo :: String -> (Array LinearDemoNode) -> LinearDemo
mkLinearDemo label content =
  LinearDemo{label, content}


unwrapLinearDemo (LinearDemo r) = r

instance linearDemoEncodeJson :: EncodeJson LinearDemo where
  encodeJson (LinearDemo o) =
       "tag" := "LinearDemo"
    ~> "label" := o.label
    ~> "content" := o.content
    ~> jsonEmptyObject


instance linearDemoDecodeJson :: DecodeJson LinearDemo where
  decodeJson o = do
    obj <- decodeJson o
    label <- obj .? "label"
    content <- obj .? "content"
    pure $ LinearDemo {
      label,
      content
    }


instance linearDemoRequestable :: Requestable LinearDemo where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance linearDemoRespondable :: Respondable LinearDemo where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkLinearDemo
      <$> readProp "label" json
      <*> readProp "content" json


instance linearDemoIsForeign :: IsForeign LinearDemo where
  read json =
      mkLinearDemo
      <$> readProp "label" json
      <*> readProp "content" json


instance linearDemoShow :: Show LinearDemo where
    show (LinearDemo o) = show "label: " ++ show o.label ++ ", " ++ show "content: " ++ show o.content

newtype QA = QA {
  question :: String,
  answer :: String
}


type QAR = {
  question :: String,
  answer :: String
}


_QA :: LensP QA {
  question :: String,
  answer :: String
}
_QA f (QA o) = QA <$> f o


mkQA :: String -> String -> QA
mkQA question answer =
  QA{question, answer}


unwrapQA (QA r) = r

instance qAEncodeJson :: EncodeJson QA where
  encodeJson (QA o) =
       "tag" := "QA"
    ~> "question" := o.question
    ~> "answer" := o.answer
    ~> jsonEmptyObject


instance qADecodeJson :: DecodeJson QA where
  decodeJson o = do
    obj <- decodeJson o
    question <- obj .? "question"
    answer <- obj .? "answer"
    pure $ QA {
      question,
      answer
    }


instance qARequestable :: Requestable QA where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance qARespondable :: Respondable QA where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkQA
      <$> readProp "question" json
      <*> readProp "answer" json


instance qAIsForeign :: IsForeign QA where
  read json =
      mkQA
      <$> readProp "question" json
      <*> readProp "answer" json


instance qAShow :: Show QA where
    show (QA o) = show "question: " ++ show o.question ++ ", " ++ show "answer: " ++ show o.answer

newtype Table = Table {
  title :: String,
  columns :: (Array String),
  rows :: (Array (Array (Maybe String)))
}


type TableR = {
  title :: String,
  columns :: (Array String),
  rows :: (Array (Array (Maybe String)))
}


_Table :: LensP Table {
  title :: String,
  columns :: (Array String),
  rows :: (Array (Array (Maybe String)))
}
_Table f (Table o) = Table <$> f o


mkTable :: String -> (Array String) -> (Array (Array (Maybe String))) -> Table
mkTable title columns rows =
  Table{title, columns, rows}


unwrapTable (Table r) = r

instance tableEncodeJson :: EncodeJson Table where
  encodeJson (Table o) =
       "tag" := "Table"
    ~> "title" := o.title
    ~> "columns" := o.columns
    ~> "rows" := o.rows
    ~> jsonEmptyObject


instance tableDecodeJson :: DecodeJson Table where
  decodeJson o = do
    obj <- decodeJson o
    title <- obj .? "title"
    columns <- obj .? "columns"
    rows <- obj .? "rows"
    pure $ Table {
      title,
      columns,
      rows
    }


instance tableRequestable :: Requestable Table where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance tableRespondable :: Respondable Table where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkTable
      <$> readProp "title" json
      <*> readProp "columns" json
      <*> readProp "rows" json


instance tableIsForeign :: IsForeign Table where
  read json =
      mkTable
      <$> readProp "title" json
      <*> readProp "columns" json
      <*> readProp "rows" json


instance tableShow :: Show Table where
    show (Table o) = show "title: " ++ show o.title ++ ", " ++ show "columns: " ++ show o.columns ++ ", " ++ show "rows: " ++ show o.rows

data Membership
  = Membership_InviteOnly 
  | Membership_RequestInvite 
  | Membership_Join 
  | Membership_Locked 



instance membershipEncodeJson :: EncodeJson Membership where
  encodeJson (Membership_InviteOnly ) =
       "tag" := "Membership_InviteOnly"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Membership_RequestInvite ) =
       "tag" := "Membership_RequestInvite"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Membership_Join ) =
       "tag" := "Membership_Join"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Membership_Locked ) =
       "tag" := "Membership_Locked"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject


instance membershipDecodeJson :: DecodeJson Membership where
  decodeJson json = do
    obj <- decodeJson json
    tag <- obj .? "tag"
    case tag of
        "Membership_InviteOnly" -> do
          return Membership_InviteOnly

        "Membership_RequestInvite" -> do
          return Membership_RequestInvite

        "Membership_Join" -> do
          return Membership_Join

        "Membership_Locked" -> do
          return Membership_Locked

  decodeJson x = fail $ "Could not parse object: " ++ show x


instance membershipRequestable :: Requestable Membership where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance membershipRespondable :: Respondable Membership where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    tag <- readProp "tag" json
    case tag of
        "Membership_InviteOnly" -> do
          return Membership_InviteOnly

        "Membership_RequestInvite" -> do
          return Membership_RequestInvite

        "Membership_Join" -> do
          return Membership_Join

        "Membership_Locked" -> do
          return Membership_Locked



instance membershipIsForeign :: IsForeign Membership where
  read json = do
    tag <- readProp "tag" json
    case tag of
        "Membership_InviteOnly" -> do
          return Membership_InviteOnly

        "Membership_RequestInvite" -> do
          return Membership_RequestInvite

        "Membership_Join" -> do
          return Membership_Join

        "Membership_Locked" -> do
          return Membership_Locked



instance membershipShow :: Show Membership where
  show (Membership_InviteOnly) = "Membership_InviteOnly"
  show (Membership_RequestInvite) = "Membership_RequestInvite"
  show (Membership_Join) = "Membership_Join"
  show (Membership_Locked) = "Membership_Locked"


instance membershipEq :: Eq Membership where
  eq (Membership_InviteOnly) (Membership_InviteOnly) = true
  eq (Membership_RequestInvite) (Membership_RequestInvite) = true
  eq (Membership_Join) (Membership_Join) = true
  eq (Membership_Locked) (Membership_Locked) = true
  eq _ _ = false

newtype OrganizationRequest = OrganizationRequest {
  displayName :: String,
  description :: (Maybe String),
  company :: String,
  location :: String,
  email :: String,
  membership :: Membership,
  tags :: (Array String),
  icon :: (Maybe String),
  visibility :: Visibility,
  guard :: Int
}


type OrganizationRequestR = {
  displayName :: String,
  description :: (Maybe String),
  company :: String,
  location :: String,
  email :: String,
  membership :: Membership,
  tags :: (Array String),
  icon :: (Maybe String),
  visibility :: Visibility,
  guard :: Int
}


_OrganizationRequest :: LensP OrganizationRequest {
  displayName :: String,
  description :: (Maybe String),
  company :: String,
  location :: String,
  email :: String,
  membership :: Membership,
  tags :: (Array String),
  icon :: (Maybe String),
  visibility :: Visibility,
  guard :: Int
}
_OrganizationRequest f (OrganizationRequest o) = OrganizationRequest <$> f o


mkOrganizationRequest :: String -> (Maybe String) -> String -> String -> String -> Membership -> (Array String) -> (Maybe String) -> Visibility -> Int -> OrganizationRequest
mkOrganizationRequest displayName description company location email membership tags icon visibility guard =
  OrganizationRequest{displayName, description, company, location, email, membership, tags, icon, visibility, guard}


unwrapOrganizationRequest (OrganizationRequest r) = r

instance organizationRequestEncodeJson :: EncodeJson OrganizationRequest where
  encodeJson (OrganizationRequest o) =
       "tag" := "OrganizationRequest"
    ~> "display_name" := o.displayName
    ~> "description" := o.description
    ~> "company" := o.company
    ~> "location" := o.location
    ~> "email" := o.email
    ~> "membership" := o.membership
    ~> "tags" := o.tags
    ~> "icon" := o.icon
    ~> "visibility" := o.visibility
    ~> "guard" := o.guard
    ~> jsonEmptyObject


instance organizationRequestDecodeJson :: DecodeJson OrganizationRequest where
  decodeJson o = do
    obj <- decodeJson o
    displayName <- obj .? "display_name"
    description <- obj .? "description"
    company <- obj .? "company"
    location <- obj .? "location"
    email <- obj .? "email"
    membership <- obj .? "membership"
    tags <- obj .? "tags"
    icon <- obj .? "icon"
    visibility <- obj .? "visibility"
    guard <- obj .? "guard"
    pure $ OrganizationRequest {
      displayName,
      description,
      company,
      location,
      email,
      membership,
      tags,
      icon,
      visibility,
      guard
    }


instance organizationRequestRequestable :: Requestable OrganizationRequest where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance organizationRequestRespondable :: Respondable OrganizationRequest where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkOrganizationRequest
      <$> readProp "display_name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "company" json
      <*> readProp "location" json
      <*> readProp "email" json
      <*> readProp "membership" json
      <*> readProp "tags" json
      <*> (runNullOrUndefined <$> readProp "icon" json)
      <*> readProp "visibility" json
      <*> readProp "guard" json


instance organizationRequestIsForeign :: IsForeign OrganizationRequest where
  read json =
      mkOrganizationRequest
      <$> readProp "display_name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "company" json
      <*> readProp "location" json
      <*> readProp "email" json
      <*> readProp "membership" json
      <*> readProp "tags" json
      <*> (runNullOrUndefined <$> readProp "icon" json)
      <*> readProp "visibility" json
      <*> readProp "guard" json


instance organizationRequestShow :: Show OrganizationRequest where
    show (OrganizationRequest o) = show "displayName: " ++ show o.displayName ++ ", " ++ show "description: " ++ show o.description ++ ", " ++ show "company: " ++ show o.company ++ ", " ++ show "location: " ++ show o.location ++ ", " ++ show "email: " ++ show o.email ++ ", " ++ show "membership: " ++ show o.membership ++ ", " ++ show "tags: " ++ show o.tags ++ ", " ++ show "icon: " ++ show o.icon ++ ", " ++ show "visibility: " ++ show o.visibility ++ ", " ++ show "guard: " ++ show o.guard

newtype OrganizationResponse = OrganizationResponse {
  id :: Int,
  userId :: Int,
  name :: String,
  displayName :: String,
  description :: (Maybe String),
  company :: String,
  location :: String,
  email :: String,
  emailMD5 :: String,
  membership :: Membership,
  icon :: (Maybe String),
  tags :: (Array String),
  visibility :: Visibility,
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


type OrganizationResponseR = {
  id :: Int,
  userId :: Int,
  name :: String,
  displayName :: String,
  description :: (Maybe String),
  company :: String,
  location :: String,
  email :: String,
  emailMD5 :: String,
  membership :: Membership,
  icon :: (Maybe String),
  tags :: (Array String),
  visibility :: Visibility,
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


_OrganizationResponse :: LensP OrganizationResponse {
  id :: Int,
  userId :: Int,
  name :: String,
  displayName :: String,
  description :: (Maybe String),
  company :: String,
  location :: String,
  email :: String,
  emailMD5 :: String,
  membership :: Membership,
  icon :: (Maybe String),
  tags :: (Array String),
  visibility :: Visibility,
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}
_OrganizationResponse f (OrganizationResponse o) = OrganizationResponse <$> f o


mkOrganizationResponse :: Int -> Int -> String -> String -> (Maybe String) -> String -> String -> String -> String -> Membership -> (Maybe String) -> (Array String) -> Visibility -> Boolean -> Int -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> OrganizationResponse
mkOrganizationResponse id userId name displayName description company location email emailMD5 membership icon tags visibility active guard createdAt modifiedBy modifiedAt activityAt =
  OrganizationResponse{id, userId, name, displayName, description, company, location, email, emailMD5, membership, icon, tags, visibility, active, guard, createdAt, modifiedBy, modifiedAt, activityAt}


unwrapOrganizationResponse (OrganizationResponse r) = r

instance organizationResponseEncodeJson :: EncodeJson OrganizationResponse where
  encodeJson (OrganizationResponse o) =
       "tag" := "OrganizationResponse"
    ~> "id" := o.id
    ~> "user_id" := o.userId
    ~> "name" := o.name
    ~> "display_name" := o.displayName
    ~> "description" := o.description
    ~> "company" := o.company
    ~> "location" := o.location
    ~> "email" := o.email
    ~> "email_md5" := o.emailMD5
    ~> "membership" := o.membership
    ~> "icon" := o.icon
    ~> "tags" := o.tags
    ~> "visibility" := o.visibility
    ~> "active" := o.active
    ~> "guard" := o.guard
    ~> "created_at" := o.createdAt
    ~> "modified_by" := o.modifiedBy
    ~> "modified_at" := o.modifiedAt
    ~> "activity_at" := o.activityAt
    ~> jsonEmptyObject


instance organizationResponseDecodeJson :: DecodeJson OrganizationResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    userId <- obj .? "user_id"
    name <- obj .? "name"
    displayName <- obj .? "display_name"
    description <- obj .? "description"
    company <- obj .? "company"
    location <- obj .? "location"
    email <- obj .? "email"
    emailMD5 <- obj .? "email_md5"
    membership <- obj .? "membership"
    icon <- obj .? "icon"
    tags <- obj .? "tags"
    visibility <- obj .? "visibility"
    active <- obj .? "active"
    guard <- obj .? "guard"
    createdAt <- obj .? "created_at"
    modifiedBy <- obj .? "modified_by"
    modifiedAt <- obj .? "modified_at"
    activityAt <- obj .? "activity_at"
    pure $ OrganizationResponse {
      id,
      userId,
      name,
      displayName,
      description,
      company,
      location,
      email,
      emailMD5,
      membership,
      icon,
      tags,
      visibility,
      active,
      guard,
      createdAt,
      modifiedBy,
      modifiedAt,
      activityAt
    }


instance organizationResponseRequestable :: Requestable OrganizationResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance organizationResponseRespondable :: Respondable OrganizationResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkOrganizationResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "name" json
      <*> readProp "display_name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "company" json
      <*> readProp "location" json
      <*> readProp "email" json
      <*> readProp "email_md5" json
      <*> readProp "membership" json
      <*> (runNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "visibility" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance organizationResponseIsForeign :: IsForeign OrganizationResponse where
  read json =
      mkOrganizationResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "name" json
      <*> readProp "display_name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "company" json
      <*> readProp "location" json
      <*> readProp "email" json
      <*> readProp "email_md5" json
      <*> readProp "membership" json
      <*> (runNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "visibility" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance organizationResponseShow :: Show OrganizationResponse where
    show (OrganizationResponse o) = show "id: " ++ show o.id ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "name: " ++ show o.name ++ ", " ++ show "displayName: " ++ show o.displayName ++ ", " ++ show "description: " ++ show o.description ++ ", " ++ show "company: " ++ show o.company ++ ", " ++ show "location: " ++ show o.location ++ ", " ++ show "email: " ++ show o.email ++ ", " ++ show "emailMD5: " ++ show o.emailMD5 ++ ", " ++ show "membership: " ++ show o.membership ++ ", " ++ show "icon: " ++ show o.icon ++ ", " ++ show "tags: " ++ show o.tags ++ ", " ++ show "visibility: " ++ show o.visibility ++ ", " ++ show "active: " ++ show o.active ++ ", " ++ show "guard: " ++ show o.guard ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedBy: " ++ show o.modifiedBy ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt ++ ", " ++ show "activityAt: " ++ show o.activityAt

newtype OrganizationResponses = OrganizationResponses {
  organizationResponses :: (Array OrganizationResponse)
}


type OrganizationResponsesR = {
  organizationResponses :: (Array OrganizationResponse)
}


_OrganizationResponses :: LensP OrganizationResponses {
  organizationResponses :: (Array OrganizationResponse)
}
_OrganizationResponses f (OrganizationResponses o) = OrganizationResponses <$> f o


mkOrganizationResponses :: (Array OrganizationResponse) -> OrganizationResponses
mkOrganizationResponses organizationResponses =
  OrganizationResponses{organizationResponses}


unwrapOrganizationResponses (OrganizationResponses r) = r

instance organizationResponsesEncodeJson :: EncodeJson OrganizationResponses where
  encodeJson (OrganizationResponses o) =
       "tag" := "OrganizationResponses"
    ~> "organization_responses" := o.organizationResponses
    ~> jsonEmptyObject


instance organizationResponsesDecodeJson :: DecodeJson OrganizationResponses where
  decodeJson o = do
    obj <- decodeJson o
    organizationResponses <- obj .? "organization_responses"
    pure $ OrganizationResponses {
      organizationResponses
    }


instance organizationResponsesRequestable :: Requestable OrganizationResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance organizationResponsesRespondable :: Respondable OrganizationResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkOrganizationResponses
      <$> readProp "organization_responses" json


instance organizationResponsesIsForeign :: IsForeign OrganizationResponses where
  read json =
      mkOrganizationResponses
      <$> readProp "organization_responses" json


instance organizationResponsesShow :: Show OrganizationResponses where
    show (OrganizationResponses o) = show "organizationResponses: " ++ show o.organizationResponses

newtype OrganizationStatResponse = OrganizationStatResponse {
  organizationId :: Int,
  teams :: Int,
  members :: Int,
  forums :: Int,
  boards :: Int,
  threads :: Int,
  threadPosts :: Int,
  views :: Int
}


type OrganizationStatResponseR = {
  organizationId :: Int,
  teams :: Int,
  members :: Int,
  forums :: Int,
  boards :: Int,
  threads :: Int,
  threadPosts :: Int,
  views :: Int
}


_OrganizationStatResponse :: LensP OrganizationStatResponse {
  organizationId :: Int,
  teams :: Int,
  members :: Int,
  forums :: Int,
  boards :: Int,
  threads :: Int,
  threadPosts :: Int,
  views :: Int
}
_OrganizationStatResponse f (OrganizationStatResponse o) = OrganizationStatResponse <$> f o


mkOrganizationStatResponse :: Int -> Int -> Int -> Int -> Int -> Int -> Int -> Int -> OrganizationStatResponse
mkOrganizationStatResponse organizationId teams members forums boards threads threadPosts views =
  OrganizationStatResponse{organizationId, teams, members, forums, boards, threads, threadPosts, views}


unwrapOrganizationStatResponse (OrganizationStatResponse r) = r

instance organizationStatResponseEncodeJson :: EncodeJson OrganizationStatResponse where
  encodeJson (OrganizationStatResponse o) =
       "tag" := "OrganizationStatResponse"
    ~> "organization_id" := o.organizationId
    ~> "teams" := o.teams
    ~> "members" := o.members
    ~> "forums" := o.forums
    ~> "boards" := o.boards
    ~> "threads" := o.threads
    ~> "thread_posts" := o.threadPosts
    ~> "views" := o.views
    ~> jsonEmptyObject


instance organizationStatResponseDecodeJson :: DecodeJson OrganizationStatResponse where
  decodeJson o = do
    obj <- decodeJson o
    organizationId <- obj .? "organization_id"
    teams <- obj .? "teams"
    members <- obj .? "members"
    forums <- obj .? "forums"
    boards <- obj .? "boards"
    threads <- obj .? "threads"
    threadPosts <- obj .? "thread_posts"
    views <- obj .? "views"
    pure $ OrganizationStatResponse {
      organizationId,
      teams,
      members,
      forums,
      boards,
      threads,
      threadPosts,
      views
    }


instance organizationStatResponseRequestable :: Requestable OrganizationStatResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance organizationStatResponseRespondable :: Respondable OrganizationStatResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkOrganizationStatResponse
      <$> readProp "organization_id" json
      <*> readProp "teams" json
      <*> readProp "members" json
      <*> readProp "forums" json
      <*> readProp "boards" json
      <*> readProp "threads" json
      <*> readProp "thread_posts" json
      <*> readProp "views" json


instance organizationStatResponseIsForeign :: IsForeign OrganizationStatResponse where
  read json =
      mkOrganizationStatResponse
      <$> readProp "organization_id" json
      <*> readProp "teams" json
      <*> readProp "members" json
      <*> readProp "forums" json
      <*> readProp "boards" json
      <*> readProp "threads" json
      <*> readProp "thread_posts" json
      <*> readProp "views" json


instance organizationStatResponseShow :: Show OrganizationStatResponse where
    show (OrganizationStatResponse o) = show "organizationId: " ++ show o.organizationId ++ ", " ++ show "teams: " ++ show o.teams ++ ", " ++ show "members: " ++ show o.members ++ ", " ++ show "forums: " ++ show o.forums ++ ", " ++ show "boards: " ++ show o.boards ++ ", " ++ show "threads: " ++ show o.threads ++ ", " ++ show "threadPosts: " ++ show o.threadPosts ++ ", " ++ show "views: " ++ show o.views

newtype OrganizationStatResponses = OrganizationStatResponses {
  organizationStatResponses :: (Array OrganizationStatResponse)
}


type OrganizationStatResponsesR = {
  organizationStatResponses :: (Array OrganizationStatResponse)
}


_OrganizationStatResponses :: LensP OrganizationStatResponses {
  organizationStatResponses :: (Array OrganizationStatResponse)
}
_OrganizationStatResponses f (OrganizationStatResponses o) = OrganizationStatResponses <$> f o


mkOrganizationStatResponses :: (Array OrganizationStatResponse) -> OrganizationStatResponses
mkOrganizationStatResponses organizationStatResponses =
  OrganizationStatResponses{organizationStatResponses}


unwrapOrganizationStatResponses (OrganizationStatResponses r) = r

instance organizationStatResponsesEncodeJson :: EncodeJson OrganizationStatResponses where
  encodeJson (OrganizationStatResponses o) =
       "tag" := "OrganizationStatResponses"
    ~> "organization_stat_responses" := o.organizationStatResponses
    ~> jsonEmptyObject


instance organizationStatResponsesDecodeJson :: DecodeJson OrganizationStatResponses where
  decodeJson o = do
    obj <- decodeJson o
    organizationStatResponses <- obj .? "organization_stat_responses"
    pure $ OrganizationStatResponses {
      organizationStatResponses
    }


instance organizationStatResponsesRequestable :: Requestable OrganizationStatResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance organizationStatResponsesRespondable :: Respondable OrganizationStatResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkOrganizationStatResponses
      <$> readProp "organization_stat_responses" json


instance organizationStatResponsesIsForeign :: IsForeign OrganizationStatResponses where
  read json =
      mkOrganizationStatResponses
      <$> readProp "organization_stat_responses" json


instance organizationStatResponsesShow :: Show OrganizationStatResponses where
    show (OrganizationStatResponses o) = show "organizationStatResponses: " ++ show o.organizationStatResponses

data Param
  = Limit Int
  | Offset Int
  | SortOrder SortOrderBy
  | Order OrderBy
  | ByOrganizationId Int
  | ByOrganizationsIds (Array Int)
  | ByOrganizationName String
  | ByTeamId Int
  | ByTeamsIds (Array Int)
  | ByTeamName String
  | ByTeamMemberId Int
  | ByTeamMembersIds (Array Int)
  | ByUserId Int
  | ByUsersIds (Array Int)
  | ByUserNick String
  | ByUsersNicks (Array String)
  | ByGlobalGroupId Int
  | ByGlobalGroupsIds (Array Int)
  | ByGroupId Int
  | ByGroupsIds (Array Int)
  | ByGroupMemberId Int
  | ByGroupMembersIds (Array Int)
  | ByForumId Int
  | ByForumsIds (Array Int)
  | ByForumName String
  | ByBoardId Int
  | ByBoardsIds (Array Int)
  | ByBoardName String
  | ByThreadId Int
  | ByThreadsIds (Array Int)
  | ByThreadName String
  | ByThreadPostId Int
  | ByThreadPostsIds (Array Int)
  | ByThreadPostName String
  | ByThreadPostLikeId Int
  | ByThreadPostLikesIds (Array Int)
  | ByThreadPostStarId Int
  | ByThreadPostStarsIds (Array Int)
  | ByBucketId Int
  | ByResourceId Int
  | ByResourcesIds (Array Int)
  | ByResourceName String
  | ByLeuronId Int
  | ByLeuronsIds (Array Int)
  | ByPmId Int
  | ByPmsIds (Array Int)
  | ByReminderId Int
  | ByReminderFolderId Int
  | ByParentId Int
  | ByParentsIds (Array Int)
  | ByParentName String
  | BySelf Boolean
  | Timestamp Date
  | UnixTimestamp Int
  | CreatedAtTimestamp Date
  | CreatedAtUnixTimestamp Int
  | RealIP String
  | IP String
  | WithOrganization Boolean
  | WithForum Boolean
  | WithBoard Boolean
  | WithThread Boolean
  | WithResource Boolean



instance paramEncodeJson :: EncodeJson Param where
  encodeJson (Limit x0) =
       "tag" := "Limit"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (Offset x0) =
       "tag" := "Offset"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (SortOrder x0) =
       "tag" := "SortOrder"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (Order x0) =
       "tag" := "Order"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByOrganizationId x0) =
       "tag" := "ByOrganizationId"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByOrganizationsIds x0) =
       "tag" := "ByOrganizationsIds"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByOrganizationName x0) =
       "tag" := "ByOrganizationName"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByTeamId x0) =
       "tag" := "ByTeamId"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByTeamsIds x0) =
       "tag" := "ByTeamsIds"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByTeamName x0) =
       "tag" := "ByTeamName"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByTeamMemberId x0) =
       "tag" := "ByTeamMemberId"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByTeamMembersIds x0) =
       "tag" := "ByTeamMembersIds"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByUserId x0) =
       "tag" := "ByUserId"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByUsersIds x0) =
       "tag" := "ByUsersIds"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByUserNick x0) =
       "tag" := "ByUserNick"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByUsersNicks x0) =
       "tag" := "ByUsersNicks"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByGlobalGroupId x0) =
       "tag" := "ByGlobalGroupId"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByGlobalGroupsIds x0) =
       "tag" := "ByGlobalGroupsIds"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByGroupId x0) =
       "tag" := "ByGroupId"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByGroupsIds x0) =
       "tag" := "ByGroupsIds"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByGroupMemberId x0) =
       "tag" := "ByGroupMemberId"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByGroupMembersIds x0) =
       "tag" := "ByGroupMembersIds"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByForumId x0) =
       "tag" := "ByForumId"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByForumsIds x0) =
       "tag" := "ByForumsIds"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByForumName x0) =
       "tag" := "ByForumName"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByBoardId x0) =
       "tag" := "ByBoardId"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByBoardsIds x0) =
       "tag" := "ByBoardsIds"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByBoardName x0) =
       "tag" := "ByBoardName"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByThreadId x0) =
       "tag" := "ByThreadId"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByThreadsIds x0) =
       "tag" := "ByThreadsIds"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByThreadName x0) =
       "tag" := "ByThreadName"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByThreadPostId x0) =
       "tag" := "ByThreadPostId"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByThreadPostsIds x0) =
       "tag" := "ByThreadPostsIds"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByThreadPostName x0) =
       "tag" := "ByThreadPostName"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByThreadPostLikeId x0) =
       "tag" := "ByThreadPostLikeId"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByThreadPostLikesIds x0) =
       "tag" := "ByThreadPostLikesIds"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByThreadPostStarId x0) =
       "tag" := "ByThreadPostStarId"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByThreadPostStarsIds x0) =
       "tag" := "ByThreadPostStarsIds"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByBucketId x0) =
       "tag" := "ByBucketId"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByResourceId x0) =
       "tag" := "ByResourceId"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByResourcesIds x0) =
       "tag" := "ByResourcesIds"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByResourceName x0) =
       "tag" := "ByResourceName"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByLeuronId x0) =
       "tag" := "ByLeuronId"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByLeuronsIds x0) =
       "tag" := "ByLeuronsIds"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByPmId x0) =
       "tag" := "ByPmId"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByPmsIds x0) =
       "tag" := "ByPmsIds"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByReminderId x0) =
       "tag" := "ByReminderId"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByReminderFolderId x0) =
       "tag" := "ByReminderFolderId"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByParentId x0) =
       "tag" := "ByParentId"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByParentsIds x0) =
       "tag" := "ByParentsIds"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ByParentName x0) =
       "tag" := "ByParentName"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (BySelf x0) =
       "tag" := "BySelf"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (Timestamp x0) =
       "tag" := "Timestamp"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (UnixTimestamp x0) =
       "tag" := "UnixTimestamp"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (CreatedAtTimestamp x0) =
       "tag" := "CreatedAtTimestamp"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (CreatedAtUnixTimestamp x0) =
       "tag" := "CreatedAtUnixTimestamp"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (RealIP x0) =
       "tag" := "RealIP"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (IP x0) =
       "tag" := "IP"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (WithOrganization x0) =
       "tag" := "WithOrganization"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (WithForum x0) =
       "tag" := "WithForum"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (WithBoard x0) =
       "tag" := "WithBoard"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (WithThread x0) =
       "tag" := "WithThread"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (WithResource x0) =
       "tag" := "WithResource"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject


instance paramDecodeJson :: DecodeJson Param where
  decodeJson json = do
    obj <- decodeJson json
    tag <- obj .? "tag"
    case tag of
        "Limit" -> do
          x0 <- obj .? "contents"
          Limit <$> decodeJson x0

        "Offset" -> do
          x0 <- obj .? "contents"
          Offset <$> decodeJson x0

        "SortOrder" -> do
          x0 <- obj .? "contents"
          SortOrder <$> decodeJson x0

        "Order" -> do
          x0 <- obj .? "contents"
          Order <$> decodeJson x0

        "ByOrganizationId" -> do
          x0 <- obj .? "contents"
          ByOrganizationId <$> decodeJson x0

        "ByOrganizationsIds" -> do
          x0 <- obj .? "contents"
          ByOrganizationsIds <$> decodeJson x0

        "ByOrganizationName" -> do
          x0 <- obj .? "contents"
          ByOrganizationName <$> decodeJson x0

        "ByTeamId" -> do
          x0 <- obj .? "contents"
          ByTeamId <$> decodeJson x0

        "ByTeamsIds" -> do
          x0 <- obj .? "contents"
          ByTeamsIds <$> decodeJson x0

        "ByTeamName" -> do
          x0 <- obj .? "contents"
          ByTeamName <$> decodeJson x0

        "ByTeamMemberId" -> do
          x0 <- obj .? "contents"
          ByTeamMemberId <$> decodeJson x0

        "ByTeamMembersIds" -> do
          x0 <- obj .? "contents"
          ByTeamMembersIds <$> decodeJson x0

        "ByUserId" -> do
          x0 <- obj .? "contents"
          ByUserId <$> decodeJson x0

        "ByUsersIds" -> do
          x0 <- obj .? "contents"
          ByUsersIds <$> decodeJson x0

        "ByUserNick" -> do
          x0 <- obj .? "contents"
          ByUserNick <$> decodeJson x0

        "ByUsersNicks" -> do
          x0 <- obj .? "contents"
          ByUsersNicks <$> decodeJson x0

        "ByGlobalGroupId" -> do
          x0 <- obj .? "contents"
          ByGlobalGroupId <$> decodeJson x0

        "ByGlobalGroupsIds" -> do
          x0 <- obj .? "contents"
          ByGlobalGroupsIds <$> decodeJson x0

        "ByGroupId" -> do
          x0 <- obj .? "contents"
          ByGroupId <$> decodeJson x0

        "ByGroupsIds" -> do
          x0 <- obj .? "contents"
          ByGroupsIds <$> decodeJson x0

        "ByGroupMemberId" -> do
          x0 <- obj .? "contents"
          ByGroupMemberId <$> decodeJson x0

        "ByGroupMembersIds" -> do
          x0 <- obj .? "contents"
          ByGroupMembersIds <$> decodeJson x0

        "ByForumId" -> do
          x0 <- obj .? "contents"
          ByForumId <$> decodeJson x0

        "ByForumsIds" -> do
          x0 <- obj .? "contents"
          ByForumsIds <$> decodeJson x0

        "ByForumName" -> do
          x0 <- obj .? "contents"
          ByForumName <$> decodeJson x0

        "ByBoardId" -> do
          x0 <- obj .? "contents"
          ByBoardId <$> decodeJson x0

        "ByBoardsIds" -> do
          x0 <- obj .? "contents"
          ByBoardsIds <$> decodeJson x0

        "ByBoardName" -> do
          x0 <- obj .? "contents"
          ByBoardName <$> decodeJson x0

        "ByThreadId" -> do
          x0 <- obj .? "contents"
          ByThreadId <$> decodeJson x0

        "ByThreadsIds" -> do
          x0 <- obj .? "contents"
          ByThreadsIds <$> decodeJson x0

        "ByThreadName" -> do
          x0 <- obj .? "contents"
          ByThreadName <$> decodeJson x0

        "ByThreadPostId" -> do
          x0 <- obj .? "contents"
          ByThreadPostId <$> decodeJson x0

        "ByThreadPostsIds" -> do
          x0 <- obj .? "contents"
          ByThreadPostsIds <$> decodeJson x0

        "ByThreadPostName" -> do
          x0 <- obj .? "contents"
          ByThreadPostName <$> decodeJson x0

        "ByThreadPostLikeId" -> do
          x0 <- obj .? "contents"
          ByThreadPostLikeId <$> decodeJson x0

        "ByThreadPostLikesIds" -> do
          x0 <- obj .? "contents"
          ByThreadPostLikesIds <$> decodeJson x0

        "ByThreadPostStarId" -> do
          x0 <- obj .? "contents"
          ByThreadPostStarId <$> decodeJson x0

        "ByThreadPostStarsIds" -> do
          x0 <- obj .? "contents"
          ByThreadPostStarsIds <$> decodeJson x0

        "ByBucketId" -> do
          x0 <- obj .? "contents"
          ByBucketId <$> decodeJson x0

        "ByResourceId" -> do
          x0 <- obj .? "contents"
          ByResourceId <$> decodeJson x0

        "ByResourcesIds" -> do
          x0 <- obj .? "contents"
          ByResourcesIds <$> decodeJson x0

        "ByResourceName" -> do
          x0 <- obj .? "contents"
          ByResourceName <$> decodeJson x0

        "ByLeuronId" -> do
          x0 <- obj .? "contents"
          ByLeuronId <$> decodeJson x0

        "ByLeuronsIds" -> do
          x0 <- obj .? "contents"
          ByLeuronsIds <$> decodeJson x0

        "ByPmId" -> do
          x0 <- obj .? "contents"
          ByPmId <$> decodeJson x0

        "ByPmsIds" -> do
          x0 <- obj .? "contents"
          ByPmsIds <$> decodeJson x0

        "ByReminderId" -> do
          x0 <- obj .? "contents"
          ByReminderId <$> decodeJson x0

        "ByReminderFolderId" -> do
          x0 <- obj .? "contents"
          ByReminderFolderId <$> decodeJson x0

        "ByParentId" -> do
          x0 <- obj .? "contents"
          ByParentId <$> decodeJson x0

        "ByParentsIds" -> do
          x0 <- obj .? "contents"
          ByParentsIds <$> decodeJson x0

        "ByParentName" -> do
          x0 <- obj .? "contents"
          ByParentName <$> decodeJson x0

        "BySelf" -> do
          x0 <- obj .? "contents"
          BySelf <$> decodeJson x0

        "Timestamp" -> do
          x0 <- obj .? "contents"
          Timestamp <$> decodeJson x0

        "UnixTimestamp" -> do
          x0 <- obj .? "contents"
          UnixTimestamp <$> decodeJson x0

        "CreatedAtTimestamp" -> do
          x0 <- obj .? "contents"
          CreatedAtTimestamp <$> decodeJson x0

        "CreatedAtUnixTimestamp" -> do
          x0 <- obj .? "contents"
          CreatedAtUnixTimestamp <$> decodeJson x0

        "RealIP" -> do
          x0 <- obj .? "contents"
          RealIP <$> decodeJson x0

        "IP" -> do
          x0 <- obj .? "contents"
          IP <$> decodeJson x0

        "WithOrganization" -> do
          x0 <- obj .? "contents"
          WithOrganization <$> decodeJson x0

        "WithForum" -> do
          x0 <- obj .? "contents"
          WithForum <$> decodeJson x0

        "WithBoard" -> do
          x0 <- obj .? "contents"
          WithBoard <$> decodeJson x0

        "WithThread" -> do
          x0 <- obj .? "contents"
          WithThread <$> decodeJson x0

        "WithResource" -> do
          x0 <- obj .? "contents"
          WithResource <$> decodeJson x0

  decodeJson x = fail $ "Could not parse object: " ++ show x


instance paramRequestable :: Requestable Param where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance paramRespondable :: Respondable Param where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    tag <- readProp "tag" json
    case tag of
        "Limit" -> do
          x0 <- readProp "contents" json
          Limit <$> read x0

        "Offset" -> do
          x0 <- readProp "contents" json
          Offset <$> read x0

        "SortOrder" -> do
          x0 <- readProp "contents" json
          SortOrder <$> read x0

        "Order" -> do
          x0 <- readProp "contents" json
          Order <$> read x0

        "ByOrganizationId" -> do
          x0 <- readProp "contents" json
          ByOrganizationId <$> read x0

        "ByOrganizationsIds" -> do
          x0 <- readProp "contents" json
          ByOrganizationsIds <$> read x0

        "ByOrganizationName" -> do
          x0 <- readProp "contents" json
          ByOrganizationName <$> read x0

        "ByTeamId" -> do
          x0 <- readProp "contents" json
          ByTeamId <$> read x0

        "ByTeamsIds" -> do
          x0 <- readProp "contents" json
          ByTeamsIds <$> read x0

        "ByTeamName" -> do
          x0 <- readProp "contents" json
          ByTeamName <$> read x0

        "ByTeamMemberId" -> do
          x0 <- readProp "contents" json
          ByTeamMemberId <$> read x0

        "ByTeamMembersIds" -> do
          x0 <- readProp "contents" json
          ByTeamMembersIds <$> read x0

        "ByUserId" -> do
          x0 <- readProp "contents" json
          ByUserId <$> read x0

        "ByUsersIds" -> do
          x0 <- readProp "contents" json
          ByUsersIds <$> read x0

        "ByUserNick" -> do
          x0 <- readProp "contents" json
          ByUserNick <$> read x0

        "ByUsersNicks" -> do
          x0 <- readProp "contents" json
          ByUsersNicks <$> read x0

        "ByGlobalGroupId" -> do
          x0 <- readProp "contents" json
          ByGlobalGroupId <$> read x0

        "ByGlobalGroupsIds" -> do
          x0 <- readProp "contents" json
          ByGlobalGroupsIds <$> read x0

        "ByGroupId" -> do
          x0 <- readProp "contents" json
          ByGroupId <$> read x0

        "ByGroupsIds" -> do
          x0 <- readProp "contents" json
          ByGroupsIds <$> read x0

        "ByGroupMemberId" -> do
          x0 <- readProp "contents" json
          ByGroupMemberId <$> read x0

        "ByGroupMembersIds" -> do
          x0 <- readProp "contents" json
          ByGroupMembersIds <$> read x0

        "ByForumId" -> do
          x0 <- readProp "contents" json
          ByForumId <$> read x0

        "ByForumsIds" -> do
          x0 <- readProp "contents" json
          ByForumsIds <$> read x0

        "ByForumName" -> do
          x0 <- readProp "contents" json
          ByForumName <$> read x0

        "ByBoardId" -> do
          x0 <- readProp "contents" json
          ByBoardId <$> read x0

        "ByBoardsIds" -> do
          x0 <- readProp "contents" json
          ByBoardsIds <$> read x0

        "ByBoardName" -> do
          x0 <- readProp "contents" json
          ByBoardName <$> read x0

        "ByThreadId" -> do
          x0 <- readProp "contents" json
          ByThreadId <$> read x0

        "ByThreadsIds" -> do
          x0 <- readProp "contents" json
          ByThreadsIds <$> read x0

        "ByThreadName" -> do
          x0 <- readProp "contents" json
          ByThreadName <$> read x0

        "ByThreadPostId" -> do
          x0 <- readProp "contents" json
          ByThreadPostId <$> read x0

        "ByThreadPostsIds" -> do
          x0 <- readProp "contents" json
          ByThreadPostsIds <$> read x0

        "ByThreadPostName" -> do
          x0 <- readProp "contents" json
          ByThreadPostName <$> read x0

        "ByThreadPostLikeId" -> do
          x0 <- readProp "contents" json
          ByThreadPostLikeId <$> read x0

        "ByThreadPostLikesIds" -> do
          x0 <- readProp "contents" json
          ByThreadPostLikesIds <$> read x0

        "ByThreadPostStarId" -> do
          x0 <- readProp "contents" json
          ByThreadPostStarId <$> read x0

        "ByThreadPostStarsIds" -> do
          x0 <- readProp "contents" json
          ByThreadPostStarsIds <$> read x0

        "ByBucketId" -> do
          x0 <- readProp "contents" json
          ByBucketId <$> read x0

        "ByResourceId" -> do
          x0 <- readProp "contents" json
          ByResourceId <$> read x0

        "ByResourcesIds" -> do
          x0 <- readProp "contents" json
          ByResourcesIds <$> read x0

        "ByResourceName" -> do
          x0 <- readProp "contents" json
          ByResourceName <$> read x0

        "ByLeuronId" -> do
          x0 <- readProp "contents" json
          ByLeuronId <$> read x0

        "ByLeuronsIds" -> do
          x0 <- readProp "contents" json
          ByLeuronsIds <$> read x0

        "ByPmId" -> do
          x0 <- readProp "contents" json
          ByPmId <$> read x0

        "ByPmsIds" -> do
          x0 <- readProp "contents" json
          ByPmsIds <$> read x0

        "ByReminderId" -> do
          x0 <- readProp "contents" json
          ByReminderId <$> read x0

        "ByReminderFolderId" -> do
          x0 <- readProp "contents" json
          ByReminderFolderId <$> read x0

        "ByParentId" -> do
          x0 <- readProp "contents" json
          ByParentId <$> read x0

        "ByParentsIds" -> do
          x0 <- readProp "contents" json
          ByParentsIds <$> read x0

        "ByParentName" -> do
          x0 <- readProp "contents" json
          ByParentName <$> read x0

        "BySelf" -> do
          x0 <- readProp "contents" json
          BySelf <$> read x0

        "Timestamp" -> do
          x0 <- readProp "contents" json
          Timestamp <$> read x0

        "UnixTimestamp" -> do
          x0 <- readProp "contents" json
          UnixTimestamp <$> read x0

        "CreatedAtTimestamp" -> do
          x0 <- readProp "contents" json
          CreatedAtTimestamp <$> read x0

        "CreatedAtUnixTimestamp" -> do
          x0 <- readProp "contents" json
          CreatedAtUnixTimestamp <$> read x0

        "RealIP" -> do
          x0 <- readProp "contents" json
          RealIP <$> read x0

        "IP" -> do
          x0 <- readProp "contents" json
          IP <$> read x0

        "WithOrganization" -> do
          x0 <- readProp "contents" json
          WithOrganization <$> read x0

        "WithForum" -> do
          x0 <- readProp "contents" json
          WithForum <$> read x0

        "WithBoard" -> do
          x0 <- readProp "contents" json
          WithBoard <$> read x0

        "WithThread" -> do
          x0 <- readProp "contents" json
          WithThread <$> read x0

        "WithResource" -> do
          x0 <- readProp "contents" json
          WithResource <$> read x0



instance paramIsForeign :: IsForeign Param where
  read json = do
    tag <- readProp "tag" json
    case tag of
        "Limit" -> do
          x0 <- readProp "contents" json
          Limit <$> read x0

        "Offset" -> do
          x0 <- readProp "contents" json
          Offset <$> read x0

        "SortOrder" -> do
          x0 <- readProp "contents" json
          SortOrder <$> read x0

        "Order" -> do
          x0 <- readProp "contents" json
          Order <$> read x0

        "ByOrganizationId" -> do
          x0 <- readProp "contents" json
          ByOrganizationId <$> read x0

        "ByOrganizationsIds" -> do
          x0 <- readProp "contents" json
          ByOrganizationsIds <$> read x0

        "ByOrganizationName" -> do
          x0 <- readProp "contents" json
          ByOrganizationName <$> read x0

        "ByTeamId" -> do
          x0 <- readProp "contents" json
          ByTeamId <$> read x0

        "ByTeamsIds" -> do
          x0 <- readProp "contents" json
          ByTeamsIds <$> read x0

        "ByTeamName" -> do
          x0 <- readProp "contents" json
          ByTeamName <$> read x0

        "ByTeamMemberId" -> do
          x0 <- readProp "contents" json
          ByTeamMemberId <$> read x0

        "ByTeamMembersIds" -> do
          x0 <- readProp "contents" json
          ByTeamMembersIds <$> read x0

        "ByUserId" -> do
          x0 <- readProp "contents" json
          ByUserId <$> read x0

        "ByUsersIds" -> do
          x0 <- readProp "contents" json
          ByUsersIds <$> read x0

        "ByUserNick" -> do
          x0 <- readProp "contents" json
          ByUserNick <$> read x0

        "ByUsersNicks" -> do
          x0 <- readProp "contents" json
          ByUsersNicks <$> read x0

        "ByGlobalGroupId" -> do
          x0 <- readProp "contents" json
          ByGlobalGroupId <$> read x0

        "ByGlobalGroupsIds" -> do
          x0 <- readProp "contents" json
          ByGlobalGroupsIds <$> read x0

        "ByGroupId" -> do
          x0 <- readProp "contents" json
          ByGroupId <$> read x0

        "ByGroupsIds" -> do
          x0 <- readProp "contents" json
          ByGroupsIds <$> read x0

        "ByGroupMemberId" -> do
          x0 <- readProp "contents" json
          ByGroupMemberId <$> read x0

        "ByGroupMembersIds" -> do
          x0 <- readProp "contents" json
          ByGroupMembersIds <$> read x0

        "ByForumId" -> do
          x0 <- readProp "contents" json
          ByForumId <$> read x0

        "ByForumsIds" -> do
          x0 <- readProp "contents" json
          ByForumsIds <$> read x0

        "ByForumName" -> do
          x0 <- readProp "contents" json
          ByForumName <$> read x0

        "ByBoardId" -> do
          x0 <- readProp "contents" json
          ByBoardId <$> read x0

        "ByBoardsIds" -> do
          x0 <- readProp "contents" json
          ByBoardsIds <$> read x0

        "ByBoardName" -> do
          x0 <- readProp "contents" json
          ByBoardName <$> read x0

        "ByThreadId" -> do
          x0 <- readProp "contents" json
          ByThreadId <$> read x0

        "ByThreadsIds" -> do
          x0 <- readProp "contents" json
          ByThreadsIds <$> read x0

        "ByThreadName" -> do
          x0 <- readProp "contents" json
          ByThreadName <$> read x0

        "ByThreadPostId" -> do
          x0 <- readProp "contents" json
          ByThreadPostId <$> read x0

        "ByThreadPostsIds" -> do
          x0 <- readProp "contents" json
          ByThreadPostsIds <$> read x0

        "ByThreadPostName" -> do
          x0 <- readProp "contents" json
          ByThreadPostName <$> read x0

        "ByThreadPostLikeId" -> do
          x0 <- readProp "contents" json
          ByThreadPostLikeId <$> read x0

        "ByThreadPostLikesIds" -> do
          x0 <- readProp "contents" json
          ByThreadPostLikesIds <$> read x0

        "ByThreadPostStarId" -> do
          x0 <- readProp "contents" json
          ByThreadPostStarId <$> read x0

        "ByThreadPostStarsIds" -> do
          x0 <- readProp "contents" json
          ByThreadPostStarsIds <$> read x0

        "ByBucketId" -> do
          x0 <- readProp "contents" json
          ByBucketId <$> read x0

        "ByResourceId" -> do
          x0 <- readProp "contents" json
          ByResourceId <$> read x0

        "ByResourcesIds" -> do
          x0 <- readProp "contents" json
          ByResourcesIds <$> read x0

        "ByResourceName" -> do
          x0 <- readProp "contents" json
          ByResourceName <$> read x0

        "ByLeuronId" -> do
          x0 <- readProp "contents" json
          ByLeuronId <$> read x0

        "ByLeuronsIds" -> do
          x0 <- readProp "contents" json
          ByLeuronsIds <$> read x0

        "ByPmId" -> do
          x0 <- readProp "contents" json
          ByPmId <$> read x0

        "ByPmsIds" -> do
          x0 <- readProp "contents" json
          ByPmsIds <$> read x0

        "ByReminderId" -> do
          x0 <- readProp "contents" json
          ByReminderId <$> read x0

        "ByReminderFolderId" -> do
          x0 <- readProp "contents" json
          ByReminderFolderId <$> read x0

        "ByParentId" -> do
          x0 <- readProp "contents" json
          ByParentId <$> read x0

        "ByParentsIds" -> do
          x0 <- readProp "contents" json
          ByParentsIds <$> read x0

        "ByParentName" -> do
          x0 <- readProp "contents" json
          ByParentName <$> read x0

        "BySelf" -> do
          x0 <- readProp "contents" json
          BySelf <$> read x0

        "Timestamp" -> do
          x0 <- readProp "contents" json
          Timestamp <$> read x0

        "UnixTimestamp" -> do
          x0 <- readProp "contents" json
          UnixTimestamp <$> read x0

        "CreatedAtTimestamp" -> do
          x0 <- readProp "contents" json
          CreatedAtTimestamp <$> read x0

        "CreatedAtUnixTimestamp" -> do
          x0 <- readProp "contents" json
          CreatedAtUnixTimestamp <$> read x0

        "RealIP" -> do
          x0 <- readProp "contents" json
          RealIP <$> read x0

        "IP" -> do
          x0 <- readProp "contents" json
          IP <$> read x0

        "WithOrganization" -> do
          x0 <- readProp "contents" json
          WithOrganization <$> read x0

        "WithForum" -> do
          x0 <- readProp "contents" json
          WithForum <$> read x0

        "WithBoard" -> do
          x0 <- readProp "contents" json
          WithBoard <$> read x0

        "WithThread" -> do
          x0 <- readProp "contents" json
          WithThread <$> read x0

        "WithResource" -> do
          x0 <- readProp "contents" json
          WithResource <$> read x0



data ParamTag
  = ParamTag_Limit 
  | ParamTag_Offset 
  | ParamTag_SortOrder 
  | ParamTag_Order 
  | ParamTag_ByOrganizationId 
  | ParamTag_ByOrganizationsIds 
  | ParamTag_ByOrganizationName 
  | ParamTag_ByTeamId 
  | ParamTag_ByTeamsIds 
  | ParamTag_ByTeamName 
  | ParamTag_ByTeamMemberId 
  | ParamTag_ByTeamMembersIds 
  | ParamTag_ByUserId 
  | ParamTag_ByUsersIds 
  | ParamTag_ByUserNick 
  | ParamTag_ByUsersNicks 
  | ParamTag_ByGlobalGroupId 
  | ParamTag_ByGlobalGroupsIds 
  | ParamTag_ByGroupId 
  | ParamTag_ByGroupsIds 
  | ParamTag_ByGroupMemberId 
  | ParamTag_ByGroupMembersIds 
  | ParamTag_ByForumId 
  | ParamTag_ByForumsIds 
  | ParamTag_ByForumName 
  | ParamTag_ByBoardId 
  | ParamTag_ByBoardsIds 
  | ParamTag_ByBoardName 
  | ParamTag_ByThreadId 
  | ParamTag_ByThreadsIds 
  | ParamTag_ByThreadName 
  | ParamTag_ByThreadPostId 
  | ParamTag_ByThreadPostsIds 
  | ParamTag_ByThreadPostName 
  | ParamTag_ByThreadPostLikeId 
  | ParamTag_ByThreadPostLikesIds 
  | ParamTag_ByThreadPostStarId 
  | ParamTag_ByThreadPostStarsIds 
  | ParamTag_ByBucketId 
  | ParamTag_ByResourceId 
  | ParamTag_ByResourcesIds 
  | ParamTag_ByResourceName 
  | ParamTag_ByLeuronId 
  | ParamTag_ByLeuronsIds 
  | ParamTag_ByPmId 
  | ParamTag_ByPmsIds 
  | ParamTag_ByReminderId 
  | ParamTag_ByReminderFolderId 
  | ParamTag_ByParentId 
  | ParamTag_ByParentsIds 
  | ParamTag_ByParentName 
  | ParamTag_BySelf 
  | ParamTag_Timestamp 
  | ParamTag_UnixTimestamp 
  | ParamTag_CreatedAtTimestamp 
  | ParamTag_CreatedAtUnixTimestamp 
  | ParamTag_RealIP 
  | ParamTag_IP 
  | ParamTag_WithOrganization 
  | ParamTag_WithForum 
  | ParamTag_WithBoard 
  | ParamTag_WithThread 
  | ParamTag_WithResource 



instance paramTagEncodeJson :: EncodeJson ParamTag where
  encodeJson (ParamTag_Limit ) =
       "tag" := "ParamTag_Limit"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_Offset ) =
       "tag" := "ParamTag_Offset"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_SortOrder ) =
       "tag" := "ParamTag_SortOrder"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_Order ) =
       "tag" := "ParamTag_Order"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByOrganizationId ) =
       "tag" := "ParamTag_ByOrganizationId"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByOrganizationsIds ) =
       "tag" := "ParamTag_ByOrganizationsIds"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByOrganizationName ) =
       "tag" := "ParamTag_ByOrganizationName"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByTeamId ) =
       "tag" := "ParamTag_ByTeamId"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByTeamsIds ) =
       "tag" := "ParamTag_ByTeamsIds"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByTeamName ) =
       "tag" := "ParamTag_ByTeamName"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByTeamMemberId ) =
       "tag" := "ParamTag_ByTeamMemberId"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByTeamMembersIds ) =
       "tag" := "ParamTag_ByTeamMembersIds"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByUserId ) =
       "tag" := "ParamTag_ByUserId"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByUsersIds ) =
       "tag" := "ParamTag_ByUsersIds"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByUserNick ) =
       "tag" := "ParamTag_ByUserNick"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByUsersNicks ) =
       "tag" := "ParamTag_ByUsersNicks"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByGlobalGroupId ) =
       "tag" := "ParamTag_ByGlobalGroupId"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByGlobalGroupsIds ) =
       "tag" := "ParamTag_ByGlobalGroupsIds"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByGroupId ) =
       "tag" := "ParamTag_ByGroupId"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByGroupsIds ) =
       "tag" := "ParamTag_ByGroupsIds"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByGroupMemberId ) =
       "tag" := "ParamTag_ByGroupMemberId"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByGroupMembersIds ) =
       "tag" := "ParamTag_ByGroupMembersIds"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByForumId ) =
       "tag" := "ParamTag_ByForumId"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByForumsIds ) =
       "tag" := "ParamTag_ByForumsIds"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByForumName ) =
       "tag" := "ParamTag_ByForumName"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByBoardId ) =
       "tag" := "ParamTag_ByBoardId"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByBoardsIds ) =
       "tag" := "ParamTag_ByBoardsIds"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByBoardName ) =
       "tag" := "ParamTag_ByBoardName"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByThreadId ) =
       "tag" := "ParamTag_ByThreadId"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByThreadsIds ) =
       "tag" := "ParamTag_ByThreadsIds"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByThreadName ) =
       "tag" := "ParamTag_ByThreadName"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByThreadPostId ) =
       "tag" := "ParamTag_ByThreadPostId"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByThreadPostsIds ) =
       "tag" := "ParamTag_ByThreadPostsIds"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByThreadPostName ) =
       "tag" := "ParamTag_ByThreadPostName"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByThreadPostLikeId ) =
       "tag" := "ParamTag_ByThreadPostLikeId"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByThreadPostLikesIds ) =
       "tag" := "ParamTag_ByThreadPostLikesIds"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByThreadPostStarId ) =
       "tag" := "ParamTag_ByThreadPostStarId"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByThreadPostStarsIds ) =
       "tag" := "ParamTag_ByThreadPostStarsIds"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByBucketId ) =
       "tag" := "ParamTag_ByBucketId"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByResourceId ) =
       "tag" := "ParamTag_ByResourceId"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByResourcesIds ) =
       "tag" := "ParamTag_ByResourcesIds"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByResourceName ) =
       "tag" := "ParamTag_ByResourceName"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByLeuronId ) =
       "tag" := "ParamTag_ByLeuronId"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByLeuronsIds ) =
       "tag" := "ParamTag_ByLeuronsIds"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByPmId ) =
       "tag" := "ParamTag_ByPmId"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByPmsIds ) =
       "tag" := "ParamTag_ByPmsIds"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByReminderId ) =
       "tag" := "ParamTag_ByReminderId"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByReminderFolderId ) =
       "tag" := "ParamTag_ByReminderFolderId"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByParentId ) =
       "tag" := "ParamTag_ByParentId"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByParentsIds ) =
       "tag" := "ParamTag_ByParentsIds"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByParentName ) =
       "tag" := "ParamTag_ByParentName"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_BySelf ) =
       "tag" := "ParamTag_BySelf"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_Timestamp ) =
       "tag" := "ParamTag_Timestamp"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_UnixTimestamp ) =
       "tag" := "ParamTag_UnixTimestamp"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_CreatedAtTimestamp ) =
       "tag" := "ParamTag_CreatedAtTimestamp"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_CreatedAtUnixTimestamp ) =
       "tag" := "ParamTag_CreatedAtUnixTimestamp"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_RealIP ) =
       "tag" := "ParamTag_RealIP"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_IP ) =
       "tag" := "ParamTag_IP"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_WithOrganization ) =
       "tag" := "ParamTag_WithOrganization"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_WithForum ) =
       "tag" := "ParamTag_WithForum"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_WithBoard ) =
       "tag" := "ParamTag_WithBoard"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_WithThread ) =
       "tag" := "ParamTag_WithThread"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_WithResource ) =
       "tag" := "ParamTag_WithResource"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject


instance paramTagDecodeJson :: DecodeJson ParamTag where
  decodeJson json = do
    obj <- decodeJson json
    tag <- obj .? "tag"
    case tag of
        "ParamTag_Limit" -> do
          return ParamTag_Limit

        "ParamTag_Offset" -> do
          return ParamTag_Offset

        "ParamTag_SortOrder" -> do
          return ParamTag_SortOrder

        "ParamTag_Order" -> do
          return ParamTag_Order

        "ParamTag_ByOrganizationId" -> do
          return ParamTag_ByOrganizationId

        "ParamTag_ByOrganizationsIds" -> do
          return ParamTag_ByOrganizationsIds

        "ParamTag_ByOrganizationName" -> do
          return ParamTag_ByOrganizationName

        "ParamTag_ByTeamId" -> do
          return ParamTag_ByTeamId

        "ParamTag_ByTeamsIds" -> do
          return ParamTag_ByTeamsIds

        "ParamTag_ByTeamName" -> do
          return ParamTag_ByTeamName

        "ParamTag_ByTeamMemberId" -> do
          return ParamTag_ByTeamMemberId

        "ParamTag_ByTeamMembersIds" -> do
          return ParamTag_ByTeamMembersIds

        "ParamTag_ByUserId" -> do
          return ParamTag_ByUserId

        "ParamTag_ByUsersIds" -> do
          return ParamTag_ByUsersIds

        "ParamTag_ByUserNick" -> do
          return ParamTag_ByUserNick

        "ParamTag_ByUsersNicks" -> do
          return ParamTag_ByUsersNicks

        "ParamTag_ByGlobalGroupId" -> do
          return ParamTag_ByGlobalGroupId

        "ParamTag_ByGlobalGroupsIds" -> do
          return ParamTag_ByGlobalGroupsIds

        "ParamTag_ByGroupId" -> do
          return ParamTag_ByGroupId

        "ParamTag_ByGroupsIds" -> do
          return ParamTag_ByGroupsIds

        "ParamTag_ByGroupMemberId" -> do
          return ParamTag_ByGroupMemberId

        "ParamTag_ByGroupMembersIds" -> do
          return ParamTag_ByGroupMembersIds

        "ParamTag_ByForumId" -> do
          return ParamTag_ByForumId

        "ParamTag_ByForumsIds" -> do
          return ParamTag_ByForumsIds

        "ParamTag_ByForumName" -> do
          return ParamTag_ByForumName

        "ParamTag_ByBoardId" -> do
          return ParamTag_ByBoardId

        "ParamTag_ByBoardsIds" -> do
          return ParamTag_ByBoardsIds

        "ParamTag_ByBoardName" -> do
          return ParamTag_ByBoardName

        "ParamTag_ByThreadId" -> do
          return ParamTag_ByThreadId

        "ParamTag_ByThreadsIds" -> do
          return ParamTag_ByThreadsIds

        "ParamTag_ByThreadName" -> do
          return ParamTag_ByThreadName

        "ParamTag_ByThreadPostId" -> do
          return ParamTag_ByThreadPostId

        "ParamTag_ByThreadPostsIds" -> do
          return ParamTag_ByThreadPostsIds

        "ParamTag_ByThreadPostName" -> do
          return ParamTag_ByThreadPostName

        "ParamTag_ByThreadPostLikeId" -> do
          return ParamTag_ByThreadPostLikeId

        "ParamTag_ByThreadPostLikesIds" -> do
          return ParamTag_ByThreadPostLikesIds

        "ParamTag_ByThreadPostStarId" -> do
          return ParamTag_ByThreadPostStarId

        "ParamTag_ByThreadPostStarsIds" -> do
          return ParamTag_ByThreadPostStarsIds

        "ParamTag_ByBucketId" -> do
          return ParamTag_ByBucketId

        "ParamTag_ByResourceId" -> do
          return ParamTag_ByResourceId

        "ParamTag_ByResourcesIds" -> do
          return ParamTag_ByResourcesIds

        "ParamTag_ByResourceName" -> do
          return ParamTag_ByResourceName

        "ParamTag_ByLeuronId" -> do
          return ParamTag_ByLeuronId

        "ParamTag_ByLeuronsIds" -> do
          return ParamTag_ByLeuronsIds

        "ParamTag_ByPmId" -> do
          return ParamTag_ByPmId

        "ParamTag_ByPmsIds" -> do
          return ParamTag_ByPmsIds

        "ParamTag_ByReminderId" -> do
          return ParamTag_ByReminderId

        "ParamTag_ByReminderFolderId" -> do
          return ParamTag_ByReminderFolderId

        "ParamTag_ByParentId" -> do
          return ParamTag_ByParentId

        "ParamTag_ByParentsIds" -> do
          return ParamTag_ByParentsIds

        "ParamTag_ByParentName" -> do
          return ParamTag_ByParentName

        "ParamTag_BySelf" -> do
          return ParamTag_BySelf

        "ParamTag_Timestamp" -> do
          return ParamTag_Timestamp

        "ParamTag_UnixTimestamp" -> do
          return ParamTag_UnixTimestamp

        "ParamTag_CreatedAtTimestamp" -> do
          return ParamTag_CreatedAtTimestamp

        "ParamTag_CreatedAtUnixTimestamp" -> do
          return ParamTag_CreatedAtUnixTimestamp

        "ParamTag_RealIP" -> do
          return ParamTag_RealIP

        "ParamTag_IP" -> do
          return ParamTag_IP

        "ParamTag_WithOrganization" -> do
          return ParamTag_WithOrganization

        "ParamTag_WithForum" -> do
          return ParamTag_WithForum

        "ParamTag_WithBoard" -> do
          return ParamTag_WithBoard

        "ParamTag_WithThread" -> do
          return ParamTag_WithThread

        "ParamTag_WithResource" -> do
          return ParamTag_WithResource

  decodeJson x = fail $ "Could not parse object: " ++ show x


instance paramTagRequestable :: Requestable ParamTag where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance paramTagRespondable :: Respondable ParamTag where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    tag <- readProp "tag" json
    case tag of
        "ParamTag_Limit" -> do
          return ParamTag_Limit

        "ParamTag_Offset" -> do
          return ParamTag_Offset

        "ParamTag_SortOrder" -> do
          return ParamTag_SortOrder

        "ParamTag_Order" -> do
          return ParamTag_Order

        "ParamTag_ByOrganizationId" -> do
          return ParamTag_ByOrganizationId

        "ParamTag_ByOrganizationsIds" -> do
          return ParamTag_ByOrganizationsIds

        "ParamTag_ByOrganizationName" -> do
          return ParamTag_ByOrganizationName

        "ParamTag_ByTeamId" -> do
          return ParamTag_ByTeamId

        "ParamTag_ByTeamsIds" -> do
          return ParamTag_ByTeamsIds

        "ParamTag_ByTeamName" -> do
          return ParamTag_ByTeamName

        "ParamTag_ByTeamMemberId" -> do
          return ParamTag_ByTeamMemberId

        "ParamTag_ByTeamMembersIds" -> do
          return ParamTag_ByTeamMembersIds

        "ParamTag_ByUserId" -> do
          return ParamTag_ByUserId

        "ParamTag_ByUsersIds" -> do
          return ParamTag_ByUsersIds

        "ParamTag_ByUserNick" -> do
          return ParamTag_ByUserNick

        "ParamTag_ByUsersNicks" -> do
          return ParamTag_ByUsersNicks

        "ParamTag_ByGlobalGroupId" -> do
          return ParamTag_ByGlobalGroupId

        "ParamTag_ByGlobalGroupsIds" -> do
          return ParamTag_ByGlobalGroupsIds

        "ParamTag_ByGroupId" -> do
          return ParamTag_ByGroupId

        "ParamTag_ByGroupsIds" -> do
          return ParamTag_ByGroupsIds

        "ParamTag_ByGroupMemberId" -> do
          return ParamTag_ByGroupMemberId

        "ParamTag_ByGroupMembersIds" -> do
          return ParamTag_ByGroupMembersIds

        "ParamTag_ByForumId" -> do
          return ParamTag_ByForumId

        "ParamTag_ByForumsIds" -> do
          return ParamTag_ByForumsIds

        "ParamTag_ByForumName" -> do
          return ParamTag_ByForumName

        "ParamTag_ByBoardId" -> do
          return ParamTag_ByBoardId

        "ParamTag_ByBoardsIds" -> do
          return ParamTag_ByBoardsIds

        "ParamTag_ByBoardName" -> do
          return ParamTag_ByBoardName

        "ParamTag_ByThreadId" -> do
          return ParamTag_ByThreadId

        "ParamTag_ByThreadsIds" -> do
          return ParamTag_ByThreadsIds

        "ParamTag_ByThreadName" -> do
          return ParamTag_ByThreadName

        "ParamTag_ByThreadPostId" -> do
          return ParamTag_ByThreadPostId

        "ParamTag_ByThreadPostsIds" -> do
          return ParamTag_ByThreadPostsIds

        "ParamTag_ByThreadPostName" -> do
          return ParamTag_ByThreadPostName

        "ParamTag_ByThreadPostLikeId" -> do
          return ParamTag_ByThreadPostLikeId

        "ParamTag_ByThreadPostLikesIds" -> do
          return ParamTag_ByThreadPostLikesIds

        "ParamTag_ByThreadPostStarId" -> do
          return ParamTag_ByThreadPostStarId

        "ParamTag_ByThreadPostStarsIds" -> do
          return ParamTag_ByThreadPostStarsIds

        "ParamTag_ByBucketId" -> do
          return ParamTag_ByBucketId

        "ParamTag_ByResourceId" -> do
          return ParamTag_ByResourceId

        "ParamTag_ByResourcesIds" -> do
          return ParamTag_ByResourcesIds

        "ParamTag_ByResourceName" -> do
          return ParamTag_ByResourceName

        "ParamTag_ByLeuronId" -> do
          return ParamTag_ByLeuronId

        "ParamTag_ByLeuronsIds" -> do
          return ParamTag_ByLeuronsIds

        "ParamTag_ByPmId" -> do
          return ParamTag_ByPmId

        "ParamTag_ByPmsIds" -> do
          return ParamTag_ByPmsIds

        "ParamTag_ByReminderId" -> do
          return ParamTag_ByReminderId

        "ParamTag_ByReminderFolderId" -> do
          return ParamTag_ByReminderFolderId

        "ParamTag_ByParentId" -> do
          return ParamTag_ByParentId

        "ParamTag_ByParentsIds" -> do
          return ParamTag_ByParentsIds

        "ParamTag_ByParentName" -> do
          return ParamTag_ByParentName

        "ParamTag_BySelf" -> do
          return ParamTag_BySelf

        "ParamTag_Timestamp" -> do
          return ParamTag_Timestamp

        "ParamTag_UnixTimestamp" -> do
          return ParamTag_UnixTimestamp

        "ParamTag_CreatedAtTimestamp" -> do
          return ParamTag_CreatedAtTimestamp

        "ParamTag_CreatedAtUnixTimestamp" -> do
          return ParamTag_CreatedAtUnixTimestamp

        "ParamTag_RealIP" -> do
          return ParamTag_RealIP

        "ParamTag_IP" -> do
          return ParamTag_IP

        "ParamTag_WithOrganization" -> do
          return ParamTag_WithOrganization

        "ParamTag_WithForum" -> do
          return ParamTag_WithForum

        "ParamTag_WithBoard" -> do
          return ParamTag_WithBoard

        "ParamTag_WithThread" -> do
          return ParamTag_WithThread

        "ParamTag_WithResource" -> do
          return ParamTag_WithResource



instance paramTagIsForeign :: IsForeign ParamTag where
  read json = do
    tag <- readProp "tag" json
    case tag of
        "ParamTag_Limit" -> do
          return ParamTag_Limit

        "ParamTag_Offset" -> do
          return ParamTag_Offset

        "ParamTag_SortOrder" -> do
          return ParamTag_SortOrder

        "ParamTag_Order" -> do
          return ParamTag_Order

        "ParamTag_ByOrganizationId" -> do
          return ParamTag_ByOrganizationId

        "ParamTag_ByOrganizationsIds" -> do
          return ParamTag_ByOrganizationsIds

        "ParamTag_ByOrganizationName" -> do
          return ParamTag_ByOrganizationName

        "ParamTag_ByTeamId" -> do
          return ParamTag_ByTeamId

        "ParamTag_ByTeamsIds" -> do
          return ParamTag_ByTeamsIds

        "ParamTag_ByTeamName" -> do
          return ParamTag_ByTeamName

        "ParamTag_ByTeamMemberId" -> do
          return ParamTag_ByTeamMemberId

        "ParamTag_ByTeamMembersIds" -> do
          return ParamTag_ByTeamMembersIds

        "ParamTag_ByUserId" -> do
          return ParamTag_ByUserId

        "ParamTag_ByUsersIds" -> do
          return ParamTag_ByUsersIds

        "ParamTag_ByUserNick" -> do
          return ParamTag_ByUserNick

        "ParamTag_ByUsersNicks" -> do
          return ParamTag_ByUsersNicks

        "ParamTag_ByGlobalGroupId" -> do
          return ParamTag_ByGlobalGroupId

        "ParamTag_ByGlobalGroupsIds" -> do
          return ParamTag_ByGlobalGroupsIds

        "ParamTag_ByGroupId" -> do
          return ParamTag_ByGroupId

        "ParamTag_ByGroupsIds" -> do
          return ParamTag_ByGroupsIds

        "ParamTag_ByGroupMemberId" -> do
          return ParamTag_ByGroupMemberId

        "ParamTag_ByGroupMembersIds" -> do
          return ParamTag_ByGroupMembersIds

        "ParamTag_ByForumId" -> do
          return ParamTag_ByForumId

        "ParamTag_ByForumsIds" -> do
          return ParamTag_ByForumsIds

        "ParamTag_ByForumName" -> do
          return ParamTag_ByForumName

        "ParamTag_ByBoardId" -> do
          return ParamTag_ByBoardId

        "ParamTag_ByBoardsIds" -> do
          return ParamTag_ByBoardsIds

        "ParamTag_ByBoardName" -> do
          return ParamTag_ByBoardName

        "ParamTag_ByThreadId" -> do
          return ParamTag_ByThreadId

        "ParamTag_ByThreadsIds" -> do
          return ParamTag_ByThreadsIds

        "ParamTag_ByThreadName" -> do
          return ParamTag_ByThreadName

        "ParamTag_ByThreadPostId" -> do
          return ParamTag_ByThreadPostId

        "ParamTag_ByThreadPostsIds" -> do
          return ParamTag_ByThreadPostsIds

        "ParamTag_ByThreadPostName" -> do
          return ParamTag_ByThreadPostName

        "ParamTag_ByThreadPostLikeId" -> do
          return ParamTag_ByThreadPostLikeId

        "ParamTag_ByThreadPostLikesIds" -> do
          return ParamTag_ByThreadPostLikesIds

        "ParamTag_ByThreadPostStarId" -> do
          return ParamTag_ByThreadPostStarId

        "ParamTag_ByThreadPostStarsIds" -> do
          return ParamTag_ByThreadPostStarsIds

        "ParamTag_ByBucketId" -> do
          return ParamTag_ByBucketId

        "ParamTag_ByResourceId" -> do
          return ParamTag_ByResourceId

        "ParamTag_ByResourcesIds" -> do
          return ParamTag_ByResourcesIds

        "ParamTag_ByResourceName" -> do
          return ParamTag_ByResourceName

        "ParamTag_ByLeuronId" -> do
          return ParamTag_ByLeuronId

        "ParamTag_ByLeuronsIds" -> do
          return ParamTag_ByLeuronsIds

        "ParamTag_ByPmId" -> do
          return ParamTag_ByPmId

        "ParamTag_ByPmsIds" -> do
          return ParamTag_ByPmsIds

        "ParamTag_ByReminderId" -> do
          return ParamTag_ByReminderId

        "ParamTag_ByReminderFolderId" -> do
          return ParamTag_ByReminderFolderId

        "ParamTag_ByParentId" -> do
          return ParamTag_ByParentId

        "ParamTag_ByParentsIds" -> do
          return ParamTag_ByParentsIds

        "ParamTag_ByParentName" -> do
          return ParamTag_ByParentName

        "ParamTag_BySelf" -> do
          return ParamTag_BySelf

        "ParamTag_Timestamp" -> do
          return ParamTag_Timestamp

        "ParamTag_UnixTimestamp" -> do
          return ParamTag_UnixTimestamp

        "ParamTag_CreatedAtTimestamp" -> do
          return ParamTag_CreatedAtTimestamp

        "ParamTag_CreatedAtUnixTimestamp" -> do
          return ParamTag_CreatedAtUnixTimestamp

        "ParamTag_RealIP" -> do
          return ParamTag_RealIP

        "ParamTag_IP" -> do
          return ParamTag_IP

        "ParamTag_WithOrganization" -> do
          return ParamTag_WithOrganization

        "ParamTag_WithForum" -> do
          return ParamTag_WithForum

        "ParamTag_WithBoard" -> do
          return ParamTag_WithBoard

        "ParamTag_WithThread" -> do
          return ParamTag_WithThread

        "ParamTag_WithResource" -> do
          return ParamTag_WithResource



data SortOrderBy
  = SortOrderBy_Asc 
  | SortOrderBy_Dsc 
  | SortOrderBy_Rnd 
  | SortOrderBy_None 



instance sortOrderByEncodeJson :: EncodeJson SortOrderBy where
  encodeJson (SortOrderBy_Asc ) =
       "tag" := "SortOrderBy_Asc"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (SortOrderBy_Dsc ) =
       "tag" := "SortOrderBy_Dsc"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (SortOrderBy_Rnd ) =
       "tag" := "SortOrderBy_Rnd"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (SortOrderBy_None ) =
       "tag" := "SortOrderBy_None"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject


instance sortOrderByDecodeJson :: DecodeJson SortOrderBy where
  decodeJson json = do
    obj <- decodeJson json
    tag <- obj .? "tag"
    case tag of
        "SortOrderBy_Asc" -> do
          return SortOrderBy_Asc

        "SortOrderBy_Dsc" -> do
          return SortOrderBy_Dsc

        "SortOrderBy_Rnd" -> do
          return SortOrderBy_Rnd

        "SortOrderBy_None" -> do
          return SortOrderBy_None

  decodeJson x = fail $ "Could not parse object: " ++ show x


instance sortOrderByRequestable :: Requestable SortOrderBy where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance sortOrderByRespondable :: Respondable SortOrderBy where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    tag <- readProp "tag" json
    case tag of
        "SortOrderBy_Asc" -> do
          return SortOrderBy_Asc

        "SortOrderBy_Dsc" -> do
          return SortOrderBy_Dsc

        "SortOrderBy_Rnd" -> do
          return SortOrderBy_Rnd

        "SortOrderBy_None" -> do
          return SortOrderBy_None



instance sortOrderByIsForeign :: IsForeign SortOrderBy where
  read json = do
    tag <- readProp "tag" json
    case tag of
        "SortOrderBy_Asc" -> do
          return SortOrderBy_Asc

        "SortOrderBy_Dsc" -> do
          return SortOrderBy_Dsc

        "SortOrderBy_Rnd" -> do
          return SortOrderBy_Rnd

        "SortOrderBy_None" -> do
          return SortOrderBy_None



data OrderBy
  = OrderBy_UserId 
  | OrderBy_CreatedAt 
  | OrderBy_ModifiedAt 
  | OrderBy_ModifiedBy 
  | OrderBy_ActivityAt 
  | OrderBy_OrganizationId 
  | OrderBy_TeamId 
  | OrderBy_ForumId 
  | OrderBy_BoardId 
  | OrderBy_ThreadId 
  | OrderBy_Id 
  | OrderBy_None 



instance orderByEncodeJson :: EncodeJson OrderBy where
  encodeJson (OrderBy_UserId ) =
       "tag" := "OrderBy_UserId"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (OrderBy_CreatedAt ) =
       "tag" := "OrderBy_CreatedAt"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (OrderBy_ModifiedAt ) =
       "tag" := "OrderBy_ModifiedAt"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (OrderBy_ModifiedBy ) =
       "tag" := "OrderBy_ModifiedBy"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (OrderBy_ActivityAt ) =
       "tag" := "OrderBy_ActivityAt"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (OrderBy_OrganizationId ) =
       "tag" := "OrderBy_OrganizationId"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (OrderBy_TeamId ) =
       "tag" := "OrderBy_TeamId"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (OrderBy_ForumId ) =
       "tag" := "OrderBy_ForumId"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (OrderBy_BoardId ) =
       "tag" := "OrderBy_BoardId"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (OrderBy_ThreadId ) =
       "tag" := "OrderBy_ThreadId"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (OrderBy_Id ) =
       "tag" := "OrderBy_Id"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (OrderBy_None ) =
       "tag" := "OrderBy_None"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject


instance orderByDecodeJson :: DecodeJson OrderBy where
  decodeJson json = do
    obj <- decodeJson json
    tag <- obj .? "tag"
    case tag of
        "OrderBy_UserId" -> do
          return OrderBy_UserId

        "OrderBy_CreatedAt" -> do
          return OrderBy_CreatedAt

        "OrderBy_ModifiedAt" -> do
          return OrderBy_ModifiedAt

        "OrderBy_ModifiedBy" -> do
          return OrderBy_ModifiedBy

        "OrderBy_ActivityAt" -> do
          return OrderBy_ActivityAt

        "OrderBy_OrganizationId" -> do
          return OrderBy_OrganizationId

        "OrderBy_TeamId" -> do
          return OrderBy_TeamId

        "OrderBy_ForumId" -> do
          return OrderBy_ForumId

        "OrderBy_BoardId" -> do
          return OrderBy_BoardId

        "OrderBy_ThreadId" -> do
          return OrderBy_ThreadId

        "OrderBy_Id" -> do
          return OrderBy_Id

        "OrderBy_None" -> do
          return OrderBy_None

  decodeJson x = fail $ "Could not parse object: " ++ show x


instance orderByRequestable :: Requestable OrderBy where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance orderByRespondable :: Respondable OrderBy where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    tag <- readProp "tag" json
    case tag of
        "OrderBy_UserId" -> do
          return OrderBy_UserId

        "OrderBy_CreatedAt" -> do
          return OrderBy_CreatedAt

        "OrderBy_ModifiedAt" -> do
          return OrderBy_ModifiedAt

        "OrderBy_ModifiedBy" -> do
          return OrderBy_ModifiedBy

        "OrderBy_ActivityAt" -> do
          return OrderBy_ActivityAt

        "OrderBy_OrganizationId" -> do
          return OrderBy_OrganizationId

        "OrderBy_TeamId" -> do
          return OrderBy_TeamId

        "OrderBy_ForumId" -> do
          return OrderBy_ForumId

        "OrderBy_BoardId" -> do
          return OrderBy_BoardId

        "OrderBy_ThreadId" -> do
          return OrderBy_ThreadId

        "OrderBy_Id" -> do
          return OrderBy_Id

        "OrderBy_None" -> do
          return OrderBy_None



instance orderByIsForeign :: IsForeign OrderBy where
  read json = do
    tag <- readProp "tag" json
    case tag of
        "OrderBy_UserId" -> do
          return OrderBy_UserId

        "OrderBy_CreatedAt" -> do
          return OrderBy_CreatedAt

        "OrderBy_ModifiedAt" -> do
          return OrderBy_ModifiedAt

        "OrderBy_ModifiedBy" -> do
          return OrderBy_ModifiedBy

        "OrderBy_ActivityAt" -> do
          return OrderBy_ActivityAt

        "OrderBy_OrganizationId" -> do
          return OrderBy_OrganizationId

        "OrderBy_TeamId" -> do
          return OrderBy_TeamId

        "OrderBy_ForumId" -> do
          return OrderBy_ForumId

        "OrderBy_BoardId" -> do
          return OrderBy_BoardId

        "OrderBy_ThreadId" -> do
          return OrderBy_ThreadId

        "OrderBy_Id" -> do
          return OrderBy_Id

        "OrderBy_None" -> do
          return OrderBy_None



data Permission
  = Perm_Create 
  | Perm_Read 
  | Perm_Update 
  | Perm_Delete 
  | Perm_Execute 



instance permissionEncodeJson :: EncodeJson Permission where
  encodeJson (Perm_Create ) =
       "tag" := "Perm_Create"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Perm_Read ) =
       "tag" := "Perm_Read"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Perm_Update ) =
       "tag" := "Perm_Update"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Perm_Delete ) =
       "tag" := "Perm_Delete"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Perm_Execute ) =
       "tag" := "Perm_Execute"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject


instance permissionDecodeJson :: DecodeJson Permission where
  decodeJson json = do
    obj <- decodeJson json
    tag <- obj .? "tag"
    case tag of
        "Perm_Create" -> do
          return Perm_Create

        "Perm_Read" -> do
          return Perm_Read

        "Perm_Update" -> do
          return Perm_Update

        "Perm_Delete" -> do
          return Perm_Delete

        "Perm_Execute" -> do
          return Perm_Execute

  decodeJson x = fail $ "Could not parse object: " ++ show x


instance permissionRequestable :: Requestable Permission where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance permissionRespondable :: Respondable Permission where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    tag <- readProp "tag" json
    case tag of
        "Perm_Create" -> do
          return Perm_Create

        "Perm_Read" -> do
          return Perm_Read

        "Perm_Update" -> do
          return Perm_Update

        "Perm_Delete" -> do
          return Perm_Delete

        "Perm_Execute" -> do
          return Perm_Execute



instance permissionIsForeign :: IsForeign Permission where
  read json = do
    tag <- readProp "tag" json
    case tag of
        "Perm_Create" -> do
          return Perm_Create

        "Perm_Read" -> do
          return Perm_Read

        "Perm_Update" -> do
          return Perm_Update

        "Perm_Delete" -> do
          return Perm_Delete

        "Perm_Execute" -> do
          return Perm_Execute



instance permissionShow :: Show Permission where
  show (Perm_Create) = "Perm_Create"
  show (Perm_Read) = "Perm_Read"
  show (Perm_Update) = "Perm_Update"
  show (Perm_Delete) = "Perm_Delete"
  show (Perm_Execute) = "Perm_Execute"


instance permissionEq :: Eq Permission where
  eq (Perm_Create) (Perm_Create) = true
  eq (Perm_Read) (Perm_Read) = true
  eq (Perm_Update) (Perm_Update) = true
  eq (Perm_Delete) (Perm_Delete) = true
  eq (Perm_Execute) (Perm_Execute) = true
  eq _ _ = false

type Permissions  = (Array Permission)


newtype PmRequest = PmRequest {
  subject :: String,
  body :: String,
  guard :: Int
}


type PmRequestR = {
  subject :: String,
  body :: String,
  guard :: Int
}


_PmRequest :: LensP PmRequest {
  subject :: String,
  body :: String,
  guard :: Int
}
_PmRequest f (PmRequest o) = PmRequest <$> f o


mkPmRequest :: String -> String -> Int -> PmRequest
mkPmRequest subject body guard =
  PmRequest{subject, body, guard}


unwrapPmRequest (PmRequest r) = r

instance pmRequestEncodeJson :: EncodeJson PmRequest where
  encodeJson (PmRequest o) =
       "tag" := "PmRequest"
    ~> "subject" := o.subject
    ~> "body" := o.body
    ~> "guard" := o.guard
    ~> jsonEmptyObject


instance pmRequestDecodeJson :: DecodeJson PmRequest where
  decodeJson o = do
    obj <- decodeJson o
    subject <- obj .? "subject"
    body <- obj .? "body"
    guard <- obj .? "guard"
    pure $ PmRequest {
      subject,
      body,
      guard
    }


instance pmRequestRequestable :: Requestable PmRequest where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance pmRequestRespondable :: Respondable PmRequest where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkPmRequest
      <$> readProp "subject" json
      <*> readProp "body" json
      <*> readProp "guard" json


instance pmRequestIsForeign :: IsForeign PmRequest where
  read json =
      mkPmRequest
      <$> readProp "subject" json
      <*> readProp "body" json
      <*> readProp "guard" json


instance pmRequestShow :: Show PmRequest where
    show (PmRequest o) = show "subject: " ++ show o.subject ++ ", " ++ show "body: " ++ show o.body ++ ", " ++ show "guard: " ++ show o.guard

newtype PmResponse = PmResponse {
  id :: Int,
  userId :: Int,
  toUserId :: Int,
  subject :: String,
  body :: String,
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


type PmResponseR = {
  id :: Int,
  userId :: Int,
  toUserId :: Int,
  subject :: String,
  body :: String,
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


_PmResponse :: LensP PmResponse {
  id :: Int,
  userId :: Int,
  toUserId :: Int,
  subject :: String,
  body :: String,
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}
_PmResponse f (PmResponse o) = PmResponse <$> f o


mkPmResponse :: Int -> Int -> Int -> String -> String -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> PmResponse
mkPmResponse id userId toUserId subject body active guard createdAt modifiedAt activityAt =
  PmResponse{id, userId, toUserId, subject, body, active, guard, createdAt, modifiedAt, activityAt}


unwrapPmResponse (PmResponse r) = r

instance pmResponseEncodeJson :: EncodeJson PmResponse where
  encodeJson (PmResponse o) =
       "tag" := "PmResponse"
    ~> "id" := o.id
    ~> "user_id" := o.userId
    ~> "to_user_id" := o.toUserId
    ~> "subject" := o.subject
    ~> "body" := o.body
    ~> "active" := o.active
    ~> "guard" := o.guard
    ~> "created_at" := o.createdAt
    ~> "modified_at" := o.modifiedAt
    ~> "activity_at" := o.activityAt
    ~> jsonEmptyObject


instance pmResponseDecodeJson :: DecodeJson PmResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    userId <- obj .? "user_id"
    toUserId <- obj .? "to_user_id"
    subject <- obj .? "subject"
    body <- obj .? "body"
    active <- obj .? "active"
    guard <- obj .? "guard"
    createdAt <- obj .? "created_at"
    modifiedAt <- obj .? "modified_at"
    activityAt <- obj .? "activity_at"
    pure $ PmResponse {
      id,
      userId,
      toUserId,
      subject,
      body,
      active,
      guard,
      createdAt,
      modifiedAt,
      activityAt
    }


instance pmResponseRequestable :: Requestable PmResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance pmResponseRespondable :: Respondable PmResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkPmResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "to_user_id" json
      <*> readProp "subject" json
      <*> readProp "body" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance pmResponseIsForeign :: IsForeign PmResponse where
  read json =
      mkPmResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "to_user_id" json
      <*> readProp "subject" json
      <*> readProp "body" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance pmResponseShow :: Show PmResponse where
    show (PmResponse o) = show "id: " ++ show o.id ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "toUserId: " ++ show o.toUserId ++ ", " ++ show "subject: " ++ show o.subject ++ ", " ++ show "body: " ++ show o.body ++ ", " ++ show "active: " ++ show o.active ++ ", " ++ show "guard: " ++ show o.guard ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt ++ ", " ++ show "activityAt: " ++ show o.activityAt

newtype PmResponses = PmResponses {
  pmResponses :: (Array PmResponse)
}


type PmResponsesR = {
  pmResponses :: (Array PmResponse)
}


_PmResponses :: LensP PmResponses {
  pmResponses :: (Array PmResponse)
}
_PmResponses f (PmResponses o) = PmResponses <$> f o


mkPmResponses :: (Array PmResponse) -> PmResponses
mkPmResponses pmResponses =
  PmResponses{pmResponses}


unwrapPmResponses (PmResponses r) = r

instance pmResponsesEncodeJson :: EncodeJson PmResponses where
  encodeJson (PmResponses o) =
       "tag" := "PmResponses"
    ~> "pm_responses" := o.pmResponses
    ~> jsonEmptyObject


instance pmResponsesDecodeJson :: DecodeJson PmResponses where
  decodeJson o = do
    obj <- decodeJson o
    pmResponses <- obj .? "pm_responses"
    pure $ PmResponses {
      pmResponses
    }


instance pmResponsesRequestable :: Requestable PmResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance pmResponsesRespondable :: Respondable PmResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkPmResponses
      <$> readProp "pm_responses" json


instance pmResponsesIsForeign :: IsForeign PmResponses where
  read json =
      mkPmResponses
      <$> readProp "pm_responses" json


instance pmResponsesShow :: Show PmResponses where
    show (PmResponses o) = show "pmResponses: " ++ show o.pmResponses

newtype PmInRequest = PmInRequest {
  label :: (Maybe String),
  isRead :: Boolean,
  isStarred :: Boolean,
  guard :: Int
}


type PmInRequestR = {
  label :: (Maybe String),
  isRead :: Boolean,
  isStarred :: Boolean,
  guard :: Int
}


_PmInRequest :: LensP PmInRequest {
  label :: (Maybe String),
  isRead :: Boolean,
  isStarred :: Boolean,
  guard :: Int
}
_PmInRequest f (PmInRequest o) = PmInRequest <$> f o


mkPmInRequest :: (Maybe String) -> Boolean -> Boolean -> Int -> PmInRequest
mkPmInRequest label isRead isStarred guard =
  PmInRequest{label, isRead, isStarred, guard}


unwrapPmInRequest (PmInRequest r) = r

instance pmInRequestEncodeJson :: EncodeJson PmInRequest where
  encodeJson (PmInRequest o) =
       "tag" := "PmInRequest"
    ~> "label" := o.label
    ~> "is_read" := o.isRead
    ~> "is_starred" := o.isStarred
    ~> "guard" := o.guard
    ~> jsonEmptyObject


instance pmInRequestDecodeJson :: DecodeJson PmInRequest where
  decodeJson o = do
    obj <- decodeJson o
    label <- obj .? "label"
    isRead <- obj .? "is_read"
    isStarred <- obj .? "is_starred"
    guard <- obj .? "guard"
    pure $ PmInRequest {
      label,
      isRead,
      isStarred,
      guard
    }


instance pmInRequestRequestable :: Requestable PmInRequest where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance pmInRequestRespondable :: Respondable PmInRequest where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkPmInRequest
      <$> (runNullOrUndefined <$> readProp "label" json)
      <*> readProp "is_read" json
      <*> readProp "is_starred" json
      <*> readProp "guard" json


instance pmInRequestIsForeign :: IsForeign PmInRequest where
  read json =
      mkPmInRequest
      <$> (runNullOrUndefined <$> readProp "label" json)
      <*> readProp "is_read" json
      <*> readProp "is_starred" json
      <*> readProp "guard" json


instance pmInRequestShow :: Show PmInRequest where
    show (PmInRequest o) = show "label: " ++ show o.label ++ ", " ++ show "isRead: " ++ show o.isRead ++ ", " ++ show "isStarred: " ++ show o.isStarred ++ ", " ++ show "guard: " ++ show o.guard

newtype PmInResponse = PmInResponse {
  id :: Int,
  pmId :: Int,
  userId :: Int,
  label :: (Maybe String),
  isRead :: Boolean,
  isStarred :: Boolean,
  isNew :: Boolean,
  isSaved :: Boolean,
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}


type PmInResponseR = {
  id :: Int,
  pmId :: Int,
  userId :: Int,
  label :: (Maybe String),
  isRead :: Boolean,
  isStarred :: Boolean,
  isNew :: Boolean,
  isSaved :: Boolean,
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}


_PmInResponse :: LensP PmInResponse {
  id :: Int,
  pmId :: Int,
  userId :: Int,
  label :: (Maybe String),
  isRead :: Boolean,
  isStarred :: Boolean,
  isNew :: Boolean,
  isSaved :: Boolean,
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}
_PmInResponse f (PmInResponse o) = PmInResponse <$> f o


mkPmInResponse :: Int -> Int -> Int -> (Maybe String) -> Boolean -> Boolean -> Boolean -> Boolean -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> PmInResponse
mkPmInResponse id pmId userId label isRead isStarred isNew isSaved active guard createdAt modifiedAt =
  PmInResponse{id, pmId, userId, label, isRead, isStarred, isNew, isSaved, active, guard, createdAt, modifiedAt}


unwrapPmInResponse (PmInResponse r) = r

instance pmInResponseEncodeJson :: EncodeJson PmInResponse where
  encodeJson (PmInResponse o) =
       "tag" := "PmInResponse"
    ~> "id" := o.id
    ~> "pm_id" := o.pmId
    ~> "user_id" := o.userId
    ~> "label" := o.label
    ~> "is_read" := o.isRead
    ~> "is_starred" := o.isStarred
    ~> "is_new" := o.isNew
    ~> "is_saved" := o.isSaved
    ~> "active" := o.active
    ~> "guard" := o.guard
    ~> "created_at" := o.createdAt
    ~> "modified_at" := o.modifiedAt
    ~> jsonEmptyObject


instance pmInResponseDecodeJson :: DecodeJson PmInResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    pmId <- obj .? "pm_id"
    userId <- obj .? "user_id"
    label <- obj .? "label"
    isRead <- obj .? "is_read"
    isStarred <- obj .? "is_starred"
    isNew <- obj .? "is_new"
    isSaved <- obj .? "is_saved"
    active <- obj .? "active"
    guard <- obj .? "guard"
    createdAt <- obj .? "created_at"
    modifiedAt <- obj .? "modified_at"
    pure $ PmInResponse {
      id,
      pmId,
      userId,
      label,
      isRead,
      isStarred,
      isNew,
      isSaved,
      active,
      guard,
      createdAt,
      modifiedAt
    }


instance pmInResponseRequestable :: Requestable PmInResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance pmInResponseRespondable :: Respondable PmInResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkPmInResponse
      <$> readProp "id" json
      <*> readProp "pm_id" json
      <*> readProp "user_id" json
      <*> (runNullOrUndefined <$> readProp "label" json)
      <*> readProp "is_read" json
      <*> readProp "is_starred" json
      <*> readProp "is_new" json
      <*> readProp "is_saved" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance pmInResponseIsForeign :: IsForeign PmInResponse where
  read json =
      mkPmInResponse
      <$> readProp "id" json
      <*> readProp "pm_id" json
      <*> readProp "user_id" json
      <*> (runNullOrUndefined <$> readProp "label" json)
      <*> readProp "is_read" json
      <*> readProp "is_starred" json
      <*> readProp "is_new" json
      <*> readProp "is_saved" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance pmInResponseShow :: Show PmInResponse where
    show (PmInResponse o) = show "id: " ++ show o.id ++ ", " ++ show "pmId: " ++ show o.pmId ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "label: " ++ show o.label ++ ", " ++ show "isRead: " ++ show o.isRead ++ ", " ++ show "isStarred: " ++ show o.isStarred ++ ", " ++ show "isNew: " ++ show o.isNew ++ ", " ++ show "isSaved: " ++ show o.isSaved ++ ", " ++ show "active: " ++ show o.active ++ ", " ++ show "guard: " ++ show o.guard ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt

newtype PmInResponses = PmInResponses {
  pmInResponses :: (Array PmInResponse)
}


type PmInResponsesR = {
  pmInResponses :: (Array PmInResponse)
}


_PmInResponses :: LensP PmInResponses {
  pmInResponses :: (Array PmInResponse)
}
_PmInResponses f (PmInResponses o) = PmInResponses <$> f o


mkPmInResponses :: (Array PmInResponse) -> PmInResponses
mkPmInResponses pmInResponses =
  PmInResponses{pmInResponses}


unwrapPmInResponses (PmInResponses r) = r

instance pmInResponsesEncodeJson :: EncodeJson PmInResponses where
  encodeJson (PmInResponses o) =
       "tag" := "PmInResponses"
    ~> "pm_in_responses" := o.pmInResponses
    ~> jsonEmptyObject


instance pmInResponsesDecodeJson :: DecodeJson PmInResponses where
  decodeJson o = do
    obj <- decodeJson o
    pmInResponses <- obj .? "pm_in_responses"
    pure $ PmInResponses {
      pmInResponses
    }


instance pmInResponsesRequestable :: Requestable PmInResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance pmInResponsesRespondable :: Respondable PmInResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkPmInResponses
      <$> readProp "pm_in_responses" json


instance pmInResponsesIsForeign :: IsForeign PmInResponses where
  read json =
      mkPmInResponses
      <$> readProp "pm_in_responses" json


instance pmInResponsesShow :: Show PmInResponses where
    show (PmInResponses o) = show "pmInResponses: " ++ show o.pmInResponses

newtype PmOutRequest = PmOutRequest {
  label :: (Maybe String),
  guard :: Int
}


type PmOutRequestR = {
  label :: (Maybe String),
  guard :: Int
}


_PmOutRequest :: LensP PmOutRequest {
  label :: (Maybe String),
  guard :: Int
}
_PmOutRequest f (PmOutRequest o) = PmOutRequest <$> f o


mkPmOutRequest :: (Maybe String) -> Int -> PmOutRequest
mkPmOutRequest label guard =
  PmOutRequest{label, guard}


unwrapPmOutRequest (PmOutRequest r) = r

instance pmOutRequestEncodeJson :: EncodeJson PmOutRequest where
  encodeJson (PmOutRequest o) =
       "tag" := "PmOutRequest"
    ~> "label" := o.label
    ~> "guard" := o.guard
    ~> jsonEmptyObject


instance pmOutRequestDecodeJson :: DecodeJson PmOutRequest where
  decodeJson o = do
    obj <- decodeJson o
    label <- obj .? "label"
    guard <- obj .? "guard"
    pure $ PmOutRequest {
      label,
      guard
    }


instance pmOutRequestRequestable :: Requestable PmOutRequest where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance pmOutRequestRespondable :: Respondable PmOutRequest where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkPmOutRequest
      <$> (runNullOrUndefined <$> readProp "label" json)
      <*> readProp "guard" json


instance pmOutRequestIsForeign :: IsForeign PmOutRequest where
  read json =
      mkPmOutRequest
      <$> (runNullOrUndefined <$> readProp "label" json)
      <*> readProp "guard" json


instance pmOutRequestShow :: Show PmOutRequest where
    show (PmOutRequest o) = show "label: " ++ show o.label ++ ", " ++ show "guard: " ++ show o.guard

newtype PmOutResponse = PmOutResponse {
  id :: Int,
  pmId :: Int,
  userId :: Int,
  label :: (Maybe String),
  isSaved :: Boolean,
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}


type PmOutResponseR = {
  id :: Int,
  pmId :: Int,
  userId :: Int,
  label :: (Maybe String),
  isSaved :: Boolean,
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}


_PmOutResponse :: LensP PmOutResponse {
  id :: Int,
  pmId :: Int,
  userId :: Int,
  label :: (Maybe String),
  isSaved :: Boolean,
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}
_PmOutResponse f (PmOutResponse o) = PmOutResponse <$> f o


mkPmOutResponse :: Int -> Int -> Int -> (Maybe String) -> Boolean -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> PmOutResponse
mkPmOutResponse id pmId userId label isSaved active guard createdAt modifiedAt =
  PmOutResponse{id, pmId, userId, label, isSaved, active, guard, createdAt, modifiedAt}


unwrapPmOutResponse (PmOutResponse r) = r

instance pmOutResponseEncodeJson :: EncodeJson PmOutResponse where
  encodeJson (PmOutResponse o) =
       "tag" := "PmOutResponse"
    ~> "id" := o.id
    ~> "pm_id" := o.pmId
    ~> "user_id" := o.userId
    ~> "label" := o.label
    ~> "is_saved" := o.isSaved
    ~> "active" := o.active
    ~> "guard" := o.guard
    ~> "created_at" := o.createdAt
    ~> "modified_at" := o.modifiedAt
    ~> jsonEmptyObject


instance pmOutResponseDecodeJson :: DecodeJson PmOutResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    pmId <- obj .? "pm_id"
    userId <- obj .? "user_id"
    label <- obj .? "label"
    isSaved <- obj .? "is_saved"
    active <- obj .? "active"
    guard <- obj .? "guard"
    createdAt <- obj .? "created_at"
    modifiedAt <- obj .? "modified_at"
    pure $ PmOutResponse {
      id,
      pmId,
      userId,
      label,
      isSaved,
      active,
      guard,
      createdAt,
      modifiedAt
    }


instance pmOutResponseRequestable :: Requestable PmOutResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance pmOutResponseRespondable :: Respondable PmOutResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkPmOutResponse
      <$> readProp "id" json
      <*> readProp "pm_id" json
      <*> readProp "user_id" json
      <*> (runNullOrUndefined <$> readProp "label" json)
      <*> readProp "is_saved" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance pmOutResponseIsForeign :: IsForeign PmOutResponse where
  read json =
      mkPmOutResponse
      <$> readProp "id" json
      <*> readProp "pm_id" json
      <*> readProp "user_id" json
      <*> (runNullOrUndefined <$> readProp "label" json)
      <*> readProp "is_saved" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance pmOutResponseShow :: Show PmOutResponse where
    show (PmOutResponse o) = show "id: " ++ show o.id ++ ", " ++ show "pmId: " ++ show o.pmId ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "label: " ++ show o.label ++ ", " ++ show "isSaved: " ++ show o.isSaved ++ ", " ++ show "active: " ++ show o.active ++ ", " ++ show "guard: " ++ show o.guard ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt

newtype PmOutResponses = PmOutResponses {
  pmOutResponses :: (Array PmOutResponse)
}


type PmOutResponsesR = {
  pmOutResponses :: (Array PmOutResponse)
}


_PmOutResponses :: LensP PmOutResponses {
  pmOutResponses :: (Array PmOutResponse)
}
_PmOutResponses f (PmOutResponses o) = PmOutResponses <$> f o


mkPmOutResponses :: (Array PmOutResponse) -> PmOutResponses
mkPmOutResponses pmOutResponses =
  PmOutResponses{pmOutResponses}


unwrapPmOutResponses (PmOutResponses r) = r

instance pmOutResponsesEncodeJson :: EncodeJson PmOutResponses where
  encodeJson (PmOutResponses o) =
       "tag" := "PmOutResponses"
    ~> "pm_out_responses" := o.pmOutResponses
    ~> jsonEmptyObject


instance pmOutResponsesDecodeJson :: DecodeJson PmOutResponses where
  decodeJson o = do
    obj <- decodeJson o
    pmOutResponses <- obj .? "pm_out_responses"
    pure $ PmOutResponses {
      pmOutResponses
    }


instance pmOutResponsesRequestable :: Requestable PmOutResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance pmOutResponsesRespondable :: Respondable PmOutResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkPmOutResponses
      <$> readProp "pm_out_responses" json


instance pmOutResponsesIsForeign :: IsForeign PmOutResponses where
  read json =
      mkPmOutResponses
      <$> readProp "pm_out_responses" json


instance pmOutResponsesShow :: Show PmOutResponses where
    show (PmOutResponses o) = show "pmOutResponses: " ++ show o.pmOutResponses

newtype ProfileX = ProfileX {
  profileLogin :: String,
  profileName :: String,
  profileEmail :: String
}


type ProfileXR = {
  profileLogin :: String,
  profileName :: String,
  profileEmail :: String
}


_ProfileX :: LensP ProfileX {
  profileLogin :: String,
  profileName :: String,
  profileEmail :: String
}
_ProfileX f (ProfileX o) = ProfileX <$> f o


mkProfileX :: String -> String -> String -> ProfileX
mkProfileX profileLogin profileName profileEmail =
  ProfileX{profileLogin, profileName, profileEmail}


unwrapProfileX (ProfileX r) = r

instance profileXEncodeJson :: EncodeJson ProfileX where
  encodeJson (ProfileX o) =
       "tag" := "ProfileX"
    ~> "profile_login" := o.profileLogin
    ~> "profile_name" := o.profileName
    ~> "profile_email" := o.profileEmail
    ~> jsonEmptyObject


instance profileXDecodeJson :: DecodeJson ProfileX where
  decodeJson o = do
    obj <- decodeJson o
    profileLogin <- obj .? "profile_login"
    profileName <- obj .? "profile_name"
    profileEmail <- obj .? "profile_email"
    pure $ ProfileX {
      profileLogin,
      profileName,
      profileEmail
    }


instance profileXRequestable :: Requestable ProfileX where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance profileXRespondable :: Respondable ProfileX where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkProfileX
      <$> readProp "profile_login" json
      <*> readProp "profile_name" json
      <*> readProp "profile_email" json


instance profileXIsForeign :: IsForeign ProfileX where
  read json =
      mkProfileX
      <$> readProp "profile_login" json
      <*> readProp "profile_name" json
      <*> readProp "profile_email" json


instance profileXShow :: Show ProfileX where
    show (ProfileX o) = show "profileLogin: " ++ show o.profileLogin ++ ", " ++ show "profileName: " ++ show o.profileName ++ ", " ++ show "profileEmail: " ++ show o.profileEmail

data ProfileGender
  = GenderMale 
  | GenderFemale 
  | GenderUnknown 



instance profileGenderEncodeJson :: EncodeJson ProfileGender where
  encodeJson (GenderMale ) =
       "tag" := "GenderMale"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (GenderFemale ) =
       "tag" := "GenderFemale"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (GenderUnknown ) =
       "tag" := "GenderUnknown"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject


instance profileGenderDecodeJson :: DecodeJson ProfileGender where
  decodeJson json = do
    obj <- decodeJson json
    tag <- obj .? "tag"
    case tag of
        "GenderMale" -> do
          return GenderMale

        "GenderFemale" -> do
          return GenderFemale

        "GenderUnknown" -> do
          return GenderUnknown

  decodeJson x = fail $ "Could not parse object: " ++ show x


instance profileGenderRequestable :: Requestable ProfileGender where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance profileGenderRespondable :: Respondable ProfileGender where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    tag <- readProp "tag" json
    case tag of
        "GenderMale" -> do
          return GenderMale

        "GenderFemale" -> do
          return GenderFemale

        "GenderUnknown" -> do
          return GenderUnknown



instance profileGenderIsForeign :: IsForeign ProfileGender where
  read json = do
    tag <- readProp "tag" json
    case tag of
        "GenderMale" -> do
          return GenderMale

        "GenderFemale" -> do
          return GenderFemale

        "GenderUnknown" -> do
          return GenderUnknown



instance profileGenderShow :: Show ProfileGender where
  show (GenderMale) = "GenderMale"
  show (GenderFemale) = "GenderFemale"
  show (GenderUnknown) = "GenderUnknown"


instance profileGenderEq :: Eq ProfileGender where
  eq (GenderMale) (GenderMale) = true
  eq (GenderFemale) (GenderFemale) = true
  eq (GenderUnknown) (GenderUnknown) = true
  eq _ _ = false

newtype ProfileRequest = ProfileRequest {
  gender :: ProfileGender,
  birthdate :: Date,
  website :: (Maybe String),
  location :: (Maybe String),
  signature :: (Maybe String),
  guard :: Int
}


type ProfileRequestR = {
  gender :: ProfileGender,
  birthdate :: Date,
  website :: (Maybe String),
  location :: (Maybe String),
  signature :: (Maybe String),
  guard :: Int
}


_ProfileRequest :: LensP ProfileRequest {
  gender :: ProfileGender,
  birthdate :: Date,
  website :: (Maybe String),
  location :: (Maybe String),
  signature :: (Maybe String),
  guard :: Int
}
_ProfileRequest f (ProfileRequest o) = ProfileRequest <$> f o


mkProfileRequest :: ProfileGender -> Date -> (Maybe String) -> (Maybe String) -> (Maybe String) -> Int -> ProfileRequest
mkProfileRequest gender birthdate website location signature guard =
  ProfileRequest{gender, birthdate, website, location, signature, guard}


unwrapProfileRequest (ProfileRequest r) = r

instance profileRequestEncodeJson :: EncodeJson ProfileRequest where
  encodeJson (ProfileRequest o) =
       "tag" := "ProfileRequest"
    ~> "gender" := o.gender
    ~> "birthdate" := o.birthdate
    ~> "website" := o.website
    ~> "location" := o.location
    ~> "signature" := o.signature
    ~> "guard" := o.guard
    ~> jsonEmptyObject


instance profileRequestDecodeJson :: DecodeJson ProfileRequest where
  decodeJson o = do
    obj <- decodeJson o
    gender <- obj .? "gender"
    birthdate <- obj .? "birthdate"
    website <- obj .? "website"
    location <- obj .? "location"
    signature <- obj .? "signature"
    guard <- obj .? "guard"
    pure $ ProfileRequest {
      gender,
      birthdate,
      website,
      location,
      signature,
      guard
    }


instance profileRequestRequestable :: Requestable ProfileRequest where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance profileRequestRespondable :: Respondable ProfileRequest where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkProfileRequest
      <$> readProp "gender" json
      <*> readProp "birthdate" json
      <*> (runNullOrUndefined <$> readProp "website" json)
      <*> (runNullOrUndefined <$> readProp "location" json)
      <*> (runNullOrUndefined <$> readProp "signature" json)
      <*> readProp "guard" json


instance profileRequestIsForeign :: IsForeign ProfileRequest where
  read json =
      mkProfileRequest
      <$> readProp "gender" json
      <*> readProp "birthdate" json
      <*> (runNullOrUndefined <$> readProp "website" json)
      <*> (runNullOrUndefined <$> readProp "location" json)
      <*> (runNullOrUndefined <$> readProp "signature" json)
      <*> readProp "guard" json


instance profileRequestShow :: Show ProfileRequest where
    show (ProfileRequest o) = show "gender: " ++ show o.gender ++ ", " ++ show "birthdate: " ++ show o.birthdate ++ ", " ++ show "website: " ++ show o.website ++ ", " ++ show "location: " ++ show o.location ++ ", " ++ show "signature: " ++ show o.signature ++ ", " ++ show "guard: " ++ show o.guard

newtype ProfileResponse = ProfileResponse {
  id :: Int,
  ent :: Ent,
  entId :: Int,
  gender :: ProfileGender,
  birthdate :: Date,
  website :: (Maybe String),
  location :: (Maybe String),
  signature :: (Maybe String),
  karmaGood :: Int,
  karmaBad :: Int,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}


type ProfileResponseR = {
  id :: Int,
  ent :: Ent,
  entId :: Int,
  gender :: ProfileGender,
  birthdate :: Date,
  website :: (Maybe String),
  location :: (Maybe String),
  signature :: (Maybe String),
  karmaGood :: Int,
  karmaBad :: Int,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}


_ProfileResponse :: LensP ProfileResponse {
  id :: Int,
  ent :: Ent,
  entId :: Int,
  gender :: ProfileGender,
  birthdate :: Date,
  website :: (Maybe String),
  location :: (Maybe String),
  signature :: (Maybe String),
  karmaGood :: Int,
  karmaBad :: Int,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}
_ProfileResponse f (ProfileResponse o) = ProfileResponse <$> f o


mkProfileResponse :: Int -> Ent -> Int -> ProfileGender -> Date -> (Maybe String) -> (Maybe String) -> (Maybe String) -> Int -> Int -> Int -> (Maybe Date) -> (Maybe Date) -> ProfileResponse
mkProfileResponse id ent entId gender birthdate website location signature karmaGood karmaBad guard createdAt modifiedAt =
  ProfileResponse{id, ent, entId, gender, birthdate, website, location, signature, karmaGood, karmaBad, guard, createdAt, modifiedAt}


unwrapProfileResponse (ProfileResponse r) = r

instance profileResponseEncodeJson :: EncodeJson ProfileResponse where
  encodeJson (ProfileResponse o) =
       "tag" := "ProfileResponse"
    ~> "id" := o.id
    ~> "ent" := o.ent
    ~> "ent_id" := o.entId
    ~> "gender" := o.gender
    ~> "birthdate" := o.birthdate
    ~> "website" := o.website
    ~> "location" := o.location
    ~> "signature" := o.signature
    ~> "karma_good" := o.karmaGood
    ~> "karma_bad" := o.karmaBad
    ~> "guard" := o.guard
    ~> "created_at" := o.createdAt
    ~> "modified_at" := o.modifiedAt
    ~> jsonEmptyObject


instance profileResponseDecodeJson :: DecodeJson ProfileResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    ent <- obj .? "ent"
    entId <- obj .? "ent_id"
    gender <- obj .? "gender"
    birthdate <- obj .? "birthdate"
    website <- obj .? "website"
    location <- obj .? "location"
    signature <- obj .? "signature"
    karmaGood <- obj .? "karma_good"
    karmaBad <- obj .? "karma_bad"
    guard <- obj .? "guard"
    createdAt <- obj .? "created_at"
    modifiedAt <- obj .? "modified_at"
    pure $ ProfileResponse {
      id,
      ent,
      entId,
      gender,
      birthdate,
      website,
      location,
      signature,
      karmaGood,
      karmaBad,
      guard,
      createdAt,
      modifiedAt
    }


instance profileResponseRequestable :: Requestable ProfileResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance profileResponseRespondable :: Respondable ProfileResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkProfileResponse
      <$> readProp "id" json
      <*> readProp "ent" json
      <*> readProp "ent_id" json
      <*> readProp "gender" json
      <*> readProp "birthdate" json
      <*> (runNullOrUndefined <$> readProp "website" json)
      <*> (runNullOrUndefined <$> readProp "location" json)
      <*> (runNullOrUndefined <$> readProp "signature" json)
      <*> readProp "karma_good" json
      <*> readProp "karma_bad" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance profileResponseIsForeign :: IsForeign ProfileResponse where
  read json =
      mkProfileResponse
      <$> readProp "id" json
      <*> readProp "ent" json
      <*> readProp "ent_id" json
      <*> readProp "gender" json
      <*> readProp "birthdate" json
      <*> (runNullOrUndefined <$> readProp "website" json)
      <*> (runNullOrUndefined <$> readProp "location" json)
      <*> (runNullOrUndefined <$> readProp "signature" json)
      <*> readProp "karma_good" json
      <*> readProp "karma_bad" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance profileResponseShow :: Show ProfileResponse where
    show (ProfileResponse o) = show "id: " ++ show o.id ++ ", " ++ show "ent: " ++ show o.ent ++ ", " ++ show "entId: " ++ show o.entId ++ ", " ++ show "gender: " ++ show o.gender ++ ", " ++ show "birthdate: " ++ show o.birthdate ++ ", " ++ show "website: " ++ show o.website ++ ", " ++ show "location: " ++ show o.location ++ ", " ++ show "signature: " ++ show o.signature ++ ", " ++ show "karmaGood: " ++ show o.karmaGood ++ ", " ++ show "karmaBad: " ++ show o.karmaBad ++ ", " ++ show "guard: " ++ show o.guard ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt

newtype ProfileResponses = ProfileResponses {
  profileResponses :: (Array ProfileResponse)
}


type ProfileResponsesR = {
  profileResponses :: (Array ProfileResponse)
}


_ProfileResponses :: LensP ProfileResponses {
  profileResponses :: (Array ProfileResponse)
}
_ProfileResponses f (ProfileResponses o) = ProfileResponses <$> f o


mkProfileResponses :: (Array ProfileResponse) -> ProfileResponses
mkProfileResponses profileResponses =
  ProfileResponses{profileResponses}


unwrapProfileResponses (ProfileResponses r) = r

instance profileResponsesEncodeJson :: EncodeJson ProfileResponses where
  encodeJson (ProfileResponses o) =
       "tag" := "ProfileResponses"
    ~> "profile_responses" := o.profileResponses
    ~> jsonEmptyObject


instance profileResponsesDecodeJson :: DecodeJson ProfileResponses where
  decodeJson o = do
    obj <- decodeJson o
    profileResponses <- obj .? "profile_responses"
    pure $ ProfileResponses {
      profileResponses
    }


instance profileResponsesRequestable :: Requestable ProfileResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance profileResponsesRespondable :: Respondable ProfileResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkProfileResponses
      <$> readProp "profile_responses" json


instance profileResponsesIsForeign :: IsForeign ProfileResponses where
  read json =
      mkProfileResponses
      <$> readProp "profile_responses" json


instance profileResponsesShow :: Show ProfileResponses where
    show (ProfileResponses o) = show "profileResponses: " ++ show o.profileResponses

newtype ReminderRequest = ReminderRequest {
  dataP :: String,
  guard :: Int
}


type ReminderRequestR = {
  dataP :: String,
  guard :: Int
}


_ReminderRequest :: LensP ReminderRequest {
  dataP :: String,
  guard :: Int
}
_ReminderRequest f (ReminderRequest o) = ReminderRequest <$> f o


mkReminderRequest :: String -> Int -> ReminderRequest
mkReminderRequest dataP guard =
  ReminderRequest{dataP, guard}


unwrapReminderRequest (ReminderRequest r) = r

instance reminderRequestEncodeJson :: EncodeJson ReminderRequest where
  encodeJson (ReminderRequest o) =
       "tag" := "ReminderRequest"
    ~> "data" := o.dataP
    ~> "guard" := o.guard
    ~> jsonEmptyObject


instance reminderRequestDecodeJson :: DecodeJson ReminderRequest where
  decodeJson o = do
    obj <- decodeJson o
    dataP <- obj .? "data"
    guard <- obj .? "guard"
    pure $ ReminderRequest {
      dataP,
      guard
    }


instance reminderRequestRequestable :: Requestable ReminderRequest where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance reminderRequestRespondable :: Respondable ReminderRequest where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkReminderRequest
      <$> readProp "data" json
      <*> readProp "guard" json


instance reminderRequestIsForeign :: IsForeign ReminderRequest where
  read json =
      mkReminderRequest
      <$> readProp "data" json
      <*> readProp "guard" json


instance reminderRequestShow :: Show ReminderRequest where
    show (ReminderRequest o) = show "dataP: " ++ show o.dataP ++ ", " ++ show "guard: " ++ show o.guard

newtype ReminderResponse = ReminderResponse {
  id :: Int,
  userId :: Int,
  parentFolderId :: Int,
  dataP :: String,
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


type ReminderResponseR = {
  id :: Int,
  userId :: Int,
  parentFolderId :: Int,
  dataP :: String,
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


_ReminderResponse :: LensP ReminderResponse {
  id :: Int,
  userId :: Int,
  parentFolderId :: Int,
  dataP :: String,
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}
_ReminderResponse f (ReminderResponse o) = ReminderResponse <$> f o


mkReminderResponse :: Int -> Int -> Int -> String -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> ReminderResponse
mkReminderResponse id userId parentFolderId dataP active guard createdAt modifiedAt activityAt =
  ReminderResponse{id, userId, parentFolderId, dataP, active, guard, createdAt, modifiedAt, activityAt}


unwrapReminderResponse (ReminderResponse r) = r

instance reminderResponseEncodeJson :: EncodeJson ReminderResponse where
  encodeJson (ReminderResponse o) =
       "tag" := "ReminderResponse"
    ~> "id" := o.id
    ~> "user_id" := o.userId
    ~> "parent_folder_id" := o.parentFolderId
    ~> "data" := o.dataP
    ~> "active" := o.active
    ~> "guard" := o.guard
    ~> "created_at" := o.createdAt
    ~> "modified_at" := o.modifiedAt
    ~> "activity_at" := o.activityAt
    ~> jsonEmptyObject


instance reminderResponseDecodeJson :: DecodeJson ReminderResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    userId <- obj .? "user_id"
    parentFolderId <- obj .? "parent_folder_id"
    dataP <- obj .? "data"
    active <- obj .? "active"
    guard <- obj .? "guard"
    createdAt <- obj .? "created_at"
    modifiedAt <- obj .? "modified_at"
    activityAt <- obj .? "activity_at"
    pure $ ReminderResponse {
      id,
      userId,
      parentFolderId,
      dataP,
      active,
      guard,
      createdAt,
      modifiedAt,
      activityAt
    }


instance reminderResponseRequestable :: Requestable ReminderResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance reminderResponseRespondable :: Respondable ReminderResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkReminderResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "parent_folder_id" json
      <*> readProp "data" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance reminderResponseIsForeign :: IsForeign ReminderResponse where
  read json =
      mkReminderResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "parent_folder_id" json
      <*> readProp "data" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance reminderResponseShow :: Show ReminderResponse where
    show (ReminderResponse o) = show "id: " ++ show o.id ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "parentFolderId: " ++ show o.parentFolderId ++ ", " ++ show "dataP: " ++ show o.dataP ++ ", " ++ show "active: " ++ show o.active ++ ", " ++ show "guard: " ++ show o.guard ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt ++ ", " ++ show "activityAt: " ++ show o.activityAt

newtype ReminderResponses = ReminderResponses {
  reminderResponses :: (Array ReminderResponse)
}


type ReminderResponsesR = {
  reminderResponses :: (Array ReminderResponse)
}


_ReminderResponses :: LensP ReminderResponses {
  reminderResponses :: (Array ReminderResponse)
}
_ReminderResponses f (ReminderResponses o) = ReminderResponses <$> f o


mkReminderResponses :: (Array ReminderResponse) -> ReminderResponses
mkReminderResponses reminderResponses =
  ReminderResponses{reminderResponses}


unwrapReminderResponses (ReminderResponses r) = r

instance reminderResponsesEncodeJson :: EncodeJson ReminderResponses where
  encodeJson (ReminderResponses o) =
       "tag" := "ReminderResponses"
    ~> "reminder_responses" := o.reminderResponses
    ~> jsonEmptyObject


instance reminderResponsesDecodeJson :: DecodeJson ReminderResponses where
  decodeJson o = do
    obj <- decodeJson o
    reminderResponses <- obj .? "reminder_responses"
    pure $ ReminderResponses {
      reminderResponses
    }


instance reminderResponsesRequestable :: Requestable ReminderResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance reminderResponsesRespondable :: Respondable ReminderResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkReminderResponses
      <$> readProp "reminder_responses" json


instance reminderResponsesIsForeign :: IsForeign ReminderResponses where
  read json =
      mkReminderResponses
      <$> readProp "reminder_responses" json


instance reminderResponsesShow :: Show ReminderResponses where
    show (ReminderResponses o) = show "reminderResponses: " ++ show o.reminderResponses

newtype ReminderFolderRequest = ReminderFolderRequest {
  displayName :: String,
  description :: (Maybe String),
  visibility :: Visibility,
  guard :: Int
}


type ReminderFolderRequestR = {
  displayName :: String,
  description :: (Maybe String),
  visibility :: Visibility,
  guard :: Int
}


_ReminderFolderRequest :: LensP ReminderFolderRequest {
  displayName :: String,
  description :: (Maybe String),
  visibility :: Visibility,
  guard :: Int
}
_ReminderFolderRequest f (ReminderFolderRequest o) = ReminderFolderRequest <$> f o


mkReminderFolderRequest :: String -> (Maybe String) -> Visibility -> Int -> ReminderFolderRequest
mkReminderFolderRequest displayName description visibility guard =
  ReminderFolderRequest{displayName, description, visibility, guard}


unwrapReminderFolderRequest (ReminderFolderRequest r) = r

instance reminderFolderRequestEncodeJson :: EncodeJson ReminderFolderRequest where
  encodeJson (ReminderFolderRequest o) =
       "tag" := "ReminderFolderRequest"
    ~> "display_name" := o.displayName
    ~> "description" := o.description
    ~> "visibility" := o.visibility
    ~> "guard" := o.guard
    ~> jsonEmptyObject


instance reminderFolderRequestDecodeJson :: DecodeJson ReminderFolderRequest where
  decodeJson o = do
    obj <- decodeJson o
    displayName <- obj .? "display_name"
    description <- obj .? "description"
    visibility <- obj .? "visibility"
    guard <- obj .? "guard"
    pure $ ReminderFolderRequest {
      displayName,
      description,
      visibility,
      guard
    }


instance reminderFolderRequestRequestable :: Requestable ReminderFolderRequest where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance reminderFolderRequestRespondable :: Respondable ReminderFolderRequest where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkReminderFolderRequest
      <$> readProp "display_name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "visibility" json
      <*> readProp "guard" json


instance reminderFolderRequestIsForeign :: IsForeign ReminderFolderRequest where
  read json =
      mkReminderFolderRequest
      <$> readProp "display_name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "visibility" json
      <*> readProp "guard" json


instance reminderFolderRequestShow :: Show ReminderFolderRequest where
    show (ReminderFolderRequest o) = show "displayName: " ++ show o.displayName ++ ", " ++ show "description: " ++ show o.description ++ ", " ++ show "visibility: " ++ show o.visibility ++ ", " ++ show "guard: " ++ show o.guard

newtype ReminderFolderResponse = ReminderFolderResponse {
  id :: Int,
  userId :: Int,
  parentFolderId :: (Maybe Int),
  name :: String,
  displayName :: String,
  visibility :: Visibility,
  description :: (Maybe String),
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


type ReminderFolderResponseR = {
  id :: Int,
  userId :: Int,
  parentFolderId :: (Maybe Int),
  name :: String,
  displayName :: String,
  visibility :: Visibility,
  description :: (Maybe String),
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


_ReminderFolderResponse :: LensP ReminderFolderResponse {
  id :: Int,
  userId :: Int,
  parentFolderId :: (Maybe Int),
  name :: String,
  displayName :: String,
  visibility :: Visibility,
  description :: (Maybe String),
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}
_ReminderFolderResponse f (ReminderFolderResponse o) = ReminderFolderResponse <$> f o


mkReminderFolderResponse :: Int -> Int -> (Maybe Int) -> String -> String -> Visibility -> (Maybe String) -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> ReminderFolderResponse
mkReminderFolderResponse id userId parentFolderId name displayName visibility description active guard createdAt modifiedAt activityAt =
  ReminderFolderResponse{id, userId, parentFolderId, name, displayName, visibility, description, active, guard, createdAt, modifiedAt, activityAt}


unwrapReminderFolderResponse (ReminderFolderResponse r) = r

instance reminderFolderResponseEncodeJson :: EncodeJson ReminderFolderResponse where
  encodeJson (ReminderFolderResponse o) =
       "tag" := "ReminderFolderResponse"
    ~> "id" := o.id
    ~> "user_id" := o.userId
    ~> "parent_folder_id" := o.parentFolderId
    ~> "name" := o.name
    ~> "display_name" := o.displayName
    ~> "visibility" := o.visibility
    ~> "description" := o.description
    ~> "active" := o.active
    ~> "guard" := o.guard
    ~> "created_at" := o.createdAt
    ~> "modified_at" := o.modifiedAt
    ~> "activity_at" := o.activityAt
    ~> jsonEmptyObject


instance reminderFolderResponseDecodeJson :: DecodeJson ReminderFolderResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    userId <- obj .? "user_id"
    parentFolderId <- obj .? "parent_folder_id"
    name <- obj .? "name"
    displayName <- obj .? "display_name"
    visibility <- obj .? "visibility"
    description <- obj .? "description"
    active <- obj .? "active"
    guard <- obj .? "guard"
    createdAt <- obj .? "created_at"
    modifiedAt <- obj .? "modified_at"
    activityAt <- obj .? "activity_at"
    pure $ ReminderFolderResponse {
      id,
      userId,
      parentFolderId,
      name,
      displayName,
      visibility,
      description,
      active,
      guard,
      createdAt,
      modifiedAt,
      activityAt
    }


instance reminderFolderResponseRequestable :: Requestable ReminderFolderResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance reminderFolderResponseRespondable :: Respondable ReminderFolderResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkReminderFolderResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> (runNullOrUndefined <$> readProp "parent_folder_id" json)
      <*> readProp "name" json
      <*> readProp "display_name" json
      <*> readProp "visibility" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance reminderFolderResponseIsForeign :: IsForeign ReminderFolderResponse where
  read json =
      mkReminderFolderResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> (runNullOrUndefined <$> readProp "parent_folder_id" json)
      <*> readProp "name" json
      <*> readProp "display_name" json
      <*> readProp "visibility" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance reminderFolderResponseShow :: Show ReminderFolderResponse where
    show (ReminderFolderResponse o) = show "id: " ++ show o.id ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "parentFolderId: " ++ show o.parentFolderId ++ ", " ++ show "name: " ++ show o.name ++ ", " ++ show "displayName: " ++ show o.displayName ++ ", " ++ show "visibility: " ++ show o.visibility ++ ", " ++ show "description: " ++ show o.description ++ ", " ++ show "active: " ++ show o.active ++ ", " ++ show "guard: " ++ show o.guard ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt ++ ", " ++ show "activityAt: " ++ show o.activityAt

newtype ReminderFolderResponses = ReminderFolderResponses {
  reminderFolderResponses :: (Array ReminderFolderResponse)
}


type ReminderFolderResponsesR = {
  reminderFolderResponses :: (Array ReminderFolderResponse)
}


_ReminderFolderResponses :: LensP ReminderFolderResponses {
  reminderFolderResponses :: (Array ReminderFolderResponse)
}
_ReminderFolderResponses f (ReminderFolderResponses o) = ReminderFolderResponses <$> f o


mkReminderFolderResponses :: (Array ReminderFolderResponse) -> ReminderFolderResponses
mkReminderFolderResponses reminderFolderResponses =
  ReminderFolderResponses{reminderFolderResponses}


unwrapReminderFolderResponses (ReminderFolderResponses r) = r

instance reminderFolderResponsesEncodeJson :: EncodeJson ReminderFolderResponses where
  encodeJson (ReminderFolderResponses o) =
       "tag" := "ReminderFolderResponses"
    ~> "reminder_folder_responses" := o.reminderFolderResponses
    ~> jsonEmptyObject


instance reminderFolderResponsesDecodeJson :: DecodeJson ReminderFolderResponses where
  decodeJson o = do
    obj <- decodeJson o
    reminderFolderResponses <- obj .? "reminder_folder_responses"
    pure $ ReminderFolderResponses {
      reminderFolderResponses
    }


instance reminderFolderResponsesRequestable :: Requestable ReminderFolderResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance reminderFolderResponsesRespondable :: Respondable ReminderFolderResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkReminderFolderResponses
      <$> readProp "reminder_folder_responses" json


instance reminderFolderResponsesIsForeign :: IsForeign ReminderFolderResponses where
  read json =
      mkReminderFolderResponses
      <$> readProp "reminder_folder_responses" json


instance reminderFolderResponsesShow :: Show ReminderFolderResponses where
    show (ReminderFolderResponses o) = show "reminderFolderResponses: " ++ show o.reminderFolderResponses

data ResourceType
  = ISBN13 String
  | ISBN10 String
  | ISBN String
  | URL String
  | SourceNone 



instance resourceTypeEncodeJson :: EncodeJson ResourceType where
  encodeJson (ISBN13 x0) =
       "tag" := "ISBN13"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ISBN10 x0) =
       "tag" := "ISBN10"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (ISBN x0) =
       "tag" := "ISBN"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (URL x0) =
       "tag" := "URL"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (SourceNone ) =
       "tag" := "SourceNone"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject


instance resourceTypeDecodeJson :: DecodeJson ResourceType where
  decodeJson json = do
    obj <- decodeJson json
    tag <- obj .? "tag"
    case tag of
        "ISBN13" -> do
          x0 <- obj .? "contents"
          ISBN13 <$> decodeJson x0

        "ISBN10" -> do
          x0 <- obj .? "contents"
          ISBN10 <$> decodeJson x0

        "ISBN" -> do
          x0 <- obj .? "contents"
          ISBN <$> decodeJson x0

        "URL" -> do
          x0 <- obj .? "contents"
          URL <$> decodeJson x0

        "SourceNone" -> do
          return SourceNone

  decodeJson x = fail $ "Could not parse object: " ++ show x


instance resourceTypeRequestable :: Requestable ResourceType where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance resourceTypeRespondable :: Respondable ResourceType where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    tag <- readProp "tag" json
    case tag of
        "ISBN13" -> do
          x0 <- readProp "contents" json
          ISBN13 <$> read x0

        "ISBN10" -> do
          x0 <- readProp "contents" json
          ISBN10 <$> read x0

        "ISBN" -> do
          x0 <- readProp "contents" json
          ISBN <$> read x0

        "URL" -> do
          x0 <- readProp "contents" json
          URL <$> read x0

        "SourceNone" -> do
          return SourceNone



instance resourceTypeIsForeign :: IsForeign ResourceType where
  read json = do
    tag <- readProp "tag" json
    case tag of
        "ISBN13" -> do
          x0 <- readProp "contents" json
          ISBN13 <$> read x0

        "ISBN10" -> do
          x0 <- readProp "contents" json
          ISBN10 <$> read x0

        "ISBN" -> do
          x0 <- readProp "contents" json
          ISBN <$> read x0

        "URL" -> do
          x0 <- readProp "contents" json
          URL <$> read x0

        "SourceNone" -> do
          return SourceNone



instance resourceTypeShow :: Show ResourceType where
  show (ISBN13 x0) = "ISBN13: " ++ show x0
  show (ISBN10 x0) = "ISBN10: " ++ show x0
  show (ISBN x0) = "ISBN: " ++ show x0
  show (URL x0) = "URL: " ++ show x0
  show (SourceNone) = "SourceNone"


data TyResourceType
  = TyISBN13 
  | TyISBN10 
  | TyISBN 
  | TyURL 
  | TySourceNone 



instance tyResourceTypeEncodeJson :: EncodeJson TyResourceType where
  encodeJson (TyISBN13 ) =
       "tag" := "TyISBN13"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (TyISBN10 ) =
       "tag" := "TyISBN10"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (TyISBN ) =
       "tag" := "TyISBN"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (TyURL ) =
       "tag" := "TyURL"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (TySourceNone ) =
       "tag" := "TySourceNone"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject


instance tyResourceTypeDecodeJson :: DecodeJson TyResourceType where
  decodeJson json = do
    obj <- decodeJson json
    tag <- obj .? "tag"
    case tag of
        "TyISBN13" -> do
          return TyISBN13

        "TyISBN10" -> do
          return TyISBN10

        "TyISBN" -> do
          return TyISBN

        "TyURL" -> do
          return TyURL

        "TySourceNone" -> do
          return TySourceNone

  decodeJson x = fail $ "Could not parse object: " ++ show x


instance tyResourceTypeRequestable :: Requestable TyResourceType where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance tyResourceTypeRespondable :: Respondable TyResourceType where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    tag <- readProp "tag" json
    case tag of
        "TyISBN13" -> do
          return TyISBN13

        "TyISBN10" -> do
          return TyISBN10

        "TyISBN" -> do
          return TyISBN

        "TyURL" -> do
          return TyURL

        "TySourceNone" -> do
          return TySourceNone



instance tyResourceTypeIsForeign :: IsForeign TyResourceType where
  read json = do
    tag <- readProp "tag" json
    case tag of
        "TyISBN13" -> do
          return TyISBN13

        "TyISBN10" -> do
          return TyISBN10

        "TyISBN" -> do
          return TyISBN

        "TyURL" -> do
          return TyURL

        "TySourceNone" -> do
          return TySourceNone



instance tyResourceTypeShow :: Show TyResourceType where
  show (TyISBN13) = "TyISBN13"
  show (TyISBN10) = "TyISBN10"
  show (TyISBN) = "TyISBN"
  show (TyURL) = "TyURL"
  show (TySourceNone) = "TySourceNone"


instance tyResourceTypeEq :: Eq TyResourceType where
  eq (TyISBN13) (TyISBN13) = true
  eq (TyISBN10) (TyISBN10) = true
  eq (TyISBN) (TyISBN) = true
  eq (TyURL) (TyURL) = true
  eq (TySourceNone) (TySourceNone) = true
  eq _ _ = false

newtype ResourceRequest = ResourceRequest {
  displayName :: String,
  description :: String,
  source :: ResourceType,
  author :: (Maybe (Array String)),
  prerequisites :: (DepList String),
  categories :: (DepList String),
  visibility :: Visibility,
  counter :: Int,
  version :: (Maybe String),
  urls :: (Maybe (Array String)),
  icon :: (Maybe String),
  tags :: (Array String),
  guard :: Int
}


type ResourceRequestR = {
  displayName :: String,
  description :: String,
  source :: ResourceType,
  author :: (Maybe (Array String)),
  prerequisites :: (DepList String),
  categories :: (DepList String),
  visibility :: Visibility,
  counter :: Int,
  version :: (Maybe String),
  urls :: (Maybe (Array String)),
  icon :: (Maybe String),
  tags :: (Array String),
  guard :: Int
}


_ResourceRequest :: LensP ResourceRequest {
  displayName :: String,
  description :: String,
  source :: ResourceType,
  author :: (Maybe (Array String)),
  prerequisites :: (DepList String),
  categories :: (DepList String),
  visibility :: Visibility,
  counter :: Int,
  version :: (Maybe String),
  urls :: (Maybe (Array String)),
  icon :: (Maybe String),
  tags :: (Array String),
  guard :: Int
}
_ResourceRequest f (ResourceRequest o) = ResourceRequest <$> f o


mkResourceRequest :: String -> String -> ResourceType -> (Maybe (Array String)) -> (DepList String) -> (DepList String) -> Visibility -> Int -> (Maybe String) -> (Maybe (Array String)) -> (Maybe String) -> (Array String) -> Int -> ResourceRequest
mkResourceRequest displayName description source author prerequisites categories visibility counter version urls icon tags guard =
  ResourceRequest{displayName, description, source, author, prerequisites, categories, visibility, counter, version, urls, icon, tags, guard}


unwrapResourceRequest (ResourceRequest r) = r

instance resourceRequestEncodeJson :: EncodeJson ResourceRequest where
  encodeJson (ResourceRequest o) =
       "tag" := "ResourceRequest"
    ~> "display_name" := o.displayName
    ~> "description" := o.description
    ~> "source" := o.source
    ~> "author" := o.author
    ~> "prerequisites" := o.prerequisites
    ~> "categories" := o.categories
    ~> "visibility" := o.visibility
    ~> "counter" := o.counter
    ~> "version" := o.version
    ~> "urls" := o.urls
    ~> "icon" := o.icon
    ~> "tags" := o.tags
    ~> "guard" := o.guard
    ~> jsonEmptyObject


instance resourceRequestDecodeJson :: DecodeJson ResourceRequest where
  decodeJson o = do
    obj <- decodeJson o
    displayName <- obj .? "display_name"
    description <- obj .? "description"
    source <- obj .? "source"
    author <- obj .? "author"
    prerequisites <- obj .? "prerequisites"
    categories <- obj .? "categories"
    visibility <- obj .? "visibility"
    counter <- obj .? "counter"
    version <- obj .? "version"
    urls <- obj .? "urls"
    icon <- obj .? "icon"
    tags <- obj .? "tags"
    guard <- obj .? "guard"
    pure $ ResourceRequest {
      displayName,
      description,
      source,
      author,
      prerequisites,
      categories,
      visibility,
      counter,
      version,
      urls,
      icon,
      tags,
      guard
    }


instance resourceRequestRequestable :: Requestable ResourceRequest where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance resourceRequestRespondable :: Respondable ResourceRequest where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkResourceRequest
      <$> readProp "display_name" json
      <*> readProp "description" json
      <*> readProp "source" json
      <*> (runNullOrUndefined <$> readProp "author" json)
      <*> readProp "prerequisites" json
      <*> readProp "categories" json
      <*> readProp "visibility" json
      <*> readProp "counter" json
      <*> (runNullOrUndefined <$> readProp "version" json)
      <*> (runNullOrUndefined <$> readProp "urls" json)
      <*> (runNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "guard" json


instance resourceRequestIsForeign :: IsForeign ResourceRequest where
  read json =
      mkResourceRequest
      <$> readProp "display_name" json
      <*> readProp "description" json
      <*> readProp "source" json
      <*> (runNullOrUndefined <$> readProp "author" json)
      <*> readProp "prerequisites" json
      <*> readProp "categories" json
      <*> readProp "visibility" json
      <*> readProp "counter" json
      <*> (runNullOrUndefined <$> readProp "version" json)
      <*> (runNullOrUndefined <$> readProp "urls" json)
      <*> (runNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "guard" json


instance resourceRequestShow :: Show ResourceRequest where
    show (ResourceRequest o) = show "displayName: " ++ show o.displayName ++ ", " ++ show "description: " ++ show o.description ++ ", " ++ show "source: " ++ show o.source ++ ", " ++ show "author: " ++ show o.author ++ ", " ++ show "prerequisites: " ++ show o.prerequisites ++ ", " ++ show "categories: " ++ show o.categories ++ ", " ++ show "visibility: " ++ show o.visibility ++ ", " ++ show "counter: " ++ show o.counter ++ ", " ++ show "version: " ++ show o.version ++ ", " ++ show "urls: " ++ show o.urls ++ ", " ++ show "icon: " ++ show o.icon ++ ", " ++ show "tags: " ++ show o.tags ++ ", " ++ show "guard: " ++ show o.guard

newtype ResourceResponse = ResourceResponse {
  id :: Int,
  userId :: Int,
  name :: String,
  displayName :: String,
  description :: String,
  source :: ResourceType,
  author :: (Maybe (Array String)),
  prerequisites :: (DepList String),
  categories :: (DepList String),
  visibility :: Visibility,
  counter :: Int,
  version :: (Maybe String),
  urls :: (Maybe (Array String)),
  icon :: (Maybe String),
  tags :: (Array String),
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


type ResourceResponseR = {
  id :: Int,
  userId :: Int,
  name :: String,
  displayName :: String,
  description :: String,
  source :: ResourceType,
  author :: (Maybe (Array String)),
  prerequisites :: (DepList String),
  categories :: (DepList String),
  visibility :: Visibility,
  counter :: Int,
  version :: (Maybe String),
  urls :: (Maybe (Array String)),
  icon :: (Maybe String),
  tags :: (Array String),
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


_ResourceResponse :: LensP ResourceResponse {
  id :: Int,
  userId :: Int,
  name :: String,
  displayName :: String,
  description :: String,
  source :: ResourceType,
  author :: (Maybe (Array String)),
  prerequisites :: (DepList String),
  categories :: (DepList String),
  visibility :: Visibility,
  counter :: Int,
  version :: (Maybe String),
  urls :: (Maybe (Array String)),
  icon :: (Maybe String),
  tags :: (Array String),
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}
_ResourceResponse f (ResourceResponse o) = ResourceResponse <$> f o


mkResourceResponse :: Int -> Int -> String -> String -> String -> ResourceType -> (Maybe (Array String)) -> (DepList String) -> (DepList String) -> Visibility -> Int -> (Maybe String) -> (Maybe (Array String)) -> (Maybe String) -> (Array String) -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> ResourceResponse
mkResourceResponse id userId name displayName description source author prerequisites categories visibility counter version urls icon tags active guard createdAt modifiedAt activityAt =
  ResourceResponse{id, userId, name, displayName, description, source, author, prerequisites, categories, visibility, counter, version, urls, icon, tags, active, guard, createdAt, modifiedAt, activityAt}


unwrapResourceResponse (ResourceResponse r) = r

instance resourceResponseEncodeJson :: EncodeJson ResourceResponse where
  encodeJson (ResourceResponse o) =
       "tag" := "ResourceResponse"
    ~> "id" := o.id
    ~> "user_id" := o.userId
    ~> "name" := o.name
    ~> "display_name" := o.displayName
    ~> "description" := o.description
    ~> "source" := o.source
    ~> "author" := o.author
    ~> "prerequisites" := o.prerequisites
    ~> "categories" := o.categories
    ~> "visibility" := o.visibility
    ~> "counter" := o.counter
    ~> "version" := o.version
    ~> "urls" := o.urls
    ~> "icon" := o.icon
    ~> "tags" := o.tags
    ~> "active" := o.active
    ~> "guard" := o.guard
    ~> "created_at" := o.createdAt
    ~> "modified_at" := o.modifiedAt
    ~> "activity_at" := o.activityAt
    ~> jsonEmptyObject


instance resourceResponseDecodeJson :: DecodeJson ResourceResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    userId <- obj .? "user_id"
    name <- obj .? "name"
    displayName <- obj .? "display_name"
    description <- obj .? "description"
    source <- obj .? "source"
    author <- obj .? "author"
    prerequisites <- obj .? "prerequisites"
    categories <- obj .? "categories"
    visibility <- obj .? "visibility"
    counter <- obj .? "counter"
    version <- obj .? "version"
    urls <- obj .? "urls"
    icon <- obj .? "icon"
    tags <- obj .? "tags"
    active <- obj .? "active"
    guard <- obj .? "guard"
    createdAt <- obj .? "created_at"
    modifiedAt <- obj .? "modified_at"
    activityAt <- obj .? "activity_at"
    pure $ ResourceResponse {
      id,
      userId,
      name,
      displayName,
      description,
      source,
      author,
      prerequisites,
      categories,
      visibility,
      counter,
      version,
      urls,
      icon,
      tags,
      active,
      guard,
      createdAt,
      modifiedAt,
      activityAt
    }


instance resourceResponseRequestable :: Requestable ResourceResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance resourceResponseRespondable :: Respondable ResourceResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkResourceResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "name" json
      <*> readProp "display_name" json
      <*> readProp "description" json
      <*> readProp "source" json
      <*> (runNullOrUndefined <$> readProp "author" json)
      <*> readProp "prerequisites" json
      <*> readProp "categories" json
      <*> readProp "visibility" json
      <*> readProp "counter" json
      <*> (runNullOrUndefined <$> readProp "version" json)
      <*> (runNullOrUndefined <$> readProp "urls" json)
      <*> (runNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance resourceResponseIsForeign :: IsForeign ResourceResponse where
  read json =
      mkResourceResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "name" json
      <*> readProp "display_name" json
      <*> readProp "description" json
      <*> readProp "source" json
      <*> (runNullOrUndefined <$> readProp "author" json)
      <*> readProp "prerequisites" json
      <*> readProp "categories" json
      <*> readProp "visibility" json
      <*> readProp "counter" json
      <*> (runNullOrUndefined <$> readProp "version" json)
      <*> (runNullOrUndefined <$> readProp "urls" json)
      <*> (runNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance resourceResponseShow :: Show ResourceResponse where
    show (ResourceResponse o) = show "id: " ++ show o.id ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "name: " ++ show o.name ++ ", " ++ show "displayName: " ++ show o.displayName ++ ", " ++ show "description: " ++ show o.description ++ ", " ++ show "source: " ++ show o.source ++ ", " ++ show "author: " ++ show o.author ++ ", " ++ show "prerequisites: " ++ show o.prerequisites ++ ", " ++ show "categories: " ++ show o.categories ++ ", " ++ show "visibility: " ++ show o.visibility ++ ", " ++ show "counter: " ++ show o.counter ++ ", " ++ show "version: " ++ show o.version ++ ", " ++ show "urls: " ++ show o.urls ++ ", " ++ show "icon: " ++ show o.icon ++ ", " ++ show "tags: " ++ show o.tags ++ ", " ++ show "active: " ++ show o.active ++ ", " ++ show "guard: " ++ show o.guard ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt ++ ", " ++ show "activityAt: " ++ show o.activityAt

newtype ResourceResponses = ResourceResponses {
  resourceResponses :: (Array ResourceResponse)
}


type ResourceResponsesR = {
  resourceResponses :: (Array ResourceResponse)
}


_ResourceResponses :: LensP ResourceResponses {
  resourceResponses :: (Array ResourceResponse)
}
_ResourceResponses f (ResourceResponses o) = ResourceResponses <$> f o


mkResourceResponses :: (Array ResourceResponse) -> ResourceResponses
mkResourceResponses resourceResponses =
  ResourceResponses{resourceResponses}


unwrapResourceResponses (ResourceResponses r) = r

instance resourceResponsesEncodeJson :: EncodeJson ResourceResponses where
  encodeJson (ResourceResponses o) =
       "tag" := "ResourceResponses"
    ~> "resource_responses" := o.resourceResponses
    ~> jsonEmptyObject


instance resourceResponsesDecodeJson :: DecodeJson ResourceResponses where
  decodeJson o = do
    obj <- decodeJson o
    resourceResponses <- obj .? "resource_responses"
    pure $ ResourceResponses {
      resourceResponses
    }


instance resourceResponsesRequestable :: Requestable ResourceResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance resourceResponsesRespondable :: Respondable ResourceResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkResourceResponses
      <$> readProp "resource_responses" json


instance resourceResponsesIsForeign :: IsForeign ResourceResponses where
  read json =
      mkResourceResponses
      <$> readProp "resource_responses" json


instance resourceResponsesShow :: Show ResourceResponses where
    show (ResourceResponses o) = show "resourceResponses: " ++ show o.resourceResponses

newtype ResourceStatResponse = ResourceStatResponse {
  resourceId :: Int,
  leurons :: Int,
  likes :: Int,
  neutral :: Int,
  dislikes :: Int,
  stars :: Int,
  views :: Int
}


type ResourceStatResponseR = {
  resourceId :: Int,
  leurons :: Int,
  likes :: Int,
  neutral :: Int,
  dislikes :: Int,
  stars :: Int,
  views :: Int
}


_ResourceStatResponse :: LensP ResourceStatResponse {
  resourceId :: Int,
  leurons :: Int,
  likes :: Int,
  neutral :: Int,
  dislikes :: Int,
  stars :: Int,
  views :: Int
}
_ResourceStatResponse f (ResourceStatResponse o) = ResourceStatResponse <$> f o


mkResourceStatResponse :: Int -> Int -> Int -> Int -> Int -> Int -> Int -> ResourceStatResponse
mkResourceStatResponse resourceId leurons likes neutral dislikes stars views =
  ResourceStatResponse{resourceId, leurons, likes, neutral, dislikes, stars, views}


unwrapResourceStatResponse (ResourceStatResponse r) = r

instance resourceStatResponseEncodeJson :: EncodeJson ResourceStatResponse where
  encodeJson (ResourceStatResponse o) =
       "tag" := "ResourceStatResponse"
    ~> "resource_id" := o.resourceId
    ~> "leurons" := o.leurons
    ~> "likes" := o.likes
    ~> "neutral" := o.neutral
    ~> "dislikes" := o.dislikes
    ~> "stars" := o.stars
    ~> "views" := o.views
    ~> jsonEmptyObject


instance resourceStatResponseDecodeJson :: DecodeJson ResourceStatResponse where
  decodeJson o = do
    obj <- decodeJson o
    resourceId <- obj .? "resource_id"
    leurons <- obj .? "leurons"
    likes <- obj .? "likes"
    neutral <- obj .? "neutral"
    dislikes <- obj .? "dislikes"
    stars <- obj .? "stars"
    views <- obj .? "views"
    pure $ ResourceStatResponse {
      resourceId,
      leurons,
      likes,
      neutral,
      dislikes,
      stars,
      views
    }


instance resourceStatResponseRequestable :: Requestable ResourceStatResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance resourceStatResponseRespondable :: Respondable ResourceStatResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkResourceStatResponse
      <$> readProp "resource_id" json
      <*> readProp "leurons" json
      <*> readProp "likes" json
      <*> readProp "neutral" json
      <*> readProp "dislikes" json
      <*> readProp "stars" json
      <*> readProp "views" json


instance resourceStatResponseIsForeign :: IsForeign ResourceStatResponse where
  read json =
      mkResourceStatResponse
      <$> readProp "resource_id" json
      <*> readProp "leurons" json
      <*> readProp "likes" json
      <*> readProp "neutral" json
      <*> readProp "dislikes" json
      <*> readProp "stars" json
      <*> readProp "views" json


instance resourceStatResponseShow :: Show ResourceStatResponse where
    show (ResourceStatResponse o) = show "resourceId: " ++ show o.resourceId ++ ", " ++ show "leurons: " ++ show o.leurons ++ ", " ++ show "likes: " ++ show o.likes ++ ", " ++ show "neutral: " ++ show o.neutral ++ ", " ++ show "dislikes: " ++ show o.dislikes ++ ", " ++ show "stars: " ++ show o.stars ++ ", " ++ show "views: " ++ show o.views

newtype ResourceStatResponses = ResourceStatResponses {
  resourceStatResponses :: (Array ResourceStatResponse)
}


type ResourceStatResponsesR = {
  resourceStatResponses :: (Array ResourceStatResponse)
}


_ResourceStatResponses :: LensP ResourceStatResponses {
  resourceStatResponses :: (Array ResourceStatResponse)
}
_ResourceStatResponses f (ResourceStatResponses o) = ResourceStatResponses <$> f o


mkResourceStatResponses :: (Array ResourceStatResponse) -> ResourceStatResponses
mkResourceStatResponses resourceStatResponses =
  ResourceStatResponses{resourceStatResponses}


unwrapResourceStatResponses (ResourceStatResponses r) = r

instance resourceStatResponsesEncodeJson :: EncodeJson ResourceStatResponses where
  encodeJson (ResourceStatResponses o) =
       "tag" := "ResourceStatResponses"
    ~> "resource_stat_responses" := o.resourceStatResponses
    ~> jsonEmptyObject


instance resourceStatResponsesDecodeJson :: DecodeJson ResourceStatResponses where
  decodeJson o = do
    obj <- decodeJson o
    resourceStatResponses <- obj .? "resource_stat_responses"
    pure $ ResourceStatResponses {
      resourceStatResponses
    }


instance resourceStatResponsesRequestable :: Requestable ResourceStatResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance resourceStatResponsesRespondable :: Respondable ResourceStatResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkResourceStatResponses
      <$> readProp "resource_stat_responses" json


instance resourceStatResponsesIsForeign :: IsForeign ResourceStatResponses where
  read json =
      mkResourceStatResponses
      <$> readProp "resource_stat_responses" json


instance resourceStatResponsesShow :: Show ResourceStatResponses where
    show (ResourceStatResponses o) = show "resourceStatResponses: " ++ show o.resourceStatResponses

data Size
  = XSmall 
  | Small 
  | Medium 
  | Large 
  | XLarge 



instance sizeEncodeJson :: EncodeJson Size where
  encodeJson (XSmall ) =
       "tag" := "XSmall"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Small ) =
       "tag" := "Small"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Medium ) =
       "tag" := "Medium"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Large ) =
       "tag" := "Large"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (XLarge ) =
       "tag" := "XLarge"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject


instance sizeDecodeJson :: DecodeJson Size where
  decodeJson json = do
    obj <- decodeJson json
    tag <- obj .? "tag"
    case tag of
        "XSmall" -> do
          return XSmall

        "Small" -> do
          return Small

        "Medium" -> do
          return Medium

        "Large" -> do
          return Large

        "XLarge" -> do
          return XLarge

  decodeJson x = fail $ "Could not parse object: " ++ show x


instance sizeRequestable :: Requestable Size where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance sizeRespondable :: Respondable Size where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    tag <- readProp "tag" json
    case tag of
        "XSmall" -> do
          return XSmall

        "Small" -> do
          return Small

        "Medium" -> do
          return Medium

        "Large" -> do
          return Large

        "XLarge" -> do
          return XLarge



instance sizeIsForeign :: IsForeign Size where
  read json = do
    tag <- readProp "tag" json
    case tag of
        "XSmall" -> do
          return XSmall

        "Small" -> do
          return Small

        "Medium" -> do
          return Medium

        "Large" -> do
          return Large

        "XLarge" -> do
          return XLarge



instance sizeShow :: Show Size where
  show (XSmall) = "XSmall"
  show (Small) = "Small"
  show (Medium) = "Medium"
  show (Large) = "Large"
  show (XLarge) = "XLarge"


instance sizeEq :: Eq Size where
  eq (XSmall) (XSmall) = true
  eq (Small) (Small) = true
  eq (Medium) (Medium) = true
  eq (Large) (Large) = true
  eq (XLarge) (XLarge) = true
  eq _ _ = false

data Splits
  = SplitAt Char String String
  | SplitNone 



instance splitsEncodeJson :: EncodeJson Splits where
  encodeJson (SplitAt x0 x1 x2) =
       "tag" := "SplitAt"
    ~> "contents" := [encodeJson x0, encodeJson x1, encodeJson x2]
    ~> jsonEmptyObject
  encodeJson (SplitNone ) =
       "tag" := "SplitNone"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject


instance splitsDecodeJson :: DecodeJson Splits where
  decodeJson json = do
    obj <- decodeJson json
    tag <- obj .? "tag"
    case tag of
        "SplitAt" -> do
          [x0, x1, x2] <- obj .? "contents"
          SplitAt <$> decodeJson x0 <*> decodeJson x1 <*> decodeJson x2

        "SplitNone" -> do
          return SplitNone

  decodeJson x = fail $ "Could not parse object: " ++ show x


instance splitsRequestable :: Requestable Splits where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance splitsRespondable :: Respondable Splits where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    tag <- readProp "tag" json
    case tag of
        "SplitAt" -> do
          [x0, x1, x2] <- readProp "contents" json
          SplitAt <$> read x0 <*> read x1 <*> read x2

        "SplitNone" -> do
          return SplitNone



instance splitsIsForeign :: IsForeign Splits where
  read json = do
    tag <- readProp "tag" json
    case tag of
        "SplitAt" -> do
          [x0, x1, x2] <- readProp "contents" json
          SplitAt <$> read x0 <*> read x1 <*> read x2

        "SplitNone" -> do
          return SplitNone



instance splitsShow :: Show Splits where
  show (SplitAt x0 x1 x2) = "SplitAt: " ++ show x0 ++ " " ++ show x1 ++ " " ++ show x2
  show (SplitNone) = "SplitNone"


data TySplits
  = TySplitA 
  | TySplitNone 



instance tySplitsEncodeJson :: EncodeJson TySplits where
  encodeJson (TySplitA ) =
       "tag" := "TySplitA"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (TySplitNone ) =
       "tag" := "TySplitNone"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject


instance tySplitsDecodeJson :: DecodeJson TySplits where
  decodeJson json = do
    obj <- decodeJson json
    tag <- obj .? "tag"
    case tag of
        "TySplitA" -> do
          return TySplitA

        "TySplitNone" -> do
          return TySplitNone

  decodeJson x = fail $ "Could not parse object: " ++ show x


instance tySplitsRequestable :: Requestable TySplits where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance tySplitsRespondable :: Respondable TySplits where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    tag <- readProp "tag" json
    case tag of
        "TySplitA" -> do
          return TySplitA

        "TySplitNone" -> do
          return TySplitNone



instance tySplitsIsForeign :: IsForeign TySplits where
  read json = do
    tag <- readProp "tag" json
    case tag of
        "TySplitA" -> do
          return TySplitA

        "TySplitNone" -> do
          return TySplitNone



instance tySplitsShow :: Show TySplits where
  show (TySplitA) = "TySplitA"
  show (TySplitNone) = "TySplitNone"


instance tySplitsEq :: Eq TySplits where
  eq (TySplitA) (TySplitA) = true
  eq (TySplitNone) (TySplitNone) = true
  eq _ _ = false

data Substitutions
  = SubsExpr Substitutions Substitutions
  | SubsOneOf (Array String)
  | SubsAllOf (Array String)
  | SubsBoth Substitutions Substitutions



instance substitutionsEncodeJson :: EncodeJson Substitutions where
  encodeJson (SubsExpr x0 x1) =
       "tag" := "SubsExpr"
    ~> "contents" := [encodeJson x0, encodeJson x1]
    ~> jsonEmptyObject
  encodeJson (SubsOneOf x0) =
       "tag" := "SubsOneOf"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (SubsAllOf x0) =
       "tag" := "SubsAllOf"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (SubsBoth x0 x1) =
       "tag" := "SubsBoth"
    ~> "contents" := [encodeJson x0, encodeJson x1]
    ~> jsonEmptyObject


instance substitutionsDecodeJson :: DecodeJson Substitutions where
  decodeJson json = do
    obj <- decodeJson json
    tag <- obj .? "tag"
    case tag of
        "SubsExpr" -> do
          [x0, x1] <- obj .? "contents"
          SubsExpr <$> decodeJson x0 <*> decodeJson x1

        "SubsOneOf" -> do
          x0 <- obj .? "contents"
          SubsOneOf <$> decodeJson x0

        "SubsAllOf" -> do
          x0 <- obj .? "contents"
          SubsAllOf <$> decodeJson x0

        "SubsBoth" -> do
          [x0, x1] <- obj .? "contents"
          SubsBoth <$> decodeJson x0 <*> decodeJson x1

  decodeJson x = fail $ "Could not parse object: " ++ show x


instance substitutionsRequestable :: Requestable Substitutions where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance substitutionsRespondable :: Respondable Substitutions where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    tag <- readProp "tag" json
    case tag of
        "SubsExpr" -> do
          [x0, x1] <- readProp "contents" json
          SubsExpr <$> read x0 <*> read x1

        "SubsOneOf" -> do
          x0 <- readProp "contents" json
          SubsOneOf <$> read x0

        "SubsAllOf" -> do
          x0 <- readProp "contents" json
          SubsAllOf <$> read x0

        "SubsBoth" -> do
          [x0, x1] <- readProp "contents" json
          SubsBoth <$> read x0 <*> read x1



instance substitutionsIsForeign :: IsForeign Substitutions where
  read json = do
    tag <- readProp "tag" json
    case tag of
        "SubsExpr" -> do
          [x0, x1] <- readProp "contents" json
          SubsExpr <$> read x0 <*> read x1

        "SubsOneOf" -> do
          x0 <- readProp "contents" json
          SubsOneOf <$> read x0

        "SubsAllOf" -> do
          x0 <- readProp "contents" json
          SubsAllOf <$> read x0

        "SubsBoth" -> do
          [x0, x1] <- readProp "contents" json
          SubsBoth <$> read x0 <*> read x1



instance substitutionsShow :: Show Substitutions where
  show (SubsExpr x0 x1) = "SubsExpr: " ++ show x0 ++ " " ++ show x1
  show (SubsOneOf x0) = "SubsOneOf: " ++ show x0
  show (SubsAllOf x0) = "SubsAllOf: " ++ show x0
  show (SubsBoth x0 x1) = "SubsBoth: " ++ show x0 ++ " " ++ show x1


data TySubstitutions
  = TySubsExpr 
  | TySubsOneOf 
  | TySubsAllOf 
  | TySubsBoth 



instance tySubstitutionsEncodeJson :: EncodeJson TySubstitutions where
  encodeJson (TySubsExpr ) =
       "tag" := "TySubsExpr"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (TySubsOneOf ) =
       "tag" := "TySubsOneOf"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (TySubsAllOf ) =
       "tag" := "TySubsAllOf"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (TySubsBoth ) =
       "tag" := "TySubsBoth"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject


instance tySubstitutionsDecodeJson :: DecodeJson TySubstitutions where
  decodeJson json = do
    obj <- decodeJson json
    tag <- obj .? "tag"
    case tag of
        "TySubsExpr" -> do
          return TySubsExpr

        "TySubsOneOf" -> do
          return TySubsOneOf

        "TySubsAllOf" -> do
          return TySubsAllOf

        "TySubsBoth" -> do
          return TySubsBoth

  decodeJson x = fail $ "Could not parse object: " ++ show x


instance tySubstitutionsRequestable :: Requestable TySubstitutions where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance tySubstitutionsRespondable :: Respondable TySubstitutions where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    tag <- readProp "tag" json
    case tag of
        "TySubsExpr" -> do
          return TySubsExpr

        "TySubsOneOf" -> do
          return TySubsOneOf

        "TySubsAllOf" -> do
          return TySubsAllOf

        "TySubsBoth" -> do
          return TySubsBoth



instance tySubstitutionsIsForeign :: IsForeign TySubstitutions where
  read json = do
    tag <- readProp "tag" json
    case tag of
        "TySubsExpr" -> do
          return TySubsExpr

        "TySubsOneOf" -> do
          return TySubsOneOf

        "TySubsAllOf" -> do
          return TySubsAllOf

        "TySubsBoth" -> do
          return TySubsBoth



instance tySubstitutionsShow :: Show TySubstitutions where
  show (TySubsExpr) = "TySubsExpr"
  show (TySubsOneOf) = "TySubsOneOf"
  show (TySubsAllOf) = "TySubsAllOf"
  show (TySubsBoth) = "TySubsBoth"


instance tySubstitutionsEq :: Eq TySubstitutions where
  eq (TySubsExpr) (TySubsExpr) = true
  eq (TySubsOneOf) (TySubsOneOf) = true
  eq (TySubsAllOf) (TySubsAllOf) = true
  eq (TySubsBoth) (TySubsBoth) = true
  eq _ _ = false

newtype StarRequest = StarRequest {
  reason :: (Maybe String),
  guard :: Int
}


type StarRequestR = {
  reason :: (Maybe String),
  guard :: Int
}


_StarRequest :: LensP StarRequest {
  reason :: (Maybe String),
  guard :: Int
}
_StarRequest f (StarRequest o) = StarRequest <$> f o


mkStarRequest :: (Maybe String) -> Int -> StarRequest
mkStarRequest reason guard =
  StarRequest{reason, guard}


unwrapStarRequest (StarRequest r) = r

instance starRequestEncodeJson :: EncodeJson StarRequest where
  encodeJson (StarRequest o) =
       "tag" := "StarRequest"
    ~> "reason" := o.reason
    ~> "guard" := o.guard
    ~> jsonEmptyObject


instance starRequestDecodeJson :: DecodeJson StarRequest where
  decodeJson o = do
    obj <- decodeJson o
    reason <- obj .? "reason"
    guard <- obj .? "guard"
    pure $ StarRequest {
      reason,
      guard
    }


instance starRequestRequestable :: Requestable StarRequest where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance starRequestRespondable :: Respondable StarRequest where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkStarRequest
      <$> (runNullOrUndefined <$> readProp "reason" json)
      <*> readProp "guard" json


instance starRequestIsForeign :: IsForeign StarRequest where
  read json =
      mkStarRequest
      <$> (runNullOrUndefined <$> readProp "reason" json)
      <*> readProp "guard" json


instance starRequestShow :: Show StarRequest where
    show (StarRequest o) = show "reason: " ++ show o.reason ++ ", " ++ show "guard: " ++ show o.guard

newtype StarResponse = StarResponse {
  id :: Int,
  ent :: Ent,
  entId :: Int,
  userId :: Int,
  reason :: (Maybe String),
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}


type StarResponseR = {
  id :: Int,
  ent :: Ent,
  entId :: Int,
  userId :: Int,
  reason :: (Maybe String),
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}


_StarResponse :: LensP StarResponse {
  id :: Int,
  ent :: Ent,
  entId :: Int,
  userId :: Int,
  reason :: (Maybe String),
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}
_StarResponse f (StarResponse o) = StarResponse <$> f o


mkStarResponse :: Int -> Ent -> Int -> Int -> (Maybe String) -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> StarResponse
mkStarResponse id ent entId userId reason active guard createdAt modifiedAt =
  StarResponse{id, ent, entId, userId, reason, active, guard, createdAt, modifiedAt}


unwrapStarResponse (StarResponse r) = r

instance starResponseEncodeJson :: EncodeJson StarResponse where
  encodeJson (StarResponse o) =
       "tag" := "StarResponse"
    ~> "id" := o.id
    ~> "ent" := o.ent
    ~> "ent_id" := o.entId
    ~> "user_id" := o.userId
    ~> "reason" := o.reason
    ~> "active" := o.active
    ~> "guard" := o.guard
    ~> "created_at" := o.createdAt
    ~> "modified_at" := o.modifiedAt
    ~> jsonEmptyObject


instance starResponseDecodeJson :: DecodeJson StarResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    ent <- obj .? "ent"
    entId <- obj .? "ent_id"
    userId <- obj .? "user_id"
    reason <- obj .? "reason"
    active <- obj .? "active"
    guard <- obj .? "guard"
    createdAt <- obj .? "created_at"
    modifiedAt <- obj .? "modified_at"
    pure $ StarResponse {
      id,
      ent,
      entId,
      userId,
      reason,
      active,
      guard,
      createdAt,
      modifiedAt
    }


instance starResponseRequestable :: Requestable StarResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance starResponseRespondable :: Respondable StarResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkStarResponse
      <$> readProp "id" json
      <*> readProp "ent" json
      <*> readProp "ent_id" json
      <*> readProp "user_id" json
      <*> (runNullOrUndefined <$> readProp "reason" json)
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance starResponseIsForeign :: IsForeign StarResponse where
  read json =
      mkStarResponse
      <$> readProp "id" json
      <*> readProp "ent" json
      <*> readProp "ent_id" json
      <*> readProp "user_id" json
      <*> (runNullOrUndefined <$> readProp "reason" json)
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance starResponseShow :: Show StarResponse where
    show (StarResponse o) = show "id: " ++ show o.id ++ ", " ++ show "ent: " ++ show o.ent ++ ", " ++ show "entId: " ++ show o.entId ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "reason: " ++ show o.reason ++ ", " ++ show "active: " ++ show o.active ++ ", " ++ show "guard: " ++ show o.guard ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt

newtype StarResponses = StarResponses {
  starResponses :: (Array StarResponse)
}


type StarResponsesR = {
  starResponses :: (Array StarResponse)
}


_StarResponses :: LensP StarResponses {
  starResponses :: (Array StarResponse)
}
_StarResponses f (StarResponses o) = StarResponses <$> f o


mkStarResponses :: (Array StarResponse) -> StarResponses
mkStarResponses starResponses =
  StarResponses{starResponses}


unwrapStarResponses (StarResponses r) = r

instance starResponsesEncodeJson :: EncodeJson StarResponses where
  encodeJson (StarResponses o) =
       "tag" := "StarResponses"
    ~> "star_responses" := o.starResponses
    ~> jsonEmptyObject


instance starResponsesDecodeJson :: DecodeJson StarResponses where
  decodeJson o = do
    obj <- decodeJson o
    starResponses <- obj .? "star_responses"
    pure $ StarResponses {
      starResponses
    }


instance starResponsesRequestable :: Requestable StarResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance starResponsesRespondable :: Respondable StarResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkStarResponses
      <$> readProp "star_responses" json


instance starResponsesIsForeign :: IsForeign StarResponses where
  read json =
      mkStarResponses
      <$> readProp "star_responses" json


instance starResponsesShow :: Show StarResponses where
    show (StarResponses o) = show "starResponses: " ++ show o.starResponses

newtype StarStatResponse = StarStatResponse {
  ent :: Ent,
  entId :: Int,
  stars :: Int
}


type StarStatResponseR = {
  ent :: Ent,
  entId :: Int,
  stars :: Int
}


_StarStatResponse :: LensP StarStatResponse {
  ent :: Ent,
  entId :: Int,
  stars :: Int
}
_StarStatResponse f (StarStatResponse o) = StarStatResponse <$> f o


mkStarStatResponse :: Ent -> Int -> Int -> StarStatResponse
mkStarStatResponse ent entId stars =
  StarStatResponse{ent, entId, stars}


unwrapStarStatResponse (StarStatResponse r) = r

instance starStatResponseEncodeJson :: EncodeJson StarStatResponse where
  encodeJson (StarStatResponse o) =
       "tag" := "StarStatResponse"
    ~> "ent" := o.ent
    ~> "ent_id" := o.entId
    ~> "stars" := o.stars
    ~> jsonEmptyObject


instance starStatResponseDecodeJson :: DecodeJson StarStatResponse where
  decodeJson o = do
    obj <- decodeJson o
    ent <- obj .? "ent"
    entId <- obj .? "ent_id"
    stars <- obj .? "stars"
    pure $ StarStatResponse {
      ent,
      entId,
      stars
    }


instance starStatResponseRequestable :: Requestable StarStatResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance starStatResponseRespondable :: Respondable StarStatResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkStarStatResponse
      <$> readProp "ent" json
      <*> readProp "ent_id" json
      <*> readProp "stars" json


instance starStatResponseIsForeign :: IsForeign StarStatResponse where
  read json =
      mkStarStatResponse
      <$> readProp "ent" json
      <*> readProp "ent_id" json
      <*> readProp "stars" json


instance starStatResponseShow :: Show StarStatResponse where
    show (StarStatResponse o) = show "ent: " ++ show o.ent ++ ", " ++ show "entId: " ++ show o.entId ++ ", " ++ show "stars: " ++ show o.stars

newtype StarStatResponses = StarStatResponses {
  starStatResponses :: (Array StarStatResponse)
}


type StarStatResponsesR = {
  starStatResponses :: (Array StarStatResponse)
}


_StarStatResponses :: LensP StarStatResponses {
  starStatResponses :: (Array StarStatResponse)
}
_StarStatResponses f (StarStatResponses o) = StarStatResponses <$> f o


mkStarStatResponses :: (Array StarStatResponse) -> StarStatResponses
mkStarStatResponses starStatResponses =
  StarStatResponses{starStatResponses}


unwrapStarStatResponses (StarStatResponses r) = r

instance starStatResponsesEncodeJson :: EncodeJson StarStatResponses where
  encodeJson (StarStatResponses o) =
       "tag" := "StarStatResponses"
    ~> "star_stat_responses" := o.starStatResponses
    ~> jsonEmptyObject


instance starStatResponsesDecodeJson :: DecodeJson StarStatResponses where
  decodeJson o = do
    obj <- decodeJson o
    starStatResponses <- obj .? "star_stat_responses"
    pure $ StarStatResponses {
      starStatResponses
    }


instance starStatResponsesRequestable :: Requestable StarStatResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance starStatResponsesRespondable :: Respondable StarStatResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkStarStatResponses
      <$> readProp "star_stat_responses" json


instance starStatResponsesIsForeign :: IsForeign StarStatResponses where
  read json =
      mkStarStatResponses
      <$> readProp "star_stat_responses" json


instance starStatResponsesShow :: Show StarStatResponses where
    show (StarStatResponses o) = show "starStatResponses: " ++ show o.starStatResponses

data SystemTeam
  = Team_Owners 
  | Team_Members 



instance systemTeamEncodeJson :: EncodeJson SystemTeam where
  encodeJson (Team_Owners ) =
       "tag" := "Team_Owners"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Team_Members ) =
       "tag" := "Team_Members"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject


instance systemTeamDecodeJson :: DecodeJson SystemTeam where
  decodeJson json = do
    obj <- decodeJson json
    tag <- obj .? "tag"
    case tag of
        "Team_Owners" -> do
          return Team_Owners

        "Team_Members" -> do
          return Team_Members

  decodeJson x = fail $ "Could not parse object: " ++ show x


instance systemTeamRequestable :: Requestable SystemTeam where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance systemTeamRespondable :: Respondable SystemTeam where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    tag <- readProp "tag" json
    case tag of
        "Team_Owners" -> do
          return Team_Owners

        "Team_Members" -> do
          return Team_Members



instance systemTeamIsForeign :: IsForeign SystemTeam where
  read json = do
    tag <- readProp "tag" json
    case tag of
        "Team_Owners" -> do
          return Team_Owners

        "Team_Members" -> do
          return Team_Members



instance systemTeamShow :: Show SystemTeam where
  show (Team_Owners) = "Team_Owners"
  show (Team_Members) = "Team_Members"


instance systemTeamEq :: Eq SystemTeam where
  eq (Team_Owners) (Team_Owners) = true
  eq (Team_Members) (Team_Members) = true
  eq _ _ = false

newtype TeamRequest = TeamRequest {
  membership :: Membership,
  icon :: (Maybe String),
  tags :: (Array String),
  visibility :: Visibility,
  guard :: Int
}


type TeamRequestR = {
  membership :: Membership,
  icon :: (Maybe String),
  tags :: (Array String),
  visibility :: Visibility,
  guard :: Int
}


_TeamRequest :: LensP TeamRequest {
  membership :: Membership,
  icon :: (Maybe String),
  tags :: (Array String),
  visibility :: Visibility,
  guard :: Int
}
_TeamRequest f (TeamRequest o) = TeamRequest <$> f o


mkTeamRequest :: Membership -> (Maybe String) -> (Array String) -> Visibility -> Int -> TeamRequest
mkTeamRequest membership icon tags visibility guard =
  TeamRequest{membership, icon, tags, visibility, guard}


unwrapTeamRequest (TeamRequest r) = r

instance teamRequestEncodeJson :: EncodeJson TeamRequest where
  encodeJson (TeamRequest o) =
       "tag" := "TeamRequest"
    ~> "membership" := o.membership
    ~> "icon" := o.icon
    ~> "tags" := o.tags
    ~> "visibility" := o.visibility
    ~> "guard" := o.guard
    ~> jsonEmptyObject


instance teamRequestDecodeJson :: DecodeJson TeamRequest where
  decodeJson o = do
    obj <- decodeJson o
    membership <- obj .? "membership"
    icon <- obj .? "icon"
    tags <- obj .? "tags"
    visibility <- obj .? "visibility"
    guard <- obj .? "guard"
    pure $ TeamRequest {
      membership,
      icon,
      tags,
      visibility,
      guard
    }


instance teamRequestRequestable :: Requestable TeamRequest where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance teamRequestRespondable :: Respondable TeamRequest where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkTeamRequest
      <$> readProp "membership" json
      <*> (runNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "visibility" json
      <*> readProp "guard" json


instance teamRequestIsForeign :: IsForeign TeamRequest where
  read json =
      mkTeamRequest
      <$> readProp "membership" json
      <*> (runNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "visibility" json
      <*> readProp "guard" json


instance teamRequestShow :: Show TeamRequest where
    show (TeamRequest o) = show "membership: " ++ show o.membership ++ ", " ++ show "icon: " ++ show o.icon ++ ", " ++ show "tags: " ++ show o.tags ++ ", " ++ show "visibility: " ++ show o.visibility ++ ", " ++ show "guard: " ++ show o.guard

newtype TeamResponse = TeamResponse {
  id :: Int,
  userId :: Int,
  orgId :: Int,
  system :: SystemTeam,
  membership :: Membership,
  icon :: (Maybe String),
  tags :: (Array String),
  visibility :: Visibility,
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


type TeamResponseR = {
  id :: Int,
  userId :: Int,
  orgId :: Int,
  system :: SystemTeam,
  membership :: Membership,
  icon :: (Maybe String),
  tags :: (Array String),
  visibility :: Visibility,
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


_TeamResponse :: LensP TeamResponse {
  id :: Int,
  userId :: Int,
  orgId :: Int,
  system :: SystemTeam,
  membership :: Membership,
  icon :: (Maybe String),
  tags :: (Array String),
  visibility :: Visibility,
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}
_TeamResponse f (TeamResponse o) = TeamResponse <$> f o


mkTeamResponse :: Int -> Int -> Int -> SystemTeam -> Membership -> (Maybe String) -> (Array String) -> Visibility -> Boolean -> Int -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> TeamResponse
mkTeamResponse id userId orgId system membership icon tags visibility active guard createdAt modifiedBy modifiedAt activityAt =
  TeamResponse{id, userId, orgId, system, membership, icon, tags, visibility, active, guard, createdAt, modifiedBy, modifiedAt, activityAt}


unwrapTeamResponse (TeamResponse r) = r

instance teamResponseEncodeJson :: EncodeJson TeamResponse where
  encodeJson (TeamResponse o) =
       "tag" := "TeamResponse"
    ~> "id" := o.id
    ~> "user_id" := o.userId
    ~> "org_id" := o.orgId
    ~> "system" := o.system
    ~> "membership" := o.membership
    ~> "icon" := o.icon
    ~> "tags" := o.tags
    ~> "visibility" := o.visibility
    ~> "active" := o.active
    ~> "guard" := o.guard
    ~> "created_at" := o.createdAt
    ~> "modified_by" := o.modifiedBy
    ~> "modified_at" := o.modifiedAt
    ~> "activity_at" := o.activityAt
    ~> jsonEmptyObject


instance teamResponseDecodeJson :: DecodeJson TeamResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    userId <- obj .? "user_id"
    orgId <- obj .? "org_id"
    system <- obj .? "system"
    membership <- obj .? "membership"
    icon <- obj .? "icon"
    tags <- obj .? "tags"
    visibility <- obj .? "visibility"
    active <- obj .? "active"
    guard <- obj .? "guard"
    createdAt <- obj .? "created_at"
    modifiedBy <- obj .? "modified_by"
    modifiedAt <- obj .? "modified_at"
    activityAt <- obj .? "activity_at"
    pure $ TeamResponse {
      id,
      userId,
      orgId,
      system,
      membership,
      icon,
      tags,
      visibility,
      active,
      guard,
      createdAt,
      modifiedBy,
      modifiedAt,
      activityAt
    }


instance teamResponseRequestable :: Requestable TeamResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance teamResponseRespondable :: Respondable TeamResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkTeamResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "org_id" json
      <*> readProp "system" json
      <*> readProp "membership" json
      <*> (runNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "visibility" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance teamResponseIsForeign :: IsForeign TeamResponse where
  read json =
      mkTeamResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "org_id" json
      <*> readProp "system" json
      <*> readProp "membership" json
      <*> (runNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "visibility" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance teamResponseShow :: Show TeamResponse where
    show (TeamResponse o) = show "id: " ++ show o.id ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "orgId: " ++ show o.orgId ++ ", " ++ show "system: " ++ show o.system ++ ", " ++ show "membership: " ++ show o.membership ++ ", " ++ show "icon: " ++ show o.icon ++ ", " ++ show "tags: " ++ show o.tags ++ ", " ++ show "visibility: " ++ show o.visibility ++ ", " ++ show "active: " ++ show o.active ++ ", " ++ show "guard: " ++ show o.guard ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedBy: " ++ show o.modifiedBy ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt ++ ", " ++ show "activityAt: " ++ show o.activityAt

newtype TeamResponses = TeamResponses {
  teamResponses :: (Array TeamResponse)
}


type TeamResponsesR = {
  teamResponses :: (Array TeamResponse)
}


_TeamResponses :: LensP TeamResponses {
  teamResponses :: (Array TeamResponse)
}
_TeamResponses f (TeamResponses o) = TeamResponses <$> f o


mkTeamResponses :: (Array TeamResponse) -> TeamResponses
mkTeamResponses teamResponses =
  TeamResponses{teamResponses}


unwrapTeamResponses (TeamResponses r) = r

instance teamResponsesEncodeJson :: EncodeJson TeamResponses where
  encodeJson (TeamResponses o) =
       "tag" := "TeamResponses"
    ~> "team_responses" := o.teamResponses
    ~> jsonEmptyObject


instance teamResponsesDecodeJson :: DecodeJson TeamResponses where
  decodeJson o = do
    obj <- decodeJson o
    teamResponses <- obj .? "team_responses"
    pure $ TeamResponses {
      teamResponses
    }


instance teamResponsesRequestable :: Requestable TeamResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance teamResponsesRespondable :: Respondable TeamResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkTeamResponses
      <$> readProp "team_responses" json


instance teamResponsesIsForeign :: IsForeign TeamResponses where
  read json =
      mkTeamResponses
      <$> readProp "team_responses" json


instance teamResponsesShow :: Show TeamResponses where
    show (TeamResponses o) = show "teamResponses: " ++ show o.teamResponses

newtype TeamStatResponse = TeamStatResponse {
  members :: Int
}


type TeamStatResponseR = {
  members :: Int
}


_TeamStatResponse :: LensP TeamStatResponse {
  members :: Int
}
_TeamStatResponse f (TeamStatResponse o) = TeamStatResponse <$> f o


mkTeamStatResponse :: Int -> TeamStatResponse
mkTeamStatResponse members =
  TeamStatResponse{members}


unwrapTeamStatResponse (TeamStatResponse r) = r

instance teamStatResponseEncodeJson :: EncodeJson TeamStatResponse where
  encodeJson (TeamStatResponse o) =
       "tag" := "TeamStatResponse"
    ~> "members" := o.members
    ~> jsonEmptyObject


instance teamStatResponseDecodeJson :: DecodeJson TeamStatResponse where
  decodeJson o = do
    obj <- decodeJson o
    members <- obj .? "members"
    pure $ TeamStatResponse {
      members
    }


instance teamStatResponseRequestable :: Requestable TeamStatResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance teamStatResponseRespondable :: Respondable TeamStatResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkTeamStatResponse
      <$> readProp "members" json


instance teamStatResponseIsForeign :: IsForeign TeamStatResponse where
  read json =
      mkTeamStatResponse
      <$> readProp "members" json


instance teamStatResponseShow :: Show TeamStatResponse where
    show (TeamStatResponse o) = show "members: " ++ show o.members

newtype TeamStatResponses = TeamStatResponses {
  teamStatResponses :: (Array TeamStatResponse)
}


type TeamStatResponsesR = {
  teamStatResponses :: (Array TeamStatResponse)
}


_TeamStatResponses :: LensP TeamStatResponses {
  teamStatResponses :: (Array TeamStatResponse)
}
_TeamStatResponses f (TeamStatResponses o) = TeamStatResponses <$> f o


mkTeamStatResponses :: (Array TeamStatResponse) -> TeamStatResponses
mkTeamStatResponses teamStatResponses =
  TeamStatResponses{teamStatResponses}


unwrapTeamStatResponses (TeamStatResponses r) = r

instance teamStatResponsesEncodeJson :: EncodeJson TeamStatResponses where
  encodeJson (TeamStatResponses o) =
       "tag" := "TeamStatResponses"
    ~> "team_stat_responses" := o.teamStatResponses
    ~> jsonEmptyObject


instance teamStatResponsesDecodeJson :: DecodeJson TeamStatResponses where
  decodeJson o = do
    obj <- decodeJson o
    teamStatResponses <- obj .? "team_stat_responses"
    pure $ TeamStatResponses {
      teamStatResponses
    }


instance teamStatResponsesRequestable :: Requestable TeamStatResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance teamStatResponsesRespondable :: Respondable TeamStatResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkTeamStatResponses
      <$> readProp "team_stat_responses" json


instance teamStatResponsesIsForeign :: IsForeign TeamStatResponses where
  read json =
      mkTeamStatResponses
      <$> readProp "team_stat_responses" json


instance teamStatResponsesShow :: Show TeamStatResponses where
    show (TeamStatResponses o) = show "teamStatResponses: " ++ show o.teamStatResponses

newtype TeamMemberRequest = TeamMemberRequest {
  guard :: Int
}


type TeamMemberRequestR = {
  guard :: Int
}


_TeamMemberRequest :: LensP TeamMemberRequest {
  guard :: Int
}
_TeamMemberRequest f (TeamMemberRequest o) = TeamMemberRequest <$> f o


mkTeamMemberRequest :: Int -> TeamMemberRequest
mkTeamMemberRequest guard =
  TeamMemberRequest{guard}


unwrapTeamMemberRequest (TeamMemberRequest r) = r

instance teamMemberRequestEncodeJson :: EncodeJson TeamMemberRequest where
  encodeJson (TeamMemberRequest o) =
       "tag" := "TeamMemberRequest"
    ~> "guard" := o.guard
    ~> jsonEmptyObject


instance teamMemberRequestDecodeJson :: DecodeJson TeamMemberRequest where
  decodeJson o = do
    obj <- decodeJson o
    guard <- obj .? "guard"
    pure $ TeamMemberRequest {
      guard
    }


instance teamMemberRequestRequestable :: Requestable TeamMemberRequest where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance teamMemberRequestRespondable :: Respondable TeamMemberRequest where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkTeamMemberRequest
      <$> readProp "guard" json


instance teamMemberRequestIsForeign :: IsForeign TeamMemberRequest where
  read json =
      mkTeamMemberRequest
      <$> readProp "guard" json


instance teamMemberRequestShow :: Show TeamMemberRequest where
    show (TeamMemberRequest o) = show "guard: " ++ show o.guard

newtype TeamMemberResponse = TeamMemberResponse {
  id :: Int,
  userId :: Int,
  teamId :: Int,
  isAccepted :: Boolean,
  acceptedAt :: (Maybe Date),
  isBlocked :: Boolean,
  blockedAt :: (Maybe Date),
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


type TeamMemberResponseR = {
  id :: Int,
  userId :: Int,
  teamId :: Int,
  isAccepted :: Boolean,
  acceptedAt :: (Maybe Date),
  isBlocked :: Boolean,
  blockedAt :: (Maybe Date),
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


_TeamMemberResponse :: LensP TeamMemberResponse {
  id :: Int,
  userId :: Int,
  teamId :: Int,
  isAccepted :: Boolean,
  acceptedAt :: (Maybe Date),
  isBlocked :: Boolean,
  blockedAt :: (Maybe Date),
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}
_TeamMemberResponse f (TeamMemberResponse o) = TeamMemberResponse <$> f o


mkTeamMemberResponse :: Int -> Int -> Int -> Boolean -> (Maybe Date) -> Boolean -> (Maybe Date) -> Boolean -> Int -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> TeamMemberResponse
mkTeamMemberResponse id userId teamId isAccepted acceptedAt isBlocked blockedAt active guard createdAt modifiedBy modifiedAt activityAt =
  TeamMemberResponse{id, userId, teamId, isAccepted, acceptedAt, isBlocked, blockedAt, active, guard, createdAt, modifiedBy, modifiedAt, activityAt}


unwrapTeamMemberResponse (TeamMemberResponse r) = r

instance teamMemberResponseEncodeJson :: EncodeJson TeamMemberResponse where
  encodeJson (TeamMemberResponse o) =
       "tag" := "TeamMemberResponse"
    ~> "id" := o.id
    ~> "user_id" := o.userId
    ~> "team_id" := o.teamId
    ~> "is_accepted" := o.isAccepted
    ~> "accepted_at" := o.acceptedAt
    ~> "is_blocked" := o.isBlocked
    ~> "blocked_at" := o.blockedAt
    ~> "active" := o.active
    ~> "guard" := o.guard
    ~> "created_at" := o.createdAt
    ~> "modified_by" := o.modifiedBy
    ~> "modified_at" := o.modifiedAt
    ~> "activity_at" := o.activityAt
    ~> jsonEmptyObject


instance teamMemberResponseDecodeJson :: DecodeJson TeamMemberResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    userId <- obj .? "user_id"
    teamId <- obj .? "team_id"
    isAccepted <- obj .? "is_accepted"
    acceptedAt <- obj .? "accepted_at"
    isBlocked <- obj .? "is_blocked"
    blockedAt <- obj .? "blocked_at"
    active <- obj .? "active"
    guard <- obj .? "guard"
    createdAt <- obj .? "created_at"
    modifiedBy <- obj .? "modified_by"
    modifiedAt <- obj .? "modified_at"
    activityAt <- obj .? "activity_at"
    pure $ TeamMemberResponse {
      id,
      userId,
      teamId,
      isAccepted,
      acceptedAt,
      isBlocked,
      blockedAt,
      active,
      guard,
      createdAt,
      modifiedBy,
      modifiedAt,
      activityAt
    }


instance teamMemberResponseRequestable :: Requestable TeamMemberResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance teamMemberResponseRespondable :: Respondable TeamMemberResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkTeamMemberResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "team_id" json
      <*> readProp "is_accepted" json
      <*> (runNullOrUndefined <$> readProp "accepted_at" json)
      <*> readProp "is_blocked" json
      <*> (runNullOrUndefined <$> readProp "blocked_at" json)
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance teamMemberResponseIsForeign :: IsForeign TeamMemberResponse where
  read json =
      mkTeamMemberResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "team_id" json
      <*> readProp "is_accepted" json
      <*> (runNullOrUndefined <$> readProp "accepted_at" json)
      <*> readProp "is_blocked" json
      <*> (runNullOrUndefined <$> readProp "blocked_at" json)
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance teamMemberResponseShow :: Show TeamMemberResponse where
    show (TeamMemberResponse o) = show "id: " ++ show o.id ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "teamId: " ++ show o.teamId ++ ", " ++ show "isAccepted: " ++ show o.isAccepted ++ ", " ++ show "acceptedAt: " ++ show o.acceptedAt ++ ", " ++ show "isBlocked: " ++ show o.isBlocked ++ ", " ++ show "blockedAt: " ++ show o.blockedAt ++ ", " ++ show "active: " ++ show o.active ++ ", " ++ show "guard: " ++ show o.guard ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedBy: " ++ show o.modifiedBy ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt ++ ", " ++ show "activityAt: " ++ show o.activityAt

newtype TeamMemberResponses = TeamMemberResponses {
  teamMemberResponses :: (Array TeamMemberResponse)
}


type TeamMemberResponsesR = {
  teamMemberResponses :: (Array TeamMemberResponse)
}


_TeamMemberResponses :: LensP TeamMemberResponses {
  teamMemberResponses :: (Array TeamMemberResponse)
}
_TeamMemberResponses f (TeamMemberResponses o) = TeamMemberResponses <$> f o


mkTeamMemberResponses :: (Array TeamMemberResponse) -> TeamMemberResponses
mkTeamMemberResponses teamMemberResponses =
  TeamMemberResponses{teamMemberResponses}


unwrapTeamMemberResponses (TeamMemberResponses r) = r

instance teamMemberResponsesEncodeJson :: EncodeJson TeamMemberResponses where
  encodeJson (TeamMemberResponses o) =
       "tag" := "TeamMemberResponses"
    ~> "team_member_responses" := o.teamMemberResponses
    ~> jsonEmptyObject


instance teamMemberResponsesDecodeJson :: DecodeJson TeamMemberResponses where
  decodeJson o = do
    obj <- decodeJson o
    teamMemberResponses <- obj .? "team_member_responses"
    pure $ TeamMemberResponses {
      teamMemberResponses
    }


instance teamMemberResponsesRequestable :: Requestable TeamMemberResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance teamMemberResponsesRespondable :: Respondable TeamMemberResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkTeamMemberResponses
      <$> readProp "team_member_responses" json


instance teamMemberResponsesIsForeign :: IsForeign TeamMemberResponses where
  read json =
      mkTeamMemberResponses
      <$> readProp "team_member_responses" json


instance teamMemberResponsesShow :: Show TeamMemberResponses where
    show (TeamMemberResponses o) = show "teamMemberResponses: " ++ show o.teamMemberResponses

data TeamMemberStatResponse
  = TeamMemberStatResponse 



instance teamMemberStatResponseEncodeJson :: EncodeJson TeamMemberStatResponse where
  encodeJson (TeamMemberStatResponse ) =
       "tag" := "TeamMemberStatResponse"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject


instance teamMemberStatResponseDecodeJson :: DecodeJson TeamMemberStatResponse where
  decodeJson json = do
    obj <- decodeJson json
    tag <- obj .? "tag"
    case tag of
        "TeamMemberStatResponse" -> do
          return TeamMemberStatResponse

  decodeJson x = fail $ "Could not parse object: " ++ show x


instance teamMemberStatResponseRequestable :: Requestable TeamMemberStatResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance teamMemberStatResponseRespondable :: Respondable TeamMemberStatResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    tag <- readProp "tag" json
    case tag of
        "TeamMemberStatResponse" -> do
          return TeamMemberStatResponse



instance teamMemberStatResponseIsForeign :: IsForeign TeamMemberStatResponse where
  read json = do
    tag <- readProp "tag" json
    case tag of
        "TeamMemberStatResponse" -> do
          return TeamMemberStatResponse



instance teamMemberStatResponseShow :: Show TeamMemberStatResponse where
  show (TeamMemberStatResponse) = "TeamMemberStatResponse"


newtype TeamMemberStatResponses = TeamMemberStatResponses {
  teamMemberStatResponses :: (Array TeamMemberStatResponse)
}


type TeamMemberStatResponsesR = {
  teamMemberStatResponses :: (Array TeamMemberStatResponse)
}


_TeamMemberStatResponses :: LensP TeamMemberStatResponses {
  teamMemberStatResponses :: (Array TeamMemberStatResponse)
}
_TeamMemberStatResponses f (TeamMemberStatResponses o) = TeamMemberStatResponses <$> f o


mkTeamMemberStatResponses :: (Array TeamMemberStatResponse) -> TeamMemberStatResponses
mkTeamMemberStatResponses teamMemberStatResponses =
  TeamMemberStatResponses{teamMemberStatResponses}


unwrapTeamMemberStatResponses (TeamMemberStatResponses r) = r

instance teamMemberStatResponsesEncodeJson :: EncodeJson TeamMemberStatResponses where
  encodeJson (TeamMemberStatResponses o) =
       "tag" := "TeamMemberStatResponses"
    ~> "team_member_stat_responses" := o.teamMemberStatResponses
    ~> jsonEmptyObject


instance teamMemberStatResponsesDecodeJson :: DecodeJson TeamMemberStatResponses where
  decodeJson o = do
    obj <- decodeJson o
    teamMemberStatResponses <- obj .? "team_member_stat_responses"
    pure $ TeamMemberStatResponses {
      teamMemberStatResponses
    }


instance teamMemberStatResponsesRequestable :: Requestable TeamMemberStatResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance teamMemberStatResponsesRespondable :: Respondable TeamMemberStatResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkTeamMemberStatResponses
      <$> readProp "team_member_stat_responses" json


instance teamMemberStatResponsesIsForeign :: IsForeign TeamMemberStatResponses where
  read json =
      mkTeamMemberStatResponses
      <$> readProp "team_member_stat_responses" json


instance teamMemberStatResponsesShow :: Show TeamMemberStatResponses where
    show (TeamMemberStatResponses o) = show "teamMemberStatResponses: " ++ show o.teamMemberStatResponses

newtype TestRequest = TestRequest {
  msg :: String
}


type TestRequestR = {
  msg :: String
}


_TestRequest :: LensP TestRequest {
  msg :: String
}
_TestRequest f (TestRequest o) = TestRequest <$> f o


mkTestRequest :: String -> TestRequest
mkTestRequest msg =
  TestRequest{msg}


unwrapTestRequest (TestRequest r) = r

instance testRequestEncodeJson :: EncodeJson TestRequest where
  encodeJson (TestRequest o) =
       "tag" := "TestRequest"
    ~> "msg" := o.msg
    ~> jsonEmptyObject


instance testRequestDecodeJson :: DecodeJson TestRequest where
  decodeJson o = do
    obj <- decodeJson o
    msg <- obj .? "msg"
    pure $ TestRequest {
      msg
    }


instance testRequestRequestable :: Requestable TestRequest where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance testRequestRespondable :: Respondable TestRequest where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkTestRequest
      <$> readProp "msg" json


instance testRequestIsForeign :: IsForeign TestRequest where
  read json =
      mkTestRequest
      <$> readProp "msg" json


instance testRequestShow :: Show TestRequest where
    show (TestRequest o) = show "msg: " ++ show o.msg

newtype TestResponse = TestResponse {
  id :: Int,
  userId :: Int,
  msg :: String,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}


type TestResponseR = {
  id :: Int,
  userId :: Int,
  msg :: String,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}


_TestResponse :: LensP TestResponse {
  id :: Int,
  userId :: Int,
  msg :: String,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}
_TestResponse f (TestResponse o) = TestResponse <$> f o


mkTestResponse :: Int -> Int -> String -> (Maybe Date) -> (Maybe Date) -> TestResponse
mkTestResponse id userId msg createdAt modifiedAt =
  TestResponse{id, userId, msg, createdAt, modifiedAt}


unwrapTestResponse (TestResponse r) = r

instance testResponseEncodeJson :: EncodeJson TestResponse where
  encodeJson (TestResponse o) =
       "tag" := "TestResponse"
    ~> "id" := o.id
    ~> "user_id" := o.userId
    ~> "msg" := o.msg
    ~> "created_at" := o.createdAt
    ~> "modified_at" := o.modifiedAt
    ~> jsonEmptyObject


instance testResponseDecodeJson :: DecodeJson TestResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    userId <- obj .? "user_id"
    msg <- obj .? "msg"
    createdAt <- obj .? "created_at"
    modifiedAt <- obj .? "modified_at"
    pure $ TestResponse {
      id,
      userId,
      msg,
      createdAt,
      modifiedAt
    }


instance testResponseRequestable :: Requestable TestResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance testResponseRespondable :: Respondable TestResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkTestResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "msg" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance testResponseIsForeign :: IsForeign TestResponse where
  read json =
      mkTestResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "msg" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance testResponseShow :: Show TestResponse where
    show (TestResponse o) = show "id: " ++ show o.id ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "msg: " ++ show o.msg ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt

newtype TestResponses = TestResponses {
  testResponses :: (Array TestResponse)
}


type TestResponsesR = {
  testResponses :: (Array TestResponse)
}


_TestResponses :: LensP TestResponses {
  testResponses :: (Array TestResponse)
}
_TestResponses f (TestResponses o) = TestResponses <$> f o


mkTestResponses :: (Array TestResponse) -> TestResponses
mkTestResponses testResponses =
  TestResponses{testResponses}


unwrapTestResponses (TestResponses r) = r

instance testResponsesEncodeJson :: EncodeJson TestResponses where
  encodeJson (TestResponses o) =
       "tag" := "TestResponses"
    ~> "test_responses" := o.testResponses
    ~> jsonEmptyObject


instance testResponsesDecodeJson :: DecodeJson TestResponses where
  decodeJson o = do
    obj <- decodeJson o
    testResponses <- obj .? "test_responses"
    pure $ TestResponses {
      testResponses
    }


instance testResponsesRequestable :: Requestable TestResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance testResponsesRespondable :: Respondable TestResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkTestResponses
      <$> readProp "test_responses" json


instance testResponsesIsForeign :: IsForeign TestResponses where
  read json =
      mkTestResponses
      <$> readProp "test_responses" json


instance testResponsesShow :: Show TestResponses where
    show (TestResponses o) = show "testResponses: " ++ show o.testResponses

newtype ThreadRequest = ThreadRequest {
  displayName :: String,
  description :: (Maybe String),
  sticky :: Boolean,
  locked :: Boolean,
  poll :: (Maybe String),
  icon :: (Maybe String),
  tags :: (Array String),
  guard :: Int
}


type ThreadRequestR = {
  displayName :: String,
  description :: (Maybe String),
  sticky :: Boolean,
  locked :: Boolean,
  poll :: (Maybe String),
  icon :: (Maybe String),
  tags :: (Array String),
  guard :: Int
}


_ThreadRequest :: LensP ThreadRequest {
  displayName :: String,
  description :: (Maybe String),
  sticky :: Boolean,
  locked :: Boolean,
  poll :: (Maybe String),
  icon :: (Maybe String),
  tags :: (Array String),
  guard :: Int
}
_ThreadRequest f (ThreadRequest o) = ThreadRequest <$> f o


mkThreadRequest :: String -> (Maybe String) -> Boolean -> Boolean -> (Maybe String) -> (Maybe String) -> (Array String) -> Int -> ThreadRequest
mkThreadRequest displayName description sticky locked poll icon tags guard =
  ThreadRequest{displayName, description, sticky, locked, poll, icon, tags, guard}


unwrapThreadRequest (ThreadRequest r) = r

instance threadRequestEncodeJson :: EncodeJson ThreadRequest where
  encodeJson (ThreadRequest o) =
       "tag" := "ThreadRequest"
    ~> "display_name" := o.displayName
    ~> "description" := o.description
    ~> "sticky" := o.sticky
    ~> "locked" := o.locked
    ~> "poll" := o.poll
    ~> "icon" := o.icon
    ~> "tags" := o.tags
    ~> "guard" := o.guard
    ~> jsonEmptyObject


instance threadRequestDecodeJson :: DecodeJson ThreadRequest where
  decodeJson o = do
    obj <- decodeJson o
    displayName <- obj .? "display_name"
    description <- obj .? "description"
    sticky <- obj .? "sticky"
    locked <- obj .? "locked"
    poll <- obj .? "poll"
    icon <- obj .? "icon"
    tags <- obj .? "tags"
    guard <- obj .? "guard"
    pure $ ThreadRequest {
      displayName,
      description,
      sticky,
      locked,
      poll,
      icon,
      tags,
      guard
    }


instance threadRequestRequestable :: Requestable ThreadRequest where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance threadRequestRespondable :: Respondable ThreadRequest where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkThreadRequest
      <$> readProp "display_name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "sticky" json
      <*> readProp "locked" json
      <*> (runNullOrUndefined <$> readProp "poll" json)
      <*> (runNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "guard" json


instance threadRequestIsForeign :: IsForeign ThreadRequest where
  read json =
      mkThreadRequest
      <$> readProp "display_name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "sticky" json
      <*> readProp "locked" json
      <*> (runNullOrUndefined <$> readProp "poll" json)
      <*> (runNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "guard" json


instance threadRequestShow :: Show ThreadRequest where
    show (ThreadRequest o) = show "displayName: " ++ show o.displayName ++ ", " ++ show "description: " ++ show o.description ++ ", " ++ show "sticky: " ++ show o.sticky ++ ", " ++ show "locked: " ++ show o.locked ++ ", " ++ show "poll: " ++ show o.poll ++ ", " ++ show "icon: " ++ show o.icon ++ ", " ++ show "tags: " ++ show o.tags ++ ", " ++ show "guard: " ++ show o.guard

newtype ThreadResponse = ThreadResponse {
  id :: Int,
  userId :: Int,
  boardId :: Int,
  name :: String,
  displayName :: String,
  description :: (Maybe String),
  sticky :: Boolean,
  locked :: Boolean,
  poll :: (Maybe String),
  icon :: (Maybe String),
  tags :: (Array String),
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


type ThreadResponseR = {
  id :: Int,
  userId :: Int,
  boardId :: Int,
  name :: String,
  displayName :: String,
  description :: (Maybe String),
  sticky :: Boolean,
  locked :: Boolean,
  poll :: (Maybe String),
  icon :: (Maybe String),
  tags :: (Array String),
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


_ThreadResponse :: LensP ThreadResponse {
  id :: Int,
  userId :: Int,
  boardId :: Int,
  name :: String,
  displayName :: String,
  description :: (Maybe String),
  sticky :: Boolean,
  locked :: Boolean,
  poll :: (Maybe String),
  icon :: (Maybe String),
  tags :: (Array String),
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}
_ThreadResponse f (ThreadResponse o) = ThreadResponse <$> f o


mkThreadResponse :: Int -> Int -> Int -> String -> String -> (Maybe String) -> Boolean -> Boolean -> (Maybe String) -> (Maybe String) -> (Array String) -> Boolean -> Int -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> ThreadResponse
mkThreadResponse id userId boardId name displayName description sticky locked poll icon tags active guard createdAt modifiedBy modifiedAt activityAt =
  ThreadResponse{id, userId, boardId, name, displayName, description, sticky, locked, poll, icon, tags, active, guard, createdAt, modifiedBy, modifiedAt, activityAt}


unwrapThreadResponse (ThreadResponse r) = r

instance threadResponseEncodeJson :: EncodeJson ThreadResponse where
  encodeJson (ThreadResponse o) =
       "tag" := "ThreadResponse"
    ~> "id" := o.id
    ~> "user_id" := o.userId
    ~> "board_id" := o.boardId
    ~> "name" := o.name
    ~> "display_name" := o.displayName
    ~> "description" := o.description
    ~> "sticky" := o.sticky
    ~> "locked" := o.locked
    ~> "poll" := o.poll
    ~> "icon" := o.icon
    ~> "tags" := o.tags
    ~> "active" := o.active
    ~> "guard" := o.guard
    ~> "created_at" := o.createdAt
    ~> "modified_by" := o.modifiedBy
    ~> "modified_at" := o.modifiedAt
    ~> "activity_at" := o.activityAt
    ~> jsonEmptyObject


instance threadResponseDecodeJson :: DecodeJson ThreadResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    userId <- obj .? "user_id"
    boardId <- obj .? "board_id"
    name <- obj .? "name"
    displayName <- obj .? "display_name"
    description <- obj .? "description"
    sticky <- obj .? "sticky"
    locked <- obj .? "locked"
    poll <- obj .? "poll"
    icon <- obj .? "icon"
    tags <- obj .? "tags"
    active <- obj .? "active"
    guard <- obj .? "guard"
    createdAt <- obj .? "created_at"
    modifiedBy <- obj .? "modified_by"
    modifiedAt <- obj .? "modified_at"
    activityAt <- obj .? "activity_at"
    pure $ ThreadResponse {
      id,
      userId,
      boardId,
      name,
      displayName,
      description,
      sticky,
      locked,
      poll,
      icon,
      tags,
      active,
      guard,
      createdAt,
      modifiedBy,
      modifiedAt,
      activityAt
    }


instance threadResponseRequestable :: Requestable ThreadResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance threadResponseRespondable :: Respondable ThreadResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkThreadResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "board_id" json
      <*> readProp "name" json
      <*> readProp "display_name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "sticky" json
      <*> readProp "locked" json
      <*> (runNullOrUndefined <$> readProp "poll" json)
      <*> (runNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance threadResponseIsForeign :: IsForeign ThreadResponse where
  read json =
      mkThreadResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "board_id" json
      <*> readProp "name" json
      <*> readProp "display_name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "sticky" json
      <*> readProp "locked" json
      <*> (runNullOrUndefined <$> readProp "poll" json)
      <*> (runNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance threadResponseShow :: Show ThreadResponse where
    show (ThreadResponse o) = show "id: " ++ show o.id ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "boardId: " ++ show o.boardId ++ ", " ++ show "name: " ++ show o.name ++ ", " ++ show "displayName: " ++ show o.displayName ++ ", " ++ show "description: " ++ show o.description ++ ", " ++ show "sticky: " ++ show o.sticky ++ ", " ++ show "locked: " ++ show o.locked ++ ", " ++ show "poll: " ++ show o.poll ++ ", " ++ show "icon: " ++ show o.icon ++ ", " ++ show "tags: " ++ show o.tags ++ ", " ++ show "active: " ++ show o.active ++ ", " ++ show "guard: " ++ show o.guard ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedBy: " ++ show o.modifiedBy ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt ++ ", " ++ show "activityAt: " ++ show o.activityAt

newtype ThreadResponses = ThreadResponses {
  threadResponses :: (Array ThreadResponse)
}


type ThreadResponsesR = {
  threadResponses :: (Array ThreadResponse)
}


_ThreadResponses :: LensP ThreadResponses {
  threadResponses :: (Array ThreadResponse)
}
_ThreadResponses f (ThreadResponses o) = ThreadResponses <$> f o


mkThreadResponses :: (Array ThreadResponse) -> ThreadResponses
mkThreadResponses threadResponses =
  ThreadResponses{threadResponses}


unwrapThreadResponses (ThreadResponses r) = r

instance threadResponsesEncodeJson :: EncodeJson ThreadResponses where
  encodeJson (ThreadResponses o) =
       "tag" := "ThreadResponses"
    ~> "thread_responses" := o.threadResponses
    ~> jsonEmptyObject


instance threadResponsesDecodeJson :: DecodeJson ThreadResponses where
  decodeJson o = do
    obj <- decodeJson o
    threadResponses <- obj .? "thread_responses"
    pure $ ThreadResponses {
      threadResponses
    }


instance threadResponsesRequestable :: Requestable ThreadResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance threadResponsesRespondable :: Respondable ThreadResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkThreadResponses
      <$> readProp "thread_responses" json


instance threadResponsesIsForeign :: IsForeign ThreadResponses where
  read json =
      mkThreadResponses
      <$> readProp "thread_responses" json


instance threadResponsesShow :: Show ThreadResponses where
    show (ThreadResponses o) = show "threadResponses: " ++ show o.threadResponses

newtype ThreadStatResponse = ThreadStatResponse {
  threadId :: Int,
  threadPosts :: Int,
  views :: Int
}


type ThreadStatResponseR = {
  threadId :: Int,
  threadPosts :: Int,
  views :: Int
}


_ThreadStatResponse :: LensP ThreadStatResponse {
  threadId :: Int,
  threadPosts :: Int,
  views :: Int
}
_ThreadStatResponse f (ThreadStatResponse o) = ThreadStatResponse <$> f o


mkThreadStatResponse :: Int -> Int -> Int -> ThreadStatResponse
mkThreadStatResponse threadId threadPosts views =
  ThreadStatResponse{threadId, threadPosts, views}


unwrapThreadStatResponse (ThreadStatResponse r) = r

instance threadStatResponseEncodeJson :: EncodeJson ThreadStatResponse where
  encodeJson (ThreadStatResponse o) =
       "tag" := "ThreadStatResponse"
    ~> "thread_id" := o.threadId
    ~> "thread_posts" := o.threadPosts
    ~> "views" := o.views
    ~> jsonEmptyObject


instance threadStatResponseDecodeJson :: DecodeJson ThreadStatResponse where
  decodeJson o = do
    obj <- decodeJson o
    threadId <- obj .? "thread_id"
    threadPosts <- obj .? "thread_posts"
    views <- obj .? "views"
    pure $ ThreadStatResponse {
      threadId,
      threadPosts,
      views
    }


instance threadStatResponseRequestable :: Requestable ThreadStatResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance threadStatResponseRespondable :: Respondable ThreadStatResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkThreadStatResponse
      <$> readProp "thread_id" json
      <*> readProp "thread_posts" json
      <*> readProp "views" json


instance threadStatResponseIsForeign :: IsForeign ThreadStatResponse where
  read json =
      mkThreadStatResponse
      <$> readProp "thread_id" json
      <*> readProp "thread_posts" json
      <*> readProp "views" json


instance threadStatResponseShow :: Show ThreadStatResponse where
    show (ThreadStatResponse o) = show "threadId: " ++ show o.threadId ++ ", " ++ show "threadPosts: " ++ show o.threadPosts ++ ", " ++ show "views: " ++ show o.views

newtype ThreadStatResponses = ThreadStatResponses {
  threadStatResponses :: (Array ThreadStatResponse)
}


type ThreadStatResponsesR = {
  threadStatResponses :: (Array ThreadStatResponse)
}


_ThreadStatResponses :: LensP ThreadStatResponses {
  threadStatResponses :: (Array ThreadStatResponse)
}
_ThreadStatResponses f (ThreadStatResponses o) = ThreadStatResponses <$> f o


mkThreadStatResponses :: (Array ThreadStatResponse) -> ThreadStatResponses
mkThreadStatResponses threadStatResponses =
  ThreadStatResponses{threadStatResponses}


unwrapThreadStatResponses (ThreadStatResponses r) = r

instance threadStatResponsesEncodeJson :: EncodeJson ThreadStatResponses where
  encodeJson (ThreadStatResponses o) =
       "tag" := "ThreadStatResponses"
    ~> "thread_stat_responses" := o.threadStatResponses
    ~> jsonEmptyObject


instance threadStatResponsesDecodeJson :: DecodeJson ThreadStatResponses where
  decodeJson o = do
    obj <- decodeJson o
    threadStatResponses <- obj .? "thread_stat_responses"
    pure $ ThreadStatResponses {
      threadStatResponses
    }


instance threadStatResponsesRequestable :: Requestable ThreadStatResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance threadStatResponsesRespondable :: Respondable ThreadStatResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkThreadStatResponses
      <$> readProp "thread_stat_responses" json


instance threadStatResponsesIsForeign :: IsForeign ThreadStatResponses where
  read json =
      mkThreadStatResponses
      <$> readProp "thread_stat_responses" json


instance threadStatResponsesShow :: Show ThreadStatResponses where
    show (ThreadStatResponses o) = show "threadStatResponses: " ++ show o.threadStatResponses

data PostData
  = PostDataRaw String
  | PostDataMarkdown String
  | PostDataBBCode String
  | PostDataCode String String
  | PostDataOther String String
  | PostDataEmpty 



instance postDataEncodeJson :: EncodeJson PostData where
  encodeJson (PostDataRaw x0) =
       "tag" := "PostDataRaw"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (PostDataMarkdown x0) =
       "tag" := "PostDataMarkdown"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (PostDataBBCode x0) =
       "tag" := "PostDataBBCode"
    ~> "contents" := encodeJson x0
    ~> jsonEmptyObject
  encodeJson (PostDataCode x0 x1) =
       "tag" := "PostDataCode"
    ~> "contents" := [encodeJson x0, encodeJson x1]
    ~> jsonEmptyObject
  encodeJson (PostDataOther x0 x1) =
       "tag" := "PostDataOther"
    ~> "contents" := [encodeJson x0, encodeJson x1]
    ~> jsonEmptyObject
  encodeJson (PostDataEmpty ) =
       "tag" := "PostDataEmpty"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject


instance postDataDecodeJson :: DecodeJson PostData where
  decodeJson json = do
    obj <- decodeJson json
    tag <- obj .? "tag"
    case tag of
        "PostDataRaw" -> do
          x0 <- obj .? "contents"
          PostDataRaw <$> decodeJson x0

        "PostDataMarkdown" -> do
          x0 <- obj .? "contents"
          PostDataMarkdown <$> decodeJson x0

        "PostDataBBCode" -> do
          x0 <- obj .? "contents"
          PostDataBBCode <$> decodeJson x0

        "PostDataCode" -> do
          [x0, x1] <- obj .? "contents"
          PostDataCode <$> decodeJson x0 <*> decodeJson x1

        "PostDataOther" -> do
          [x0, x1] <- obj .? "contents"
          PostDataOther <$> decodeJson x0 <*> decodeJson x1

        "PostDataEmpty" -> do
          return PostDataEmpty

  decodeJson x = fail $ "Could not parse object: " ++ show x


instance postDataRequestable :: Requestable PostData where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance postDataRespondable :: Respondable PostData where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    tag <- readProp "tag" json
    case tag of
        "PostDataRaw" -> do
          x0 <- readProp "contents" json
          PostDataRaw <$> read x0

        "PostDataMarkdown" -> do
          x0 <- readProp "contents" json
          PostDataMarkdown <$> read x0

        "PostDataBBCode" -> do
          x0 <- readProp "contents" json
          PostDataBBCode <$> read x0

        "PostDataCode" -> do
          [x0, x1] <- readProp "contents" json
          PostDataCode <$> read x0 <*> read x1

        "PostDataOther" -> do
          [x0, x1] <- readProp "contents" json
          PostDataOther <$> read x0 <*> read x1

        "PostDataEmpty" -> do
          return PostDataEmpty



instance postDataIsForeign :: IsForeign PostData where
  read json = do
    tag <- readProp "tag" json
    case tag of
        "PostDataRaw" -> do
          x0 <- readProp "contents" json
          PostDataRaw <$> read x0

        "PostDataMarkdown" -> do
          x0 <- readProp "contents" json
          PostDataMarkdown <$> read x0

        "PostDataBBCode" -> do
          x0 <- readProp "contents" json
          PostDataBBCode <$> read x0

        "PostDataCode" -> do
          [x0, x1] <- readProp "contents" json
          PostDataCode <$> read x0 <*> read x1

        "PostDataOther" -> do
          [x0, x1] <- readProp "contents" json
          PostDataOther <$> read x0 <*> read x1

        "PostDataEmpty" -> do
          return PostDataEmpty



instance postDataShow :: Show PostData where
  show (PostDataRaw x0) = "PostDataRaw: " ++ show x0
  show (PostDataMarkdown x0) = "PostDataMarkdown: " ++ show x0
  show (PostDataBBCode x0) = "PostDataBBCode: " ++ show x0
  show (PostDataCode x0 x1) = "PostDataCode: " ++ show x0 ++ " " ++ show x1
  show (PostDataOther x0 x1) = "PostDataOther: " ++ show x0 ++ " " ++ show x1
  show (PostDataEmpty) = "PostDataEmpty"


newtype ThreadPostRequest = ThreadPostRequest {
  title :: (Maybe String),
  body :: PostData,
  tags :: (Array String),
  privateTags :: (Array String),
  guard :: Int
}


type ThreadPostRequestR = {
  title :: (Maybe String),
  body :: PostData,
  tags :: (Array String),
  privateTags :: (Array String),
  guard :: Int
}


_ThreadPostRequest :: LensP ThreadPostRequest {
  title :: (Maybe String),
  body :: PostData,
  tags :: (Array String),
  privateTags :: (Array String),
  guard :: Int
}
_ThreadPostRequest f (ThreadPostRequest o) = ThreadPostRequest <$> f o


mkThreadPostRequest :: (Maybe String) -> PostData -> (Array String) -> (Array String) -> Int -> ThreadPostRequest
mkThreadPostRequest title body tags privateTags guard =
  ThreadPostRequest{title, body, tags, privateTags, guard}


unwrapThreadPostRequest (ThreadPostRequest r) = r

instance threadPostRequestEncodeJson :: EncodeJson ThreadPostRequest where
  encodeJson (ThreadPostRequest o) =
       "tag" := "ThreadPostRequest"
    ~> "title" := o.title
    ~> "body" := o.body
    ~> "tags" := o.tags
    ~> "private_tags" := o.privateTags
    ~> "guard" := o.guard
    ~> jsonEmptyObject


instance threadPostRequestDecodeJson :: DecodeJson ThreadPostRequest where
  decodeJson o = do
    obj <- decodeJson o
    title <- obj .? "title"
    body <- obj .? "body"
    tags <- obj .? "tags"
    privateTags <- obj .? "private_tags"
    guard <- obj .? "guard"
    pure $ ThreadPostRequest {
      title,
      body,
      tags,
      privateTags,
      guard
    }


instance threadPostRequestRequestable :: Requestable ThreadPostRequest where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance threadPostRequestRespondable :: Respondable ThreadPostRequest where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkThreadPostRequest
      <$> (runNullOrUndefined <$> readProp "title" json)
      <*> readProp "body" json
      <*> readProp "tags" json
      <*> readProp "private_tags" json
      <*> readProp "guard" json


instance threadPostRequestIsForeign :: IsForeign ThreadPostRequest where
  read json =
      mkThreadPostRequest
      <$> (runNullOrUndefined <$> readProp "title" json)
      <*> readProp "body" json
      <*> readProp "tags" json
      <*> readProp "private_tags" json
      <*> readProp "guard" json


instance threadPostRequestShow :: Show ThreadPostRequest where
    show (ThreadPostRequest o) = show "title: " ++ show o.title ++ ", " ++ show "body: " ++ show o.body ++ ", " ++ show "tags: " ++ show o.tags ++ ", " ++ show "privateTags: " ++ show o.privateTags ++ ", " ++ show "guard: " ++ show o.guard

newtype ThreadPostResponse = ThreadPostResponse {
  id :: Int,
  userId :: Int,
  threadId :: Int,
  parentId :: (Maybe Int),
  title :: (Maybe String),
  body :: PostData,
  tags :: (Array String),
  privateTags :: (Array String),
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


type ThreadPostResponseR = {
  id :: Int,
  userId :: Int,
  threadId :: Int,
  parentId :: (Maybe Int),
  title :: (Maybe String),
  body :: PostData,
  tags :: (Array String),
  privateTags :: (Array String),
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


_ThreadPostResponse :: LensP ThreadPostResponse {
  id :: Int,
  userId :: Int,
  threadId :: Int,
  parentId :: (Maybe Int),
  title :: (Maybe String),
  body :: PostData,
  tags :: (Array String),
  privateTags :: (Array String),
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}
_ThreadPostResponse f (ThreadPostResponse o) = ThreadPostResponse <$> f o


mkThreadPostResponse :: Int -> Int -> Int -> (Maybe Int) -> (Maybe String) -> PostData -> (Array String) -> (Array String) -> Boolean -> Int -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> ThreadPostResponse
mkThreadPostResponse id userId threadId parentId title body tags privateTags active guard createdAt modifiedBy modifiedAt activityAt =
  ThreadPostResponse{id, userId, threadId, parentId, title, body, tags, privateTags, active, guard, createdAt, modifiedBy, modifiedAt, activityAt}


unwrapThreadPostResponse (ThreadPostResponse r) = r

instance threadPostResponseEncodeJson :: EncodeJson ThreadPostResponse where
  encodeJson (ThreadPostResponse o) =
       "tag" := "ThreadPostResponse"
    ~> "id" := o.id
    ~> "user_id" := o.userId
    ~> "thread_id" := o.threadId
    ~> "parent_id" := o.parentId
    ~> "title" := o.title
    ~> "body" := o.body
    ~> "tags" := o.tags
    ~> "private_tags" := o.privateTags
    ~> "active" := o.active
    ~> "guard" := o.guard
    ~> "created_at" := o.createdAt
    ~> "modified_by" := o.modifiedBy
    ~> "modified_at" := o.modifiedAt
    ~> "activity_at" := o.activityAt
    ~> jsonEmptyObject


instance threadPostResponseDecodeJson :: DecodeJson ThreadPostResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    userId <- obj .? "user_id"
    threadId <- obj .? "thread_id"
    parentId <- obj .? "parent_id"
    title <- obj .? "title"
    body <- obj .? "body"
    tags <- obj .? "tags"
    privateTags <- obj .? "private_tags"
    active <- obj .? "active"
    guard <- obj .? "guard"
    createdAt <- obj .? "created_at"
    modifiedBy <- obj .? "modified_by"
    modifiedAt <- obj .? "modified_at"
    activityAt <- obj .? "activity_at"
    pure $ ThreadPostResponse {
      id,
      userId,
      threadId,
      parentId,
      title,
      body,
      tags,
      privateTags,
      active,
      guard,
      createdAt,
      modifiedBy,
      modifiedAt,
      activityAt
    }


instance threadPostResponseRequestable :: Requestable ThreadPostResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance threadPostResponseRespondable :: Respondable ThreadPostResponse where
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
      <*> readProp "tags" json
      <*> readProp "private_tags" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance threadPostResponseIsForeign :: IsForeign ThreadPostResponse where
  read json =
      mkThreadPostResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "thread_id" json
      <*> (runNullOrUndefined <$> readProp "parent_id" json)
      <*> (runNullOrUndefined <$> readProp "title" json)
      <*> readProp "body" json
      <*> readProp "tags" json
      <*> readProp "private_tags" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance threadPostResponseShow :: Show ThreadPostResponse where
    show (ThreadPostResponse o) = show "id: " ++ show o.id ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "threadId: " ++ show o.threadId ++ ", " ++ show "parentId: " ++ show o.parentId ++ ", " ++ show "title: " ++ show o.title ++ ", " ++ show "body: " ++ show o.body ++ ", " ++ show "tags: " ++ show o.tags ++ ", " ++ show "privateTags: " ++ show o.privateTags ++ ", " ++ show "active: " ++ show o.active ++ ", " ++ show "guard: " ++ show o.guard ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedBy: " ++ show o.modifiedBy ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt ++ ", " ++ show "activityAt: " ++ show o.activityAt

newtype ThreadPostResponses = ThreadPostResponses {
  threadPostResponses :: (Array ThreadPostResponse)
}


type ThreadPostResponsesR = {
  threadPostResponses :: (Array ThreadPostResponse)
}


_ThreadPostResponses :: LensP ThreadPostResponses {
  threadPostResponses :: (Array ThreadPostResponse)
}
_ThreadPostResponses f (ThreadPostResponses o) = ThreadPostResponses <$> f o


mkThreadPostResponses :: (Array ThreadPostResponse) -> ThreadPostResponses
mkThreadPostResponses threadPostResponses =
  ThreadPostResponses{threadPostResponses}


unwrapThreadPostResponses (ThreadPostResponses r) = r

instance threadPostResponsesEncodeJson :: EncodeJson ThreadPostResponses where
  encodeJson (ThreadPostResponses o) =
       "tag" := "ThreadPostResponses"
    ~> "thread_post_responses" := o.threadPostResponses
    ~> jsonEmptyObject


instance threadPostResponsesDecodeJson :: DecodeJson ThreadPostResponses where
  decodeJson o = do
    obj <- decodeJson o
    threadPostResponses <- obj .? "thread_post_responses"
    pure $ ThreadPostResponses {
      threadPostResponses
    }


instance threadPostResponsesRequestable :: Requestable ThreadPostResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance threadPostResponsesRespondable :: Respondable ThreadPostResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkThreadPostResponses
      <$> readProp "thread_post_responses" json


instance threadPostResponsesIsForeign :: IsForeign ThreadPostResponses where
  read json =
      mkThreadPostResponses
      <$> readProp "thread_post_responses" json


instance threadPostResponsesShow :: Show ThreadPostResponses where
    show (ThreadPostResponses o) = show "threadPostResponses: " ++ show o.threadPostResponses

newtype ThreadPostStatResponse = ThreadPostStatResponse {
  threadPostId :: Int,
  likes :: Int,
  neutral :: Int,
  dislikes :: Int,
  stars :: Int,
  views :: Int
}


type ThreadPostStatResponseR = {
  threadPostId :: Int,
  likes :: Int,
  neutral :: Int,
  dislikes :: Int,
  stars :: Int,
  views :: Int
}


_ThreadPostStatResponse :: LensP ThreadPostStatResponse {
  threadPostId :: Int,
  likes :: Int,
  neutral :: Int,
  dislikes :: Int,
  stars :: Int,
  views :: Int
}
_ThreadPostStatResponse f (ThreadPostStatResponse o) = ThreadPostStatResponse <$> f o


mkThreadPostStatResponse :: Int -> Int -> Int -> Int -> Int -> Int -> ThreadPostStatResponse
mkThreadPostStatResponse threadPostId likes neutral dislikes stars views =
  ThreadPostStatResponse{threadPostId, likes, neutral, dislikes, stars, views}


unwrapThreadPostStatResponse (ThreadPostStatResponse r) = r

instance threadPostStatResponseEncodeJson :: EncodeJson ThreadPostStatResponse where
  encodeJson (ThreadPostStatResponse o) =
       "tag" := "ThreadPostStatResponse"
    ~> "thread_post_id" := o.threadPostId
    ~> "likes" := o.likes
    ~> "neutral" := o.neutral
    ~> "dislikes" := o.dislikes
    ~> "stars" := o.stars
    ~> "views" := o.views
    ~> jsonEmptyObject


instance threadPostStatResponseDecodeJson :: DecodeJson ThreadPostStatResponse where
  decodeJson o = do
    obj <- decodeJson o
    threadPostId <- obj .? "thread_post_id"
    likes <- obj .? "likes"
    neutral <- obj .? "neutral"
    dislikes <- obj .? "dislikes"
    stars <- obj .? "stars"
    views <- obj .? "views"
    pure $ ThreadPostStatResponse {
      threadPostId,
      likes,
      neutral,
      dislikes,
      stars,
      views
    }


instance threadPostStatResponseRequestable :: Requestable ThreadPostStatResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance threadPostStatResponseRespondable :: Respondable ThreadPostStatResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkThreadPostStatResponse
      <$> readProp "thread_post_id" json
      <*> readProp "likes" json
      <*> readProp "neutral" json
      <*> readProp "dislikes" json
      <*> readProp "stars" json
      <*> readProp "views" json


instance threadPostStatResponseIsForeign :: IsForeign ThreadPostStatResponse where
  read json =
      mkThreadPostStatResponse
      <$> readProp "thread_post_id" json
      <*> readProp "likes" json
      <*> readProp "neutral" json
      <*> readProp "dislikes" json
      <*> readProp "stars" json
      <*> readProp "views" json


instance threadPostStatResponseShow :: Show ThreadPostStatResponse where
    show (ThreadPostStatResponse o) = show "threadPostId: " ++ show o.threadPostId ++ ", " ++ show "likes: " ++ show o.likes ++ ", " ++ show "neutral: " ++ show o.neutral ++ ", " ++ show "dislikes: " ++ show o.dislikes ++ ", " ++ show "stars: " ++ show o.stars ++ ", " ++ show "views: " ++ show o.views

newtype ThreadPostStatResponses = ThreadPostStatResponses {
  threadPostStatResponses :: (Array ThreadPostStatResponse)
}


type ThreadPostStatResponsesR = {
  threadPostStatResponses :: (Array ThreadPostStatResponse)
}


_ThreadPostStatResponses :: LensP ThreadPostStatResponses {
  threadPostStatResponses :: (Array ThreadPostStatResponse)
}
_ThreadPostStatResponses f (ThreadPostStatResponses o) = ThreadPostStatResponses <$> f o


mkThreadPostStatResponses :: (Array ThreadPostStatResponse) -> ThreadPostStatResponses
mkThreadPostStatResponses threadPostStatResponses =
  ThreadPostStatResponses{threadPostStatResponses}


unwrapThreadPostStatResponses (ThreadPostStatResponses r) = r

instance threadPostStatResponsesEncodeJson :: EncodeJson ThreadPostStatResponses where
  encodeJson (ThreadPostStatResponses o) =
       "tag" := "ThreadPostStatResponses"
    ~> "thread_post_stat_responses" := o.threadPostStatResponses
    ~> jsonEmptyObject


instance threadPostStatResponsesDecodeJson :: DecodeJson ThreadPostStatResponses where
  decodeJson o = do
    obj <- decodeJson o
    threadPostStatResponses <- obj .? "thread_post_stat_responses"
    pure $ ThreadPostStatResponses {
      threadPostStatResponses
    }


instance threadPostStatResponsesRequestable :: Requestable ThreadPostStatResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance threadPostStatResponsesRespondable :: Respondable ThreadPostStatResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkThreadPostStatResponses
      <$> readProp "thread_post_stat_responses" json


instance threadPostStatResponsesIsForeign :: IsForeign ThreadPostStatResponses where
  read json =
      mkThreadPostStatResponses
      <$> readProp "thread_post_stat_responses" json


instance threadPostStatResponsesShow :: Show ThreadPostStatResponses where
    show (ThreadPostStatResponses o) = show "threadPostStatResponses: " ++ show o.threadPostStatResponses

newtype UserRequest = UserRequest {
  displayNick :: String,
  name :: String,
  email :: String,
  plugin :: String,
  ident :: String,
  acceptTOS :: (Maybe Date)
}


type UserRequestR = {
  displayNick :: String,
  name :: String,
  email :: String,
  plugin :: String,
  ident :: String,
  acceptTOS :: (Maybe Date)
}


_UserRequest :: LensP UserRequest {
  displayNick :: String,
  name :: String,
  email :: String,
  plugin :: String,
  ident :: String,
  acceptTOS :: (Maybe Date)
}
_UserRequest f (UserRequest o) = UserRequest <$> f o


mkUserRequest :: String -> String -> String -> String -> String -> (Maybe Date) -> UserRequest
mkUserRequest displayNick name email plugin ident acceptTOS =
  UserRequest{displayNick, name, email, plugin, ident, acceptTOS}


unwrapUserRequest (UserRequest r) = r

instance userRequestEncodeJson :: EncodeJson UserRequest where
  encodeJson (UserRequest o) =
       "tag" := "UserRequest"
    ~> "display_nick" := o.displayNick
    ~> "name" := o.name
    ~> "email" := o.email
    ~> "plugin" := o.plugin
    ~> "ident" := o.ident
    ~> "accept_tos" := o.acceptTOS
    ~> jsonEmptyObject


instance userRequestDecodeJson :: DecodeJson UserRequest where
  decodeJson o = do
    obj <- decodeJson o
    displayNick <- obj .? "display_nick"
    name <- obj .? "name"
    email <- obj .? "email"
    plugin <- obj .? "plugin"
    ident <- obj .? "ident"
    acceptTOS <- obj .? "accept_tos"
    pure $ UserRequest {
      displayNick,
      name,
      email,
      plugin,
      ident,
      acceptTOS
    }


instance userRequestRequestable :: Requestable UserRequest where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance userRequestRespondable :: Respondable UserRequest where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkUserRequest
      <$> readProp "display_nick" json
      <*> readProp "name" json
      <*> readProp "email" json
      <*> readProp "plugin" json
      <*> readProp "ident" json
      <*> (runNullOrUndefined <$> readProp "accept_tos" json)


instance userRequestIsForeign :: IsForeign UserRequest where
  read json =
      mkUserRequest
      <$> readProp "display_nick" json
      <*> readProp "name" json
      <*> readProp "email" json
      <*> readProp "plugin" json
      <*> readProp "ident" json
      <*> (runNullOrUndefined <$> readProp "accept_tos" json)


instance userRequestShow :: Show UserRequest where
    show (UserRequest o) = show "displayNick: " ++ show o.displayNick ++ ", " ++ show "name: " ++ show o.name ++ ", " ++ show "email: " ++ show o.email ++ ", " ++ show "plugin: " ++ show o.plugin ++ ", " ++ show "ident: " ++ show o.ident ++ ", " ++ show "acceptTOS: " ++ show o.acceptTOS

newtype UserResponse = UserResponse {
  id :: Int,
  nick :: String,
  displayNick :: String,
  name :: String,
  email :: String,
  emailMD5 :: String,
  plugin :: String,
  ident :: String,
  acceptTOS :: (Maybe Date),
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date),
  deactivatedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


type UserResponseR = {
  id :: Int,
  nick :: String,
  displayNick :: String,
  name :: String,
  email :: String,
  emailMD5 :: String,
  plugin :: String,
  ident :: String,
  acceptTOS :: (Maybe Date),
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date),
  deactivatedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


_UserResponse :: LensP UserResponse {
  id :: Int,
  nick :: String,
  displayNick :: String,
  name :: String,
  email :: String,
  emailMD5 :: String,
  plugin :: String,
  ident :: String,
  acceptTOS :: (Maybe Date),
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date),
  deactivatedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}
_UserResponse f (UserResponse o) = UserResponse <$> f o


mkUserResponse :: Int -> String -> String -> String -> String -> String -> String -> String -> (Maybe Date) -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> UserResponse
mkUserResponse id nick displayNick name email emailMD5 plugin ident acceptTOS active guard createdAt modifiedAt deactivatedAt activityAt =
  UserResponse{id, nick, displayNick, name, email, emailMD5, plugin, ident, acceptTOS, active, guard, createdAt, modifiedAt, deactivatedAt, activityAt}


unwrapUserResponse (UserResponse r) = r

instance userResponseEncodeJson :: EncodeJson UserResponse where
  encodeJson (UserResponse o) =
       "tag" := "UserResponse"
    ~> "id" := o.id
    ~> "nick" := o.nick
    ~> "display_nick" := o.displayNick
    ~> "name" := o.name
    ~> "email" := o.email
    ~> "email_md5" := o.emailMD5
    ~> "plugin" := o.plugin
    ~> "ident" := o.ident
    ~> "accept_tos" := o.acceptTOS
    ~> "active" := o.active
    ~> "guard" := o.guard
    ~> "created_at" := o.createdAt
    ~> "modified_at" := o.modifiedAt
    ~> "deactivated_at" := o.deactivatedAt
    ~> "activity_at" := o.activityAt
    ~> jsonEmptyObject


instance userResponseDecodeJson :: DecodeJson UserResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    nick <- obj .? "nick"
    displayNick <- obj .? "display_nick"
    name <- obj .? "name"
    email <- obj .? "email"
    emailMD5 <- obj .? "email_md5"
    plugin <- obj .? "plugin"
    ident <- obj .? "ident"
    acceptTOS <- obj .? "accept_tos"
    active <- obj .? "active"
    guard <- obj .? "guard"
    createdAt <- obj .? "created_at"
    modifiedAt <- obj .? "modified_at"
    deactivatedAt <- obj .? "deactivated_at"
    activityAt <- obj .? "activity_at"
    pure $ UserResponse {
      id,
      nick,
      displayNick,
      name,
      email,
      emailMD5,
      plugin,
      ident,
      acceptTOS,
      active,
      guard,
      createdAt,
      modifiedAt,
      deactivatedAt,
      activityAt
    }


instance userResponseRequestable :: Requestable UserResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance userResponseRespondable :: Respondable UserResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkUserResponse
      <$> readProp "id" json
      <*> readProp "nick" json
      <*> readProp "display_nick" json
      <*> readProp "name" json
      <*> readProp "email" json
      <*> readProp "email_md5" json
      <*> readProp "plugin" json
      <*> readProp "ident" json
      <*> (runNullOrUndefined <$> readProp "accept_tos" json)
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "deactivated_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance userResponseIsForeign :: IsForeign UserResponse where
  read json =
      mkUserResponse
      <$> readProp "id" json
      <*> readProp "nick" json
      <*> readProp "display_nick" json
      <*> readProp "name" json
      <*> readProp "email" json
      <*> readProp "email_md5" json
      <*> readProp "plugin" json
      <*> readProp "ident" json
      <*> (runNullOrUndefined <$> readProp "accept_tos" json)
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "deactivated_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance userResponseShow :: Show UserResponse where
    show (UserResponse o) = show "id: " ++ show o.id ++ ", " ++ show "nick: " ++ show o.nick ++ ", " ++ show "displayNick: " ++ show o.displayNick ++ ", " ++ show "name: " ++ show o.name ++ ", " ++ show "email: " ++ show o.email ++ ", " ++ show "emailMD5: " ++ show o.emailMD5 ++ ", " ++ show "plugin: " ++ show o.plugin ++ ", " ++ show "ident: " ++ show o.ident ++ ", " ++ show "acceptTOS: " ++ show o.acceptTOS ++ ", " ++ show "active: " ++ show o.active ++ ", " ++ show "guard: " ++ show o.guard ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt ++ ", " ++ show "deactivatedAt: " ++ show o.deactivatedAt ++ ", " ++ show "activityAt: " ++ show o.activityAt

newtype UserResponses = UserResponses {
  userResponses :: (Array UserResponse)
}


type UserResponsesR = {
  userResponses :: (Array UserResponse)
}


_UserResponses :: LensP UserResponses {
  userResponses :: (Array UserResponse)
}
_UserResponses f (UserResponses o) = UserResponses <$> f o


mkUserResponses :: (Array UserResponse) -> UserResponses
mkUserResponses userResponses =
  UserResponses{userResponses}


unwrapUserResponses (UserResponses r) = r

instance userResponsesEncodeJson :: EncodeJson UserResponses where
  encodeJson (UserResponses o) =
       "tag" := "UserResponses"
    ~> "user_responses" := o.userResponses
    ~> jsonEmptyObject


instance userResponsesDecodeJson :: DecodeJson UserResponses where
  decodeJson o = do
    obj <- decodeJson o
    userResponses <- obj .? "user_responses"
    pure $ UserResponses {
      userResponses
    }


instance userResponsesRequestable :: Requestable UserResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance userResponsesRespondable :: Respondable UserResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkUserResponses
      <$> readProp "user_responses" json


instance userResponsesIsForeign :: IsForeign UserResponses where
  read json =
      mkUserResponses
      <$> readProp "user_responses" json


instance userResponsesShow :: Show UserResponses where
    show (UserResponses o) = show "userResponses: " ++ show o.userResponses

newtype UserSanitizedResponse = UserSanitizedResponse {
  id :: Int,
  nick :: String,
  displayNick :: String,
  emailMD5 :: String,
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


type UserSanitizedResponseR = {
  id :: Int,
  nick :: String,
  displayNick :: String,
  emailMD5 :: String,
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


_UserSanitizedResponse :: LensP UserSanitizedResponse {
  id :: Int,
  nick :: String,
  displayNick :: String,
  emailMD5 :: String,
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}
_UserSanitizedResponse f (UserSanitizedResponse o) = UserSanitizedResponse <$> f o


mkUserSanitizedResponse :: Int -> String -> String -> String -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> UserSanitizedResponse
mkUserSanitizedResponse id nick displayNick emailMD5 active guard createdAt activityAt =
  UserSanitizedResponse{id, nick, displayNick, emailMD5, active, guard, createdAt, activityAt}


unwrapUserSanitizedResponse (UserSanitizedResponse r) = r

instance userSanitizedResponseEncodeJson :: EncodeJson UserSanitizedResponse where
  encodeJson (UserSanitizedResponse o) =
       "tag" := "UserSanitizedResponse"
    ~> "id" := o.id
    ~> "nick" := o.nick
    ~> "display_nick" := o.displayNick
    ~> "email_md5" := o.emailMD5
    ~> "active" := o.active
    ~> "guard" := o.guard
    ~> "created_at" := o.createdAt
    ~> "activity_at" := o.activityAt
    ~> jsonEmptyObject


instance userSanitizedResponseDecodeJson :: DecodeJson UserSanitizedResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    nick <- obj .? "nick"
    displayNick <- obj .? "display_nick"
    emailMD5 <- obj .? "email_md5"
    active <- obj .? "active"
    guard <- obj .? "guard"
    createdAt <- obj .? "created_at"
    activityAt <- obj .? "activity_at"
    pure $ UserSanitizedResponse {
      id,
      nick,
      displayNick,
      emailMD5,
      active,
      guard,
      createdAt,
      activityAt
    }


instance userSanitizedResponseRequestable :: Requestable UserSanitizedResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance userSanitizedResponseRespondable :: Respondable UserSanitizedResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkUserSanitizedResponse
      <$> readProp "id" json
      <*> readProp "nick" json
      <*> readProp "display_nick" json
      <*> readProp "email_md5" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance userSanitizedResponseIsForeign :: IsForeign UserSanitizedResponse where
  read json =
      mkUserSanitizedResponse
      <$> readProp "id" json
      <*> readProp "nick" json
      <*> readProp "display_nick" json
      <*> readProp "email_md5" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance userSanitizedResponseShow :: Show UserSanitizedResponse where
    show (UserSanitizedResponse o) = show "id: " ++ show o.id ++ ", " ++ show "nick: " ++ show o.nick ++ ", " ++ show "displayNick: " ++ show o.displayNick ++ ", " ++ show "emailMD5: " ++ show o.emailMD5 ++ ", " ++ show "active: " ++ show o.active ++ ", " ++ show "guard: " ++ show o.guard ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "activityAt: " ++ show o.activityAt

newtype UserSanitizedResponses = UserSanitizedResponses {
  userSanitizedResponses :: (Array UserSanitizedResponse)
}


type UserSanitizedResponsesR = {
  userSanitizedResponses :: (Array UserSanitizedResponse)
}


_UserSanitizedResponses :: LensP UserSanitizedResponses {
  userSanitizedResponses :: (Array UserSanitizedResponse)
}
_UserSanitizedResponses f (UserSanitizedResponses o) = UserSanitizedResponses <$> f o


mkUserSanitizedResponses :: (Array UserSanitizedResponse) -> UserSanitizedResponses
mkUserSanitizedResponses userSanitizedResponses =
  UserSanitizedResponses{userSanitizedResponses}


unwrapUserSanitizedResponses (UserSanitizedResponses r) = r

instance userSanitizedResponsesEncodeJson :: EncodeJson UserSanitizedResponses where
  encodeJson (UserSanitizedResponses o) =
       "tag" := "UserSanitizedResponses"
    ~> "user_sanitized_responses" := o.userSanitizedResponses
    ~> jsonEmptyObject


instance userSanitizedResponsesDecodeJson :: DecodeJson UserSanitizedResponses where
  decodeJson o = do
    obj <- decodeJson o
    userSanitizedResponses <- obj .? "user_sanitized_responses"
    pure $ UserSanitizedResponses {
      userSanitizedResponses
    }


instance userSanitizedResponsesRequestable :: Requestable UserSanitizedResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance userSanitizedResponsesRespondable :: Respondable UserSanitizedResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkUserSanitizedResponses
      <$> readProp "user_sanitized_responses" json


instance userSanitizedResponsesIsForeign :: IsForeign UserSanitizedResponses where
  read json =
      mkUserSanitizedResponses
      <$> readProp "user_sanitized_responses" json


instance userSanitizedResponsesShow :: Show UserSanitizedResponses where
    show (UserSanitizedResponses o) = show "userSanitizedResponses: " ++ show o.userSanitizedResponses

newtype UserSanitizedStatResponse = UserSanitizedStatResponse {
  userId :: Int,
  threads :: Int,
  threadPosts :: Int,
  respect :: Int,
  resources :: Int,
  leurons :: Int,
  workouts :: Int
}


type UserSanitizedStatResponseR = {
  userId :: Int,
  threads :: Int,
  threadPosts :: Int,
  respect :: Int,
  resources :: Int,
  leurons :: Int,
  workouts :: Int
}


_UserSanitizedStatResponse :: LensP UserSanitizedStatResponse {
  userId :: Int,
  threads :: Int,
  threadPosts :: Int,
  respect :: Int,
  resources :: Int,
  leurons :: Int,
  workouts :: Int
}
_UserSanitizedStatResponse f (UserSanitizedStatResponse o) = UserSanitizedStatResponse <$> f o


mkUserSanitizedStatResponse :: Int -> Int -> Int -> Int -> Int -> Int -> Int -> UserSanitizedStatResponse
mkUserSanitizedStatResponse userId threads threadPosts respect resources leurons workouts =
  UserSanitizedStatResponse{userId, threads, threadPosts, respect, resources, leurons, workouts}


unwrapUserSanitizedStatResponse (UserSanitizedStatResponse r) = r

instance userSanitizedStatResponseEncodeJson :: EncodeJson UserSanitizedStatResponse where
  encodeJson (UserSanitizedStatResponse o) =
       "tag" := "UserSanitizedStatResponse"
    ~> "user_id" := o.userId
    ~> "threads" := o.threads
    ~> "thread_posts" := o.threadPosts
    ~> "respect" := o.respect
    ~> "resources" := o.resources
    ~> "leurons" := o.leurons
    ~> "workouts" := o.workouts
    ~> jsonEmptyObject


instance userSanitizedStatResponseDecodeJson :: DecodeJson UserSanitizedStatResponse where
  decodeJson o = do
    obj <- decodeJson o
    userId <- obj .? "user_id"
    threads <- obj .? "threads"
    threadPosts <- obj .? "thread_posts"
    respect <- obj .? "respect"
    resources <- obj .? "resources"
    leurons <- obj .? "leurons"
    workouts <- obj .? "workouts"
    pure $ UserSanitizedStatResponse {
      userId,
      threads,
      threadPosts,
      respect,
      resources,
      leurons,
      workouts
    }


instance userSanitizedStatResponseRequestable :: Requestable UserSanitizedStatResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance userSanitizedStatResponseRespondable :: Respondable UserSanitizedStatResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkUserSanitizedStatResponse
      <$> readProp "user_id" json
      <*> readProp "threads" json
      <*> readProp "thread_posts" json
      <*> readProp "respect" json
      <*> readProp "resources" json
      <*> readProp "leurons" json
      <*> readProp "workouts" json


instance userSanitizedStatResponseIsForeign :: IsForeign UserSanitizedStatResponse where
  read json =
      mkUserSanitizedStatResponse
      <$> readProp "user_id" json
      <*> readProp "threads" json
      <*> readProp "thread_posts" json
      <*> readProp "respect" json
      <*> readProp "resources" json
      <*> readProp "leurons" json
      <*> readProp "workouts" json


instance userSanitizedStatResponseShow :: Show UserSanitizedStatResponse where
    show (UserSanitizedStatResponse o) = show "userId: " ++ show o.userId ++ ", " ++ show "threads: " ++ show o.threads ++ ", " ++ show "threadPosts: " ++ show o.threadPosts ++ ", " ++ show "respect: " ++ show o.respect ++ ", " ++ show "resources: " ++ show o.resources ++ ", " ++ show "leurons: " ++ show o.leurons ++ ", " ++ show "workouts: " ++ show o.workouts

newtype UserSanitizedStatResponses = UserSanitizedStatResponses {
  userSanitizedStatResponses :: (Array UserSanitizedStatResponse)
}


type UserSanitizedStatResponsesR = {
  userSanitizedStatResponses :: (Array UserSanitizedStatResponse)
}


_UserSanitizedStatResponses :: LensP UserSanitizedStatResponses {
  userSanitizedStatResponses :: (Array UserSanitizedStatResponse)
}
_UserSanitizedStatResponses f (UserSanitizedStatResponses o) = UserSanitizedStatResponses <$> f o


mkUserSanitizedStatResponses :: (Array UserSanitizedStatResponse) -> UserSanitizedStatResponses
mkUserSanitizedStatResponses userSanitizedStatResponses =
  UserSanitizedStatResponses{userSanitizedStatResponses}


unwrapUserSanitizedStatResponses (UserSanitizedStatResponses r) = r

instance userSanitizedStatResponsesEncodeJson :: EncodeJson UserSanitizedStatResponses where
  encodeJson (UserSanitizedStatResponses o) =
       "tag" := "UserSanitizedStatResponses"
    ~> "user_sanitized_stat_responses" := o.userSanitizedStatResponses
    ~> jsonEmptyObject


instance userSanitizedStatResponsesDecodeJson :: DecodeJson UserSanitizedStatResponses where
  decodeJson o = do
    obj <- decodeJson o
    userSanitizedStatResponses <- obj .? "user_sanitized_stat_responses"
    pure $ UserSanitizedStatResponses {
      userSanitizedStatResponses
    }


instance userSanitizedStatResponsesRequestable :: Requestable UserSanitizedStatResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance userSanitizedStatResponsesRespondable :: Respondable UserSanitizedStatResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkUserSanitizedStatResponses
      <$> readProp "user_sanitized_stat_responses" json


instance userSanitizedStatResponsesIsForeign :: IsForeign UserSanitizedStatResponses where
  read json =
      mkUserSanitizedStatResponses
      <$> readProp "user_sanitized_stat_responses" json


instance userSanitizedStatResponsesShow :: Show UserSanitizedStatResponses where
    show (UserSanitizedStatResponses o) = show "userSanitizedStatResponses: " ++ show o.userSanitizedStatResponses

data Visibility
  = Public 
  | Private 



instance visibilityEncodeJson :: EncodeJson Visibility where
  encodeJson (Public ) =
       "tag" := "Public"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Private ) =
       "tag" := "Private"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject


instance visibilityDecodeJson :: DecodeJson Visibility where
  decodeJson json = do
    obj <- decodeJson json
    tag <- obj .? "tag"
    case tag of
        "Public" -> do
          return Public

        "Private" -> do
          return Private

  decodeJson x = fail $ "Could not parse object: " ++ show x


instance visibilityRequestable :: Requestable Visibility where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance visibilityRespondable :: Respondable Visibility where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    tag <- readProp "tag" json
    case tag of
        "Public" -> do
          return Public

        "Private" -> do
          return Private



instance visibilityIsForeign :: IsForeign Visibility where
  read json = do
    tag <- readProp "tag" json
    case tag of
        "Public" -> do
          return Public

        "Private" -> do
          return Private



instance visibilityShow :: Show Visibility where
  show (Public) = "Public"
  show (Private) = "Private"


instance visibilityEq :: Eq Visibility where
  eq (Public) (Public) = true
  eq (Private) (Private) = true
  eq _ _ = false

newtype OrganizationPackResponse = OrganizationPackResponse {
  user :: UserSanitizedResponse,
  userId :: Int,
  organization :: OrganizationResponse,
  organizationId :: Int,
  stat :: OrganizationStatResponse,
  like :: (Maybe LikeResponse),
  star :: (Maybe StarResponse),
  permissions :: Permissions,
  teams :: (Array SystemTeam)
}


type OrganizationPackResponseR = {
  user :: UserSanitizedResponse,
  userId :: Int,
  organization :: OrganizationResponse,
  organizationId :: Int,
  stat :: OrganizationStatResponse,
  like :: (Maybe LikeResponse),
  star :: (Maybe StarResponse),
  permissions :: Permissions,
  teams :: (Array SystemTeam)
}


_OrganizationPackResponse :: LensP OrganizationPackResponse {
  user :: UserSanitizedResponse,
  userId :: Int,
  organization :: OrganizationResponse,
  organizationId :: Int,
  stat :: OrganizationStatResponse,
  like :: (Maybe LikeResponse),
  star :: (Maybe StarResponse),
  permissions :: Permissions,
  teams :: (Array SystemTeam)
}
_OrganizationPackResponse f (OrganizationPackResponse o) = OrganizationPackResponse <$> f o


mkOrganizationPackResponse :: UserSanitizedResponse -> Int -> OrganizationResponse -> Int -> OrganizationStatResponse -> (Maybe LikeResponse) -> (Maybe StarResponse) -> Permissions -> (Array SystemTeam) -> OrganizationPackResponse
mkOrganizationPackResponse user userId organization organizationId stat like star permissions teams =
  OrganizationPackResponse{user, userId, organization, organizationId, stat, like, star, permissions, teams}


unwrapOrganizationPackResponse (OrganizationPackResponse r) = r

instance organizationPackResponseEncodeJson :: EncodeJson OrganizationPackResponse where
  encodeJson (OrganizationPackResponse o) =
       "tag" := "OrganizationPackResponse"
    ~> "user" := o.user
    ~> "user_id" := o.userId
    ~> "organization" := o.organization
    ~> "organization_id" := o.organizationId
    ~> "stat" := o.stat
    ~> "like" := o.like
    ~> "star" := o.star
    ~> "permissions" := o.permissions
    ~> "teams" := o.teams
    ~> jsonEmptyObject


instance organizationPackResponseDecodeJson :: DecodeJson OrganizationPackResponse where
  decodeJson o = do
    obj <- decodeJson o
    user <- obj .? "user"
    userId <- obj .? "user_id"
    organization <- obj .? "organization"
    organizationId <- obj .? "organization_id"
    stat <- obj .? "stat"
    like <- obj .? "like"
    star <- obj .? "star"
    permissions <- obj .? "permissions"
    teams <- obj .? "teams"
    pure $ OrganizationPackResponse {
      user,
      userId,
      organization,
      organizationId,
      stat,
      like,
      star,
      permissions,
      teams
    }


instance organizationPackResponseRequestable :: Requestable OrganizationPackResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance organizationPackResponseRespondable :: Respondable OrganizationPackResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkOrganizationPackResponse
      <$> readProp "user" json
      <*> readProp "user_id" json
      <*> readProp "organization" json
      <*> readProp "organization_id" json
      <*> readProp "stat" json
      <*> (runNullOrUndefined <$> readProp "like" json)
      <*> (runNullOrUndefined <$> readProp "star" json)
      <*> readProp "permissions" json
      <*> readProp "teams" json


instance organizationPackResponseIsForeign :: IsForeign OrganizationPackResponse where
  read json =
      mkOrganizationPackResponse
      <$> readProp "user" json
      <*> readProp "user_id" json
      <*> readProp "organization" json
      <*> readProp "organization_id" json
      <*> readProp "stat" json
      <*> (runNullOrUndefined <$> readProp "like" json)
      <*> (runNullOrUndefined <$> readProp "star" json)
      <*> readProp "permissions" json
      <*> readProp "teams" json


instance organizationPackResponseShow :: Show OrganizationPackResponse where
    show (OrganizationPackResponse o) = show "user: " ++ show o.user ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "organization: " ++ show o.organization ++ ", " ++ show "organizationId: " ++ show o.organizationId ++ ", " ++ show "stat: " ++ show o.stat ++ ", " ++ show "like: " ++ show o.like ++ ", " ++ show "star: " ++ show o.star ++ ", " ++ show "permissions: " ++ show o.permissions ++ ", " ++ show "teams: " ++ show o.teams

newtype OrganizationPackResponses = OrganizationPackResponses {
  organizationPackResponses :: (Array OrganizationPackResponse)
}


type OrganizationPackResponsesR = {
  organizationPackResponses :: (Array OrganizationPackResponse)
}


_OrganizationPackResponses :: LensP OrganizationPackResponses {
  organizationPackResponses :: (Array OrganizationPackResponse)
}
_OrganizationPackResponses f (OrganizationPackResponses o) = OrganizationPackResponses <$> f o


mkOrganizationPackResponses :: (Array OrganizationPackResponse) -> OrganizationPackResponses
mkOrganizationPackResponses organizationPackResponses =
  OrganizationPackResponses{organizationPackResponses}


unwrapOrganizationPackResponses (OrganizationPackResponses r) = r

instance organizationPackResponsesEncodeJson :: EncodeJson OrganizationPackResponses where
  encodeJson (OrganizationPackResponses o) =
       "tag" := "OrganizationPackResponses"
    ~> "organization_pack_responses" := o.organizationPackResponses
    ~> jsonEmptyObject


instance organizationPackResponsesDecodeJson :: DecodeJson OrganizationPackResponses where
  decodeJson o = do
    obj <- decodeJson o
    organizationPackResponses <- obj .? "organization_pack_responses"
    pure $ OrganizationPackResponses {
      organizationPackResponses
    }


instance organizationPackResponsesRequestable :: Requestable OrganizationPackResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance organizationPackResponsesRespondable :: Respondable OrganizationPackResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkOrganizationPackResponses
      <$> readProp "organization_pack_responses" json


instance organizationPackResponsesIsForeign :: IsForeign OrganizationPackResponses where
  read json =
      mkOrganizationPackResponses
      <$> readProp "organization_pack_responses" json


instance organizationPackResponsesShow :: Show OrganizationPackResponses where
    show (OrganizationPackResponses o) = show "organizationPackResponses: " ++ show o.organizationPackResponses

newtype TeamPackResponse = TeamPackResponse {
  user :: UserSanitizedResponse,
  userId :: Int,
  team :: TeamResponse,
  teamId :: Int,
  stat :: TeamStatResponse,
  permissions :: Permissions
}


type TeamPackResponseR = {
  user :: UserSanitizedResponse,
  userId :: Int,
  team :: TeamResponse,
  teamId :: Int,
  stat :: TeamStatResponse,
  permissions :: Permissions
}


_TeamPackResponse :: LensP TeamPackResponse {
  user :: UserSanitizedResponse,
  userId :: Int,
  team :: TeamResponse,
  teamId :: Int,
  stat :: TeamStatResponse,
  permissions :: Permissions
}
_TeamPackResponse f (TeamPackResponse o) = TeamPackResponse <$> f o


mkTeamPackResponse :: UserSanitizedResponse -> Int -> TeamResponse -> Int -> TeamStatResponse -> Permissions -> TeamPackResponse
mkTeamPackResponse user userId team teamId stat permissions =
  TeamPackResponse{user, userId, team, teamId, stat, permissions}


unwrapTeamPackResponse (TeamPackResponse r) = r

instance teamPackResponseEncodeJson :: EncodeJson TeamPackResponse where
  encodeJson (TeamPackResponse o) =
       "tag" := "TeamPackResponse"
    ~> "user" := o.user
    ~> "user_id" := o.userId
    ~> "team" := o.team
    ~> "team_id" := o.teamId
    ~> "stat" := o.stat
    ~> "permissions" := o.permissions
    ~> jsonEmptyObject


instance teamPackResponseDecodeJson :: DecodeJson TeamPackResponse where
  decodeJson o = do
    obj <- decodeJson o
    user <- obj .? "user"
    userId <- obj .? "user_id"
    team <- obj .? "team"
    teamId <- obj .? "team_id"
    stat <- obj .? "stat"
    permissions <- obj .? "permissions"
    pure $ TeamPackResponse {
      user,
      userId,
      team,
      teamId,
      stat,
      permissions
    }


instance teamPackResponseRequestable :: Requestable TeamPackResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance teamPackResponseRespondable :: Respondable TeamPackResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkTeamPackResponse
      <$> readProp "user" json
      <*> readProp "user_id" json
      <*> readProp "team" json
      <*> readProp "team_id" json
      <*> readProp "stat" json
      <*> readProp "permissions" json


instance teamPackResponseIsForeign :: IsForeign TeamPackResponse where
  read json =
      mkTeamPackResponse
      <$> readProp "user" json
      <*> readProp "user_id" json
      <*> readProp "team" json
      <*> readProp "team_id" json
      <*> readProp "stat" json
      <*> readProp "permissions" json


instance teamPackResponseShow :: Show TeamPackResponse where
    show (TeamPackResponse o) = show "user: " ++ show o.user ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "team: " ++ show o.team ++ ", " ++ show "teamId: " ++ show o.teamId ++ ", " ++ show "stat: " ++ show o.stat ++ ", " ++ show "permissions: " ++ show o.permissions

newtype TeamPackResponses = TeamPackResponses {
  teamPackResponses :: (Array TeamPackResponse)
}


type TeamPackResponsesR = {
  teamPackResponses :: (Array TeamPackResponse)
}


_TeamPackResponses :: LensP TeamPackResponses {
  teamPackResponses :: (Array TeamPackResponse)
}
_TeamPackResponses f (TeamPackResponses o) = TeamPackResponses <$> f o


mkTeamPackResponses :: (Array TeamPackResponse) -> TeamPackResponses
mkTeamPackResponses teamPackResponses =
  TeamPackResponses{teamPackResponses}


unwrapTeamPackResponses (TeamPackResponses r) = r

instance teamPackResponsesEncodeJson :: EncodeJson TeamPackResponses where
  encodeJson (TeamPackResponses o) =
       "tag" := "TeamPackResponses"
    ~> "team_pack_responses" := o.teamPackResponses
    ~> jsonEmptyObject


instance teamPackResponsesDecodeJson :: DecodeJson TeamPackResponses where
  decodeJson o = do
    obj <- decodeJson o
    teamPackResponses <- obj .? "team_pack_responses"
    pure $ TeamPackResponses {
      teamPackResponses
    }


instance teamPackResponsesRequestable :: Requestable TeamPackResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance teamPackResponsesRespondable :: Respondable TeamPackResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkTeamPackResponses
      <$> readProp "team_pack_responses" json


instance teamPackResponsesIsForeign :: IsForeign TeamPackResponses where
  read json =
      mkTeamPackResponses
      <$> readProp "team_pack_responses" json


instance teamPackResponsesShow :: Show TeamPackResponses where
    show (TeamPackResponses o) = show "teamPackResponses: " ++ show o.teamPackResponses

newtype TeamMemberPackResponse = TeamMemberPackResponse {
  user :: UserSanitizedResponse,
  userId :: Int,
  teamMember :: TeamMemberResponse,
  teamMemberId :: Int,
  permissions :: Permissions
}


type TeamMemberPackResponseR = {
  user :: UserSanitizedResponse,
  userId :: Int,
  teamMember :: TeamMemberResponse,
  teamMemberId :: Int,
  permissions :: Permissions
}


_TeamMemberPackResponse :: LensP TeamMemberPackResponse {
  user :: UserSanitizedResponse,
  userId :: Int,
  teamMember :: TeamMemberResponse,
  teamMemberId :: Int,
  permissions :: Permissions
}
_TeamMemberPackResponse f (TeamMemberPackResponse o) = TeamMemberPackResponse <$> f o


mkTeamMemberPackResponse :: UserSanitizedResponse -> Int -> TeamMemberResponse -> Int -> Permissions -> TeamMemberPackResponse
mkTeamMemberPackResponse user userId teamMember teamMemberId permissions =
  TeamMemberPackResponse{user, userId, teamMember, teamMemberId, permissions}


unwrapTeamMemberPackResponse (TeamMemberPackResponse r) = r

instance teamMemberPackResponseEncodeJson :: EncodeJson TeamMemberPackResponse where
  encodeJson (TeamMemberPackResponse o) =
       "tag" := "TeamMemberPackResponse"
    ~> "user" := o.user
    ~> "user_id" := o.userId
    ~> "team_member" := o.teamMember
    ~> "team_member_id" := o.teamMemberId
    ~> "permissions" := o.permissions
    ~> jsonEmptyObject


instance teamMemberPackResponseDecodeJson :: DecodeJson TeamMemberPackResponse where
  decodeJson o = do
    obj <- decodeJson o
    user <- obj .? "user"
    userId <- obj .? "user_id"
    teamMember <- obj .? "team_member"
    teamMemberId <- obj .? "team_member_id"
    permissions <- obj .? "permissions"
    pure $ TeamMemberPackResponse {
      user,
      userId,
      teamMember,
      teamMemberId,
      permissions
    }


instance teamMemberPackResponseRequestable :: Requestable TeamMemberPackResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance teamMemberPackResponseRespondable :: Respondable TeamMemberPackResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkTeamMemberPackResponse
      <$> readProp "user" json
      <*> readProp "user_id" json
      <*> readProp "team_member" json
      <*> readProp "team_member_id" json
      <*> readProp "permissions" json


instance teamMemberPackResponseIsForeign :: IsForeign TeamMemberPackResponse where
  read json =
      mkTeamMemberPackResponse
      <$> readProp "user" json
      <*> readProp "user_id" json
      <*> readProp "team_member" json
      <*> readProp "team_member_id" json
      <*> readProp "permissions" json


instance teamMemberPackResponseShow :: Show TeamMemberPackResponse where
    show (TeamMemberPackResponse o) = show "user: " ++ show o.user ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "teamMember: " ++ show o.teamMember ++ ", " ++ show "teamMemberId: " ++ show o.teamMemberId ++ ", " ++ show "permissions: " ++ show o.permissions

newtype TeamMemberPackResponses = TeamMemberPackResponses {
  teamMemberPackResponses :: (Array TeamMemberPackResponse)
}


type TeamMemberPackResponsesR = {
  teamMemberPackResponses :: (Array TeamMemberPackResponse)
}


_TeamMemberPackResponses :: LensP TeamMemberPackResponses {
  teamMemberPackResponses :: (Array TeamMemberPackResponse)
}
_TeamMemberPackResponses f (TeamMemberPackResponses o) = TeamMemberPackResponses <$> f o


mkTeamMemberPackResponses :: (Array TeamMemberPackResponse) -> TeamMemberPackResponses
mkTeamMemberPackResponses teamMemberPackResponses =
  TeamMemberPackResponses{teamMemberPackResponses}


unwrapTeamMemberPackResponses (TeamMemberPackResponses r) = r

instance teamMemberPackResponsesEncodeJson :: EncodeJson TeamMemberPackResponses where
  encodeJson (TeamMemberPackResponses o) =
       "tag" := "TeamMemberPackResponses"
    ~> "team_member_pack_responses" := o.teamMemberPackResponses
    ~> jsonEmptyObject


instance teamMemberPackResponsesDecodeJson :: DecodeJson TeamMemberPackResponses where
  decodeJson o = do
    obj <- decodeJson o
    teamMemberPackResponses <- obj .? "team_member_pack_responses"
    pure $ TeamMemberPackResponses {
      teamMemberPackResponses
    }


instance teamMemberPackResponsesRequestable :: Requestable TeamMemberPackResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance teamMemberPackResponsesRespondable :: Respondable TeamMemberPackResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkTeamMemberPackResponses
      <$> readProp "team_member_pack_responses" json


instance teamMemberPackResponsesIsForeign :: IsForeign TeamMemberPackResponses where
  read json =
      mkTeamMemberPackResponses
      <$> readProp "team_member_pack_responses" json


instance teamMemberPackResponsesShow :: Show TeamMemberPackResponses where
    show (TeamMemberPackResponses o) = show "teamMemberPackResponses: " ++ show o.teamMemberPackResponses

newtype UserPackResponse = UserPackResponse {
  user :: UserResponse,
  userId :: Int,
  stat :: UserSanitizedStatResponse,
  profile :: ProfileResponse,
  profileId :: Int
}


type UserPackResponseR = {
  user :: UserResponse,
  userId :: Int,
  stat :: UserSanitizedStatResponse,
  profile :: ProfileResponse,
  profileId :: Int
}


_UserPackResponse :: LensP UserPackResponse {
  user :: UserResponse,
  userId :: Int,
  stat :: UserSanitizedStatResponse,
  profile :: ProfileResponse,
  profileId :: Int
}
_UserPackResponse f (UserPackResponse o) = UserPackResponse <$> f o


mkUserPackResponse :: UserResponse -> Int -> UserSanitizedStatResponse -> ProfileResponse -> Int -> UserPackResponse
mkUserPackResponse user userId stat profile profileId =
  UserPackResponse{user, userId, stat, profile, profileId}


unwrapUserPackResponse (UserPackResponse r) = r

instance userPackResponseEncodeJson :: EncodeJson UserPackResponse where
  encodeJson (UserPackResponse o) =
       "tag" := "UserPackResponse"
    ~> "user" := o.user
    ~> "user_id" := o.userId
    ~> "stat" := o.stat
    ~> "profile" := o.profile
    ~> "profile_id" := o.profileId
    ~> jsonEmptyObject


instance userPackResponseDecodeJson :: DecodeJson UserPackResponse where
  decodeJson o = do
    obj <- decodeJson o
    user <- obj .? "user"
    userId <- obj .? "user_id"
    stat <- obj .? "stat"
    profile <- obj .? "profile"
    profileId <- obj .? "profile_id"
    pure $ UserPackResponse {
      user,
      userId,
      stat,
      profile,
      profileId
    }


instance userPackResponseRequestable :: Requestable UserPackResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance userPackResponseRespondable :: Respondable UserPackResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkUserPackResponse
      <$> readProp "user" json
      <*> readProp "user_id" json
      <*> readProp "stat" json
      <*> readProp "profile" json
      <*> readProp "profile_id" json


instance userPackResponseIsForeign :: IsForeign UserPackResponse where
  read json =
      mkUserPackResponse
      <$> readProp "user" json
      <*> readProp "user_id" json
      <*> readProp "stat" json
      <*> readProp "profile" json
      <*> readProp "profile_id" json


instance userPackResponseShow :: Show UserPackResponse where
    show (UserPackResponse o) = show "user: " ++ show o.user ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "stat: " ++ show o.stat ++ ", " ++ show "profile: " ++ show o.profile ++ ", " ++ show "profileId: " ++ show o.profileId

newtype UserPackResponses = UserPackResponses {
  userPackResponses :: (Array UserPackResponse)
}


type UserPackResponsesR = {
  userPackResponses :: (Array UserPackResponse)
}


_UserPackResponses :: LensP UserPackResponses {
  userPackResponses :: (Array UserPackResponse)
}
_UserPackResponses f (UserPackResponses o) = UserPackResponses <$> f o


mkUserPackResponses :: (Array UserPackResponse) -> UserPackResponses
mkUserPackResponses userPackResponses =
  UserPackResponses{userPackResponses}


unwrapUserPackResponses (UserPackResponses r) = r

instance userPackResponsesEncodeJson :: EncodeJson UserPackResponses where
  encodeJson (UserPackResponses o) =
       "tag" := "UserPackResponses"
    ~> "user_pack_responses" := o.userPackResponses
    ~> jsonEmptyObject


instance userPackResponsesDecodeJson :: DecodeJson UserPackResponses where
  decodeJson o = do
    obj <- decodeJson o
    userPackResponses <- obj .? "user_pack_responses"
    pure $ UserPackResponses {
      userPackResponses
    }


instance userPackResponsesRequestable :: Requestable UserPackResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance userPackResponsesRespondable :: Respondable UserPackResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkUserPackResponses
      <$> readProp "user_pack_responses" json


instance userPackResponsesIsForeign :: IsForeign UserPackResponses where
  read json =
      mkUserPackResponses
      <$> readProp "user_pack_responses" json


instance userPackResponsesShow :: Show UserPackResponses where
    show (UserPackResponses o) = show "userPackResponses: " ++ show o.userPackResponses

newtype UserSanitizedPackResponse = UserSanitizedPackResponse {
  user :: UserSanitizedResponse,
  userId :: Int,
  profile :: ProfileResponse,
  profileId :: Int,
  stat :: UserSanitizedStatResponse,
  like :: (Maybe LikeResponse),
  star :: (Maybe StarResponse)
}


type UserSanitizedPackResponseR = {
  user :: UserSanitizedResponse,
  userId :: Int,
  profile :: ProfileResponse,
  profileId :: Int,
  stat :: UserSanitizedStatResponse,
  like :: (Maybe LikeResponse),
  star :: (Maybe StarResponse)
}


_UserSanitizedPackResponse :: LensP UserSanitizedPackResponse {
  user :: UserSanitizedResponse,
  userId :: Int,
  profile :: ProfileResponse,
  profileId :: Int,
  stat :: UserSanitizedStatResponse,
  like :: (Maybe LikeResponse),
  star :: (Maybe StarResponse)
}
_UserSanitizedPackResponse f (UserSanitizedPackResponse o) = UserSanitizedPackResponse <$> f o


mkUserSanitizedPackResponse :: UserSanitizedResponse -> Int -> ProfileResponse -> Int -> UserSanitizedStatResponse -> (Maybe LikeResponse) -> (Maybe StarResponse) -> UserSanitizedPackResponse
mkUserSanitizedPackResponse user userId profile profileId stat like star =
  UserSanitizedPackResponse{user, userId, profile, profileId, stat, like, star}


unwrapUserSanitizedPackResponse (UserSanitizedPackResponse r) = r

instance userSanitizedPackResponseEncodeJson :: EncodeJson UserSanitizedPackResponse where
  encodeJson (UserSanitizedPackResponse o) =
       "tag" := "UserSanitizedPackResponse"
    ~> "user" := o.user
    ~> "user_id" := o.userId
    ~> "profile" := o.profile
    ~> "profile_id" := o.profileId
    ~> "stat" := o.stat
    ~> "like" := o.like
    ~> "star" := o.star
    ~> jsonEmptyObject


instance userSanitizedPackResponseDecodeJson :: DecodeJson UserSanitizedPackResponse where
  decodeJson o = do
    obj <- decodeJson o
    user <- obj .? "user"
    userId <- obj .? "user_id"
    profile <- obj .? "profile"
    profileId <- obj .? "profile_id"
    stat <- obj .? "stat"
    like <- obj .? "like"
    star <- obj .? "star"
    pure $ UserSanitizedPackResponse {
      user,
      userId,
      profile,
      profileId,
      stat,
      like,
      star
    }


instance userSanitizedPackResponseRequestable :: Requestable UserSanitizedPackResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance userSanitizedPackResponseRespondable :: Respondable UserSanitizedPackResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkUserSanitizedPackResponse
      <$> readProp "user" json
      <*> readProp "user_id" json
      <*> readProp "profile" json
      <*> readProp "profile_id" json
      <*> readProp "stat" json
      <*> (runNullOrUndefined <$> readProp "like" json)
      <*> (runNullOrUndefined <$> readProp "star" json)


instance userSanitizedPackResponseIsForeign :: IsForeign UserSanitizedPackResponse where
  read json =
      mkUserSanitizedPackResponse
      <$> readProp "user" json
      <*> readProp "user_id" json
      <*> readProp "profile" json
      <*> readProp "profile_id" json
      <*> readProp "stat" json
      <*> (runNullOrUndefined <$> readProp "like" json)
      <*> (runNullOrUndefined <$> readProp "star" json)


instance userSanitizedPackResponseShow :: Show UserSanitizedPackResponse where
    show (UserSanitizedPackResponse o) = show "user: " ++ show o.user ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "profile: " ++ show o.profile ++ ", " ++ show "profileId: " ++ show o.profileId ++ ", " ++ show "stat: " ++ show o.stat ++ ", " ++ show "like: " ++ show o.like ++ ", " ++ show "star: " ++ show o.star

newtype UserSanitizedPackResponses = UserSanitizedPackResponses {
  userSanitizedPackResponses :: (Array UserSanitizedPackResponse)
}


type UserSanitizedPackResponsesR = {
  userSanitizedPackResponses :: (Array UserSanitizedPackResponse)
}


_UserSanitizedPackResponses :: LensP UserSanitizedPackResponses {
  userSanitizedPackResponses :: (Array UserSanitizedPackResponse)
}
_UserSanitizedPackResponses f (UserSanitizedPackResponses o) = UserSanitizedPackResponses <$> f o


mkUserSanitizedPackResponses :: (Array UserSanitizedPackResponse) -> UserSanitizedPackResponses
mkUserSanitizedPackResponses userSanitizedPackResponses =
  UserSanitizedPackResponses{userSanitizedPackResponses}


unwrapUserSanitizedPackResponses (UserSanitizedPackResponses r) = r

instance userSanitizedPackResponsesEncodeJson :: EncodeJson UserSanitizedPackResponses where
  encodeJson (UserSanitizedPackResponses o) =
       "tag" := "UserSanitizedPackResponses"
    ~> "user_sanitized_pack_responses" := o.userSanitizedPackResponses
    ~> jsonEmptyObject


instance userSanitizedPackResponsesDecodeJson :: DecodeJson UserSanitizedPackResponses where
  decodeJson o = do
    obj <- decodeJson o
    userSanitizedPackResponses <- obj .? "user_sanitized_pack_responses"
    pure $ UserSanitizedPackResponses {
      userSanitizedPackResponses
    }


instance userSanitizedPackResponsesRequestable :: Requestable UserSanitizedPackResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance userSanitizedPackResponsesRespondable :: Respondable UserSanitizedPackResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkUserSanitizedPackResponses
      <$> readProp "user_sanitized_pack_responses" json


instance userSanitizedPackResponsesIsForeign :: IsForeign UserSanitizedPackResponses where
  read json =
      mkUserSanitizedPackResponses
      <$> readProp "user_sanitized_pack_responses" json


instance userSanitizedPackResponsesShow :: Show UserSanitizedPackResponses where
    show (UserSanitizedPackResponses o) = show "userSanitizedPackResponses: " ++ show o.userSanitizedPackResponses

newtype GlobalGroupPackResponse = GlobalGroupPackResponse {
  user :: UserSanitizedResponse,
  userId :: Int,
  globalGroup :: GlobalGroupResponse,
  globalGroupId :: Int,
  stat :: GlobalGroupStatResponse,
  permissions :: Permissions
}


type GlobalGroupPackResponseR = {
  user :: UserSanitizedResponse,
  userId :: Int,
  globalGroup :: GlobalGroupResponse,
  globalGroupId :: Int,
  stat :: GlobalGroupStatResponse,
  permissions :: Permissions
}


_GlobalGroupPackResponse :: LensP GlobalGroupPackResponse {
  user :: UserSanitizedResponse,
  userId :: Int,
  globalGroup :: GlobalGroupResponse,
  globalGroupId :: Int,
  stat :: GlobalGroupStatResponse,
  permissions :: Permissions
}
_GlobalGroupPackResponse f (GlobalGroupPackResponse o) = GlobalGroupPackResponse <$> f o


mkGlobalGroupPackResponse :: UserSanitizedResponse -> Int -> GlobalGroupResponse -> Int -> GlobalGroupStatResponse -> Permissions -> GlobalGroupPackResponse
mkGlobalGroupPackResponse user userId globalGroup globalGroupId stat permissions =
  GlobalGroupPackResponse{user, userId, globalGroup, globalGroupId, stat, permissions}


unwrapGlobalGroupPackResponse (GlobalGroupPackResponse r) = r

instance globalGroupPackResponseEncodeJson :: EncodeJson GlobalGroupPackResponse where
  encodeJson (GlobalGroupPackResponse o) =
       "tag" := "GlobalGroupPackResponse"
    ~> "user" := o.user
    ~> "user_id" := o.userId
    ~> "global_group" := o.globalGroup
    ~> "global_group_id" := o.globalGroupId
    ~> "stat" := o.stat
    ~> "permissions" := o.permissions
    ~> jsonEmptyObject


instance globalGroupPackResponseDecodeJson :: DecodeJson GlobalGroupPackResponse where
  decodeJson o = do
    obj <- decodeJson o
    user <- obj .? "user"
    userId <- obj .? "user_id"
    globalGroup <- obj .? "global_group"
    globalGroupId <- obj .? "global_group_id"
    stat <- obj .? "stat"
    permissions <- obj .? "permissions"
    pure $ GlobalGroupPackResponse {
      user,
      userId,
      globalGroup,
      globalGroupId,
      stat,
      permissions
    }


instance globalGroupPackResponseRequestable :: Requestable GlobalGroupPackResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance globalGroupPackResponseRespondable :: Respondable GlobalGroupPackResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkGlobalGroupPackResponse
      <$> readProp "user" json
      <*> readProp "user_id" json
      <*> readProp "global_group" json
      <*> readProp "global_group_id" json
      <*> readProp "stat" json
      <*> readProp "permissions" json


instance globalGroupPackResponseIsForeign :: IsForeign GlobalGroupPackResponse where
  read json =
      mkGlobalGroupPackResponse
      <$> readProp "user" json
      <*> readProp "user_id" json
      <*> readProp "global_group" json
      <*> readProp "global_group_id" json
      <*> readProp "stat" json
      <*> readProp "permissions" json


instance globalGroupPackResponseShow :: Show GlobalGroupPackResponse where
    show (GlobalGroupPackResponse o) = show "user: " ++ show o.user ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "globalGroup: " ++ show o.globalGroup ++ ", " ++ show "globalGroupId: " ++ show o.globalGroupId ++ ", " ++ show "stat: " ++ show o.stat ++ ", " ++ show "permissions: " ++ show o.permissions

newtype GlobalGroupPackResponses = GlobalGroupPackResponses {
  globalGroupPackResponses :: (Array GlobalGroupPackResponse)
}


type GlobalGroupPackResponsesR = {
  globalGroupPackResponses :: (Array GlobalGroupPackResponse)
}


_GlobalGroupPackResponses :: LensP GlobalGroupPackResponses {
  globalGroupPackResponses :: (Array GlobalGroupPackResponse)
}
_GlobalGroupPackResponses f (GlobalGroupPackResponses o) = GlobalGroupPackResponses <$> f o


mkGlobalGroupPackResponses :: (Array GlobalGroupPackResponse) -> GlobalGroupPackResponses
mkGlobalGroupPackResponses globalGroupPackResponses =
  GlobalGroupPackResponses{globalGroupPackResponses}


unwrapGlobalGroupPackResponses (GlobalGroupPackResponses r) = r

instance globalGroupPackResponsesEncodeJson :: EncodeJson GlobalGroupPackResponses where
  encodeJson (GlobalGroupPackResponses o) =
       "tag" := "GlobalGroupPackResponses"
    ~> "global_group_pack_responses" := o.globalGroupPackResponses
    ~> jsonEmptyObject


instance globalGroupPackResponsesDecodeJson :: DecodeJson GlobalGroupPackResponses where
  decodeJson o = do
    obj <- decodeJson o
    globalGroupPackResponses <- obj .? "global_group_pack_responses"
    pure $ GlobalGroupPackResponses {
      globalGroupPackResponses
    }


instance globalGroupPackResponsesRequestable :: Requestable GlobalGroupPackResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance globalGroupPackResponsesRespondable :: Respondable GlobalGroupPackResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkGlobalGroupPackResponses
      <$> readProp "global_group_pack_responses" json


instance globalGroupPackResponsesIsForeign :: IsForeign GlobalGroupPackResponses where
  read json =
      mkGlobalGroupPackResponses
      <$> readProp "global_group_pack_responses" json


instance globalGroupPackResponsesShow :: Show GlobalGroupPackResponses where
    show (GlobalGroupPackResponses o) = show "globalGroupPackResponses: " ++ show o.globalGroupPackResponses

newtype GroupPackResponse = GroupPackResponse {
  user :: UserSanitizedResponse,
  userId :: Int,
  group :: GroupResponse,
  groupId :: Int,
  organization :: OrganizationResponse,
  organizationId :: Int,
  stat :: GroupStatResponse,
  permissions :: Permissions
}


type GroupPackResponseR = {
  user :: UserSanitizedResponse,
  userId :: Int,
  group :: GroupResponse,
  groupId :: Int,
  organization :: OrganizationResponse,
  organizationId :: Int,
  stat :: GroupStatResponse,
  permissions :: Permissions
}


_GroupPackResponse :: LensP GroupPackResponse {
  user :: UserSanitizedResponse,
  userId :: Int,
  group :: GroupResponse,
  groupId :: Int,
  organization :: OrganizationResponse,
  organizationId :: Int,
  stat :: GroupStatResponse,
  permissions :: Permissions
}
_GroupPackResponse f (GroupPackResponse o) = GroupPackResponse <$> f o


mkGroupPackResponse :: UserSanitizedResponse -> Int -> GroupResponse -> Int -> OrganizationResponse -> Int -> GroupStatResponse -> Permissions -> GroupPackResponse
mkGroupPackResponse user userId group groupId organization organizationId stat permissions =
  GroupPackResponse{user, userId, group, groupId, organization, organizationId, stat, permissions}


unwrapGroupPackResponse (GroupPackResponse r) = r

instance groupPackResponseEncodeJson :: EncodeJson GroupPackResponse where
  encodeJson (GroupPackResponse o) =
       "tag" := "GroupPackResponse"
    ~> "user" := o.user
    ~> "user_id" := o.userId
    ~> "group" := o.group
    ~> "group_id" := o.groupId
    ~> "organization" := o.organization
    ~> "organization_id" := o.organizationId
    ~> "stat" := o.stat
    ~> "permissions" := o.permissions
    ~> jsonEmptyObject


instance groupPackResponseDecodeJson :: DecodeJson GroupPackResponse where
  decodeJson o = do
    obj <- decodeJson o
    user <- obj .? "user"
    userId <- obj .? "user_id"
    group <- obj .? "group"
    groupId <- obj .? "group_id"
    organization <- obj .? "organization"
    organizationId <- obj .? "organization_id"
    stat <- obj .? "stat"
    permissions <- obj .? "permissions"
    pure $ GroupPackResponse {
      user,
      userId,
      group,
      groupId,
      organization,
      organizationId,
      stat,
      permissions
    }


instance groupPackResponseRequestable :: Requestable GroupPackResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance groupPackResponseRespondable :: Respondable GroupPackResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkGroupPackResponse
      <$> readProp "user" json
      <*> readProp "user_id" json
      <*> readProp "group" json
      <*> readProp "group_id" json
      <*> readProp "organization" json
      <*> readProp "organization_id" json
      <*> readProp "stat" json
      <*> readProp "permissions" json


instance groupPackResponseIsForeign :: IsForeign GroupPackResponse where
  read json =
      mkGroupPackResponse
      <$> readProp "user" json
      <*> readProp "user_id" json
      <*> readProp "group" json
      <*> readProp "group_id" json
      <*> readProp "organization" json
      <*> readProp "organization_id" json
      <*> readProp "stat" json
      <*> readProp "permissions" json


instance groupPackResponseShow :: Show GroupPackResponse where
    show (GroupPackResponse o) = show "user: " ++ show o.user ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "group: " ++ show o.group ++ ", " ++ show "groupId: " ++ show o.groupId ++ ", " ++ show "organization: " ++ show o.organization ++ ", " ++ show "organizationId: " ++ show o.organizationId ++ ", " ++ show "stat: " ++ show o.stat ++ ", " ++ show "permissions: " ++ show o.permissions

newtype GroupPackResponses = GroupPackResponses {
  groupPackResponses :: (Array GroupPackResponse)
}


type GroupPackResponsesR = {
  groupPackResponses :: (Array GroupPackResponse)
}


_GroupPackResponses :: LensP GroupPackResponses {
  groupPackResponses :: (Array GroupPackResponse)
}
_GroupPackResponses f (GroupPackResponses o) = GroupPackResponses <$> f o


mkGroupPackResponses :: (Array GroupPackResponse) -> GroupPackResponses
mkGroupPackResponses groupPackResponses =
  GroupPackResponses{groupPackResponses}


unwrapGroupPackResponses (GroupPackResponses r) = r

instance groupPackResponsesEncodeJson :: EncodeJson GroupPackResponses where
  encodeJson (GroupPackResponses o) =
       "tag" := "GroupPackResponses"
    ~> "group_pack_responses" := o.groupPackResponses
    ~> jsonEmptyObject


instance groupPackResponsesDecodeJson :: DecodeJson GroupPackResponses where
  decodeJson o = do
    obj <- decodeJson o
    groupPackResponses <- obj .? "group_pack_responses"
    pure $ GroupPackResponses {
      groupPackResponses
    }


instance groupPackResponsesRequestable :: Requestable GroupPackResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance groupPackResponsesRespondable :: Respondable GroupPackResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkGroupPackResponses
      <$> readProp "group_pack_responses" json


instance groupPackResponsesIsForeign :: IsForeign GroupPackResponses where
  read json =
      mkGroupPackResponses
      <$> readProp "group_pack_responses" json


instance groupPackResponsesShow :: Show GroupPackResponses where
    show (GroupPackResponses o) = show "groupPackResponses: " ++ show o.groupPackResponses

newtype GroupMemberPackResponse = GroupMemberPackResponse {
  user :: UserSanitizedResponse,
  userId :: Int,
  groupMember :: GroupMemberResponse,
  groupMemberId :: Int,
  isOwner :: Boolean
}


type GroupMemberPackResponseR = {
  user :: UserSanitizedResponse,
  userId :: Int,
  groupMember :: GroupMemberResponse,
  groupMemberId :: Int,
  isOwner :: Boolean
}


_GroupMemberPackResponse :: LensP GroupMemberPackResponse {
  user :: UserSanitizedResponse,
  userId :: Int,
  groupMember :: GroupMemberResponse,
  groupMemberId :: Int,
  isOwner :: Boolean
}
_GroupMemberPackResponse f (GroupMemberPackResponse o) = GroupMemberPackResponse <$> f o


mkGroupMemberPackResponse :: UserSanitizedResponse -> Int -> GroupMemberResponse -> Int -> Boolean -> GroupMemberPackResponse
mkGroupMemberPackResponse user userId groupMember groupMemberId isOwner =
  GroupMemberPackResponse{user, userId, groupMember, groupMemberId, isOwner}


unwrapGroupMemberPackResponse (GroupMemberPackResponse r) = r

instance groupMemberPackResponseEncodeJson :: EncodeJson GroupMemberPackResponse where
  encodeJson (GroupMemberPackResponse o) =
       "tag" := "GroupMemberPackResponse"
    ~> "user" := o.user
    ~> "user_id" := o.userId
    ~> "group_member" := o.groupMember
    ~> "group_member_id" := o.groupMemberId
    ~> "is_owner" := o.isOwner
    ~> jsonEmptyObject


instance groupMemberPackResponseDecodeJson :: DecodeJson GroupMemberPackResponse where
  decodeJson o = do
    obj <- decodeJson o
    user <- obj .? "user"
    userId <- obj .? "user_id"
    groupMember <- obj .? "group_member"
    groupMemberId <- obj .? "group_member_id"
    isOwner <- obj .? "is_owner"
    pure $ GroupMemberPackResponse {
      user,
      userId,
      groupMember,
      groupMemberId,
      isOwner
    }


instance groupMemberPackResponseRequestable :: Requestable GroupMemberPackResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance groupMemberPackResponseRespondable :: Respondable GroupMemberPackResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkGroupMemberPackResponse
      <$> readProp "user" json
      <*> readProp "user_id" json
      <*> readProp "group_member" json
      <*> readProp "group_member_id" json
      <*> readProp "is_owner" json


instance groupMemberPackResponseIsForeign :: IsForeign GroupMemberPackResponse where
  read json =
      mkGroupMemberPackResponse
      <$> readProp "user" json
      <*> readProp "user_id" json
      <*> readProp "group_member" json
      <*> readProp "group_member_id" json
      <*> readProp "is_owner" json


instance groupMemberPackResponseShow :: Show GroupMemberPackResponse where
    show (GroupMemberPackResponse o) = show "user: " ++ show o.user ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "groupMember: " ++ show o.groupMember ++ ", " ++ show "groupMemberId: " ++ show o.groupMemberId ++ ", " ++ show "isOwner: " ++ show o.isOwner

newtype GroupMemberPackResponses = GroupMemberPackResponses {
  groupMemberPackResponses :: (Array GroupMemberPackResponse)
}


type GroupMemberPackResponsesR = {
  groupMemberPackResponses :: (Array GroupMemberPackResponse)
}


_GroupMemberPackResponses :: LensP GroupMemberPackResponses {
  groupMemberPackResponses :: (Array GroupMemberPackResponse)
}
_GroupMemberPackResponses f (GroupMemberPackResponses o) = GroupMemberPackResponses <$> f o


mkGroupMemberPackResponses :: (Array GroupMemberPackResponse) -> GroupMemberPackResponses
mkGroupMemberPackResponses groupMemberPackResponses =
  GroupMemberPackResponses{groupMemberPackResponses}


unwrapGroupMemberPackResponses (GroupMemberPackResponses r) = r

instance groupMemberPackResponsesEncodeJson :: EncodeJson GroupMemberPackResponses where
  encodeJson (GroupMemberPackResponses o) =
       "tag" := "GroupMemberPackResponses"
    ~> "group_member_pack_responses" := o.groupMemberPackResponses
    ~> jsonEmptyObject


instance groupMemberPackResponsesDecodeJson :: DecodeJson GroupMemberPackResponses where
  decodeJson o = do
    obj <- decodeJson o
    groupMemberPackResponses <- obj .? "group_member_pack_responses"
    pure $ GroupMemberPackResponses {
      groupMemberPackResponses
    }


instance groupMemberPackResponsesRequestable :: Requestable GroupMemberPackResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance groupMemberPackResponsesRespondable :: Respondable GroupMemberPackResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkGroupMemberPackResponses
      <$> readProp "group_member_pack_responses" json


instance groupMemberPackResponsesIsForeign :: IsForeign GroupMemberPackResponses where
  read json =
      mkGroupMemberPackResponses
      <$> readProp "group_member_pack_responses" json


instance groupMemberPackResponsesShow :: Show GroupMemberPackResponses where
    show (GroupMemberPackResponses o) = show "groupMemberPackResponses: " ++ show o.groupMemberPackResponses

newtype ForumPackResponse = ForumPackResponse {
  forum :: ForumResponse,
  forumId :: Int,
  stat :: ForumStatResponse,
  like :: (Maybe LikeResponse),
  star :: (Maybe StarResponse),
  withOrganization :: (Maybe OrganizationResponse),
  permissions :: Permissions
}


type ForumPackResponseR = {
  forum :: ForumResponse,
  forumId :: Int,
  stat :: ForumStatResponse,
  like :: (Maybe LikeResponse),
  star :: (Maybe StarResponse),
  withOrganization :: (Maybe OrganizationResponse),
  permissions :: Permissions
}


_ForumPackResponse :: LensP ForumPackResponse {
  forum :: ForumResponse,
  forumId :: Int,
  stat :: ForumStatResponse,
  like :: (Maybe LikeResponse),
  star :: (Maybe StarResponse),
  withOrganization :: (Maybe OrganizationResponse),
  permissions :: Permissions
}
_ForumPackResponse f (ForumPackResponse o) = ForumPackResponse <$> f o


mkForumPackResponse :: ForumResponse -> Int -> ForumStatResponse -> (Maybe LikeResponse) -> (Maybe StarResponse) -> (Maybe OrganizationResponse) -> Permissions -> ForumPackResponse
mkForumPackResponse forum forumId stat like star withOrganization permissions =
  ForumPackResponse{forum, forumId, stat, like, star, withOrganization, permissions}


unwrapForumPackResponse (ForumPackResponse r) = r

instance forumPackResponseEncodeJson :: EncodeJson ForumPackResponse where
  encodeJson (ForumPackResponse o) =
       "tag" := "ForumPackResponse"
    ~> "forum" := o.forum
    ~> "forum_id" := o.forumId
    ~> "stat" := o.stat
    ~> "like" := o.like
    ~> "star" := o.star
    ~> "with_organization" := o.withOrganization
    ~> "permissions" := o.permissions
    ~> jsonEmptyObject


instance forumPackResponseDecodeJson :: DecodeJson ForumPackResponse where
  decodeJson o = do
    obj <- decodeJson o
    forum <- obj .? "forum"
    forumId <- obj .? "forum_id"
    stat <- obj .? "stat"
    like <- obj .? "like"
    star <- obj .? "star"
    withOrganization <- obj .? "with_organization"
    permissions <- obj .? "permissions"
    pure $ ForumPackResponse {
      forum,
      forumId,
      stat,
      like,
      star,
      withOrganization,
      permissions
    }


instance forumPackResponseRequestable :: Requestable ForumPackResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance forumPackResponseRespondable :: Respondable ForumPackResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkForumPackResponse
      <$> readProp "forum" json
      <*> readProp "forum_id" json
      <*> readProp "stat" json
      <*> (runNullOrUndefined <$> readProp "like" json)
      <*> (runNullOrUndefined <$> readProp "star" json)
      <*> (runNullOrUndefined <$> readProp "with_organization" json)
      <*> readProp "permissions" json


instance forumPackResponseIsForeign :: IsForeign ForumPackResponse where
  read json =
      mkForumPackResponse
      <$> readProp "forum" json
      <*> readProp "forum_id" json
      <*> readProp "stat" json
      <*> (runNullOrUndefined <$> readProp "like" json)
      <*> (runNullOrUndefined <$> readProp "star" json)
      <*> (runNullOrUndefined <$> readProp "with_organization" json)
      <*> readProp "permissions" json


instance forumPackResponseShow :: Show ForumPackResponse where
    show (ForumPackResponse o) = show "forum: " ++ show o.forum ++ ", " ++ show "forumId: " ++ show o.forumId ++ ", " ++ show "stat: " ++ show o.stat ++ ", " ++ show "like: " ++ show o.like ++ ", " ++ show "star: " ++ show o.star ++ ", " ++ show "withOrganization: " ++ show o.withOrganization ++ ", " ++ show "permissions: " ++ show o.permissions

newtype ForumPackResponses = ForumPackResponses {
  forumPackResponses :: (Array ForumPackResponse)
}


type ForumPackResponsesR = {
  forumPackResponses :: (Array ForumPackResponse)
}


_ForumPackResponses :: LensP ForumPackResponses {
  forumPackResponses :: (Array ForumPackResponse)
}
_ForumPackResponses f (ForumPackResponses o) = ForumPackResponses <$> f o


mkForumPackResponses :: (Array ForumPackResponse) -> ForumPackResponses
mkForumPackResponses forumPackResponses =
  ForumPackResponses{forumPackResponses}


unwrapForumPackResponses (ForumPackResponses r) = r

instance forumPackResponsesEncodeJson :: EncodeJson ForumPackResponses where
  encodeJson (ForumPackResponses o) =
       "tag" := "ForumPackResponses"
    ~> "forum_pack_responses" := o.forumPackResponses
    ~> jsonEmptyObject


instance forumPackResponsesDecodeJson :: DecodeJson ForumPackResponses where
  decodeJson o = do
    obj <- decodeJson o
    forumPackResponses <- obj .? "forum_pack_responses"
    pure $ ForumPackResponses {
      forumPackResponses
    }


instance forumPackResponsesRequestable :: Requestable ForumPackResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance forumPackResponsesRespondable :: Respondable ForumPackResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkForumPackResponses
      <$> readProp "forum_pack_responses" json


instance forumPackResponsesIsForeign :: IsForeign ForumPackResponses where
  read json =
      mkForumPackResponses
      <$> readProp "forum_pack_responses" json


instance forumPackResponsesShow :: Show ForumPackResponses where
    show (ForumPackResponses o) = show "forumPackResponses: " ++ show o.forumPackResponses

newtype BoardPackResponse = BoardPackResponse {
  board :: BoardResponse,
  boardId :: Int,
  stat :: BoardStatResponse,
  like :: (Maybe LikeResponse),
  star :: (Maybe StarResponse),
  latestThread :: (Maybe ThreadResponse),
  latestThreadPost :: (Maybe ThreadPostResponse),
  latestThreadPostUser :: (Maybe UserSanitizedResponse),
  withOrganization :: (Maybe OrganizationResponse),
  withForum :: (Maybe ForumResponse),
  permissions :: Permissions
}


type BoardPackResponseR = {
  board :: BoardResponse,
  boardId :: Int,
  stat :: BoardStatResponse,
  like :: (Maybe LikeResponse),
  star :: (Maybe StarResponse),
  latestThread :: (Maybe ThreadResponse),
  latestThreadPost :: (Maybe ThreadPostResponse),
  latestThreadPostUser :: (Maybe UserSanitizedResponse),
  withOrganization :: (Maybe OrganizationResponse),
  withForum :: (Maybe ForumResponse),
  permissions :: Permissions
}


_BoardPackResponse :: LensP BoardPackResponse {
  board :: BoardResponse,
  boardId :: Int,
  stat :: BoardStatResponse,
  like :: (Maybe LikeResponse),
  star :: (Maybe StarResponse),
  latestThread :: (Maybe ThreadResponse),
  latestThreadPost :: (Maybe ThreadPostResponse),
  latestThreadPostUser :: (Maybe UserSanitizedResponse),
  withOrganization :: (Maybe OrganizationResponse),
  withForum :: (Maybe ForumResponse),
  permissions :: Permissions
}
_BoardPackResponse f (BoardPackResponse o) = BoardPackResponse <$> f o


mkBoardPackResponse :: BoardResponse -> Int -> BoardStatResponse -> (Maybe LikeResponse) -> (Maybe StarResponse) -> (Maybe ThreadResponse) -> (Maybe ThreadPostResponse) -> (Maybe UserSanitizedResponse) -> (Maybe OrganizationResponse) -> (Maybe ForumResponse) -> Permissions -> BoardPackResponse
mkBoardPackResponse board boardId stat like star latestThread latestThreadPost latestThreadPostUser withOrganization withForum permissions =
  BoardPackResponse{board, boardId, stat, like, star, latestThread, latestThreadPost, latestThreadPostUser, withOrganization, withForum, permissions}


unwrapBoardPackResponse (BoardPackResponse r) = r

instance boardPackResponseEncodeJson :: EncodeJson BoardPackResponse where
  encodeJson (BoardPackResponse o) =
       "tag" := "BoardPackResponse"
    ~> "board" := o.board
    ~> "board_id" := o.boardId
    ~> "stat" := o.stat
    ~> "like" := o.like
    ~> "star" := o.star
    ~> "latest_thread" := o.latestThread
    ~> "latest_thread_post" := o.latestThreadPost
    ~> "latest_thread_post_user" := o.latestThreadPostUser
    ~> "with_organization" := o.withOrganization
    ~> "with_forum" := o.withForum
    ~> "permissions" := o.permissions
    ~> jsonEmptyObject


instance boardPackResponseDecodeJson :: DecodeJson BoardPackResponse where
  decodeJson o = do
    obj <- decodeJson o
    board <- obj .? "board"
    boardId <- obj .? "board_id"
    stat <- obj .? "stat"
    like <- obj .? "like"
    star <- obj .? "star"
    latestThread <- obj .? "latest_thread"
    latestThreadPost <- obj .? "latest_thread_post"
    latestThreadPostUser <- obj .? "latest_thread_post_user"
    withOrganization <- obj .? "with_organization"
    withForum <- obj .? "with_forum"
    permissions <- obj .? "permissions"
    pure $ BoardPackResponse {
      board,
      boardId,
      stat,
      like,
      star,
      latestThread,
      latestThreadPost,
      latestThreadPostUser,
      withOrganization,
      withForum,
      permissions
    }


instance boardPackResponseRequestable :: Requestable BoardPackResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance boardPackResponseRespondable :: Respondable BoardPackResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkBoardPackResponse
      <$> readProp "board" json
      <*> readProp "board_id" json
      <*> readProp "stat" json
      <*> (runNullOrUndefined <$> readProp "like" json)
      <*> (runNullOrUndefined <$> readProp "star" json)
      <*> (runNullOrUndefined <$> readProp "latest_thread" json)
      <*> (runNullOrUndefined <$> readProp "latest_thread_post" json)
      <*> (runNullOrUndefined <$> readProp "latest_thread_post_user" json)
      <*> (runNullOrUndefined <$> readProp "with_organization" json)
      <*> (runNullOrUndefined <$> readProp "with_forum" json)
      <*> readProp "permissions" json


instance boardPackResponseIsForeign :: IsForeign BoardPackResponse where
  read json =
      mkBoardPackResponse
      <$> readProp "board" json
      <*> readProp "board_id" json
      <*> readProp "stat" json
      <*> (runNullOrUndefined <$> readProp "like" json)
      <*> (runNullOrUndefined <$> readProp "star" json)
      <*> (runNullOrUndefined <$> readProp "latest_thread" json)
      <*> (runNullOrUndefined <$> readProp "latest_thread_post" json)
      <*> (runNullOrUndefined <$> readProp "latest_thread_post_user" json)
      <*> (runNullOrUndefined <$> readProp "with_organization" json)
      <*> (runNullOrUndefined <$> readProp "with_forum" json)
      <*> readProp "permissions" json


instance boardPackResponseShow :: Show BoardPackResponse where
    show (BoardPackResponse o) = show "board: " ++ show o.board ++ ", " ++ show "boardId: " ++ show o.boardId ++ ", " ++ show "stat: " ++ show o.stat ++ ", " ++ show "like: " ++ show o.like ++ ", " ++ show "star: " ++ show o.star ++ ", " ++ show "latestThread: " ++ show o.latestThread ++ ", " ++ show "latestThreadPost: " ++ show o.latestThreadPost ++ ", " ++ show "latestThreadPostUser: " ++ show o.latestThreadPostUser ++ ", " ++ show "withOrganization: " ++ show o.withOrganization ++ ", " ++ show "withForum: " ++ show o.withForum ++ ", " ++ show "permissions: " ++ show o.permissions

newtype BoardPackResponses = BoardPackResponses {
  boardPackResponses :: (Array BoardPackResponse)
}


type BoardPackResponsesR = {
  boardPackResponses :: (Array BoardPackResponse)
}


_BoardPackResponses :: LensP BoardPackResponses {
  boardPackResponses :: (Array BoardPackResponse)
}
_BoardPackResponses f (BoardPackResponses o) = BoardPackResponses <$> f o


mkBoardPackResponses :: (Array BoardPackResponse) -> BoardPackResponses
mkBoardPackResponses boardPackResponses =
  BoardPackResponses{boardPackResponses}


unwrapBoardPackResponses (BoardPackResponses r) = r

instance boardPackResponsesEncodeJson :: EncodeJson BoardPackResponses where
  encodeJson (BoardPackResponses o) =
       "tag" := "BoardPackResponses"
    ~> "board_pack_responses" := o.boardPackResponses
    ~> jsonEmptyObject


instance boardPackResponsesDecodeJson :: DecodeJson BoardPackResponses where
  decodeJson o = do
    obj <- decodeJson o
    boardPackResponses <- obj .? "board_pack_responses"
    pure $ BoardPackResponses {
      boardPackResponses
    }


instance boardPackResponsesRequestable :: Requestable BoardPackResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance boardPackResponsesRespondable :: Respondable BoardPackResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkBoardPackResponses
      <$> readProp "board_pack_responses" json


instance boardPackResponsesIsForeign :: IsForeign BoardPackResponses where
  read json =
      mkBoardPackResponses
      <$> readProp "board_pack_responses" json


instance boardPackResponsesShow :: Show BoardPackResponses where
    show (BoardPackResponses o) = show "boardPackResponses: " ++ show o.boardPackResponses

newtype ThreadPackResponse = ThreadPackResponse {
  thread :: ThreadResponse,
  threadId :: Int,
  user :: UserSanitizedResponse,
  userId :: Int,
  stat :: ThreadStatResponse,
  like :: (Maybe LikeResponse),
  star :: (Maybe StarResponse),
  latestThreadPost :: (Maybe ThreadPostResponse),
  latestThreadPostUser :: (Maybe UserSanitizedResponse),
  withOrganization :: (Maybe OrganizationResponse),
  withForum :: (Maybe ForumResponse),
  withBoard :: (Maybe BoardResponse),
  permissions :: Permissions
}


type ThreadPackResponseR = {
  thread :: ThreadResponse,
  threadId :: Int,
  user :: UserSanitizedResponse,
  userId :: Int,
  stat :: ThreadStatResponse,
  like :: (Maybe LikeResponse),
  star :: (Maybe StarResponse),
  latestThreadPost :: (Maybe ThreadPostResponse),
  latestThreadPostUser :: (Maybe UserSanitizedResponse),
  withOrganization :: (Maybe OrganizationResponse),
  withForum :: (Maybe ForumResponse),
  withBoard :: (Maybe BoardResponse),
  permissions :: Permissions
}


_ThreadPackResponse :: LensP ThreadPackResponse {
  thread :: ThreadResponse,
  threadId :: Int,
  user :: UserSanitizedResponse,
  userId :: Int,
  stat :: ThreadStatResponse,
  like :: (Maybe LikeResponse),
  star :: (Maybe StarResponse),
  latestThreadPost :: (Maybe ThreadPostResponse),
  latestThreadPostUser :: (Maybe UserSanitizedResponse),
  withOrganization :: (Maybe OrganizationResponse),
  withForum :: (Maybe ForumResponse),
  withBoard :: (Maybe BoardResponse),
  permissions :: Permissions
}
_ThreadPackResponse f (ThreadPackResponse o) = ThreadPackResponse <$> f o


mkThreadPackResponse :: ThreadResponse -> Int -> UserSanitizedResponse -> Int -> ThreadStatResponse -> (Maybe LikeResponse) -> (Maybe StarResponse) -> (Maybe ThreadPostResponse) -> (Maybe UserSanitizedResponse) -> (Maybe OrganizationResponse) -> (Maybe ForumResponse) -> (Maybe BoardResponse) -> Permissions -> ThreadPackResponse
mkThreadPackResponse thread threadId user userId stat like star latestThreadPost latestThreadPostUser withOrganization withForum withBoard permissions =
  ThreadPackResponse{thread, threadId, user, userId, stat, like, star, latestThreadPost, latestThreadPostUser, withOrganization, withForum, withBoard, permissions}


unwrapThreadPackResponse (ThreadPackResponse r) = r

instance threadPackResponseEncodeJson :: EncodeJson ThreadPackResponse where
  encodeJson (ThreadPackResponse o) =
       "tag" := "ThreadPackResponse"
    ~> "thread" := o.thread
    ~> "thread_id" := o.threadId
    ~> "user" := o.user
    ~> "user_id" := o.userId
    ~> "stat" := o.stat
    ~> "like" := o.like
    ~> "star" := o.star
    ~> "latest_thread_post" := o.latestThreadPost
    ~> "latest_thread_post_user" := o.latestThreadPostUser
    ~> "with_organization" := o.withOrganization
    ~> "with_forum" := o.withForum
    ~> "with_board" := o.withBoard
    ~> "permissions" := o.permissions
    ~> jsonEmptyObject


instance threadPackResponseDecodeJson :: DecodeJson ThreadPackResponse where
  decodeJson o = do
    obj <- decodeJson o
    thread <- obj .? "thread"
    threadId <- obj .? "thread_id"
    user <- obj .? "user"
    userId <- obj .? "user_id"
    stat <- obj .? "stat"
    like <- obj .? "like"
    star <- obj .? "star"
    latestThreadPost <- obj .? "latest_thread_post"
    latestThreadPostUser <- obj .? "latest_thread_post_user"
    withOrganization <- obj .? "with_organization"
    withForum <- obj .? "with_forum"
    withBoard <- obj .? "with_board"
    permissions <- obj .? "permissions"
    pure $ ThreadPackResponse {
      thread,
      threadId,
      user,
      userId,
      stat,
      like,
      star,
      latestThreadPost,
      latestThreadPostUser,
      withOrganization,
      withForum,
      withBoard,
      permissions
    }


instance threadPackResponseRequestable :: Requestable ThreadPackResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance threadPackResponseRespondable :: Respondable ThreadPackResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkThreadPackResponse
      <$> readProp "thread" json
      <*> readProp "thread_id" json
      <*> readProp "user" json
      <*> readProp "user_id" json
      <*> readProp "stat" json
      <*> (runNullOrUndefined <$> readProp "like" json)
      <*> (runNullOrUndefined <$> readProp "star" json)
      <*> (runNullOrUndefined <$> readProp "latest_thread_post" json)
      <*> (runNullOrUndefined <$> readProp "latest_thread_post_user" json)
      <*> (runNullOrUndefined <$> readProp "with_organization" json)
      <*> (runNullOrUndefined <$> readProp "with_forum" json)
      <*> (runNullOrUndefined <$> readProp "with_board" json)
      <*> readProp "permissions" json


instance threadPackResponseIsForeign :: IsForeign ThreadPackResponse where
  read json =
      mkThreadPackResponse
      <$> readProp "thread" json
      <*> readProp "thread_id" json
      <*> readProp "user" json
      <*> readProp "user_id" json
      <*> readProp "stat" json
      <*> (runNullOrUndefined <$> readProp "like" json)
      <*> (runNullOrUndefined <$> readProp "star" json)
      <*> (runNullOrUndefined <$> readProp "latest_thread_post" json)
      <*> (runNullOrUndefined <$> readProp "latest_thread_post_user" json)
      <*> (runNullOrUndefined <$> readProp "with_organization" json)
      <*> (runNullOrUndefined <$> readProp "with_forum" json)
      <*> (runNullOrUndefined <$> readProp "with_board" json)
      <*> readProp "permissions" json


instance threadPackResponseShow :: Show ThreadPackResponse where
    show (ThreadPackResponse o) = show "thread: " ++ show o.thread ++ ", " ++ show "threadId: " ++ show o.threadId ++ ", " ++ show "user: " ++ show o.user ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "stat: " ++ show o.stat ++ ", " ++ show "like: " ++ show o.like ++ ", " ++ show "star: " ++ show o.star ++ ", " ++ show "latestThreadPost: " ++ show o.latestThreadPost ++ ", " ++ show "latestThreadPostUser: " ++ show o.latestThreadPostUser ++ ", " ++ show "withOrganization: " ++ show o.withOrganization ++ ", " ++ show "withForum: " ++ show o.withForum ++ ", " ++ show "withBoard: " ++ show o.withBoard ++ ", " ++ show "permissions: " ++ show o.permissions

newtype ThreadPackResponses = ThreadPackResponses {
  threadPackResponses :: (Array ThreadPackResponse)
}


type ThreadPackResponsesR = {
  threadPackResponses :: (Array ThreadPackResponse)
}


_ThreadPackResponses :: LensP ThreadPackResponses {
  threadPackResponses :: (Array ThreadPackResponse)
}
_ThreadPackResponses f (ThreadPackResponses o) = ThreadPackResponses <$> f o


mkThreadPackResponses :: (Array ThreadPackResponse) -> ThreadPackResponses
mkThreadPackResponses threadPackResponses =
  ThreadPackResponses{threadPackResponses}


unwrapThreadPackResponses (ThreadPackResponses r) = r

instance threadPackResponsesEncodeJson :: EncodeJson ThreadPackResponses where
  encodeJson (ThreadPackResponses o) =
       "tag" := "ThreadPackResponses"
    ~> "thread_pack_responses" := o.threadPackResponses
    ~> jsonEmptyObject


instance threadPackResponsesDecodeJson :: DecodeJson ThreadPackResponses where
  decodeJson o = do
    obj <- decodeJson o
    threadPackResponses <- obj .? "thread_pack_responses"
    pure $ ThreadPackResponses {
      threadPackResponses
    }


instance threadPackResponsesRequestable :: Requestable ThreadPackResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance threadPackResponsesRespondable :: Respondable ThreadPackResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkThreadPackResponses
      <$> readProp "thread_pack_responses" json


instance threadPackResponsesIsForeign :: IsForeign ThreadPackResponses where
  read json =
      mkThreadPackResponses
      <$> readProp "thread_pack_responses" json


instance threadPackResponsesShow :: Show ThreadPackResponses where
    show (ThreadPackResponses o) = show "threadPackResponses: " ++ show o.threadPackResponses

newtype ThreadPostPackResponse = ThreadPostPackResponse {
  threadPost :: ThreadPostResponse,
  threadPostId :: Int,
  user :: UserSanitizedResponse,
  userId :: Int,
  stat :: ThreadPostStatResponse,
  like :: (Maybe LikeResponse),
  star :: (Maybe StarResponse),
  withOrganization :: (Maybe OrganizationResponse),
  withForum :: (Maybe ForumResponse),
  withBoard :: (Maybe BoardResponse),
  withThread :: (Maybe ThreadResponse),
  permissions :: Permissions
}


type ThreadPostPackResponseR = {
  threadPost :: ThreadPostResponse,
  threadPostId :: Int,
  user :: UserSanitizedResponse,
  userId :: Int,
  stat :: ThreadPostStatResponse,
  like :: (Maybe LikeResponse),
  star :: (Maybe StarResponse),
  withOrganization :: (Maybe OrganizationResponse),
  withForum :: (Maybe ForumResponse),
  withBoard :: (Maybe BoardResponse),
  withThread :: (Maybe ThreadResponse),
  permissions :: Permissions
}


_ThreadPostPackResponse :: LensP ThreadPostPackResponse {
  threadPost :: ThreadPostResponse,
  threadPostId :: Int,
  user :: UserSanitizedResponse,
  userId :: Int,
  stat :: ThreadPostStatResponse,
  like :: (Maybe LikeResponse),
  star :: (Maybe StarResponse),
  withOrganization :: (Maybe OrganizationResponse),
  withForum :: (Maybe ForumResponse),
  withBoard :: (Maybe BoardResponse),
  withThread :: (Maybe ThreadResponse),
  permissions :: Permissions
}
_ThreadPostPackResponse f (ThreadPostPackResponse o) = ThreadPostPackResponse <$> f o


mkThreadPostPackResponse :: ThreadPostResponse -> Int -> UserSanitizedResponse -> Int -> ThreadPostStatResponse -> (Maybe LikeResponse) -> (Maybe StarResponse) -> (Maybe OrganizationResponse) -> (Maybe ForumResponse) -> (Maybe BoardResponse) -> (Maybe ThreadResponse) -> Permissions -> ThreadPostPackResponse
mkThreadPostPackResponse threadPost threadPostId user userId stat like star withOrganization withForum withBoard withThread permissions =
  ThreadPostPackResponse{threadPost, threadPostId, user, userId, stat, like, star, withOrganization, withForum, withBoard, withThread, permissions}


unwrapThreadPostPackResponse (ThreadPostPackResponse r) = r

instance threadPostPackResponseEncodeJson :: EncodeJson ThreadPostPackResponse where
  encodeJson (ThreadPostPackResponse o) =
       "tag" := "ThreadPostPackResponse"
    ~> "thread_post" := o.threadPost
    ~> "thread_post_id" := o.threadPostId
    ~> "user" := o.user
    ~> "user_id" := o.userId
    ~> "stat" := o.stat
    ~> "like" := o.like
    ~> "star" := o.star
    ~> "with_organization" := o.withOrganization
    ~> "with_forum" := o.withForum
    ~> "with_board" := o.withBoard
    ~> "with_thread" := o.withThread
    ~> "permissions" := o.permissions
    ~> jsonEmptyObject


instance threadPostPackResponseDecodeJson :: DecodeJson ThreadPostPackResponse where
  decodeJson o = do
    obj <- decodeJson o
    threadPost <- obj .? "thread_post"
    threadPostId <- obj .? "thread_post_id"
    user <- obj .? "user"
    userId <- obj .? "user_id"
    stat <- obj .? "stat"
    like <- obj .? "like"
    star <- obj .? "star"
    withOrganization <- obj .? "with_organization"
    withForum <- obj .? "with_forum"
    withBoard <- obj .? "with_board"
    withThread <- obj .? "with_thread"
    permissions <- obj .? "permissions"
    pure $ ThreadPostPackResponse {
      threadPost,
      threadPostId,
      user,
      userId,
      stat,
      like,
      star,
      withOrganization,
      withForum,
      withBoard,
      withThread,
      permissions
    }


instance threadPostPackResponseRequestable :: Requestable ThreadPostPackResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance threadPostPackResponseRespondable :: Respondable ThreadPostPackResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkThreadPostPackResponse
      <$> readProp "thread_post" json
      <*> readProp "thread_post_id" json
      <*> readProp "user" json
      <*> readProp "user_id" json
      <*> readProp "stat" json
      <*> (runNullOrUndefined <$> readProp "like" json)
      <*> (runNullOrUndefined <$> readProp "star" json)
      <*> (runNullOrUndefined <$> readProp "with_organization" json)
      <*> (runNullOrUndefined <$> readProp "with_forum" json)
      <*> (runNullOrUndefined <$> readProp "with_board" json)
      <*> (runNullOrUndefined <$> readProp "with_thread" json)
      <*> readProp "permissions" json


instance threadPostPackResponseIsForeign :: IsForeign ThreadPostPackResponse where
  read json =
      mkThreadPostPackResponse
      <$> readProp "thread_post" json
      <*> readProp "thread_post_id" json
      <*> readProp "user" json
      <*> readProp "user_id" json
      <*> readProp "stat" json
      <*> (runNullOrUndefined <$> readProp "like" json)
      <*> (runNullOrUndefined <$> readProp "star" json)
      <*> (runNullOrUndefined <$> readProp "with_organization" json)
      <*> (runNullOrUndefined <$> readProp "with_forum" json)
      <*> (runNullOrUndefined <$> readProp "with_board" json)
      <*> (runNullOrUndefined <$> readProp "with_thread" json)
      <*> readProp "permissions" json


instance threadPostPackResponseShow :: Show ThreadPostPackResponse where
    show (ThreadPostPackResponse o) = show "threadPost: " ++ show o.threadPost ++ ", " ++ show "threadPostId: " ++ show o.threadPostId ++ ", " ++ show "user: " ++ show o.user ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "stat: " ++ show o.stat ++ ", " ++ show "like: " ++ show o.like ++ ", " ++ show "star: " ++ show o.star ++ ", " ++ show "withOrganization: " ++ show o.withOrganization ++ ", " ++ show "withForum: " ++ show o.withForum ++ ", " ++ show "withBoard: " ++ show o.withBoard ++ ", " ++ show "withThread: " ++ show o.withThread ++ ", " ++ show "permissions: " ++ show o.permissions

newtype ThreadPostPackResponses = ThreadPostPackResponses {
  threadPostPackResponses :: (Array ThreadPostPackResponse)
}


type ThreadPostPackResponsesR = {
  threadPostPackResponses :: (Array ThreadPostPackResponse)
}


_ThreadPostPackResponses :: LensP ThreadPostPackResponses {
  threadPostPackResponses :: (Array ThreadPostPackResponse)
}
_ThreadPostPackResponses f (ThreadPostPackResponses o) = ThreadPostPackResponses <$> f o


mkThreadPostPackResponses :: (Array ThreadPostPackResponse) -> ThreadPostPackResponses
mkThreadPostPackResponses threadPostPackResponses =
  ThreadPostPackResponses{threadPostPackResponses}


unwrapThreadPostPackResponses (ThreadPostPackResponses r) = r

instance threadPostPackResponsesEncodeJson :: EncodeJson ThreadPostPackResponses where
  encodeJson (ThreadPostPackResponses o) =
       "tag" := "ThreadPostPackResponses"
    ~> "thread_post_pack_responses" := o.threadPostPackResponses
    ~> jsonEmptyObject


instance threadPostPackResponsesDecodeJson :: DecodeJson ThreadPostPackResponses where
  decodeJson o = do
    obj <- decodeJson o
    threadPostPackResponses <- obj .? "thread_post_pack_responses"
    pure $ ThreadPostPackResponses {
      threadPostPackResponses
    }


instance threadPostPackResponsesRequestable :: Requestable ThreadPostPackResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance threadPostPackResponsesRespondable :: Respondable ThreadPostPackResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkThreadPostPackResponses
      <$> readProp "thread_post_pack_responses" json


instance threadPostPackResponsesIsForeign :: IsForeign ThreadPostPackResponses where
  read json =
      mkThreadPostPackResponses
      <$> readProp "thread_post_pack_responses" json


instance threadPostPackResponsesShow :: Show ThreadPostPackResponses where
    show (ThreadPostPackResponses o) = show "threadPostPackResponses: " ++ show o.threadPostPackResponses

newtype ResourcePackResponse = ResourcePackResponse {
  resource :: ResourceResponse,
  resourceId :: Int,
  user :: UserSanitizedResponse,
  userId :: Int,
  stat :: ResourceStatResponse,
  like :: (Maybe LikeResponse),
  star :: (Maybe StarResponse),
  permissions :: Permissions
}


type ResourcePackResponseR = {
  resource :: ResourceResponse,
  resourceId :: Int,
  user :: UserSanitizedResponse,
  userId :: Int,
  stat :: ResourceStatResponse,
  like :: (Maybe LikeResponse),
  star :: (Maybe StarResponse),
  permissions :: Permissions
}


_ResourcePackResponse :: LensP ResourcePackResponse {
  resource :: ResourceResponse,
  resourceId :: Int,
  user :: UserSanitizedResponse,
  userId :: Int,
  stat :: ResourceStatResponse,
  like :: (Maybe LikeResponse),
  star :: (Maybe StarResponse),
  permissions :: Permissions
}
_ResourcePackResponse f (ResourcePackResponse o) = ResourcePackResponse <$> f o


mkResourcePackResponse :: ResourceResponse -> Int -> UserSanitizedResponse -> Int -> ResourceStatResponse -> (Maybe LikeResponse) -> (Maybe StarResponse) -> Permissions -> ResourcePackResponse
mkResourcePackResponse resource resourceId user userId stat like star permissions =
  ResourcePackResponse{resource, resourceId, user, userId, stat, like, star, permissions}


unwrapResourcePackResponse (ResourcePackResponse r) = r

instance resourcePackResponseEncodeJson :: EncodeJson ResourcePackResponse where
  encodeJson (ResourcePackResponse o) =
       "tag" := "ResourcePackResponse"
    ~> "resource" := o.resource
    ~> "resource_id" := o.resourceId
    ~> "user" := o.user
    ~> "user_id" := o.userId
    ~> "stat" := o.stat
    ~> "like" := o.like
    ~> "star" := o.star
    ~> "permissions" := o.permissions
    ~> jsonEmptyObject


instance resourcePackResponseDecodeJson :: DecodeJson ResourcePackResponse where
  decodeJson o = do
    obj <- decodeJson o
    resource <- obj .? "resource"
    resourceId <- obj .? "resource_id"
    user <- obj .? "user"
    userId <- obj .? "user_id"
    stat <- obj .? "stat"
    like <- obj .? "like"
    star <- obj .? "star"
    permissions <- obj .? "permissions"
    pure $ ResourcePackResponse {
      resource,
      resourceId,
      user,
      userId,
      stat,
      like,
      star,
      permissions
    }


instance resourcePackResponseRequestable :: Requestable ResourcePackResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance resourcePackResponseRespondable :: Respondable ResourcePackResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkResourcePackResponse
      <$> readProp "resource" json
      <*> readProp "resource_id" json
      <*> readProp "user" json
      <*> readProp "user_id" json
      <*> readProp "stat" json
      <*> (runNullOrUndefined <$> readProp "like" json)
      <*> (runNullOrUndefined <$> readProp "star" json)
      <*> readProp "permissions" json


instance resourcePackResponseIsForeign :: IsForeign ResourcePackResponse where
  read json =
      mkResourcePackResponse
      <$> readProp "resource" json
      <*> readProp "resource_id" json
      <*> readProp "user" json
      <*> readProp "user_id" json
      <*> readProp "stat" json
      <*> (runNullOrUndefined <$> readProp "like" json)
      <*> (runNullOrUndefined <$> readProp "star" json)
      <*> readProp "permissions" json


instance resourcePackResponseShow :: Show ResourcePackResponse where
    show (ResourcePackResponse o) = show "resource: " ++ show o.resource ++ ", " ++ show "resourceId: " ++ show o.resourceId ++ ", " ++ show "user: " ++ show o.user ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "stat: " ++ show o.stat ++ ", " ++ show "like: " ++ show o.like ++ ", " ++ show "star: " ++ show o.star ++ ", " ++ show "permissions: " ++ show o.permissions

newtype ResourcePackResponses = ResourcePackResponses {
  resourcePackResponses :: (Array ResourcePackResponse)
}


type ResourcePackResponsesR = {
  resourcePackResponses :: (Array ResourcePackResponse)
}


_ResourcePackResponses :: LensP ResourcePackResponses {
  resourcePackResponses :: (Array ResourcePackResponse)
}
_ResourcePackResponses f (ResourcePackResponses o) = ResourcePackResponses <$> f o


mkResourcePackResponses :: (Array ResourcePackResponse) -> ResourcePackResponses
mkResourcePackResponses resourcePackResponses =
  ResourcePackResponses{resourcePackResponses}


unwrapResourcePackResponses (ResourcePackResponses r) = r

instance resourcePackResponsesEncodeJson :: EncodeJson ResourcePackResponses where
  encodeJson (ResourcePackResponses o) =
       "tag" := "ResourcePackResponses"
    ~> "resource_pack_responses" := o.resourcePackResponses
    ~> jsonEmptyObject


instance resourcePackResponsesDecodeJson :: DecodeJson ResourcePackResponses where
  decodeJson o = do
    obj <- decodeJson o
    resourcePackResponses <- obj .? "resource_pack_responses"
    pure $ ResourcePackResponses {
      resourcePackResponses
    }


instance resourcePackResponsesRequestable :: Requestable ResourcePackResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance resourcePackResponsesRespondable :: Respondable ResourcePackResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkResourcePackResponses
      <$> readProp "resource_pack_responses" json


instance resourcePackResponsesIsForeign :: IsForeign ResourcePackResponses where
  read json =
      mkResourcePackResponses
      <$> readProp "resource_pack_responses" json


instance resourcePackResponsesShow :: Show ResourcePackResponses where
    show (ResourcePackResponses o) = show "resourcePackResponses: " ++ show o.resourcePackResponses

newtype LeuronPackResponse = LeuronPackResponse {
  leuron :: LeuronResponse,
  leuronId :: Int,
  user :: UserSanitizedResponse,
  userId :: Int,
  training :: LeuronTrainingResponse,
  stat :: LeuronStatResponse,
  like :: (Maybe LikeResponse),
  star :: (Maybe StarResponse),
  permissions :: Permissions
}


type LeuronPackResponseR = {
  leuron :: LeuronResponse,
  leuronId :: Int,
  user :: UserSanitizedResponse,
  userId :: Int,
  training :: LeuronTrainingResponse,
  stat :: LeuronStatResponse,
  like :: (Maybe LikeResponse),
  star :: (Maybe StarResponse),
  permissions :: Permissions
}


_LeuronPackResponse :: LensP LeuronPackResponse {
  leuron :: LeuronResponse,
  leuronId :: Int,
  user :: UserSanitizedResponse,
  userId :: Int,
  training :: LeuronTrainingResponse,
  stat :: LeuronStatResponse,
  like :: (Maybe LikeResponse),
  star :: (Maybe StarResponse),
  permissions :: Permissions
}
_LeuronPackResponse f (LeuronPackResponse o) = LeuronPackResponse <$> f o


mkLeuronPackResponse :: LeuronResponse -> Int -> UserSanitizedResponse -> Int -> LeuronTrainingResponse -> LeuronStatResponse -> (Maybe LikeResponse) -> (Maybe StarResponse) -> Permissions -> LeuronPackResponse
mkLeuronPackResponse leuron leuronId user userId training stat like star permissions =
  LeuronPackResponse{leuron, leuronId, user, userId, training, stat, like, star, permissions}


unwrapLeuronPackResponse (LeuronPackResponse r) = r

instance leuronPackResponseEncodeJson :: EncodeJson LeuronPackResponse where
  encodeJson (LeuronPackResponse o) =
       "tag" := "LeuronPackResponse"
    ~> "leuron" := o.leuron
    ~> "leuron_id" := o.leuronId
    ~> "user" := o.user
    ~> "user_id" := o.userId
    ~> "training" := o.training
    ~> "stat" := o.stat
    ~> "like" := o.like
    ~> "star" := o.star
    ~> "permissions" := o.permissions
    ~> jsonEmptyObject


instance leuronPackResponseDecodeJson :: DecodeJson LeuronPackResponse where
  decodeJson o = do
    obj <- decodeJson o
    leuron <- obj .? "leuron"
    leuronId <- obj .? "leuron_id"
    user <- obj .? "user"
    userId <- obj .? "user_id"
    training <- obj .? "training"
    stat <- obj .? "stat"
    like <- obj .? "like"
    star <- obj .? "star"
    permissions <- obj .? "permissions"
    pure $ LeuronPackResponse {
      leuron,
      leuronId,
      user,
      userId,
      training,
      stat,
      like,
      star,
      permissions
    }


instance leuronPackResponseRequestable :: Requestable LeuronPackResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance leuronPackResponseRespondable :: Respondable LeuronPackResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkLeuronPackResponse
      <$> readProp "leuron" json
      <*> readProp "leuron_id" json
      <*> readProp "user" json
      <*> readProp "user_id" json
      <*> readProp "training" json
      <*> readProp "stat" json
      <*> (runNullOrUndefined <$> readProp "like" json)
      <*> (runNullOrUndefined <$> readProp "star" json)
      <*> readProp "permissions" json


instance leuronPackResponseIsForeign :: IsForeign LeuronPackResponse where
  read json =
      mkLeuronPackResponse
      <$> readProp "leuron" json
      <*> readProp "leuron_id" json
      <*> readProp "user" json
      <*> readProp "user_id" json
      <*> readProp "training" json
      <*> readProp "stat" json
      <*> (runNullOrUndefined <$> readProp "like" json)
      <*> (runNullOrUndefined <$> readProp "star" json)
      <*> readProp "permissions" json


instance leuronPackResponseShow :: Show LeuronPackResponse where
    show (LeuronPackResponse o) = show "leuron: " ++ show o.leuron ++ ", " ++ show "leuronId: " ++ show o.leuronId ++ ", " ++ show "user: " ++ show o.user ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "training: " ++ show o.training ++ ", " ++ show "stat: " ++ show o.stat ++ ", " ++ show "like: " ++ show o.like ++ ", " ++ show "star: " ++ show o.star ++ ", " ++ show "permissions: " ++ show o.permissions

newtype LeuronPackResponses = LeuronPackResponses {
  leuronPackResponses :: (Array LeuronPackResponse)
}


type LeuronPackResponsesR = {
  leuronPackResponses :: (Array LeuronPackResponse)
}


_LeuronPackResponses :: LensP LeuronPackResponses {
  leuronPackResponses :: (Array LeuronPackResponse)
}
_LeuronPackResponses f (LeuronPackResponses o) = LeuronPackResponses <$> f o


mkLeuronPackResponses :: (Array LeuronPackResponse) -> LeuronPackResponses
mkLeuronPackResponses leuronPackResponses =
  LeuronPackResponses{leuronPackResponses}


unwrapLeuronPackResponses (LeuronPackResponses r) = r

instance leuronPackResponsesEncodeJson :: EncodeJson LeuronPackResponses where
  encodeJson (LeuronPackResponses o) =
       "tag" := "LeuronPackResponses"
    ~> "leuron_pack_responses" := o.leuronPackResponses
    ~> jsonEmptyObject


instance leuronPackResponsesDecodeJson :: DecodeJson LeuronPackResponses where
  decodeJson o = do
    obj <- decodeJson o
    leuronPackResponses <- obj .? "leuron_pack_responses"
    pure $ LeuronPackResponses {
      leuronPackResponses
    }


instance leuronPackResponsesRequestable :: Requestable LeuronPackResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance leuronPackResponsesRespondable :: Respondable LeuronPackResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkLeuronPackResponses
      <$> readProp "leuron_pack_responses" json


instance leuronPackResponsesIsForeign :: IsForeign LeuronPackResponses where
  read json =
      mkLeuronPackResponses
      <$> readProp "leuron_pack_responses" json


instance leuronPackResponsesShow :: Show LeuronPackResponses where
    show (LeuronPackResponses o) = show "leuronPackResponses: " ++ show o.leuronPackResponses

a_ :: forall b a r. Lens { a :: a | r } { a :: b | r } a b
a_ f o = o { a = _ } <$> f o.a


abbreviation_ :: forall b a r. Lens { abbreviation :: a | r } { abbreviation :: b | r } a b
abbreviation_ f o = o { abbreviation = _ } <$> f o.abbreviation


acceptTOS_ :: forall b a r. Lens { acceptTOS :: a | r } { acceptTOS :: b | r } a b
acceptTOS_ f o = o { acceptTOS = _ } <$> f o.acceptTOS


acceptedAt_ :: forall b a r. Lens { acceptedAt :: a | r } { acceptedAt :: b | r } a b
acceptedAt_ f o = o { acceptedAt = _ } <$> f o.acceptedAt


active_ :: forall b a r. Lens { active :: a | r } { active :: b | r } a b
active_ f o = o { active = _ } <$> f o.active


activityAt_ :: forall b a r. Lens { activityAt :: a | r } { activityAt :: b | r } a b
activityAt_ f o = o { activityAt = _ } <$> f o.activityAt


answer_ :: forall b a r. Lens { answer :: a | r } { answer :: b | r } a b
answer_ f o = o { answer = _ } <$> f o.answer


apiResponses_ :: forall b a r. Lens { apiResponses :: a | r } { apiResponses :: b | r } a b
apiResponses_ f o = o { apiResponses = _ } <$> f o.apiResponses


assocBy_ :: forall b a r. Lens { assocBy :: a | r } { assocBy :: b | r } a b
assocBy_ f o = o { assocBy = _ } <$> f o.assocBy


assocResult_ :: forall b a r. Lens { assocResult :: a | r } { assocResult :: b | r } a b
assocResult_ f o = o { assocResult = _ } <$> f o.assocResult


author_ :: forall b a r. Lens { author :: a | r } { author :: b | r } a b
author_ f o = o { author = _ } <$> f o.author


b_ :: forall b a r. Lens { b :: a | r } { b :: b | r } a b
b_ f o = o { b = _ } <$> f o.b


back_ :: forall b a r. Lens { back :: a | r } { back :: b | r } a b
back_ f o = o { back = _ } <$> f o.back


birthdate_ :: forall b a r. Lens { birthdate :: a | r } { birthdate :: b | r } a b
birthdate_ f o = o { birthdate = _ } <$> f o.birthdate


blockedAt_ :: forall b a r. Lens { blockedAt :: a | r } { blockedAt :: b | r } a b
blockedAt_ f o = o { blockedAt = _ } <$> f o.blockedAt


board_ :: forall b a r. Lens { board :: a | r } { board :: b | r } a b
board_ f o = o { board = _ } <$> f o.board


boardId_ :: forall b a r. Lens { boardId :: a | r } { boardId :: b | r } a b
boardId_ f o = o { boardId = _ } <$> f o.boardId


boardPackResponses_ :: forall b a r. Lens { boardPackResponses :: a | r } { boardPackResponses :: b | r } a b
boardPackResponses_ f o = o { boardPackResponses = _ } <$> f o.boardPackResponses


boardResponses_ :: forall b a r. Lens { boardResponses :: a | r } { boardResponses :: b | r } a b
boardResponses_ f o = o { boardResponses = _ } <$> f o.boardResponses


boardStatResponses_ :: forall b a r. Lens { boardStatResponses :: a | r } { boardStatResponses :: b | r } a b
boardStatResponses_ f o = o { boardStatResponses = _ } <$> f o.boardStatResponses


boards_ :: forall b a r. Lens { boards :: a | r } { boards :: b | r } a b
boards_ f o = o { boards = _ } <$> f o.boards


body_ :: forall b a r. Lens { body :: a | r } { body :: b | r } a b
body_ f o = o { body = _ } <$> f o.body


bucketResponses_ :: forall b a r. Lens { bucketResponses :: a | r } { bucketResponses :: b | r } a b
bucketResponses_ f o = o { bucketResponses = _ } <$> f o.bucketResponses


canCreateSubBoards_ :: forall b a r. Lens { canCreateSubBoards :: a | r } { canCreateSubBoards :: b | r } a b
canCreateSubBoards_ f o = o { canCreateSubBoards = _ } <$> f o.canCreateSubBoards


canCreateThreads_ :: forall b a r. Lens { canCreateThreads :: a | r } { canCreateThreads :: b | r } a b
canCreateThreads_ f o = o { canCreateThreads = _ } <$> f o.canCreateThreads


categories_ :: forall b a r. Lens { categories :: a | r } { categories :: b | r } a b
categories_ f o = o { categories = _ } <$> f o.categories


columns_ :: forall b a r. Lens { columns :: a | r } { columns :: b | r } a b
columns_ f o = o { columns = _ } <$> f o.columns


comment_ :: forall b a r. Lens { comment :: a | r } { comment :: b | r } a b
comment_ f o = o { comment = _ } <$> f o.comment


company_ :: forall b a r. Lens { company :: a | r } { company :: b | r } a b
company_ f o = o { company = _ } <$> f o.company


content_ :: forall b a r. Lens { content :: a | r } { content :: b | r } a b
content_ f o = o { content = _ } <$> f o.content


countResponses_ :: forall b a r. Lens { countResponses :: a | r } { countResponses :: b | r } a b
countResponses_ f o = o { countResponses = _ } <$> f o.countResponses


counter_ :: forall b a r. Lens { counter :: a | r } { counter :: b | r } a b
counter_ f o = o { counter = _ } <$> f o.counter


createdAt_ :: forall b a r. Lens { createdAt :: a | r } { createdAt :: b | r } a b
createdAt_ f o = o { createdAt = _ } <$> f o.createdAt


dataP_ :: forall b a r. Lens { dataP :: a | r } { dataP :: b | r } a b
dataP_ f o = o { dataP = _ } <$> f o.dataP


deactivatedAt_ :: forall b a r. Lens { deactivatedAt :: a | r } { deactivatedAt :: b | r } a b
deactivatedAt_ f o = o { deactivatedAt = _ } <$> f o.deactivatedAt


desc_ :: forall b a r. Lens { desc :: a | r } { desc :: b | r } a b
desc_ f o = o { desc = _ } <$> f o.desc


description_ :: forall b a r. Lens { description :: a | r } { description :: b | r } a b
description_ f o = o { description = _ } <$> f o.description


dislike_ :: forall b a r. Lens { dislike :: a | r } { dislike :: b | r } a b
dislike_ f o = o { dislike = _ } <$> f o.dislike


dislikes_ :: forall b a r. Lens { dislikes :: a | r } { dislikes :: b | r } a b
dislikes_ f o = o { dislikes = _ } <$> f o.dislikes


displayName_ :: forall b a r. Lens { displayName :: a | r } { displayName :: b | r } a b
displayName_ f o = o { displayName = _ } <$> f o.displayName


displayNick_ :: forall b a r. Lens { displayNick :: a | r } { displayNick :: b | r } a b
displayNick_ f o = o { displayNick = _ } <$> f o.displayNick


email_ :: forall b a r. Lens { email :: a | r } { email :: b | r } a b
email_ f o = o { email = _ } <$> f o.email


emailMD5_ :: forall b a r. Lens { emailMD5 :: a | r } { emailMD5 :: b | r } a b
emailMD5_ f o = o { emailMD5 = _ } <$> f o.emailMD5


emptyResponses_ :: forall b a r. Lens { emptyResponses :: a | r } { emptyResponses :: b | r } a b
emptyResponses_ f o = o { emptyResponses = _ } <$> f o.emptyResponses


ent_ :: forall b a r. Lens { ent :: a | r } { ent :: b | r } a b
ent_ f o = o { ent = _ } <$> f o.ent


entId_ :: forall b a r. Lens { entId :: a | r } { entId :: b | r } a b
entId_ f o = o { entId = _ } <$> f o.entId


examples_ :: forall b a r. Lens { examples :: a | r } { examples :: b | r } a b
examples_ f o = o { examples = _ } <$> f o.examples


fact_ :: forall b a r. Lens { fact :: a | r } { fact :: b | r } a b
fact_ f o = o { fact = _ } <$> f o.fact


filters_ :: forall b a r. Lens { filters :: a | r } { filters :: b | r } a b
filters_ f o = o { filters = _ } <$> f o.filters


forum_ :: forall b a r. Lens { forum :: a | r } { forum :: b | r } a b
forum_ f o = o { forum = _ } <$> f o.forum


forumId_ :: forall b a r. Lens { forumId :: a | r } { forumId :: b | r } a b
forumId_ f o = o { forumId = _ } <$> f o.forumId


forumPackResponses_ :: forall b a r. Lens { forumPackResponses :: a | r } { forumPackResponses :: b | r } a b
forumPackResponses_ f o = o { forumPackResponses = _ } <$> f o.forumPackResponses


forumResponses_ :: forall b a r. Lens { forumResponses :: a | r } { forumResponses :: b | r } a b
forumResponses_ f o = o { forumResponses = _ } <$> f o.forumResponses


forumStatResponses_ :: forall b a r. Lens { forumStatResponses :: a | r } { forumStatResponses :: b | r } a b
forumStatResponses_ f o = o { forumStatResponses = _ } <$> f o.forumStatResponses


forums_ :: forall b a r. Lens { forums :: a | r } { forums :: b | r } a b
forums_ f o = o { forums = _ } <$> f o.forums


front_ :: forall b a r. Lens { front :: a | r } { front :: b | r } a b
front_ f o = o { front = _ } <$> f o.front


gender_ :: forall b a r. Lens { gender :: a | r } { gender :: b | r } a b
gender_ f o = o { gender = _ } <$> f o.gender


globalGroup_ :: forall b a r. Lens { globalGroup :: a | r } { globalGroup :: b | r } a b
globalGroup_ f o = o { globalGroup = _ } <$> f o.globalGroup


globalGroupId_ :: forall b a r. Lens { globalGroupId :: a | r } { globalGroupId :: b | r } a b
globalGroupId_ f o = o { globalGroupId = _ } <$> f o.globalGroupId


globalGroupPackResponses_ :: forall b a r. Lens { globalGroupPackResponses :: a | r } { globalGroupPackResponses :: b | r } a b
globalGroupPackResponses_ f o = o { globalGroupPackResponses = _ } <$> f o.globalGroupPackResponses


globalGroupResponses_ :: forall b a r. Lens { globalGroupResponses :: a | r } { globalGroupResponses :: b | r } a b
globalGroupResponses_ f o = o { globalGroupResponses = _ } <$> f o.globalGroupResponses


globalGroupStatResponses_ :: forall b a r. Lens { globalGroupStatResponses :: a | r } { globalGroupStatResponses :: b | r } a b
globalGroupStatResponses_ f o = o { globalGroupStatResponses = _ } <$> f o.globalGroupStatResponses


group_ :: forall b a r. Lens { group :: a | r } { group :: b | r } a b
group_ f o = o { group = _ } <$> f o.group


groupId_ :: forall b a r. Lens { groupId :: a | r } { groupId :: b | r } a b
groupId_ f o = o { groupId = _ } <$> f o.groupId


groupMember_ :: forall b a r. Lens { groupMember :: a | r } { groupMember :: b | r } a b
groupMember_ f o = o { groupMember = _ } <$> f o.groupMember


groupMemberId_ :: forall b a r. Lens { groupMemberId :: a | r } { groupMemberId :: b | r } a b
groupMemberId_ f o = o { groupMemberId = _ } <$> f o.groupMemberId


groupMemberPackResponses_ :: forall b a r. Lens { groupMemberPackResponses :: a | r } { groupMemberPackResponses :: b | r } a b
groupMemberPackResponses_ f o = o { groupMemberPackResponses = _ } <$> f o.groupMemberPackResponses


groupMemberResponses_ :: forall b a r. Lens { groupMemberResponses :: a | r } { groupMemberResponses :: b | r } a b
groupMemberResponses_ f o = o { groupMemberResponses = _ } <$> f o.groupMemberResponses


groupPackResponses_ :: forall b a r. Lens { groupPackResponses :: a | r } { groupPackResponses :: b | r } a b
groupPackResponses_ f o = o { groupPackResponses = _ } <$> f o.groupPackResponses


groupResponses_ :: forall b a r. Lens { groupResponses :: a | r } { groupResponses :: b | r } a b
groupResponses_ f o = o { groupResponses = _ } <$> f o.groupResponses


groupStatResponses_ :: forall b a r. Lens { groupStatResponses :: a | r } { groupStatResponses :: b | r } a b
groupStatResponses_ f o = o { groupStatResponses = _ } <$> f o.groupStatResponses


groups_ :: forall b a r. Lens { groups :: a | r } { groups :: b | r } a b
groups_ f o = o { groups = _ } <$> f o.groups


guard_ :: forall b a r. Lens { guard :: a | r } { guard :: b | r } a b
guard_ f o = o { guard = _ } <$> f o.guard


icon_ :: forall b a r. Lens { icon :: a | r } { icon :: b | r } a b
icon_ f o = o { icon = _ } <$> f o.icon


id_ :: forall b a r. Lens { id :: a | r } { id :: b | r } a b
id_ f o = o { id = _ } <$> f o.id


ident_ :: forall b a r. Lens { ident :: a | r } { ident :: b | r } a b
ident_ f o = o { ident = _ } <$> f o.ident


imageUrl_ :: forall b a r. Lens { imageUrl :: a | r } { imageUrl :: b | r } a b
imageUrl_ f o = o { imageUrl = _ } <$> f o.imageUrl


isAccepted_ :: forall b a r. Lens { isAccepted :: a | r } { isAccepted :: b | r } a b
isAccepted_ f o = o { isAccepted = _ } <$> f o.isAccepted


isAnonymous_ :: forall b a r. Lens { isAnonymous :: a | r } { isAnonymous :: b | r } a b
isAnonymous_ f o = o { isAnonymous = _ } <$> f o.isAnonymous


isBlocked_ :: forall b a r. Lens { isBlocked :: a | r } { isBlocked :: b | r } a b
isBlocked_ f o = o { isBlocked = _ } <$> f o.isBlocked


isNew_ :: forall b a r. Lens { isNew :: a | r } { isNew :: b | r } a b
isNew_ f o = o { isNew = _ } <$> f o.isNew


isOwner_ :: forall b a r. Lens { isOwner :: a | r } { isOwner :: b | r } a b
isOwner_ f o = o { isOwner = _ } <$> f o.isOwner


isRead_ :: forall b a r. Lens { isRead :: a | r } { isRead :: b | r } a b
isRead_ f o = o { isRead = _ } <$> f o.isRead


isSaved_ :: forall b a r. Lens { isSaved :: a | r } { isSaved :: b | r } a b
isSaved_ f o = o { isSaved = _ } <$> f o.isSaved


isStarred_ :: forall b a r. Lens { isStarred :: a | r } { isStarred :: b | r } a b
isStarred_ f o = o { isStarred = _ } <$> f o.isStarred


karmaBad_ :: forall b a r. Lens { karmaBad :: a | r } { karmaBad :: b | r } a b
karmaBad_ f o = o { karmaBad = _ } <$> f o.karmaBad


karmaGood_ :: forall b a r. Lens { karmaGood :: a | r } { karmaGood :: b | r } a b
karmaGood_ f o = o { karmaGood = _ } <$> f o.karmaGood


key_ :: forall b a r. Lens { key :: a | r } { key :: b | r } a b
key_ f o = o { key = _ } <$> f o.key


label_ :: forall b a r. Lens { label :: a | r } { label :: b | r } a b
label_ f o = o { label = _ } <$> f o.label


latestThread_ :: forall b a r. Lens { latestThread :: a | r } { latestThread :: b | r } a b
latestThread_ f o = o { latestThread = _ } <$> f o.latestThread


latestThreadPost_ :: forall b a r. Lens { latestThreadPost :: a | r } { latestThreadPost :: b | r } a b
latestThreadPost_ f o = o { latestThreadPost = _ } <$> f o.latestThreadPost


latestThreadPostUser_ :: forall b a r. Lens { latestThreadPostUser :: a | r } { latestThreadPostUser :: b | r } a b
latestThreadPostUser_ f o = o { latestThreadPostUser = _ } <$> f o.latestThreadPostUser


leuron_ :: forall b a r. Lens { leuron :: a | r } { leuron :: b | r } a b
leuron_ f o = o { leuron = _ } <$> f o.leuron


leuronId_ :: forall b a r. Lens { leuronId :: a | r } { leuronId :: b | r } a b
leuronId_ f o = o { leuronId = _ } <$> f o.leuronId


leuronPackResponses_ :: forall b a r. Lens { leuronPackResponses :: a | r } { leuronPackResponses :: b | r } a b
leuronPackResponses_ f o = o { leuronPackResponses = _ } <$> f o.leuronPackResponses


leuronResponses_ :: forall b a r. Lens { leuronResponses :: a | r } { leuronResponses :: b | r } a b
leuronResponses_ f o = o { leuronResponses = _ } <$> f o.leuronResponses


leuronStatResponses_ :: forall b a r. Lens { leuronStatResponses :: a | r } { leuronStatResponses :: b | r } a b
leuronStatResponses_ f o = o { leuronStatResponses = _ } <$> f o.leuronStatResponses


leuronTrainingId_ :: forall b a r. Lens { leuronTrainingId :: a | r } { leuronTrainingId :: b | r } a b
leuronTrainingId_ f o = o { leuronTrainingId = _ } <$> f o.leuronTrainingId


leuronTrainingResponses_ :: forall b a r. Lens { leuronTrainingResponses :: a | r } { leuronTrainingResponses :: b | r } a b
leuronTrainingResponses_ f o = o { leuronTrainingResponses = _ } <$> f o.leuronTrainingResponses


leuronTrainingStatResponses_ :: forall b a r. Lens { leuronTrainingStatResponses :: a | r } { leuronTrainingStatResponses :: b | r } a b
leuronTrainingStatResponses_ f o = o { leuronTrainingStatResponses = _ } <$> f o.leuronTrainingStatResponses


leurons_ :: forall b a r. Lens { leurons :: a | r } { leurons :: b | r } a b
leurons_ f o = o { leurons = _ } <$> f o.leurons


like_ :: forall b a r. Lens { like :: a | r } { like :: b | r } a b
like_ f o = o { like = _ } <$> f o.like


likeResponses_ :: forall b a r. Lens { likeResponses :: a | r } { likeResponses :: b | r } a b
likeResponses_ f o = o { likeResponses = _ } <$> f o.likeResponses


likeStatResponses_ :: forall b a r. Lens { likeStatResponses :: a | r } { likeStatResponses :: b | r } a b
likeStatResponses_ f o = o { likeStatResponses = _ } <$> f o.likeStatResponses


likes_ :: forall b a r. Lens { likes :: a | r } { likes :: b | r } a b
likes_ f o = o { likes = _ } <$> f o.likes


list_ :: forall b a r. Lens { list :: a | r } { list :: b | r } a b
list_ f o = o { list = _ } <$> f o.list


location_ :: forall b a r. Lens { location :: a | r } { location :: b | r } a b
location_ f o = o { location = _ } <$> f o.location


locked_ :: forall b a r. Lens { locked :: a | r } { locked :: b | r } a b
locked_ f o = o { locked = _ } <$> f o.locked


meaning_ :: forall b a r. Lens { meaning :: a | r } { meaning :: b | r } a b
meaning_ f o = o { meaning = _ } <$> f o.meaning


members_ :: forall b a r. Lens { members :: a | r } { members :: b | r } a b
members_ f o = o { members = _ } <$> f o.members


membership_ :: forall b a r. Lens { membership :: a | r } { membership :: b | r } a b
membership_ f o = o { membership = _ } <$> f o.membership


modifiedAt_ :: forall b a r. Lens { modifiedAt :: a | r } { modifiedAt :: b | r } a b
modifiedAt_ f o = o { modifiedAt = _ } <$> f o.modifiedAt


modifiedBy_ :: forall b a r. Lens { modifiedBy :: a | r } { modifiedBy :: b | r } a b
modifiedBy_ f o = o { modifiedBy = _ } <$> f o.modifiedBy


msg_ :: forall b a r. Lens { msg :: a | r } { msg :: b | r } a b
msg_ f o = o { msg = _ } <$> f o.msg


n_ :: forall b a r. Lens { n :: a | r } { n :: b | r } a b
n_ f o = o { n = _ } <$> f o.n


name_ :: forall b a r. Lens { name :: a | r } { name :: b | r } a b
name_ f o = o { name = _ } <$> f o.name


neutral_ :: forall b a r. Lens { neutral :: a | r } { neutral :: b | r } a b
neutral_ f o = o { neutral = _ } <$> f o.neutral


nick_ :: forall b a r. Lens { nick :: a | r } { nick :: b | r } a b
nick_ f o = o { nick = _ } <$> f o.nick


opt_ :: forall b a r. Lens { opt :: a | r } { opt :: b | r } a b
opt_ f o = o { opt = _ } <$> f o.opt


orgId_ :: forall b a r. Lens { orgId :: a | r } { orgId :: b | r } a b
orgId_ f o = o { orgId = _ } <$> f o.orgId


organization_ :: forall b a r. Lens { organization :: a | r } { organization :: b | r } a b
organization_ f o = o { organization = _ } <$> f o.organization


organizationId_ :: forall b a r. Lens { organizationId :: a | r } { organizationId :: b | r } a b
organizationId_ f o = o { organizationId = _ } <$> f o.organizationId


organizationPackResponses_ :: forall b a r. Lens { organizationPackResponses :: a | r } { organizationPackResponses :: b | r } a b
organizationPackResponses_ f o = o { organizationPackResponses = _ } <$> f o.organizationPackResponses


organizationResponses_ :: forall b a r. Lens { organizationResponses :: a | r } { organizationResponses :: b | r } a b
organizationResponses_ f o = o { organizationResponses = _ } <$> f o.organizationResponses


organizationStatResponses_ :: forall b a r. Lens { organizationStatResponses :: a | r } { organizationStatResponses :: b | r } a b
organizationStatResponses_ f o = o { organizationStatResponses = _ } <$> f o.organizationStatResponses


page_ :: forall b a r. Lens { page :: a | r } { page :: b | r } a b
page_ f o = o { page = _ } <$> f o.page


parentFolderId_ :: forall b a r. Lens { parentFolderId :: a | r } { parentFolderId :: b | r } a b
parentFolderId_ f o = o { parentFolderId = _ } <$> f o.parentFolderId


parentId_ :: forall b a r. Lens { parentId :: a | r } { parentId :: b | r } a b
parentId_ f o = o { parentId = _ } <$> f o.parentId


permissions_ :: forall b a r. Lens { permissions :: a | r } { permissions :: b | r } a b
permissions_ f o = o { permissions = _ } <$> f o.permissions


plugin_ :: forall b a r. Lens { plugin :: a | r } { plugin :: b | r } a b
plugin_ f o = o { plugin = _ } <$> f o.plugin


pmId_ :: forall b a r. Lens { pmId :: a | r } { pmId :: b | r } a b
pmId_ f o = o { pmId = _ } <$> f o.pmId


pmInResponses_ :: forall b a r. Lens { pmInResponses :: a | r } { pmInResponses :: b | r } a b
pmInResponses_ f o = o { pmInResponses = _ } <$> f o.pmInResponses


pmOutResponses_ :: forall b a r. Lens { pmOutResponses :: a | r } { pmOutResponses :: b | r } a b
pmOutResponses_ f o = o { pmOutResponses = _ } <$> f o.pmOutResponses


pmResponses_ :: forall b a r. Lens { pmResponses :: a | r } { pmResponses :: b | r } a b
pmResponses_ f o = o { pmResponses = _ } <$> f o.pmResponses


poll_ :: forall b a r. Lens { poll :: a | r } { poll :: b | r } a b
poll_ f o = o { poll = _ } <$> f o.poll


prerequisites_ :: forall b a r. Lens { prerequisites :: a | r } { prerequisites :: b | r } a b
prerequisites_ f o = o { prerequisites = _ } <$> f o.prerequisites


privateTags_ :: forall b a r. Lens { privateTags :: a | r } { privateTags :: b | r } a b
privateTags_ f o = o { privateTags = _ } <$> f o.privateTags


profile_ :: forall b a r. Lens { profile :: a | r } { profile :: b | r } a b
profile_ f o = o { profile = _ } <$> f o.profile


profileEmail_ :: forall b a r. Lens { profileEmail :: a | r } { profileEmail :: b | r } a b
profileEmail_ f o = o { profileEmail = _ } <$> f o.profileEmail


profileId_ :: forall b a r. Lens { profileId :: a | r } { profileId :: b | r } a b
profileId_ f o = o { profileId = _ } <$> f o.profileId


profileLogin_ :: forall b a r. Lens { profileLogin :: a | r } { profileLogin :: b | r } a b
profileLogin_ f o = o { profileLogin = _ } <$> f o.profileLogin


profileName_ :: forall b a r. Lens { profileName :: a | r } { profileName :: b | r } a b
profileName_ f o = o { profileName = _ } <$> f o.profileName


profileResponses_ :: forall b a r. Lens { profileResponses :: a | r } { profileResponses :: b | r } a b
profileResponses_ f o = o { profileResponses = _ } <$> f o.profileResponses


question_ :: forall b a r. Lens { question :: a | r } { question :: b | r } a b
question_ f o = o { question = _ } <$> f o.question


reason_ :: forall b a r. Lens { reason :: a | r } { reason :: b | r } a b
reason_ f o = o { reason = _ } <$> f o.reason


reminderFolderResponses_ :: forall b a r. Lens { reminderFolderResponses :: a | r } { reminderFolderResponses :: b | r } a b
reminderFolderResponses_ f o = o { reminderFolderResponses = _ } <$> f o.reminderFolderResponses


reminderResponses_ :: forall b a r. Lens { reminderResponses :: a | r } { reminderResponses :: b | r } a b
reminderResponses_ f o = o { reminderResponses = _ } <$> f o.reminderResponses


resource_ :: forall b a r. Lens { resource :: a | r } { resource :: b | r } a b
resource_ f o = o { resource = _ } <$> f o.resource


resourceId_ :: forall b a r. Lens { resourceId :: a | r } { resourceId :: b | r } a b
resourceId_ f o = o { resourceId = _ } <$> f o.resourceId


resourcePackResponses_ :: forall b a r. Lens { resourcePackResponses :: a | r } { resourcePackResponses :: b | r } a b
resourcePackResponses_ f o = o { resourcePackResponses = _ } <$> f o.resourcePackResponses


resourceResponses_ :: forall b a r. Lens { resourceResponses :: a | r } { resourceResponses :: b | r } a b
resourceResponses_ f o = o { resourceResponses = _ } <$> f o.resourceResponses


resourceStatResponses_ :: forall b a r. Lens { resourceStatResponses :: a | r } { resourceStatResponses :: b | r } a b
resourceStatResponses_ f o = o { resourceStatResponses = _ } <$> f o.resourceStatResponses


resources_ :: forall b a r. Lens { resources :: a | r } { resources :: b | r } a b
resources_ f o = o { resources = _ } <$> f o.resources


respect_ :: forall b a r. Lens { respect :: a | r } { respect :: b | r } a b
respect_ f o = o { respect = _ } <$> f o.respect


rows_ :: forall b a r. Lens { rows :: a | r } { rows :: b | r } a b
rows_ f o = o { rows = _ } <$> f o.rows


score_ :: forall b a r. Lens { score :: a | r } { score :: b | r } a b
score_ f o = o { score = _ } <$> f o.score


scoreHi_ :: forall b a r. Lens { scoreHi :: a | r } { scoreHi :: b | r } a b
scoreHi_ f o = o { scoreHi = _ } <$> f o.scoreHi


scoreLo_ :: forall b a r. Lens { scoreLo :: a | r } { scoreLo :: b | r } a b
scoreLo_ f o = o { scoreLo = _ } <$> f o.scoreLo


section_ :: forall b a r. Lens { section :: a | r } { section :: b | r } a b
section_ f o = o { section = _ } <$> f o.section


signature_ :: forall b a r. Lens { signature :: a | r } { signature :: b | r } a b
signature_ f o = o { signature = _ } <$> f o.signature


source_ :: forall b a r. Lens { source :: a | r } { source :: b | r } a b
source_ f o = o { source = _ } <$> f o.source


splits_ :: forall b a r. Lens { splits :: a | r } { splits :: b | r } a b
splits_ f o = o { splits = _ } <$> f o.splits


star_ :: forall b a r. Lens { star :: a | r } { star :: b | r } a b
star_ f o = o { star = _ } <$> f o.star


starResponses_ :: forall b a r. Lens { starResponses :: a | r } { starResponses :: b | r } a b
starResponses_ f o = o { starResponses = _ } <$> f o.starResponses


starStatResponses_ :: forall b a r. Lens { starStatResponses :: a | r } { starStatResponses :: b | r } a b
starStatResponses_ f o = o { starStatResponses = _ } <$> f o.starStatResponses


stars_ :: forall b a r. Lens { stars :: a | r } { stars :: b | r } a b
stars_ f o = o { stars = _ } <$> f o.stars


stat_ :: forall b a r. Lens { stat :: a | r } { stat :: b | r } a b
stat_ f o = o { stat = _ } <$> f o.stat


sticky_ :: forall b a r. Lens { sticky :: a | r } { sticky :: b | r } a b
sticky_ f o = o { sticky = _ } <$> f o.sticky


strengths_ :: forall b a r. Lens { strengths :: a | r } { strengths :: b | r } a b
strengths_ f o = o { strengths = _ } <$> f o.strengths


style_ :: forall b a r. Lens { style :: a | r } { style :: b | r } a b
style_ f o = o { style = _ } <$> f o.style


subject_ :: forall b a r. Lens { subject :: a | r } { subject :: b | r } a b
subject_ f o = o { subject = _ } <$> f o.subject


substitutions_ :: forall b a r. Lens { substitutions :: a | r } { substitutions :: b | r } a b
substitutions_ f o = o { substitutions = _ } <$> f o.substitutions


suggestedTags_ :: forall b a r. Lens { suggestedTags :: a | r } { suggestedTags :: b | r } a b
suggestedTags_ f o = o { suggestedTags = _ } <$> f o.suggestedTags


summary_ :: forall b a r. Lens { summary :: a | r } { summary :: b | r } a b
summary_ f o = o { summary = _ } <$> f o.summary


system_ :: forall b a r. Lens { system :: a | r } { system :: b | r } a b
system_ f o = o { system = _ } <$> f o.system


tags_ :: forall b a r. Lens { tags :: a | r } { tags :: b | r } a b
tags_ f o = o { tags = _ } <$> f o.tags


team_ :: forall b a r. Lens { team :: a | r } { team :: b | r } a b
team_ f o = o { team = _ } <$> f o.team


teamId_ :: forall b a r. Lens { teamId :: a | r } { teamId :: b | r } a b
teamId_ f o = o { teamId = _ } <$> f o.teamId


teamMember_ :: forall b a r. Lens { teamMember :: a | r } { teamMember :: b | r } a b
teamMember_ f o = o { teamMember = _ } <$> f o.teamMember


teamMemberId_ :: forall b a r. Lens { teamMemberId :: a | r } { teamMemberId :: b | r } a b
teamMemberId_ f o = o { teamMemberId = _ } <$> f o.teamMemberId


teamMemberPackResponses_ :: forall b a r. Lens { teamMemberPackResponses :: a | r } { teamMemberPackResponses :: b | r } a b
teamMemberPackResponses_ f o = o { teamMemberPackResponses = _ } <$> f o.teamMemberPackResponses


teamMemberResponses_ :: forall b a r. Lens { teamMemberResponses :: a | r } { teamMemberResponses :: b | r } a b
teamMemberResponses_ f o = o { teamMemberResponses = _ } <$> f o.teamMemberResponses


teamMemberStatResponses_ :: forall b a r. Lens { teamMemberStatResponses :: a | r } { teamMemberStatResponses :: b | r } a b
teamMemberStatResponses_ f o = o { teamMemberStatResponses = _ } <$> f o.teamMemberStatResponses


teamPackResponses_ :: forall b a r. Lens { teamPackResponses :: a | r } { teamPackResponses :: b | r } a b
teamPackResponses_ f o = o { teamPackResponses = _ } <$> f o.teamPackResponses


teamResponses_ :: forall b a r. Lens { teamResponses :: a | r } { teamResponses :: b | r } a b
teamResponses_ f o = o { teamResponses = _ } <$> f o.teamResponses


teamStatResponses_ :: forall b a r. Lens { teamStatResponses :: a | r } { teamStatResponses :: b | r } a b
teamStatResponses_ f o = o { teamStatResponses = _ } <$> f o.teamStatResponses


teams_ :: forall b a r. Lens { teams :: a | r } { teams :: b | r } a b
teams_ f o = o { teams = _ } <$> f o.teams


template_ :: forall b a r. Lens { template :: a | r } { template :: b | r } a b
template_ f o = o { template = _ } <$> f o.template


testResponses_ :: forall b a r. Lens { testResponses :: a | r } { testResponses :: b | r } a b
testResponses_ f o = o { testResponses = _ } <$> f o.testResponses


text_ :: forall b a r. Lens { text :: a | r } { text :: b | r } a b
text_ f o = o { text = _ } <$> f o.text


thread_ :: forall b a r. Lens { thread :: a | r } { thread :: b | r } a b
thread_ f o = o { thread = _ } <$> f o.thread


threadId_ :: forall b a r. Lens { threadId :: a | r } { threadId :: b | r } a b
threadId_ f o = o { threadId = _ } <$> f o.threadId


threadPackResponses_ :: forall b a r. Lens { threadPackResponses :: a | r } { threadPackResponses :: b | r } a b
threadPackResponses_ f o = o { threadPackResponses = _ } <$> f o.threadPackResponses


threadPost_ :: forall b a r. Lens { threadPost :: a | r } { threadPost :: b | r } a b
threadPost_ f o = o { threadPost = _ } <$> f o.threadPost


threadPostId_ :: forall b a r. Lens { threadPostId :: a | r } { threadPostId :: b | r } a b
threadPostId_ f o = o { threadPostId = _ } <$> f o.threadPostId


threadPostPackResponses_ :: forall b a r. Lens { threadPostPackResponses :: a | r } { threadPostPackResponses :: b | r } a b
threadPostPackResponses_ f o = o { threadPostPackResponses = _ } <$> f o.threadPostPackResponses


threadPostResponses_ :: forall b a r. Lens { threadPostResponses :: a | r } { threadPostResponses :: b | r } a b
threadPostResponses_ f o = o { threadPostResponses = _ } <$> f o.threadPostResponses


threadPostStatResponses_ :: forall b a r. Lens { threadPostStatResponses :: a | r } { threadPostStatResponses :: b | r } a b
threadPostStatResponses_ f o = o { threadPostStatResponses = _ } <$> f o.threadPostStatResponses


threadPosts_ :: forall b a r. Lens { threadPosts :: a | r } { threadPosts :: b | r } a b
threadPosts_ f o = o { threadPosts = _ } <$> f o.threadPosts


threadPostsPerThread_ :: forall b a r. Lens { threadPostsPerThread :: a | r } { threadPostsPerThread :: b | r } a b
threadPostsPerThread_ f o = o { threadPostsPerThread = _ } <$> f o.threadPostsPerThread


threadResponses_ :: forall b a r. Lens { threadResponses :: a | r } { threadResponses :: b | r } a b
threadResponses_ f o = o { threadResponses = _ } <$> f o.threadResponses


threadStatResponses_ :: forall b a r. Lens { threadStatResponses :: a | r } { threadStatResponses :: b | r } a b
threadStatResponses_ f o = o { threadStatResponses = _ } <$> f o.threadStatResponses


threads_ :: forall b a r. Lens { threads :: a | r } { threads :: b | r } a b
threads_ f o = o { threads = _ } <$> f o.threads


threadsPerBoard_ :: forall b a r. Lens { threadsPerBoard :: a | r } { threadsPerBoard :: b | r } a b
threadsPerBoard_ f o = o { threadsPerBoard = _ } <$> f o.threadsPerBoard


title_ :: forall b a r. Lens { title :: a | r } { title :: b | r } a b
title_ f o = o { title = _ } <$> f o.title


toUserId_ :: forall b a r. Lens { toUserId :: a | r } { toUserId :: b | r } a b
toUserId_ f o = o { toUserId = _ } <$> f o.toUserId


training_ :: forall b a r. Lens { training :: a | r } { training :: b | r } a b
training_ f o = o { training = _ } <$> f o.training


url_ :: forall b a r. Lens { url :: a | r } { url :: b | r } a b
url_ f o = o { url = _ } <$> f o.url


urls_ :: forall b a r. Lens { urls :: a | r } { urls :: b | r } a b
urls_ f o = o { urls = _ } <$> f o.urls


user_ :: forall b a r. Lens { user :: a | r } { user :: b | r } a b
user_ f o = o { user = _ } <$> f o.user


userId_ :: forall b a r. Lens { userId :: a | r } { userId :: b | r } a b
userId_ f o = o { userId = _ } <$> f o.userId


userPackResponses_ :: forall b a r. Lens { userPackResponses :: a | r } { userPackResponses :: b | r } a b
userPackResponses_ f o = o { userPackResponses = _ } <$> f o.userPackResponses


userResponses_ :: forall b a r. Lens { userResponses :: a | r } { userResponses :: b | r } a b
userResponses_ f o = o { userResponses = _ } <$> f o.userResponses


userSanitizedPackResponses_ :: forall b a r. Lens { userSanitizedPackResponses :: a | r } { userSanitizedPackResponses :: b | r } a b
userSanitizedPackResponses_ f o = o { userSanitizedPackResponses = _ } <$> f o.userSanitizedPackResponses


userSanitizedResponses_ :: forall b a r. Lens { userSanitizedResponses :: a | r } { userSanitizedResponses :: b | r } a b
userSanitizedResponses_ f o = o { userSanitizedResponses = _ } <$> f o.userSanitizedResponses


userSanitizedStatResponses_ :: forall b a r. Lens { userSanitizedStatResponses :: a | r } { userSanitizedStatResponses :: b | r } a b
userSanitizedStatResponses_ f o = o { userSanitizedStatResponses = _ } <$> f o.userSanitizedStatResponses


value_ :: forall b a r. Lens { value :: a | r } { value :: b | r } a b
value_ f o = o { value = _ } <$> f o.value


values_ :: forall b a r. Lens { values :: a | r } { values :: b | r } a b
values_ f o = o { values = _ } <$> f o.values


version_ :: forall b a r. Lens { version :: a | r } { version :: b | r } a b
version_ f o = o { version = _ } <$> f o.version


views_ :: forall b a r. Lens { views :: a | r } { views :: b | r } a b
views_ f o = o { views = _ } <$> f o.views


visibility_ :: forall b a r. Lens { visibility :: a | r } { visibility :: b | r } a b
visibility_ f o = o { visibility = _ } <$> f o.visibility


website_ :: forall b a r. Lens { website :: a | r } { website :: b | r } a b
website_ f o = o { website = _ } <$> f o.website


withBoard_ :: forall b a r. Lens { withBoard :: a | r } { withBoard :: b | r } a b
withBoard_ f o = o { withBoard = _ } <$> f o.withBoard


withForum_ :: forall b a r. Lens { withForum :: a | r } { withForum :: b | r } a b
withForum_ f o = o { withForum = _ } <$> f o.withForum


withOrganization_ :: forall b a r. Lens { withOrganization :: a | r } { withOrganization :: b | r } a b
withOrganization_ f o = o { withOrganization = _ } <$> f o.withOrganization


withThread_ :: forall b a r. Lens { withThread :: a | r } { withThread :: b | r } a b
withThread_ f o = o { withThread = _ } <$> f o.withThread


workouts_ :: forall b a r. Lens { workouts :: a | r } { workouts :: b | r } a b
workouts_ f o = o { workouts = _ } <$> f o.workouts

-- footer


instance paramQueryParam :: QueryParam Param where
  qp (Limit limit)                       = Tuple "limit" (show limit)
  qp (Offset offset)                     = Tuple "offset" (show offset)
  qp (SortOrder sort_order_by)           = Tuple "sort_order" (show sort_order_by)
  qp (Order order_by)                    = Tuple "order_by" (show order_by)
  qp (ByOrganizationId org_id)           = Tuple "organization_id" (show org_id)
  qp (ByOrganizationsIds orgs_ids)       = Tuple "organizations_ids" (show orgs_ids)
  qp (ByOrganizationName org_name)       = Tuple "organization_name" (org_name)
  qp (ByTeamId team_id)                  = Tuple "team_id" (show team_id)
  qp (ByTeamsIds teams_ids)              = Tuple "teams_ids" (show teams_ids)
  qp (ByTeamName team_name)              = Tuple "team_name" (team_name)
  qp (ByTeamMemberId team_member_id)     = Tuple "team_id" (show team_member_id)
  qp (ByTeamMembersIds team_members_ids) = Tuple "teams_ids" (show team_members_ids)
  qp (ByUserId user_id)                  = Tuple "user_id" (show user_id)
  qp (ByUsersIds users_ids)              = Tuple "users_ids" (show users_ids)
  qp (ByUserNick nick)                   = Tuple "user_nick" (show nick)
  qp (ByUsersNicks nicks)                = Tuple "users_nicks" (show nicks)
  qp (ByGlobalGroupId group_id)          = Tuple "group_id" (show group_id)
  qp (ByGlobalGroupsIds groups_ids)      = Tuple "groups_ids" (show groups_ids)
  qp (ByGroupId group_id)                = Tuple "group_id" (show group_id)
  qp (ByGroupsIds groups_ids)            = Tuple "groups_ids" (show groups_ids)
  qp (ByGroupMemberId group_member_id)   = Tuple "group_id" (show group_member_id)
  qp (ByGroupMembersIds group_members_ids) = Tuple "groups_ids" (show group_members_ids)
  qp (ByForumId forum_id)                = Tuple "forum_id" (show forum_id)
  qp (ByForumsIds forums_ids)            = Tuple "forums_ids" (show forums_ids)
  qp (ByForumName forum_name)            = Tuple "forum_name" (forum_name)
  qp (ByBoardId board_id)                = Tuple "board_id" (show board_id)
  qp (ByBoardsIds boards_ids)            = Tuple "boards_ids" (show boards_ids)
  qp (ByBoardName board_name)            = Tuple "board_name" (board_name)
  qp (ByThreadId thread_id)              = Tuple "thread_id" (show thread_id)
  qp (ByThreadsIds threads_ids)          = Tuple "threads_ids" (show threads_ids)
  qp (ByThreadName thread_name)          = Tuple "thread_name" (thread_name)
  qp (ByThreadPostId thread_post_id)     = Tuple "thread_post_id" (show thread_post_id)
  qp (ByThreadPostsIds thread_posts_ids) = Tuple "thread_posts_ids" (show thread_posts_ids)
  qp (ByThreadPostName thread_post_name) = Tuple "thread_post_name" (thread_post_name)
  qp (ByThreadPostLikeId like_id)        = Tuple "thread_post_like_id" (show like_id)
  qp (ByThreadPostLikesIds likes_ids)    = Tuple "thread_post_likes_ids" (show likes_ids)
  qp (ByThreadPostStarId star_id)        = Tuple "thread_post_star_id" (show star_id)
  qp (ByThreadPostStarsIds stars_ids)    = Tuple "thread_post_stars_ids" (show stars_ids)
  qp (ByBucketId bucket_id)              = Tuple "bucket_id" (show bucket_id)
  qp (ByResourceId resource_id)          = Tuple "resource_id" (show resource_id)
  qp (ByResourcesIds resources_ids)      = Tuple "resources_ids" (show resources_ids)
  qp (ByResourceName resource_name)      = Tuple "resource_name" (resource_name)
  qp (ByLeuronId leuron_id)              = Tuple "leuron_id" (show leuron_id)
  qp (ByLeuronsIds leurons_ids)          = Tuple "leurons_ids" (show leurons_ids)
  qp (ByPmId pm_id)                      = Tuple "pm_id" (show pm_id)
  qp (ByPmsIds pms_ids)                  = Tuple "pms_ids" (show pms_ids)
  qp (ByReminderId reminder_id)          = Tuple "reminder_id" (show reminder_id)
  qp (ByReminderFolderId reminder_folder)= Tuple "reminder_folder_id" (show reminder_folder)
  qp (ByParentId parent_id)              = Tuple "parent_id" (show parent_id)
  qp (ByParentsIds parents_ids)          = Tuple "parents_ids" (show parents_ids)
  qp (ByParentName parent_name)          = Tuple "parent_name" (parent_name)
  qp (BySelf b)                          = Tuple "self" (show b)
  qp (Timestamp ts)                      = Tuple "ts" (show ts)
  qp (UnixTimestamp unix_ts)             = Tuple "unix_ts" (show unix_ts)
  qp (CreatedAtTimestamp created_at)     = Tuple "created_at_ts" (show created_at)
  qp (CreatedAtUnixTimestamp created_at) = Tuple "created_at_unix_ts" (show created_at)
  qp (RealIP real_ip)                    = Tuple "real_ip" (real_ip)
  qp (IP ip)                             = Tuple "ip" (ip)
  qp (WithOrganization b)                = Tuple "with_organization" (show b)
  qp (WithForum b)                       = Tuple "with_forum" (show b)
  qp (WithBoard b)                       = Tuple "with_board" (show b)
  qp (WithThread b)                      = Tuple "with_thread" (show b)
  qp (WithResource b)                    = Tuple "with_resource" (show b)



instance paramTagShow :: Show ParamTag where
  show ParamTag_Limit                  = "limit"
  show ParamTag_Offset                 = "offset"
  show ParamTag_SortOrder              = "sort_order"
  show ParamTag_Order                  = "order"
  show ParamTag_ByOrganizationId       = "organization_id"
  show ParamTag_ByOrganizationsIds     = "organizations_ids"
  show ParamTag_ByOrganizationName     = "organization_name"
  show ParamTag_ByTeamId               = "team_id"
  show ParamTag_ByTeamsIds             = "teams_ids"
  show ParamTag_ByTeamName             = "team_name"
  show ParamTag_ByTeamMemberId         = "team_member_id"
  show ParamTag_ByTeamMembersIds       = "teams_member_ids"
  show ParamTag_ByUserId               = "user_id"
  show ParamTag_ByUsersIds             = "users_ids"
  show ParamTag_ByUserNick             = "user_nick"
  show ParamTag_ByUsersNicks           = "users_nicks"
  show ParamTag_ByGlobalGroupId        = "global_group_id"
  show ParamTag_ByGlobalGroupsIds      = "global_groups_ids"
  show ParamTag_ByGroupId              = "group_id"
  show ParamTag_ByGroupsIds            = "groups_ids"
  show ParamTag_ByGroupMemberId        = "group_member_id"
  show ParamTag_ByGroupMembersIds      = "groups_member_ids"
  show ParamTag_ByForumId              = "forum_id"
  show ParamTag_ByForumsIds            = "forums_ids"
  show ParamTag_ByForumName            = "forum_name"
  show ParamTag_ByBoardId              = "board_id"
  show ParamTag_ByBoardsIds            = "boards_ids"
  show ParamTag_ByBoardName            = "board_name"
  show ParamTag_ByThreadId             = "thread_id"
  show ParamTag_ByThreadsIds           = "threads_ids"
  show ParamTag_ByThreadName           = "thread_name"
  show ParamTag_ByThreadPostId         = "thread_post_id"
  show ParamTag_ByThreadPostsIds       = "thread_posts_ids"
  show ParamTag_ByThreadPostName       = "thread_post_name"
  show ParamTag_ByThreadPostLikeId     = "thread_post_like_id"
  show ParamTag_ByThreadPostLikesIds   = "thread_post_likes_ids"
  show ParamTag_ByThreadPostStarId     = "thread_post_star_id"
  show ParamTag_ByThreadPostStarsIds   = "thread_post_stars_ids"
  show ParamTag_ByBucketId             = "bucket_id"
  show ParamTag_ByResourceId           = "resource_id"
  show ParamTag_ByResourcesIds         = "resources_ids"
  show ParamTag_ByResourceName         = "resource_name"
  show ParamTag_ByLeuronId             = "leuron_id"
  show ParamTag_ByLeuronsIds           = "leurons_ids"
  show ParamTag_ByPmId                 = "pm_id"
  show ParamTag_ByPmsIds               = "pms_ids"
  show ParamTag_ByReminderId           = "reminder_id"
  show ParamTag_ByReminderFolderId     = "reminder_folder_id"
  show ParamTag_ByParentId             = "parent_id"
  show ParamTag_ByParentsIds           = "parents_ids"
  show ParamTag_ByParentName           = "parent_name"
  show ParamTag_BySelf                 = "self"
  show ParamTag_Timestamp              = "ts"
  show ParamTag_UnixTimestamp          = "unix_ts"
  show ParamTag_CreatedAtTimestamp     = "created_at_ts"
  show ParamTag_CreatedAtUnixTimestamp = "created_at_unix_ts"
  show ParamTag_RealIP                 = "real_ip"
  show ParamTag_IP                     = "ip"
  show ParamTag_WithOrganization       = "with_organization"
  show ParamTag_WithForum              = "with_forum"
  show ParamTag_WithBoard              = "with_board"
  show ParamTag_WithThread             = "with_thread"
  show ParamTag_WithResource           = "with_resource"



instance sortOrderByShow :: Show SortOrderBy where
  show SortOrderBy_Asc  = "asc"
  show SortOrderBy_Dsc  = "dsc"
  show SortOrderBy_Rnd  = "rnd"
  show SortOrderBy_None = "none"



instance orderByShow :: Show OrderBy where
  show OrderBy_UserId     = "user_id"
  show OrderBy_CreatedAt  = "created_at"
  show OrderBy_ModifiedAt = "modified_at"
  show OrderBy_ModifiedBy = "modified_by"
  show OrderBy_ActivityAt = "activity_at"
  show OrderBy_OrganizationId = "org_id"
  show OrderBy_TeamId     = "team_id"
  show OrderBy_ForumId    = "forum_id"
  show OrderBy_BoardId    = "board_id"
  show OrderBy_ThreadId   = "thread_id"
  show OrderBy_Id         = "id"
  show OrderBy_None       = "none"
