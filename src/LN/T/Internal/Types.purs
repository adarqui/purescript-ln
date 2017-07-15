module LN.T.Internal.Types where


import Data.Argonaut.Core               (jsonEmptyObject)
import Data.Argonaut.Decode             (class DecodeJson, decodeJson)
import Data.Argonaut.Decode.Combinators ((.?))
import Data.Argonaut.Encode             (class EncodeJson, encodeJson)
import Data.Argonaut.Encode.Combinators ((~>), (:=))
import Data.Argonaut.Printer            (printJson)
import Data.Date.Helpers                (Date)
import Data.Either                      (Either(..))
import Data.Foreign                     (ForeignError(..), fail)
import Data.Foreign.NullOrUndefined     (unNullOrUndefined)
import Data.Foreign.Class               (class IsForeign, read, readProp)
import Data.Maybe                       (Maybe(..))
import Data.Tuple                       (Tuple(..))
import Purescript.Api.Helpers           (class QueryParam, qp)
import Network.HTTP.Affjax.Request      (class Requestable, toRequest)
import Network.HTTP.Affjax.Response     (class Respondable, ResponseType(..))
import Optic.Core                       ((^.), (..))
import Optic.Types                      (Lens, Lens')
import Prelude                          (class Show, show, class Eq, eq, pure, bind, ($), (<>), (<$>), (<*>), (==), (&&))

import Purescript.Api.Helpers

data ACL
  = ACL_Grant Permissions
  | ACL_Deny 



instance aCLEncodeJson :: EncodeJson ACL where
  encodeJson (ACL_Grant x0) =
       "tag" := "ACL_Grant"
    ~> "contents" := [encodeJson x0]
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
        r <- obj .? "contents"
        case r of
          [x0] -> ACL_Grant <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ACL_Grant"


      "ACL_Deny" -> do
        pure ACL_Deny

      _ -> Left $ "DecodeJson TypeMismatch for ACL"



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
        r <- readProp "contents" json
        case r of
          [x0] -> ACL_Grant <$> read x0
          _ -> Left $ TypeMismatch "ACL_Grant" "Respondable"


      "ACL_Deny" -> do
        pure ACL_Deny

      _ -> Left $ TypeMismatch "ACL" "Respondable"



instance aCLIsForeign :: IsForeign ACL where
  read json = do
    tag <- readProp "tag" json
    case tag of
      "ACL_Grant" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ACL_Grant <$> read x0
          _ -> Left $ TypeMismatch "ACL_Grant" "IsForeign"


      "ACL_Deny" -> do
        pure ACL_Deny

      _ -> Left $ TypeMismatch "ACL" "IsForeign"



instance aCLEq :: Eq ACL where
  eq (ACL_Grant x0a) (ACL_Grant x0b) = x0a == x0b
  eq ACL_Deny ACL_Deny = true
  eq _ _ = false

newtype ApiRequest = ApiRequest {
  comment :: (Maybe String),
  guard :: Int
}


type ApiRequestR = {
  comment :: (Maybe String),
  guard :: Int
}


mkApiRequest :: (Maybe String) -> Int -> ApiRequest
mkApiRequest comment guard =
  ApiRequest{comment, guard}


unwrapApiRequest :: ApiRequest -> {
  comment :: (Maybe String),
  guard :: Int
}
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
      <$> (unNullOrUndefined <$> readProp "comment" json)
      <*> readProp "guard" json


instance apiRequestIsForeign :: IsForeign ApiRequest where
  read json =
      mkApiRequest
      <$> (unNullOrUndefined <$> readProp "comment" json)
      <*> readProp "guard" json


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


mkApiResponse :: Int -> Int -> String -> (Maybe String) -> Int -> (Maybe Date) -> (Maybe Date) -> ApiResponse
mkApiResponse id userId key comment guard createdAt modifiedAt =
  ApiResponse{id, userId, key, comment, guard, createdAt, modifiedAt}


unwrapApiResponse :: ApiResponse -> {
  id :: Int,
  userId :: Int,
  key :: String,
  comment :: (Maybe String),
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}
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
      <*> (unNullOrUndefined <$> readProp "comment" json)
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)


instance apiResponseIsForeign :: IsForeign ApiResponse where
  read json =
      mkApiResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "key" json
      <*> (unNullOrUndefined <$> readProp "comment" json)
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)


newtype ApiResponses = ApiResponses {
  apiResponses :: (Array ApiResponse)
}


type ApiResponsesR = {
  apiResponses :: (Array ApiResponse)
}


mkApiResponses :: (Array ApiResponse) -> ApiResponses
mkApiResponses apiResponses =
  ApiResponses{apiResponses}


unwrapApiResponses :: ApiResponses -> {
  apiResponses :: (Array ApiResponse)
}
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


mkBoardRequest :: String -> (Maybe String) -> Boolean -> Boolean -> Boolean -> (Array String) -> (Maybe String) -> (Array String) -> Int -> BoardRequest
mkBoardRequest displayName description isAnonymous canCreateSubBoards canCreateThreads suggestedTags icon tags guard =
  BoardRequest{displayName, description, isAnonymous, canCreateSubBoards, canCreateThreads, suggestedTags, icon, tags, guard}


unwrapBoardRequest :: BoardRequest -> {
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
      <*> (unNullOrUndefined <$> readProp "description" json)
      <*> readProp "is_anonymous" json
      <*> readProp "can_create_sub_boards" json
      <*> readProp "can_create_threads" json
      <*> readProp "suggested_tags" json
      <*> (unNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "guard" json


instance boardRequestIsForeign :: IsForeign BoardRequest where
  read json =
      mkBoardRequest
      <$> readProp "display_name" json
      <*> (unNullOrUndefined <$> readProp "description" json)
      <*> readProp "is_anonymous" json
      <*> readProp "can_create_sub_boards" json
      <*> readProp "can_create_threads" json
      <*> readProp "suggested_tags" json
      <*> (unNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "guard" json


newtype BoardResponse = BoardResponse {
  id :: Int,
  userId :: Int,
  orgId :: Int,
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
  orgId :: Int,
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


mkBoardResponse :: Int -> Int -> Int -> Int -> (Maybe Int) -> String -> String -> (Maybe String) -> Boolean -> Boolean -> Boolean -> (Array String) -> (Maybe String) -> (Array String) -> Boolean -> Int -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> BoardResponse
mkBoardResponse id userId orgId forumId parentId name displayName description isAnonymous canCreateSubBoards canCreateThreads suggestedTags icon tags active guard createdAt modifiedBy modifiedAt activityAt =
  BoardResponse{id, userId, orgId, forumId, parentId, name, displayName, description, isAnonymous, canCreateSubBoards, canCreateThreads, suggestedTags, icon, tags, active, guard, createdAt, modifiedBy, modifiedAt, activityAt}


unwrapBoardResponse :: BoardResponse -> {
  id :: Int,
  userId :: Int,
  orgId :: Int,
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
unwrapBoardResponse (BoardResponse r) = r

instance boardResponseEncodeJson :: EncodeJson BoardResponse where
  encodeJson (BoardResponse o) =
       "tag" := "BoardResponse"
    ~> "id" := o.id
    ~> "user_id" := o.userId
    ~> "org_id" := o.orgId
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
    orgId <- obj .? "org_id"
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
      orgId,
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
      <*> readProp "org_id" json
      <*> readProp "forum_id" json
      <*> (unNullOrUndefined <$> readProp "parent_id" json)
      <*> readProp "name" json
      <*> readProp "display_name" json
      <*> (unNullOrUndefined <$> readProp "description" json)
      <*> readProp "is_anonymous" json
      <*> readProp "can_create_sub_boards" json
      <*> readProp "can_create_threads" json
      <*> readProp "suggested_tags" json
      <*> (unNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_by" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)
      <*> (unNullOrUndefined <$> readProp "activity_at" json)


instance boardResponseIsForeign :: IsForeign BoardResponse where
  read json =
      mkBoardResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "org_id" json
      <*> readProp "forum_id" json
      <*> (unNullOrUndefined <$> readProp "parent_id" json)
      <*> readProp "name" json
      <*> readProp "display_name" json
      <*> (unNullOrUndefined <$> readProp "description" json)
      <*> readProp "is_anonymous" json
      <*> readProp "can_create_sub_boards" json
      <*> readProp "can_create_threads" json
      <*> readProp "suggested_tags" json
      <*> (unNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_by" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)
      <*> (unNullOrUndefined <$> readProp "activity_at" json)


newtype BoardResponses = BoardResponses {
  boardResponses :: (Array BoardResponse)
}


type BoardResponsesR = {
  boardResponses :: (Array BoardResponse)
}


mkBoardResponses :: (Array BoardResponse) -> BoardResponses
mkBoardResponses boardResponses =
  BoardResponses{boardResponses}


unwrapBoardResponses :: BoardResponses -> {
  boardResponses :: (Array BoardResponse)
}
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


mkBoardStatResponse :: Int -> Int -> Int -> Int -> BoardStatResponse
mkBoardStatResponse boardId threads threadPosts views =
  BoardStatResponse{boardId, threads, threadPosts, views}


unwrapBoardStatResponse :: BoardStatResponse -> {
  boardId :: Int,
  threads :: Int,
  threadPosts :: Int,
  views :: Int
}
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


newtype BoardStatResponses = BoardStatResponses {
  boardStatResponses :: (Array BoardStatResponse)
}


type BoardStatResponsesR = {
  boardStatResponses :: (Array BoardStatResponse)
}


mkBoardStatResponses :: (Array BoardStatResponse) -> BoardStatResponses
mkBoardStatResponses boardStatResponses =
  BoardStatResponses{boardStatResponses}


unwrapBoardStatResponses :: BoardStatResponses -> {
  boardStatResponses :: (Array BoardStatResponse)
}
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


mkBucketRequest :: String -> (Maybe String) -> Int -> Int -> (Array Int) -> (Array Int) -> (Array String) -> (Array Int) -> Int -> BucketRequest
mkBucketRequest displayName description scoreLo scoreHi leurons resources categories filters guard =
  BucketRequest{displayName, description, scoreLo, scoreHi, leurons, resources, categories, filters, guard}


unwrapBucketRequest :: BucketRequest -> {
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
      <*> (unNullOrUndefined <$> readProp "description" json)
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
      <*> (unNullOrUndefined <$> readProp "description" json)
      <*> readProp "score_lo" json
      <*> readProp "score_hi" json
      <*> readProp "leurons" json
      <*> readProp "resources" json
      <*> readProp "categories" json
      <*> readProp "filters" json
      <*> readProp "guard" json


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


mkBucketResponse :: Int -> Int -> String -> String -> (Maybe String) -> Int -> Int -> (Array Int) -> (Array Int) -> (Array String) -> (Array Int) -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> BucketResponse
mkBucketResponse id userId name displayName description scoreLo scoreHi leurons resources categories filters active guard createdAt modifiedAt activityAt =
  BucketResponse{id, userId, name, displayName, description, scoreLo, scoreHi, leurons, resources, categories, filters, active, guard, createdAt, modifiedAt, activityAt}


unwrapBucketResponse :: BucketResponse -> {
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
      <*> (unNullOrUndefined <$> readProp "description" json)
      <*> readProp "score_lo" json
      <*> readProp "score_hi" json
      <*> readProp "leurons" json
      <*> readProp "resources" json
      <*> readProp "categories" json
      <*> readProp "filters" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)
      <*> (unNullOrUndefined <$> readProp "activity_at" json)


instance bucketResponseIsForeign :: IsForeign BucketResponse where
  read json =
      mkBucketResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "name" json
      <*> readProp "display_name" json
      <*> (unNullOrUndefined <$> readProp "description" json)
      <*> readProp "score_lo" json
      <*> readProp "score_hi" json
      <*> readProp "leurons" json
      <*> readProp "resources" json
      <*> readProp "categories" json
      <*> readProp "filters" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)
      <*> (unNullOrUndefined <$> readProp "activity_at" json)


newtype BucketResponses = BucketResponses {
  bucketResponses :: (Array BucketResponse)
}


type BucketResponsesR = {
  bucketResponses :: (Array BucketResponse)
}


mkBucketResponses :: (Array BucketResponse) -> BucketResponses
mkBucketResponses bucketResponses =
  BucketResponses{bucketResponses}


unwrapBucketResponses :: BucketResponses -> {
  bucketResponses :: (Array BucketResponse)
}
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


newtype CountResponse = CountResponse {
  id :: Int,
  n :: Int
}


type CountResponseR = {
  id :: Int,
  n :: Int
}


mkCountResponse :: Int -> Int -> CountResponse
mkCountResponse id n =
  CountResponse{id, n}


unwrapCountResponse :: CountResponse -> {
  id :: Int,
  n :: Int
}
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


newtype CountResponses = CountResponses {
  countResponses :: (Array CountResponse)
}


type CountResponsesR = {
  countResponses :: (Array CountResponse)
}


mkCountResponses :: (Array CountResponse) -> CountResponses
mkCountResponses countResponses =
  CountResponses{countResponses}


unwrapCountResponses :: CountResponses -> {
  countResponses :: (Array CountResponse)
}
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


type DepList a = (Array (Array a))


newtype EmptyRequest = EmptyRequest {
  value :: Boolean
}


type EmptyRequestR = {
  value :: Boolean
}


mkEmptyRequest :: Boolean -> EmptyRequest
mkEmptyRequest value =
  EmptyRequest{value}


unwrapEmptyRequest :: EmptyRequest -> {
  value :: Boolean
}
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


mkEmptyResponse :: Int -> Int -> Boolean -> (Maybe Date) -> (Maybe Date) -> EmptyResponse
mkEmptyResponse id userId value createdAt modifiedAt =
  EmptyResponse{id, userId, value, createdAt, modifiedAt}


unwrapEmptyResponse :: EmptyResponse -> {
  id :: Int,
  userId :: Int,
  value :: Boolean,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}
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
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)


instance emptyResponseIsForeign :: IsForeign EmptyResponse where
  read json =
      mkEmptyResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "value" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)


newtype EmptyResponses = EmptyResponses {
  emptyResponses :: (Array EmptyResponse)
}


type EmptyResponsesR = {
  emptyResponses :: (Array EmptyResponse)
}


mkEmptyResponses :: (Array EmptyResponse) -> EmptyResponses
mkEmptyResponses emptyResponses =
  EmptyResponses{emptyResponses}


unwrapEmptyResponses :: EmptyResponses -> {
  emptyResponses :: (Array EmptyResponse)
}
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
        pure Ent_Organization

      "Ent_Team" -> do
        pure Ent_Team

      "Ent_TeamMember" -> do
        pure Ent_TeamMember

      "Ent_GlobalGroup" -> do
        pure Ent_GlobalGroup

      "Ent_Group" -> do
        pure Ent_Group

      "Ent_GroupMember" -> do
        pure Ent_GroupMember

      "Ent_User" -> do
        pure Ent_User

      "Ent_UserSanitized" -> do
        pure Ent_UserSanitized

      "Ent_Forum" -> do
        pure Ent_Forum

      "Ent_Board" -> do
        pure Ent_Board

      "Ent_Thread" -> do
        pure Ent_Thread

      "Ent_ThreadPost" -> do
        pure Ent_ThreadPost

      "Ent_Blog" -> do
        pure Ent_Blog

      "Ent_BlogPost" -> do
        pure Ent_BlogPost

      "Ent_BlogComment" -> do
        pure Ent_BlogComment

      "Ent_Resource" -> do
        pure Ent_Resource

      "Ent_Leuron" -> do
        pure Ent_Leuron

      "Ent_Comment" -> do
        pure Ent_Comment

      "Ent_Api" -> do
        pure Ent_Api

      "Ent_Like" -> do
        pure Ent_Like

      "Ent_Star" -> do
        pure Ent_Star

      "Ent_None" -> do
        pure Ent_None

      _ -> Left $ "DecodeJson TypeMismatch for Ent"



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
        pure Ent_Organization

      "Ent_Team" -> do
        pure Ent_Team

      "Ent_TeamMember" -> do
        pure Ent_TeamMember

      "Ent_GlobalGroup" -> do
        pure Ent_GlobalGroup

      "Ent_Group" -> do
        pure Ent_Group

      "Ent_GroupMember" -> do
        pure Ent_GroupMember

      "Ent_User" -> do
        pure Ent_User

      "Ent_UserSanitized" -> do
        pure Ent_UserSanitized

      "Ent_Forum" -> do
        pure Ent_Forum

      "Ent_Board" -> do
        pure Ent_Board

      "Ent_Thread" -> do
        pure Ent_Thread

      "Ent_ThreadPost" -> do
        pure Ent_ThreadPost

      "Ent_Blog" -> do
        pure Ent_Blog

      "Ent_BlogPost" -> do
        pure Ent_BlogPost

      "Ent_BlogComment" -> do
        pure Ent_BlogComment

      "Ent_Resource" -> do
        pure Ent_Resource

      "Ent_Leuron" -> do
        pure Ent_Leuron

      "Ent_Comment" -> do
        pure Ent_Comment

      "Ent_Api" -> do
        pure Ent_Api

      "Ent_Like" -> do
        pure Ent_Like

      "Ent_Star" -> do
        pure Ent_Star

      "Ent_None" -> do
        pure Ent_None

      _ -> Left $ TypeMismatch "Ent" "Respondable"



instance entIsForeign :: IsForeign Ent where
  read json = do
    tag <- readProp "tag" json
    case tag of
      "Ent_Organization" -> do
        pure Ent_Organization

      "Ent_Team" -> do
        pure Ent_Team

      "Ent_TeamMember" -> do
        pure Ent_TeamMember

      "Ent_GlobalGroup" -> do
        pure Ent_GlobalGroup

      "Ent_Group" -> do
        pure Ent_Group

      "Ent_GroupMember" -> do
        pure Ent_GroupMember

      "Ent_User" -> do
        pure Ent_User

      "Ent_UserSanitized" -> do
        pure Ent_UserSanitized

      "Ent_Forum" -> do
        pure Ent_Forum

      "Ent_Board" -> do
        pure Ent_Board

      "Ent_Thread" -> do
        pure Ent_Thread

      "Ent_ThreadPost" -> do
        pure Ent_ThreadPost

      "Ent_Blog" -> do
        pure Ent_Blog

      "Ent_BlogPost" -> do
        pure Ent_BlogPost

      "Ent_BlogComment" -> do
        pure Ent_BlogComment

      "Ent_Resource" -> do
        pure Ent_Resource

      "Ent_Leuron" -> do
        pure Ent_Leuron

      "Ent_Comment" -> do
        pure Ent_Comment

      "Ent_Api" -> do
        pure Ent_Api

      "Ent_Like" -> do
        pure Ent_Like

      "Ent_Star" -> do
        pure Ent_Star

      "Ent_None" -> do
        pure Ent_None

      _ -> Left $ TypeMismatch "Ent" "IsForeign"



instance entEq :: Eq Ent where
  eq Ent_Organization Ent_Organization = true
  eq Ent_Team Ent_Team = true
  eq Ent_TeamMember Ent_TeamMember = true
  eq Ent_GlobalGroup Ent_GlobalGroup = true
  eq Ent_Group Ent_Group = true
  eq Ent_GroupMember Ent_GroupMember = true
  eq Ent_User Ent_User = true
  eq Ent_UserSanitized Ent_UserSanitized = true
  eq Ent_Forum Ent_Forum = true
  eq Ent_Board Ent_Board = true
  eq Ent_Thread Ent_Thread = true
  eq Ent_ThreadPost Ent_ThreadPost = true
  eq Ent_Blog Ent_Blog = true
  eq Ent_BlogPost Ent_BlogPost = true
  eq Ent_BlogComment Ent_BlogComment = true
  eq Ent_Resource Ent_Resource = true
  eq Ent_Leuron Ent_Leuron = true
  eq Ent_Comment Ent_Comment = true
  eq Ent_Api Ent_Api = true
  eq Ent_Like Ent_Like = true
  eq Ent_Star Ent_Star = true
  eq Ent_None Ent_None = true
  eq _ _ = false

readEnt :: String -> Maybe Ent
readEnt "organization" = Just Ent_Organization
readEnt "team" = Just Ent_Team
readEnt "team_member" = Just Ent_TeamMember
readEnt "global_group" = Just Ent_GlobalGroup
readEnt "group" = Just Ent_Group
readEnt "group_member" = Just Ent_GroupMember
readEnt "user" = Just Ent_User
readEnt "user_sanitized" = Just Ent_UserSanitized
readEnt "forum" = Just Ent_Forum
readEnt "board" = Just Ent_Board
readEnt "thread" = Just Ent_Thread
readEnt "thread_post" = Just Ent_ThreadPost
readEnt "blog" = Just Ent_Blog
readEnt "blog_post" = Just Ent_BlogPost
readEnt "blog_comment" = Just Ent_BlogComment
readEnt "resource" = Just Ent_Resource
readEnt "leuron" = Just Ent_Leuron
readEnt "comment" = Just Ent_Comment
readEnt "api" = Just Ent_Api
readEnt "like" = Just Ent_Like
readEnt "star" = Just Ent_Star
readEnt "none" = Just Ent_None
readEnt _ = Nothing

data ApplicationError
  = Error_Unknown 
  | Error_NotFound 
  | Error_PermissionDenied 
  | Error_AlreadyExists 
  | Error_Visibility 
  | Error_Membership 
  | Error_Validation ValidationError
  | Error_NotImplemented 
  | Error_InvalidArguments String
  | Error_Unexpected 



instance applicationErrorEncodeJson :: EncodeJson ApplicationError where
  encodeJson (Error_Unknown ) =
       "tag" := "Error_Unknown"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Error_NotFound ) =
       "tag" := "Error_NotFound"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Error_PermissionDenied ) =
       "tag" := "Error_PermissionDenied"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Error_AlreadyExists ) =
       "tag" := "Error_AlreadyExists"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Error_Visibility ) =
       "tag" := "Error_Visibility"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Error_Membership ) =
       "tag" := "Error_Membership"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Error_Validation x0) =
       "tag" := "Error_Validation"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (Error_NotImplemented ) =
       "tag" := "Error_NotImplemented"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Error_InvalidArguments x0) =
       "tag" := "Error_InvalidArguments"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (Error_Unexpected ) =
       "tag" := "Error_Unexpected"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject


instance applicationErrorDecodeJson :: DecodeJson ApplicationError where
  decodeJson json = do
    obj <- decodeJson json
    tag <- obj .? "tag"
    case tag of
      "Error_Unknown" -> do
        pure Error_Unknown

      "Error_NotFound" -> do
        pure Error_NotFound

      "Error_PermissionDenied" -> do
        pure Error_PermissionDenied

      "Error_AlreadyExists" -> do
        pure Error_AlreadyExists

      "Error_Visibility" -> do
        pure Error_Visibility

      "Error_Membership" -> do
        pure Error_Membership

      "Error_Validation" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> Error_Validation <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for Error_Validation"


      "Error_NotImplemented" -> do
        pure Error_NotImplemented

      "Error_InvalidArguments" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> Error_InvalidArguments <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for Error_InvalidArguments"


      "Error_Unexpected" -> do
        pure Error_Unexpected

      _ -> Left $ "DecodeJson TypeMismatch for ApplicationError"



instance applicationErrorRequestable :: Requestable ApplicationError where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance applicationErrorRespondable :: Respondable ApplicationError where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    tag <- readProp "tag" json
    case tag of
      "Error_Unknown" -> do
        pure Error_Unknown

      "Error_NotFound" -> do
        pure Error_NotFound

      "Error_PermissionDenied" -> do
        pure Error_PermissionDenied

      "Error_AlreadyExists" -> do
        pure Error_AlreadyExists

      "Error_Visibility" -> do
        pure Error_Visibility

      "Error_Membership" -> do
        pure Error_Membership

      "Error_Validation" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> Error_Validation <$> read x0
          _ -> Left $ TypeMismatch "Error_Validation" "Respondable"


      "Error_NotImplemented" -> do
        pure Error_NotImplemented

      "Error_InvalidArguments" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> Error_InvalidArguments <$> read x0
          _ -> Left $ TypeMismatch "Error_InvalidArguments" "Respondable"


      "Error_Unexpected" -> do
        pure Error_Unexpected

      _ -> Left $ TypeMismatch "ApplicationError" "Respondable"



instance applicationErrorIsForeign :: IsForeign ApplicationError where
  read json = do
    tag <- readProp "tag" json
    case tag of
      "Error_Unknown" -> do
        pure Error_Unknown

      "Error_NotFound" -> do
        pure Error_NotFound

      "Error_PermissionDenied" -> do
        pure Error_PermissionDenied

      "Error_AlreadyExists" -> do
        pure Error_AlreadyExists

      "Error_Visibility" -> do
        pure Error_Visibility

      "Error_Membership" -> do
        pure Error_Membership

      "Error_Validation" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> Error_Validation <$> read x0
          _ -> Left $ TypeMismatch "Error_Validation" "IsForeign"


      "Error_NotImplemented" -> do
        pure Error_NotImplemented

      "Error_InvalidArguments" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> Error_InvalidArguments <$> read x0
          _ -> Left $ TypeMismatch "Error_InvalidArguments" "IsForeign"


      "Error_Unexpected" -> do
        pure Error_Unexpected

      _ -> Left $ TypeMismatch "ApplicationError" "IsForeign"



instance applicationErrorEq :: Eq ApplicationError where
  eq Error_Unknown Error_Unknown = true
  eq Error_NotFound Error_NotFound = true
  eq Error_PermissionDenied Error_PermissionDenied = true
  eq Error_AlreadyExists Error_AlreadyExists = true
  eq Error_Visibility Error_Visibility = true
  eq Error_Membership Error_Membership = true
  eq (Error_Validation x0a) (Error_Validation x0b) = x0a == x0b
  eq Error_NotImplemented Error_NotImplemented = true
  eq (Error_InvalidArguments x0a) (Error_InvalidArguments x0b) = x0a == x0b
  eq Error_Unexpected Error_Unexpected = true
  eq _ _ = false

data ValidationError
  = Validate ValidationErrorCode (Maybe String)



instance validationErrorEncodeJson :: EncodeJson ValidationError where
  encodeJson (Validate x0 x1) =
       "tag" := "Validate"
    ~> "contents" := [encodeJson x0, encodeJson x1]
    ~> jsonEmptyObject


instance validationErrorDecodeJson :: DecodeJson ValidationError where
  decodeJson json = do
    obj <- decodeJson json
    tag <- obj .? "tag"
    case tag of
      "Validate" -> do
        r <- obj .? "contents"
        case r of
          [x0, x1] -> Validate <$> decodeJson x0 <*> decodeJson x1
          _ -> Left $ "DecodeJson TypeMismatch for Validate"


      _ -> Left $ "DecodeJson TypeMismatch for ValidationError"



instance validationErrorRequestable :: Requestable ValidationError where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance validationErrorRespondable :: Respondable ValidationError where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    tag <- readProp "tag" json
    case tag of
      "Validate" -> do
        r <- readProp "contents" json
        case r of
          [x0, x1] -> Validate <$> read x0 <*> read x1
          _ -> Left $ TypeMismatch "Validate" "Respondable"


      _ -> Left $ TypeMismatch "ValidationError" "Respondable"



instance validationErrorIsForeign :: IsForeign ValidationError where
  read json = do
    tag <- readProp "tag" json
    case tag of
      "Validate" -> do
        r <- readProp "contents" json
        case r of
          [x0, x1] -> Validate <$> read x0 <*> read x1
          _ -> Left $ TypeMismatch "Validate" "IsForeign"


      _ -> Left $ TypeMismatch "ValidationError" "IsForeign"



instance validationErrorEq :: Eq ValidationError where
  eq (Validate x0a x1a) (Validate x0b x1b) = x0a == x0b && x1a == x1b


data ValidationErrorCode
  = Validate_Unknown 
  | Validate_InvalidCharacters 
  | Validate_InvalidEmail 
  | Validate_InvalidDate 
  | Validate_CannotBeEmpty 
  | Validate_TooLong 
  | Validate_TooShort 
  | Validate_GreaterThanMaximum 
  | Validate_SmallerThanMinimum 
  | Validate_Reason String



instance validationErrorCodeEncodeJson :: EncodeJson ValidationErrorCode where
  encodeJson (Validate_Unknown ) =
       "tag" := "Validate_Unknown"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Validate_InvalidCharacters ) =
       "tag" := "Validate_InvalidCharacters"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Validate_InvalidEmail ) =
       "tag" := "Validate_InvalidEmail"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Validate_InvalidDate ) =
       "tag" := "Validate_InvalidDate"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Validate_CannotBeEmpty ) =
       "tag" := "Validate_CannotBeEmpty"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Validate_TooLong ) =
       "tag" := "Validate_TooLong"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Validate_TooShort ) =
       "tag" := "Validate_TooShort"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Validate_GreaterThanMaximum ) =
       "tag" := "Validate_GreaterThanMaximum"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Validate_SmallerThanMinimum ) =
       "tag" := "Validate_SmallerThanMinimum"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (Validate_Reason x0) =
       "tag" := "Validate_Reason"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject


instance validationErrorCodeDecodeJson :: DecodeJson ValidationErrorCode where
  decodeJson json = do
    obj <- decodeJson json
    tag <- obj .? "tag"
    case tag of
      "Validate_Unknown" -> do
        pure Validate_Unknown

      "Validate_InvalidCharacters" -> do
        pure Validate_InvalidCharacters

      "Validate_InvalidEmail" -> do
        pure Validate_InvalidEmail

      "Validate_InvalidDate" -> do
        pure Validate_InvalidDate

      "Validate_CannotBeEmpty" -> do
        pure Validate_CannotBeEmpty

      "Validate_TooLong" -> do
        pure Validate_TooLong

      "Validate_TooShort" -> do
        pure Validate_TooShort

      "Validate_GreaterThanMaximum" -> do
        pure Validate_GreaterThanMaximum

      "Validate_SmallerThanMinimum" -> do
        pure Validate_SmallerThanMinimum

      "Validate_Reason" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> Validate_Reason <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for Validate_Reason"


      _ -> Left $ "DecodeJson TypeMismatch for ValidationErrorCode"



instance validationErrorCodeRequestable :: Requestable ValidationErrorCode where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance validationErrorCodeRespondable :: Respondable ValidationErrorCode where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    tag <- readProp "tag" json
    case tag of
      "Validate_Unknown" -> do
        pure Validate_Unknown

      "Validate_InvalidCharacters" -> do
        pure Validate_InvalidCharacters

      "Validate_InvalidEmail" -> do
        pure Validate_InvalidEmail

      "Validate_InvalidDate" -> do
        pure Validate_InvalidDate

      "Validate_CannotBeEmpty" -> do
        pure Validate_CannotBeEmpty

      "Validate_TooLong" -> do
        pure Validate_TooLong

      "Validate_TooShort" -> do
        pure Validate_TooShort

      "Validate_GreaterThanMaximum" -> do
        pure Validate_GreaterThanMaximum

      "Validate_SmallerThanMinimum" -> do
        pure Validate_SmallerThanMinimum

      "Validate_Reason" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> Validate_Reason <$> read x0
          _ -> Left $ TypeMismatch "Validate_Reason" "Respondable"


      _ -> Left $ TypeMismatch "ValidationErrorCode" "Respondable"



instance validationErrorCodeIsForeign :: IsForeign ValidationErrorCode where
  read json = do
    tag <- readProp "tag" json
    case tag of
      "Validate_Unknown" -> do
        pure Validate_Unknown

      "Validate_InvalidCharacters" -> do
        pure Validate_InvalidCharacters

      "Validate_InvalidEmail" -> do
        pure Validate_InvalidEmail

      "Validate_InvalidDate" -> do
        pure Validate_InvalidDate

      "Validate_CannotBeEmpty" -> do
        pure Validate_CannotBeEmpty

      "Validate_TooLong" -> do
        pure Validate_TooLong

      "Validate_TooShort" -> do
        pure Validate_TooShort

      "Validate_GreaterThanMaximum" -> do
        pure Validate_GreaterThanMaximum

      "Validate_SmallerThanMinimum" -> do
        pure Validate_SmallerThanMinimum

      "Validate_Reason" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> Validate_Reason <$> read x0
          _ -> Left $ TypeMismatch "Validate_Reason" "IsForeign"


      _ -> Left $ TypeMismatch "ValidationErrorCode" "IsForeign"



instance validationErrorCodeEq :: Eq ValidationErrorCode where
  eq Validate_Unknown Validate_Unknown = true
  eq Validate_InvalidCharacters Validate_InvalidCharacters = true
  eq Validate_InvalidEmail Validate_InvalidEmail = true
  eq Validate_InvalidDate Validate_InvalidDate = true
  eq Validate_CannotBeEmpty Validate_CannotBeEmpty = true
  eq Validate_TooLong Validate_TooLong = true
  eq Validate_TooShort Validate_TooShort = true
  eq Validate_GreaterThanMaximum Validate_GreaterThanMaximum = true
  eq Validate_SmallerThanMinimum Validate_SmallerThanMinimum = true
  eq (Validate_Reason x0a) (Validate_Reason x0b) = x0a == x0b
  eq _ _ = false

newtype ForumRequest = ForumRequest {
  displayName :: String,
  description :: (Maybe String),
  threadsPerBoard :: Int,
  threadPostsPerThread :: Int,
  recentThreadsLimit :: Int,
  recentPostsLimit :: Int,
  motwLimit :: Int,
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
  recentThreadsLimit :: Int,
  recentPostsLimit :: Int,
  motwLimit :: Int,
  icon :: (Maybe String),
  tags :: (Array String),
  visibility :: Visibility,
  guard :: Int
}


mkForumRequest :: String -> (Maybe String) -> Int -> Int -> Int -> Int -> Int -> (Maybe String) -> (Array String) -> Visibility -> Int -> ForumRequest
mkForumRequest displayName description threadsPerBoard threadPostsPerThread recentThreadsLimit recentPostsLimit motwLimit icon tags visibility guard =
  ForumRequest{displayName, description, threadsPerBoard, threadPostsPerThread, recentThreadsLimit, recentPostsLimit, motwLimit, icon, tags, visibility, guard}


unwrapForumRequest :: ForumRequest -> {
  displayName :: String,
  description :: (Maybe String),
  threadsPerBoard :: Int,
  threadPostsPerThread :: Int,
  recentThreadsLimit :: Int,
  recentPostsLimit :: Int,
  motwLimit :: Int,
  icon :: (Maybe String),
  tags :: (Array String),
  visibility :: Visibility,
  guard :: Int
}
unwrapForumRequest (ForumRequest r) = r

instance forumRequestEncodeJson :: EncodeJson ForumRequest where
  encodeJson (ForumRequest o) =
       "tag" := "ForumRequest"
    ~> "display_name" := o.displayName
    ~> "description" := o.description
    ~> "threads_per_board" := o.threadsPerBoard
    ~> "thread_posts_per_thread" := o.threadPostsPerThread
    ~> "recent_threads_limit" := o.recentThreadsLimit
    ~> "recent_posts_limit" := o.recentPostsLimit
    ~> "motw_limit" := o.motwLimit
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
    recentThreadsLimit <- obj .? "recent_threads_limit"
    recentPostsLimit <- obj .? "recent_posts_limit"
    motwLimit <- obj .? "motw_limit"
    icon <- obj .? "icon"
    tags <- obj .? "tags"
    visibility <- obj .? "visibility"
    guard <- obj .? "guard"
    pure $ ForumRequest {
      displayName,
      description,
      threadsPerBoard,
      threadPostsPerThread,
      recentThreadsLimit,
      recentPostsLimit,
      motwLimit,
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
      <*> (unNullOrUndefined <$> readProp "description" json)
      <*> readProp "threads_per_board" json
      <*> readProp "thread_posts_per_thread" json
      <*> readProp "recent_threads_limit" json
      <*> readProp "recent_posts_limit" json
      <*> readProp "motw_limit" json
      <*> (unNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "visibility" json
      <*> readProp "guard" json


instance forumRequestIsForeign :: IsForeign ForumRequest where
  read json =
      mkForumRequest
      <$> readProp "display_name" json
      <*> (unNullOrUndefined <$> readProp "description" json)
      <*> readProp "threads_per_board" json
      <*> readProp "thread_posts_per_thread" json
      <*> readProp "recent_threads_limit" json
      <*> readProp "recent_posts_limit" json
      <*> readProp "motw_limit" json
      <*> (unNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "visibility" json
      <*> readProp "guard" json


newtype ForumResponse = ForumResponse {
  id :: Int,
  userId :: Int,
  orgId :: Int,
  name :: String,
  displayName :: String,
  description :: (Maybe String),
  threadsPerBoard :: Int,
  threadPostsPerThread :: Int,
  recentThreadsLimit :: Int,
  recentPostsLimit :: Int,
  motwLimit :: Int,
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
  recentThreadsLimit :: Int,
  recentPostsLimit :: Int,
  motwLimit :: Int,
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


mkForumResponse :: Int -> Int -> Int -> String -> String -> (Maybe String) -> Int -> Int -> Int -> Int -> Int -> (Maybe String) -> (Array String) -> Visibility -> Boolean -> Int -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> ForumResponse
mkForumResponse id userId orgId name displayName description threadsPerBoard threadPostsPerThread recentThreadsLimit recentPostsLimit motwLimit icon tags visibility active guard createdAt modifiedBy modifiedAt activityAt =
  ForumResponse{id, userId, orgId, name, displayName, description, threadsPerBoard, threadPostsPerThread, recentThreadsLimit, recentPostsLimit, motwLimit, icon, tags, visibility, active, guard, createdAt, modifiedBy, modifiedAt, activityAt}


unwrapForumResponse :: ForumResponse -> {
  id :: Int,
  userId :: Int,
  orgId :: Int,
  name :: String,
  displayName :: String,
  description :: (Maybe String),
  threadsPerBoard :: Int,
  threadPostsPerThread :: Int,
  recentThreadsLimit :: Int,
  recentPostsLimit :: Int,
  motwLimit :: Int,
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
    ~> "recent_threads_limit" := o.recentThreadsLimit
    ~> "recent_posts_limit" := o.recentPostsLimit
    ~> "motw_limit" := o.motwLimit
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
    recentThreadsLimit <- obj .? "recent_threads_limit"
    recentPostsLimit <- obj .? "recent_posts_limit"
    motwLimit <- obj .? "motw_limit"
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
      recentThreadsLimit,
      recentPostsLimit,
      motwLimit,
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
      <*> (unNullOrUndefined <$> readProp "description" json)
      <*> readProp "threads_per_board" json
      <*> readProp "thread_posts_per_thread" json
      <*> readProp "recent_threads_limit" json
      <*> readProp "recent_posts_limit" json
      <*> readProp "motw_limit" json
      <*> (unNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "visibility" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_by" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)
      <*> (unNullOrUndefined <$> readProp "activity_at" json)


instance forumResponseIsForeign :: IsForeign ForumResponse where
  read json =
      mkForumResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "org_id" json
      <*> readProp "name" json
      <*> readProp "display_name" json
      <*> (unNullOrUndefined <$> readProp "description" json)
      <*> readProp "threads_per_board" json
      <*> readProp "thread_posts_per_thread" json
      <*> readProp "recent_threads_limit" json
      <*> readProp "recent_posts_limit" json
      <*> readProp "motw_limit" json
      <*> (unNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "visibility" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_by" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)
      <*> (unNullOrUndefined <$> readProp "activity_at" json)


newtype ForumResponses = ForumResponses {
  forumResponses :: (Array ForumResponse)
}


type ForumResponsesR = {
  forumResponses :: (Array ForumResponse)
}


mkForumResponses :: (Array ForumResponse) -> ForumResponses
mkForumResponses forumResponses =
  ForumResponses{forumResponses}


unwrapForumResponses :: ForumResponses -> {
  forumResponses :: (Array ForumResponse)
}
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


mkForumStatResponse :: Int -> Int -> Int -> Int -> Int -> ForumStatResponse
mkForumStatResponse forumId boards threads threadPosts views =
  ForumStatResponse{forumId, boards, threads, threadPosts, views}


unwrapForumStatResponse :: ForumStatResponse -> {
  forumId :: Int,
  boards :: Int,
  threads :: Int,
  threadPosts :: Int,
  views :: Int
}
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


newtype ForumStatResponses = ForumStatResponses {
  forumStatResponses :: (Array ForumStatResponse)
}


type ForumStatResponsesR = {
  forumStatResponses :: (Array ForumStatResponse)
}


mkForumStatResponses :: (Array ForumStatResponse) -> ForumStatResponses
mkForumStatResponses forumStatResponses =
  ForumStatResponses{forumStatResponses}


unwrapForumStatResponses :: ForumStatResponses -> {
  forumStatResponses :: (Array ForumStatResponse)
}
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


mkGlobalGroupRequest :: String -> (Maybe String) -> Membership -> (Maybe String) -> (Array String) -> Visibility -> Int -> GlobalGroupRequest
mkGlobalGroupRequest displayName description membership icon tags visibility guard =
  GlobalGroupRequest{displayName, description, membership, icon, tags, visibility, guard}


unwrapGlobalGroupRequest :: GlobalGroupRequest -> {
  displayName :: String,
  description :: (Maybe String),
  membership :: Membership,
  icon :: (Maybe String),
  tags :: (Array String),
  visibility :: Visibility,
  guard :: Int
}
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
      <*> (unNullOrUndefined <$> readProp "description" json)
      <*> readProp "membership" json
      <*> (unNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "visibility" json
      <*> readProp "guard" json


instance globalGroupRequestIsForeign :: IsForeign GlobalGroupRequest where
  read json =
      mkGlobalGroupRequest
      <$> readProp "display_name" json
      <*> (unNullOrUndefined <$> readProp "description" json)
      <*> readProp "membership" json
      <*> (unNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "visibility" json
      <*> readProp "guard" json


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


mkGlobalGroupResponse :: Int -> Int -> String -> String -> (Maybe String) -> Membership -> (Maybe String) -> (Array String) -> Visibility -> Boolean -> Int -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> GlobalGroupResponse
mkGlobalGroupResponse id userId name displayName description membership icon tags visibility active guard createdAt modifiedBy modifiedAt activityAt =
  GlobalGroupResponse{id, userId, name, displayName, description, membership, icon, tags, visibility, active, guard, createdAt, modifiedBy, modifiedAt, activityAt}


unwrapGlobalGroupResponse :: GlobalGroupResponse -> {
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
      <*> (unNullOrUndefined <$> readProp "description" json)
      <*> readProp "membership" json
      <*> (unNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "visibility" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_by" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)
      <*> (unNullOrUndefined <$> readProp "activity_at" json)


instance globalGroupResponseIsForeign :: IsForeign GlobalGroupResponse where
  read json =
      mkGlobalGroupResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "name" json
      <*> readProp "display_name" json
      <*> (unNullOrUndefined <$> readProp "description" json)
      <*> readProp "membership" json
      <*> (unNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "visibility" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_by" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)
      <*> (unNullOrUndefined <$> readProp "activity_at" json)


newtype GlobalGroupResponses = GlobalGroupResponses {
  globalGroupResponses :: (Array GlobalGroupResponse)
}


type GlobalGroupResponsesR = {
  globalGroupResponses :: (Array GlobalGroupResponse)
}


mkGlobalGroupResponses :: (Array GlobalGroupResponse) -> GlobalGroupResponses
mkGlobalGroupResponses globalGroupResponses =
  GlobalGroupResponses{globalGroupResponses}


unwrapGlobalGroupResponses :: GlobalGroupResponses -> {
  globalGroupResponses :: (Array GlobalGroupResponse)
}
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


newtype GlobalGroupStatResponse = GlobalGroupStatResponse {
  groups :: Int
}


type GlobalGroupStatResponseR = {
  groups :: Int
}


mkGlobalGroupStatResponse :: Int -> GlobalGroupStatResponse
mkGlobalGroupStatResponse groups =
  GlobalGroupStatResponse{groups}


unwrapGlobalGroupStatResponse :: GlobalGroupStatResponse -> {
  groups :: Int
}
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


newtype GlobalGroupStatResponses = GlobalGroupStatResponses {
  globalGroupStatResponses :: (Array GlobalGroupStatResponse)
}


type GlobalGroupStatResponsesR = {
  globalGroupStatResponses :: (Array GlobalGroupStatResponse)
}


mkGlobalGroupStatResponses :: (Array GlobalGroupStatResponse) -> GlobalGroupStatResponses
mkGlobalGroupStatResponses globalGroupStatResponses =
  GlobalGroupStatResponses{globalGroupStatResponses}


unwrapGlobalGroupStatResponses :: GlobalGroupStatResponses -> {
  globalGroupStatResponses :: (Array GlobalGroupStatResponse)
}
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


newtype GroupRequest = GroupRequest {
  guard :: Int
}


type GroupRequestR = {
  guard :: Int
}


mkGroupRequest :: Int -> GroupRequest
mkGroupRequest guard =
  GroupRequest{guard}


unwrapGroupRequest :: GroupRequest -> {
  guard :: Int
}
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


mkGroupResponse :: Int -> Int -> Int -> Int -> Boolean -> Int -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> GroupResponse
mkGroupResponse id userId globalGroupId organizationId active guard createdAt modifiedBy modifiedAt activityAt =
  GroupResponse{id, userId, globalGroupId, organizationId, active, guard, createdAt, modifiedBy, modifiedAt, activityAt}


unwrapGroupResponse :: GroupResponse -> {
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
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_by" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)
      <*> (unNullOrUndefined <$> readProp "activity_at" json)


instance groupResponseIsForeign :: IsForeign GroupResponse where
  read json =
      mkGroupResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "global_group_id" json
      <*> readProp "organization_id" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_by" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)
      <*> (unNullOrUndefined <$> readProp "activity_at" json)


newtype GroupResponses = GroupResponses {
  groupResponses :: (Array GroupResponse)
}


type GroupResponsesR = {
  groupResponses :: (Array GroupResponse)
}


mkGroupResponses :: (Array GroupResponse) -> GroupResponses
mkGroupResponses groupResponses =
  GroupResponses{groupResponses}


unwrapGroupResponses :: GroupResponses -> {
  groupResponses :: (Array GroupResponse)
}
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


newtype GroupStatResponse = GroupStatResponse {
  members :: Int
}


type GroupStatResponseR = {
  members :: Int
}


mkGroupStatResponse :: Int -> GroupStatResponse
mkGroupStatResponse members =
  GroupStatResponse{members}


unwrapGroupStatResponse :: GroupStatResponse -> {
  members :: Int
}
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


newtype GroupStatResponses = GroupStatResponses {
  groupStatResponses :: (Array GroupStatResponse)
}


type GroupStatResponsesR = {
  groupStatResponses :: (Array GroupStatResponse)
}


mkGroupStatResponses :: (Array GroupStatResponse) -> GroupStatResponses
mkGroupStatResponses groupStatResponses =
  GroupStatResponses{groupStatResponses}


unwrapGroupStatResponses :: GroupStatResponses -> {
  groupStatResponses :: (Array GroupStatResponse)
}
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


newtype GroupMemberRequest = GroupMemberRequest {
  guard :: Int
}


type GroupMemberRequestR = {
  guard :: Int
}


mkGroupMemberRequest :: Int -> GroupMemberRequest
mkGroupMemberRequest guard =
  GroupMemberRequest{guard}


unwrapGroupMemberRequest :: GroupMemberRequest -> {
  guard :: Int
}
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


mkGroupMemberResponse :: Int -> Int -> Int -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> GroupMemberResponse
mkGroupMemberResponse id userId globalGroupId createdAt modifiedBy modifiedAt activityAt =
  GroupMemberResponse{id, userId, globalGroupId, createdAt, modifiedBy, modifiedAt, activityAt}


unwrapGroupMemberResponse :: GroupMemberResponse -> {
  id :: Int,
  userId :: Int,
  globalGroupId :: Int,
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}
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
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_by" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)
      <*> (unNullOrUndefined <$> readProp "activity_at" json)


instance groupMemberResponseIsForeign :: IsForeign GroupMemberResponse where
  read json =
      mkGroupMemberResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "global_group_id" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_by" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)
      <*> (unNullOrUndefined <$> readProp "activity_at" json)


newtype GroupMemberResponses = GroupMemberResponses {
  groupMemberResponses :: (Array GroupMemberResponse)
}


type GroupMemberResponsesR = {
  groupMemberResponses :: (Array GroupMemberResponse)
}


mkGroupMemberResponses :: (Array GroupMemberResponse) -> GroupMemberResponses
mkGroupMemberResponses groupMemberResponses =
  GroupMemberResponses{groupMemberResponses}


unwrapGroupMemberResponses :: GroupMemberResponses -> {
  groupMemberResponses :: (Array GroupMemberResponse)
}
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
        pure GroupMemberStatResponse

      _ -> Left $ "DecodeJson TypeMismatch for GroupMemberStatResponse"



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
        pure GroupMemberStatResponse

      _ -> Left $ TypeMismatch "GroupMemberStatResponse" "Respondable"



instance groupMemberStatResponseIsForeign :: IsForeign GroupMemberStatResponse where
  read json = do
    tag <- readProp "tag" json
    case tag of
      "GroupMemberStatResponse" -> do
        pure GroupMemberStatResponse

      _ -> Left $ TypeMismatch "GroupMemberStatResponse" "IsForeign"



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
        pure GroupMemberStatResponses

      _ -> Left $ "DecodeJson TypeMismatch for GroupMemberStatResponses"



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
        pure GroupMemberStatResponses

      _ -> Left $ TypeMismatch "GroupMemberStatResponses" "Respondable"



instance groupMemberStatResponsesIsForeign :: IsForeign GroupMemberStatResponses where
  read json = do
    tag <- readProp "tag" json
    case tag of
      "GroupMemberStatResponses" -> do
        pure GroupMemberStatResponses

      _ -> Left $ TypeMismatch "GroupMemberStatResponses" "IsForeign"



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


mkLeuronRequest :: LeuronData -> (Maybe String) -> (Maybe String) -> (Maybe String) -> (Maybe String) -> (Maybe (Array String)) -> (Maybe (Array String)) -> (DepList String) -> (Maybe (Array Splits)) -> (Maybe (Array Substitutions)) -> (Array String) -> (Maybe (Array String)) -> Int -> LeuronRequest
mkLeuronRequest dataP title description section page examples strengths categories splits substitutions tags style guard =
  LeuronRequest{dataP, title, description, section, page, examples, strengths, categories, splits, substitutions, tags, style, guard}


unwrapLeuronRequest :: LeuronRequest -> {
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
      <*> (unNullOrUndefined <$> readProp "title" json)
      <*> (unNullOrUndefined <$> readProp "description" json)
      <*> (unNullOrUndefined <$> readProp "section" json)
      <*> (unNullOrUndefined <$> readProp "page" json)
      <*> (unNullOrUndefined <$> readProp "examples" json)
      <*> (unNullOrUndefined <$> readProp "strengths" json)
      <*> readProp "categories" json
      <*> (unNullOrUndefined <$> readProp "splits" json)
      <*> (unNullOrUndefined <$> readProp "substitutions" json)
      <*> readProp "tags" json
      <*> (unNullOrUndefined <$> readProp "style" json)
      <*> readProp "guard" json


instance leuronRequestIsForeign :: IsForeign LeuronRequest where
  read json =
      mkLeuronRequest
      <$> readProp "data" json
      <*> (unNullOrUndefined <$> readProp "title" json)
      <*> (unNullOrUndefined <$> readProp "description" json)
      <*> (unNullOrUndefined <$> readProp "section" json)
      <*> (unNullOrUndefined <$> readProp "page" json)
      <*> (unNullOrUndefined <$> readProp "examples" json)
      <*> (unNullOrUndefined <$> readProp "strengths" json)
      <*> readProp "categories" json
      <*> (unNullOrUndefined <$> readProp "splits" json)
      <*> (unNullOrUndefined <$> readProp "substitutions" json)
      <*> readProp "tags" json
      <*> (unNullOrUndefined <$> readProp "style" json)
      <*> readProp "guard" json


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


mkLeuronResponse :: Int -> Int -> Int -> LeuronData -> (Maybe String) -> (Maybe String) -> (Maybe String) -> (Maybe String) -> (Maybe (Array String)) -> (Maybe (Array String)) -> (DepList String) -> (Maybe (Array Splits)) -> (Maybe (Array Substitutions)) -> (Array String) -> (Maybe (Array String)) -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> LeuronResponse
mkLeuronResponse id userId resourceId dataP title description section page examples strengths categories splits substitutions tags style active guard createdAt modifiedAt activityAt =
  LeuronResponse{id, userId, resourceId, dataP, title, description, section, page, examples, strengths, categories, splits, substitutions, tags, style, active, guard, createdAt, modifiedAt, activityAt}


unwrapLeuronResponse :: LeuronResponse -> {
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
      <*> (unNullOrUndefined <$> readProp "title" json)
      <*> (unNullOrUndefined <$> readProp "description" json)
      <*> (unNullOrUndefined <$> readProp "section" json)
      <*> (unNullOrUndefined <$> readProp "page" json)
      <*> (unNullOrUndefined <$> readProp "examples" json)
      <*> (unNullOrUndefined <$> readProp "strengths" json)
      <*> readProp "categories" json
      <*> (unNullOrUndefined <$> readProp "splits" json)
      <*> (unNullOrUndefined <$> readProp "substitutions" json)
      <*> readProp "tags" json
      <*> (unNullOrUndefined <$> readProp "style" json)
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)
      <*> (unNullOrUndefined <$> readProp "activity_at" json)


instance leuronResponseIsForeign :: IsForeign LeuronResponse where
  read json =
      mkLeuronResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "resource_id" json
      <*> readProp "data" json
      <*> (unNullOrUndefined <$> readProp "title" json)
      <*> (unNullOrUndefined <$> readProp "description" json)
      <*> (unNullOrUndefined <$> readProp "section" json)
      <*> (unNullOrUndefined <$> readProp "page" json)
      <*> (unNullOrUndefined <$> readProp "examples" json)
      <*> (unNullOrUndefined <$> readProp "strengths" json)
      <*> readProp "categories" json
      <*> (unNullOrUndefined <$> readProp "splits" json)
      <*> (unNullOrUndefined <$> readProp "substitutions" json)
      <*> readProp "tags" json
      <*> (unNullOrUndefined <$> readProp "style" json)
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)
      <*> (unNullOrUndefined <$> readProp "activity_at" json)


newtype LeuronResponses = LeuronResponses {
  leuronResponses :: (Array LeuronResponse)
}


type LeuronResponsesR = {
  leuronResponses :: (Array LeuronResponse)
}


mkLeuronResponses :: (Array LeuronResponse) -> LeuronResponses
mkLeuronResponses leuronResponses =
  LeuronResponses{leuronResponses}


unwrapLeuronResponses :: LeuronResponses -> {
  leuronResponses :: (Array LeuronResponse)
}
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


mkLeuronStatResponse :: Int -> Int -> Int -> Int -> Int -> Int -> LeuronStatResponse
mkLeuronStatResponse leuronId likes neutral dislikes stars views =
  LeuronStatResponse{leuronId, likes, neutral, dislikes, stars, views}


unwrapLeuronStatResponse :: LeuronStatResponse -> {
  leuronId :: Int,
  likes :: Int,
  neutral :: Int,
  dislikes :: Int,
  stars :: Int,
  views :: Int
}
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


newtype LeuronStatResponses = LeuronStatResponses {
  leuronStatResponses :: (Array LeuronStatResponse)
}


type LeuronStatResponsesR = {
  leuronStatResponses :: (Array LeuronStatResponse)
}


mkLeuronStatResponses :: (Array LeuronStatResponse) -> LeuronStatResponses
mkLeuronStatResponses leuronStatResponses =
  LeuronStatResponses{leuronStatResponses}


unwrapLeuronStatResponses :: LeuronStatResponses -> {
  leuronStatResponses :: (Array LeuronStatResponse)
}
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
        pure LTS_View

      "LTS_Skip" -> do
        pure LTS_Skip

      "LTS_Know" -> do
        pure LTS_Know

      "LTS_DontKnow" -> do
        pure LTS_DontKnow

      "LTS_DontUnderstand" -> do
        pure LTS_DontUnderstand

      "LTS_DontCare" -> do
        pure LTS_DontCare

      "LTS_Protest" -> do
        pure LTS_Protest

      _ -> Left $ "DecodeJson TypeMismatch for LeuronTrainingSummary"



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
        pure LTS_View

      "LTS_Skip" -> do
        pure LTS_Skip

      "LTS_Know" -> do
        pure LTS_Know

      "LTS_DontKnow" -> do
        pure LTS_DontKnow

      "LTS_DontUnderstand" -> do
        pure LTS_DontUnderstand

      "LTS_DontCare" -> do
        pure LTS_DontCare

      "LTS_Protest" -> do
        pure LTS_Protest

      _ -> Left $ TypeMismatch "LeuronTrainingSummary" "Respondable"



instance leuronTrainingSummaryIsForeign :: IsForeign LeuronTrainingSummary where
  read json = do
    tag <- readProp "tag" json
    case tag of
      "LTS_View" -> do
        pure LTS_View

      "LTS_Skip" -> do
        pure LTS_Skip

      "LTS_Know" -> do
        pure LTS_Know

      "LTS_DontKnow" -> do
        pure LTS_DontKnow

      "LTS_DontUnderstand" -> do
        pure LTS_DontUnderstand

      "LTS_DontCare" -> do
        pure LTS_DontCare

      "LTS_Protest" -> do
        pure LTS_Protest

      _ -> Left $ TypeMismatch "LeuronTrainingSummary" "IsForeign"



instance leuronTrainingSummaryEq :: Eq LeuronTrainingSummary where
  eq LTS_View LTS_View = true
  eq LTS_Skip LTS_Skip = true
  eq LTS_Know LTS_Know = true
  eq LTS_DontKnow LTS_DontKnow = true
  eq LTS_DontUnderstand LTS_DontUnderstand = true
  eq LTS_DontCare LTS_DontCare = true
  eq LTS_Protest LTS_Protest = true
  eq _ _ = false

readLeuronTrainingSummary :: String -> Maybe LeuronTrainingSummary
readLeuronTrainingSummary "lts_view" = Just LTS_View
readLeuronTrainingSummary "lts_skip" = Just LTS_Skip
readLeuronTrainingSummary "lts_know" = Just LTS_Know
readLeuronTrainingSummary "lts_dont_know" = Just LTS_DontKnow
readLeuronTrainingSummary "lts_dont_understand" = Just LTS_DontUnderstand
readLeuronTrainingSummary "lts_dont_care" = Just LTS_DontCare
readLeuronTrainingSummary "lts_protest" = Just LTS_Protest
readLeuronTrainingSummary _ = Nothing

newtype LeuronTrainingRequest = LeuronTrainingRequest {
  summary :: LeuronTrainingSummary,
  guard :: Int
}


type LeuronTrainingRequestR = {
  summary :: LeuronTrainingSummary,
  guard :: Int
}


mkLeuronTrainingRequest :: LeuronTrainingSummary -> Int -> LeuronTrainingRequest
mkLeuronTrainingRequest summary guard =
  LeuronTrainingRequest{summary, guard}


unwrapLeuronTrainingRequest :: LeuronTrainingRequest -> {
  summary :: LeuronTrainingSummary,
  guard :: Int
}
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


mkLeuronTrainingResponse :: Int -> Int -> Int -> LeuronTrainingSummary -> Int -> (Maybe Date) -> (Maybe Date) -> LeuronTrainingResponse
mkLeuronTrainingResponse id userId leuronId summary guard createdAt modifiedAt =
  LeuronTrainingResponse{id, userId, leuronId, summary, guard, createdAt, modifiedAt}


unwrapLeuronTrainingResponse :: LeuronTrainingResponse -> {
  id :: Int,
  userId :: Int,
  leuronId :: Int,
  summary :: LeuronTrainingSummary,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}
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
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)


instance leuronTrainingResponseIsForeign :: IsForeign LeuronTrainingResponse where
  read json =
      mkLeuronTrainingResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "leuron_id" json
      <*> readProp "summary" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)


newtype LeuronTrainingResponses = LeuronTrainingResponses {
  leuronTrainingResponses :: (Array LeuronTrainingResponse)
}


type LeuronTrainingResponsesR = {
  leuronTrainingResponses :: (Array LeuronTrainingResponse)
}


mkLeuronTrainingResponses :: (Array LeuronTrainingResponse) -> LeuronTrainingResponses
mkLeuronTrainingResponses leuronTrainingResponses =
  LeuronTrainingResponses{leuronTrainingResponses}


unwrapLeuronTrainingResponses :: LeuronTrainingResponses -> {
  leuronTrainingResponses :: (Array LeuronTrainingResponse)
}
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


newtype LeuronTrainingStatResponse = LeuronTrainingStatResponse {
  leuronTrainingId :: Int
}


type LeuronTrainingStatResponseR = {
  leuronTrainingId :: Int
}


mkLeuronTrainingStatResponse :: Int -> LeuronTrainingStatResponse
mkLeuronTrainingStatResponse leuronTrainingId =
  LeuronTrainingStatResponse{leuronTrainingId}


unwrapLeuronTrainingStatResponse :: LeuronTrainingStatResponse -> {
  leuronTrainingId :: Int
}
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


newtype LeuronTrainingStatResponses = LeuronTrainingStatResponses {
  leuronTrainingStatResponses :: (Array LeuronTrainingStatResponse)
}


type LeuronTrainingStatResponsesR = {
  leuronTrainingStatResponses :: (Array LeuronTrainingStatResponse)
}


mkLeuronTrainingStatResponses :: (Array LeuronTrainingStatResponse) -> LeuronTrainingStatResponses
mkLeuronTrainingStatResponses leuronTrainingStatResponses =
  LeuronTrainingStatResponses{leuronTrainingStatResponses}


unwrapLeuronTrainingStatResponses :: LeuronTrainingStatResponses -> {
  leuronTrainingStatResponses :: (Array LeuronTrainingStatResponse)
}
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
        pure Like

      "Neutral" -> do
        pure Neutral

      "Dislike" -> do
        pure Dislike

      _ -> Left $ "DecodeJson TypeMismatch for LikeOpt"



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
        pure Like

      "Neutral" -> do
        pure Neutral

      "Dislike" -> do
        pure Dislike

      _ -> Left $ TypeMismatch "LikeOpt" "Respondable"



instance likeOptIsForeign :: IsForeign LikeOpt where
  read json = do
    tag <- readProp "tag" json
    case tag of
      "Like" -> do
        pure Like

      "Neutral" -> do
        pure Neutral

      "Dislike" -> do
        pure Dislike

      _ -> Left $ TypeMismatch "LikeOpt" "IsForeign"



instance likeOptEq :: Eq LikeOpt where
  eq Like Like = true
  eq Neutral Neutral = true
  eq Dislike Dislike = true
  eq _ _ = false

readLikeOpt :: String -> Maybe LikeOpt
readLikeOpt "like" = Just Like
readLikeOpt "neutral" = Just Neutral
readLikeOpt "dislike" = Just Dislike
readLikeOpt _ = Nothing

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


mkLikeRequest :: LikeOpt -> (Maybe String) -> Int -> LikeRequest
mkLikeRequest opt reason guard =
  LikeRequest{opt, reason, guard}


unwrapLikeRequest :: LikeRequest -> {
  opt :: LikeOpt,
  reason :: (Maybe String),
  guard :: Int
}
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
      <*> (unNullOrUndefined <$> readProp "reason" json)
      <*> readProp "guard" json


instance likeRequestIsForeign :: IsForeign LikeRequest where
  read json =
      mkLikeRequest
      <$> readProp "opt" json
      <*> (unNullOrUndefined <$> readProp "reason" json)
      <*> readProp "guard" json


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


mkLikeResponse :: Int -> Ent -> Int -> Int -> LikeOpt -> Int -> (Maybe String) -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> LikeResponse
mkLikeResponse id ent entId userId opt score reason active guard createdAt modifiedAt =
  LikeResponse{id, ent, entId, userId, opt, score, reason, active, guard, createdAt, modifiedAt}


unwrapLikeResponse :: LikeResponse -> {
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
      <*> (unNullOrUndefined <$> readProp "reason" json)
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)


instance likeResponseIsForeign :: IsForeign LikeResponse where
  read json =
      mkLikeResponse
      <$> readProp "id" json
      <*> readProp "ent" json
      <*> readProp "ent_id" json
      <*> readProp "user_id" json
      <*> readProp "opt" json
      <*> readProp "score" json
      <*> (unNullOrUndefined <$> readProp "reason" json)
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)


newtype LikeResponses = LikeResponses {
  likeResponses :: (Array LikeResponse)
}


type LikeResponsesR = {
  likeResponses :: (Array LikeResponse)
}


mkLikeResponses :: (Array LikeResponse) -> LikeResponses
mkLikeResponses likeResponses =
  LikeResponses{likeResponses}


unwrapLikeResponses :: LikeResponses -> {
  likeResponses :: (Array LikeResponse)
}
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


mkLikeStatResponse :: Ent -> Int -> Int -> Int -> Int -> Int -> LikeStatResponse
mkLikeStatResponse ent entId score like neutral dislike =
  LikeStatResponse{ent, entId, score, like, neutral, dislike}


unwrapLikeStatResponse :: LikeStatResponse -> {
  ent :: Ent,
  entId :: Int,
  score :: Int,
  like :: Int,
  neutral :: Int,
  dislike :: Int
}
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


newtype LikeStatResponses = LikeStatResponses {
  likeStatResponses :: (Array LikeStatResponse)
}


type LikeStatResponsesR = {
  likeStatResponses :: (Array LikeStatResponse)
}


mkLikeStatResponses :: (Array LikeStatResponse) -> LikeStatResponses
mkLikeStatResponses likeStatResponses =
  LikeStatResponses{likeStatResponses}


unwrapLikeStatResponses :: LikeStatResponses -> {
  likeStatResponses :: (Array LikeStatResponse)
}
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
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (LnFactList x0) =
       "tag" := "LnFactList"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (LnCard x0) =
       "tag" := "LnCard"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (LnDCard x0) =
       "tag" := "LnDCard"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (LnDCardX x0) =
       "tag" := "LnDCardX"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (LnAcronym x0) =
       "tag" := "LnAcronym"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (LnSynonym x0) =
       "tag" := "LnSynonym"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (LnAntonym x0) =
       "tag" := "LnAntonym"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (LnTemplate x0) =
       "tag" := "LnTemplate"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (LnImageAssociation x0) =
       "tag" := "LnImageAssociation"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (LnLinearDemo x0) =
       "tag" := "LnLinearDemo"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (LnTable x0) =
       "tag" := "LnTable"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (LnScript x0) =
       "tag" := "LnScript"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (LnQA x0) =
       "tag" := "LnQA"
    ~> "contents" := [encodeJson x0]
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
        r <- obj .? "contents"
        case r of
          [x0] -> LnFact <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for LnFact"


      "LnFactList" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> LnFactList <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for LnFactList"


      "LnCard" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> LnCard <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for LnCard"


      "LnDCard" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> LnDCard <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for LnDCard"


      "LnDCardX" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> LnDCardX <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for LnDCardX"


      "LnAcronym" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> LnAcronym <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for LnAcronym"


      "LnSynonym" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> LnSynonym <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for LnSynonym"


      "LnAntonym" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> LnAntonym <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for LnAntonym"


      "LnTemplate" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> LnTemplate <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for LnTemplate"


      "LnImageAssociation" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> LnImageAssociation <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for LnImageAssociation"


      "LnLinearDemo" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> LnLinearDemo <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for LnLinearDemo"


      "LnTable" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> LnTable <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for LnTable"


      "LnScript" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> LnScript <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for LnScript"


      "LnQA" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> LnQA <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for LnQA"


      "LnExamples" -> do
        pure LnExamples

      "LnEmpty" -> do
        pure LnEmpty

      _ -> Left $ "DecodeJson TypeMismatch for LeuronData"



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
        r <- readProp "contents" json
        case r of
          [x0] -> LnFact <$> read x0
          _ -> Left $ TypeMismatch "LnFact" "Respondable"


      "LnFactList" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> LnFactList <$> read x0
          _ -> Left $ TypeMismatch "LnFactList" "Respondable"


      "LnCard" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> LnCard <$> read x0
          _ -> Left $ TypeMismatch "LnCard" "Respondable"


      "LnDCard" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> LnDCard <$> read x0
          _ -> Left $ TypeMismatch "LnDCard" "Respondable"


      "LnDCardX" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> LnDCardX <$> read x0
          _ -> Left $ TypeMismatch "LnDCardX" "Respondable"


      "LnAcronym" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> LnAcronym <$> read x0
          _ -> Left $ TypeMismatch "LnAcronym" "Respondable"


      "LnSynonym" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> LnSynonym <$> read x0
          _ -> Left $ TypeMismatch "LnSynonym" "Respondable"


      "LnAntonym" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> LnAntonym <$> read x0
          _ -> Left $ TypeMismatch "LnAntonym" "Respondable"


      "LnTemplate" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> LnTemplate <$> read x0
          _ -> Left $ TypeMismatch "LnTemplate" "Respondable"


      "LnImageAssociation" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> LnImageAssociation <$> read x0
          _ -> Left $ TypeMismatch "LnImageAssociation" "Respondable"


      "LnLinearDemo" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> LnLinearDemo <$> read x0
          _ -> Left $ TypeMismatch "LnLinearDemo" "Respondable"


      "LnTable" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> LnTable <$> read x0
          _ -> Left $ TypeMismatch "LnTable" "Respondable"


      "LnScript" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> LnScript <$> read x0
          _ -> Left $ TypeMismatch "LnScript" "Respondable"


      "LnQA" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> LnQA <$> read x0
          _ -> Left $ TypeMismatch "LnQA" "Respondable"


      "LnExamples" -> do
        pure LnExamples

      "LnEmpty" -> do
        pure LnEmpty

      _ -> Left $ TypeMismatch "LeuronData" "Respondable"



instance leuronDataIsForeign :: IsForeign LeuronData where
  read json = do
    tag <- readProp "tag" json
    case tag of
      "LnFact" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> LnFact <$> read x0
          _ -> Left $ TypeMismatch "LnFact" "IsForeign"


      "LnFactList" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> LnFactList <$> read x0
          _ -> Left $ TypeMismatch "LnFactList" "IsForeign"


      "LnCard" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> LnCard <$> read x0
          _ -> Left $ TypeMismatch "LnCard" "IsForeign"


      "LnDCard" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> LnDCard <$> read x0
          _ -> Left $ TypeMismatch "LnDCard" "IsForeign"


      "LnDCardX" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> LnDCardX <$> read x0
          _ -> Left $ TypeMismatch "LnDCardX" "IsForeign"


      "LnAcronym" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> LnAcronym <$> read x0
          _ -> Left $ TypeMismatch "LnAcronym" "IsForeign"


      "LnSynonym" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> LnSynonym <$> read x0
          _ -> Left $ TypeMismatch "LnSynonym" "IsForeign"


      "LnAntonym" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> LnAntonym <$> read x0
          _ -> Left $ TypeMismatch "LnAntonym" "IsForeign"


      "LnTemplate" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> LnTemplate <$> read x0
          _ -> Left $ TypeMismatch "LnTemplate" "IsForeign"


      "LnImageAssociation" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> LnImageAssociation <$> read x0
          _ -> Left $ TypeMismatch "LnImageAssociation" "IsForeign"


      "LnLinearDemo" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> LnLinearDemo <$> read x0
          _ -> Left $ TypeMismatch "LnLinearDemo" "IsForeign"


      "LnTable" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> LnTable <$> read x0
          _ -> Left $ TypeMismatch "LnTable" "IsForeign"


      "LnScript" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> LnScript <$> read x0
          _ -> Left $ TypeMismatch "LnScript" "IsForeign"


      "LnQA" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> LnQA <$> read x0
          _ -> Left $ TypeMismatch "LnQA" "IsForeign"


      "LnExamples" -> do
        pure LnExamples

      "LnEmpty" -> do
        pure LnEmpty

      _ -> Left $ TypeMismatch "LeuronData" "IsForeign"



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
        pure TyLnFact

      "TyLnFactList" -> do
        pure TyLnFactList

      "TyLnCard" -> do
        pure TyLnCard

      "TyLnDCard" -> do
        pure TyLnDCard

      "TyLnDCardX" -> do
        pure TyLnDCardX

      "TyLnAcronym" -> do
        pure TyLnAcronym

      "TyLnSynonym" -> do
        pure TyLnSynonym

      "TyLnAntonym" -> do
        pure TyLnAntonym

      "TyLnTemplate" -> do
        pure TyLnTemplate

      "TyLnImageAssociation" -> do
        pure TyLnImageAssociation

      "TyLnLinearDemo" -> do
        pure TyLnLinearDemo

      "TyLnTable" -> do
        pure TyLnTable

      "TyLnScript" -> do
        pure TyLnScript

      "TyLnQA" -> do
        pure TyLnQA

      "TyLnExamples" -> do
        pure TyLnExamples

      "TyLnEmpty" -> do
        pure TyLnEmpty

      _ -> Left $ "DecodeJson TypeMismatch for TyLeuron"



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
        pure TyLnFact

      "TyLnFactList" -> do
        pure TyLnFactList

      "TyLnCard" -> do
        pure TyLnCard

      "TyLnDCard" -> do
        pure TyLnDCard

      "TyLnDCardX" -> do
        pure TyLnDCardX

      "TyLnAcronym" -> do
        pure TyLnAcronym

      "TyLnSynonym" -> do
        pure TyLnSynonym

      "TyLnAntonym" -> do
        pure TyLnAntonym

      "TyLnTemplate" -> do
        pure TyLnTemplate

      "TyLnImageAssociation" -> do
        pure TyLnImageAssociation

      "TyLnLinearDemo" -> do
        pure TyLnLinearDemo

      "TyLnTable" -> do
        pure TyLnTable

      "TyLnScript" -> do
        pure TyLnScript

      "TyLnQA" -> do
        pure TyLnQA

      "TyLnExamples" -> do
        pure TyLnExamples

      "TyLnEmpty" -> do
        pure TyLnEmpty

      _ -> Left $ TypeMismatch "TyLeuron" "Respondable"



instance tyLeuronIsForeign :: IsForeign TyLeuron where
  read json = do
    tag <- readProp "tag" json
    case tag of
      "TyLnFact" -> do
        pure TyLnFact

      "TyLnFactList" -> do
        pure TyLnFactList

      "TyLnCard" -> do
        pure TyLnCard

      "TyLnDCard" -> do
        pure TyLnDCard

      "TyLnDCardX" -> do
        pure TyLnDCardX

      "TyLnAcronym" -> do
        pure TyLnAcronym

      "TyLnSynonym" -> do
        pure TyLnSynonym

      "TyLnAntonym" -> do
        pure TyLnAntonym

      "TyLnTemplate" -> do
        pure TyLnTemplate

      "TyLnImageAssociation" -> do
        pure TyLnImageAssociation

      "TyLnLinearDemo" -> do
        pure TyLnLinearDemo

      "TyLnTable" -> do
        pure TyLnTable

      "TyLnScript" -> do
        pure TyLnScript

      "TyLnQA" -> do
        pure TyLnQA

      "TyLnExamples" -> do
        pure TyLnExamples

      "TyLnEmpty" -> do
        pure TyLnEmpty

      _ -> Left $ TypeMismatch "TyLeuron" "IsForeign"



instance tyLeuronEq :: Eq TyLeuron where
  eq TyLnFact TyLnFact = true
  eq TyLnFactList TyLnFactList = true
  eq TyLnCard TyLnCard = true
  eq TyLnDCard TyLnDCard = true
  eq TyLnDCardX TyLnDCardX = true
  eq TyLnAcronym TyLnAcronym = true
  eq TyLnSynonym TyLnSynonym = true
  eq TyLnAntonym TyLnAntonym = true
  eq TyLnTemplate TyLnTemplate = true
  eq TyLnImageAssociation TyLnImageAssociation = true
  eq TyLnLinearDemo TyLnLinearDemo = true
  eq TyLnTable TyLnTable = true
  eq TyLnScript TyLnScript = true
  eq TyLnQA TyLnQA = true
  eq TyLnExamples TyLnExamples = true
  eq TyLnEmpty TyLnEmpty = true
  eq _ _ = false

newtype Fact = Fact {
  text :: String
}


type FactR = {
  text :: String
}


mkFact :: String -> Fact
mkFact text =
  Fact{text}


unwrapFact :: Fact -> {
  text :: String
}
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


newtype FactList = FactList {
  fact :: String,
  list :: (Array String)
}


type FactListR = {
  fact :: String,
  list :: (Array String)
}


mkFactList :: String -> (Array String) -> FactList
mkFactList fact list =
  FactList{fact, list}


unwrapFactList :: FactList -> {
  fact :: String,
  list :: (Array String)
}
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


newtype Card = Card {
  front :: String,
  back :: String
}


type CardR = {
  front :: String,
  back :: String
}


mkCard :: String -> String -> Card
mkCard front back =
  Card{front, back}


unwrapCard :: Card -> {
  front :: String,
  back :: String
}
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


newtype DCard = DCard {
  front :: String,
  back :: String
}


type DCardR = {
  front :: String,
  back :: String
}


mkDCard :: String -> String -> DCard
mkDCard front back =
  DCard{front, back}


unwrapDCard :: DCard -> {
  front :: String,
  back :: String
}
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


newtype DCardX = DCardX {
  front :: (Array String),
  back :: (Array String)
}


type DCardXR = {
  front :: (Array String),
  back :: (Array String)
}


mkDCardX :: (Array String) -> (Array String) -> DCardX
mkDCardX front back =
  DCardX{front, back}


unwrapDCardX :: DCardX -> {
  front :: (Array String),
  back :: (Array String)
}
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


newtype Acronym = Acronym {
  abbreviation :: String,
  meaning :: String
}


type AcronymR = {
  abbreviation :: String,
  meaning :: String
}


mkAcronym :: String -> String -> Acronym
mkAcronym abbreviation meaning =
  Acronym{abbreviation, meaning}


unwrapAcronym :: Acronym -> {
  abbreviation :: String,
  meaning :: String
}
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


newtype Synonym = Synonym {
  a :: String,
  b :: String
}


type SynonymR = {
  a :: String,
  b :: String
}


mkSynonym :: String -> String -> Synonym
mkSynonym a b =
  Synonym{a, b}


unwrapSynonym :: Synonym -> {
  a :: String,
  b :: String
}
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


newtype Antonym = Antonym {
  a :: String,
  b :: String
}


type AntonymR = {
  a :: String,
  b :: String
}


mkAntonym :: String -> String -> Antonym
mkAntonym a b =
  Antonym{a, b}


unwrapAntonym :: Antonym -> {
  a :: String,
  b :: String
}
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


newtype Template = Template {
  template :: String,
  values :: (Array TemplateValue)
}


type TemplateR = {
  template :: String,
  values :: (Array TemplateValue)
}


mkTemplate :: String -> (Array TemplateValue) -> Template
mkTemplate template values =
  Template{template, values}


unwrapTemplate :: Template -> {
  template :: String,
  values :: (Array TemplateValue)
}
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


mkImageAssociation :: (Array String) -> (Array String) -> (Array String) -> ImageAssociation
mkImageAssociation imageUrl assocBy assocResult =
  ImageAssociation{imageUrl, assocBy, assocResult}


unwrapImageAssociation :: ImageAssociation -> {
  imageUrl :: (Array String),
  assocBy :: (Array String),
  assocResult :: (Array String)
}
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


mkScript :: String -> String -> String -> Script
mkScript title desc url =
  Script{title, desc, url}


unwrapScript :: Script -> {
  title :: String,
  desc :: String,
  url :: String
}
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


mkLinearDemo :: String -> (Array LinearDemoNode) -> LinearDemo
mkLinearDemo label content =
  LinearDemo{label, content}


unwrapLinearDemo :: LinearDemo -> {
  label :: String,
  content :: (Array LinearDemoNode)
}
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


newtype QA = QA {
  question :: String,
  answer :: String
}


type QAR = {
  question :: String,
  answer :: String
}


mkQA :: String -> String -> QA
mkQA question answer =
  QA{question, answer}


unwrapQA :: QA -> {
  question :: String,
  answer :: String
}
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


mkTable :: String -> (Array String) -> (Array (Array (Maybe String))) -> Table
mkTable title columns rows =
  Table{title, columns, rows}


unwrapTable :: Table -> {
  title :: String,
  columns :: (Array String),
  rows :: (Array (Array (Maybe String)))
}
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
        pure Membership_InviteOnly

      "Membership_RequestInvite" -> do
        pure Membership_RequestInvite

      "Membership_Join" -> do
        pure Membership_Join

      "Membership_Locked" -> do
        pure Membership_Locked

      _ -> Left $ "DecodeJson TypeMismatch for Membership"



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
        pure Membership_InviteOnly

      "Membership_RequestInvite" -> do
        pure Membership_RequestInvite

      "Membership_Join" -> do
        pure Membership_Join

      "Membership_Locked" -> do
        pure Membership_Locked

      _ -> Left $ TypeMismatch "Membership" "Respondable"



instance membershipIsForeign :: IsForeign Membership where
  read json = do
    tag <- readProp "tag" json
    case tag of
      "Membership_InviteOnly" -> do
        pure Membership_InviteOnly

      "Membership_RequestInvite" -> do
        pure Membership_RequestInvite

      "Membership_Join" -> do
        pure Membership_Join

      "Membership_Locked" -> do
        pure Membership_Locked

      _ -> Left $ TypeMismatch "Membership" "IsForeign"



instance membershipEq :: Eq Membership where
  eq Membership_InviteOnly Membership_InviteOnly = true
  eq Membership_RequestInvite Membership_RequestInvite = true
  eq Membership_Join Membership_Join = true
  eq Membership_Locked Membership_Locked = true
  eq _ _ = false

readMembership :: String -> Maybe Membership
readMembership "invite_only" = Just Membership_InviteOnly
readMembership "request_invite" = Just Membership_RequestInvite
readMembership "join" = Just Membership_Join
readMembership "locked" = Just Membership_Locked
readMembership _ = Nothing

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


mkOrganizationRequest :: String -> (Maybe String) -> String -> String -> String -> Membership -> (Array String) -> (Maybe String) -> Visibility -> Int -> OrganizationRequest
mkOrganizationRequest displayName description company location email membership tags icon visibility guard =
  OrganizationRequest{displayName, description, company, location, email, membership, tags, icon, visibility, guard}


unwrapOrganizationRequest :: OrganizationRequest -> {
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
      <*> (unNullOrUndefined <$> readProp "description" json)
      <*> readProp "company" json
      <*> readProp "location" json
      <*> readProp "email" json
      <*> readProp "membership" json
      <*> readProp "tags" json
      <*> (unNullOrUndefined <$> readProp "icon" json)
      <*> readProp "visibility" json
      <*> readProp "guard" json


instance organizationRequestIsForeign :: IsForeign OrganizationRequest where
  read json =
      mkOrganizationRequest
      <$> readProp "display_name" json
      <*> (unNullOrUndefined <$> readProp "description" json)
      <*> readProp "company" json
      <*> readProp "location" json
      <*> readProp "email" json
      <*> readProp "membership" json
      <*> readProp "tags" json
      <*> (unNullOrUndefined <$> readProp "icon" json)
      <*> readProp "visibility" json
      <*> readProp "guard" json


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


mkOrganizationResponse :: Int -> Int -> String -> String -> (Maybe String) -> String -> String -> String -> String -> Membership -> (Maybe String) -> (Array String) -> Visibility -> Boolean -> Int -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> OrganizationResponse
mkOrganizationResponse id userId name displayName description company location email emailMD5 membership icon tags visibility active guard createdAt modifiedBy modifiedAt activityAt =
  OrganizationResponse{id, userId, name, displayName, description, company, location, email, emailMD5, membership, icon, tags, visibility, active, guard, createdAt, modifiedBy, modifiedAt, activityAt}


unwrapOrganizationResponse :: OrganizationResponse -> {
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
      <*> (unNullOrUndefined <$> readProp "description" json)
      <*> readProp "company" json
      <*> readProp "location" json
      <*> readProp "email" json
      <*> readProp "email_md5" json
      <*> readProp "membership" json
      <*> (unNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "visibility" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_by" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)
      <*> (unNullOrUndefined <$> readProp "activity_at" json)


instance organizationResponseIsForeign :: IsForeign OrganizationResponse where
  read json =
      mkOrganizationResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "name" json
      <*> readProp "display_name" json
      <*> (unNullOrUndefined <$> readProp "description" json)
      <*> readProp "company" json
      <*> readProp "location" json
      <*> readProp "email" json
      <*> readProp "email_md5" json
      <*> readProp "membership" json
      <*> (unNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "visibility" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_by" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)
      <*> (unNullOrUndefined <$> readProp "activity_at" json)


newtype OrganizationResponses = OrganizationResponses {
  organizationResponses :: (Array OrganizationResponse)
}


type OrganizationResponsesR = {
  organizationResponses :: (Array OrganizationResponse)
}


mkOrganizationResponses :: (Array OrganizationResponse) -> OrganizationResponses
mkOrganizationResponses organizationResponses =
  OrganizationResponses{organizationResponses}


unwrapOrganizationResponses :: OrganizationResponses -> {
  organizationResponses :: (Array OrganizationResponse)
}
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


mkOrganizationStatResponse :: Int -> Int -> Int -> Int -> Int -> Int -> Int -> Int -> OrganizationStatResponse
mkOrganizationStatResponse organizationId teams members forums boards threads threadPosts views =
  OrganizationStatResponse{organizationId, teams, members, forums, boards, threads, threadPosts, views}


unwrapOrganizationStatResponse :: OrganizationStatResponse -> {
  organizationId :: Int,
  teams :: Int,
  members :: Int,
  forums :: Int,
  boards :: Int,
  threads :: Int,
  threadPosts :: Int,
  views :: Int
}
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


newtype OrganizationStatResponses = OrganizationStatResponses {
  organizationStatResponses :: (Array OrganizationStatResponse)
}


type OrganizationStatResponsesR = {
  organizationStatResponses :: (Array OrganizationStatResponse)
}


mkOrganizationStatResponses :: (Array OrganizationStatResponse) -> OrganizationStatResponses
mkOrganizationStatResponses organizationStatResponses =
  OrganizationStatResponses{organizationStatResponses}


unwrapOrganizationStatResponses :: OrganizationStatResponses -> {
  organizationStatResponses :: (Array OrganizationStatResponse)
}
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
  | ByUserName String
  | ByUsersNames (Array String)
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
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (Offset x0) =
       "tag" := "Offset"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (SortOrder x0) =
       "tag" := "SortOrder"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (Order x0) =
       "tag" := "Order"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByOrganizationId x0) =
       "tag" := "ByOrganizationId"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByOrganizationsIds x0) =
       "tag" := "ByOrganizationsIds"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByOrganizationName x0) =
       "tag" := "ByOrganizationName"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByTeamId x0) =
       "tag" := "ByTeamId"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByTeamsIds x0) =
       "tag" := "ByTeamsIds"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByTeamName x0) =
       "tag" := "ByTeamName"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByTeamMemberId x0) =
       "tag" := "ByTeamMemberId"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByTeamMembersIds x0) =
       "tag" := "ByTeamMembersIds"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByUserId x0) =
       "tag" := "ByUserId"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByUsersIds x0) =
       "tag" := "ByUsersIds"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByUserName x0) =
       "tag" := "ByUserName"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByUsersNames x0) =
       "tag" := "ByUsersNames"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByGlobalGroupId x0) =
       "tag" := "ByGlobalGroupId"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByGlobalGroupsIds x0) =
       "tag" := "ByGlobalGroupsIds"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByGroupId x0) =
       "tag" := "ByGroupId"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByGroupsIds x0) =
       "tag" := "ByGroupsIds"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByGroupMemberId x0) =
       "tag" := "ByGroupMemberId"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByGroupMembersIds x0) =
       "tag" := "ByGroupMembersIds"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByForumId x0) =
       "tag" := "ByForumId"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByForumsIds x0) =
       "tag" := "ByForumsIds"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByForumName x0) =
       "tag" := "ByForumName"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByBoardId x0) =
       "tag" := "ByBoardId"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByBoardsIds x0) =
       "tag" := "ByBoardsIds"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByBoardName x0) =
       "tag" := "ByBoardName"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByThreadId x0) =
       "tag" := "ByThreadId"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByThreadsIds x0) =
       "tag" := "ByThreadsIds"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByThreadName x0) =
       "tag" := "ByThreadName"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByThreadPostId x0) =
       "tag" := "ByThreadPostId"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByThreadPostsIds x0) =
       "tag" := "ByThreadPostsIds"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByThreadPostName x0) =
       "tag" := "ByThreadPostName"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByThreadPostLikeId x0) =
       "tag" := "ByThreadPostLikeId"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByThreadPostLikesIds x0) =
       "tag" := "ByThreadPostLikesIds"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByThreadPostStarId x0) =
       "tag" := "ByThreadPostStarId"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByThreadPostStarsIds x0) =
       "tag" := "ByThreadPostStarsIds"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByBucketId x0) =
       "tag" := "ByBucketId"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByResourceId x0) =
       "tag" := "ByResourceId"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByResourcesIds x0) =
       "tag" := "ByResourcesIds"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByResourceName x0) =
       "tag" := "ByResourceName"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByLeuronId x0) =
       "tag" := "ByLeuronId"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByLeuronsIds x0) =
       "tag" := "ByLeuronsIds"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByPmId x0) =
       "tag" := "ByPmId"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByPmsIds x0) =
       "tag" := "ByPmsIds"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByReminderId x0) =
       "tag" := "ByReminderId"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByReminderFolderId x0) =
       "tag" := "ByReminderFolderId"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByParentId x0) =
       "tag" := "ByParentId"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByParentsIds x0) =
       "tag" := "ByParentsIds"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ByParentName x0) =
       "tag" := "ByParentName"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (BySelf x0) =
       "tag" := "BySelf"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (Timestamp x0) =
       "tag" := "Timestamp"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (UnixTimestamp x0) =
       "tag" := "UnixTimestamp"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (CreatedAtTimestamp x0) =
       "tag" := "CreatedAtTimestamp"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (CreatedAtUnixTimestamp x0) =
       "tag" := "CreatedAtUnixTimestamp"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (RealIP x0) =
       "tag" := "RealIP"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (IP x0) =
       "tag" := "IP"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (WithOrganization x0) =
       "tag" := "WithOrganization"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (WithForum x0) =
       "tag" := "WithForum"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (WithBoard x0) =
       "tag" := "WithBoard"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (WithThread x0) =
       "tag" := "WithThread"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (WithResource x0) =
       "tag" := "WithResource"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject


instance paramDecodeJson :: DecodeJson Param where
  decodeJson json = do
    obj <- decodeJson json
    tag <- obj .? "tag"
    case tag of
      "Limit" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> Limit <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for Limit"


      "Offset" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> Offset <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for Offset"


      "SortOrder" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> SortOrder <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for SortOrder"


      "Order" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> Order <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for Order"


      "ByOrganizationId" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByOrganizationId <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByOrganizationId"


      "ByOrganizationsIds" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByOrganizationsIds <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByOrganizationsIds"


      "ByOrganizationName" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByOrganizationName <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByOrganizationName"


      "ByTeamId" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByTeamId <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByTeamId"


      "ByTeamsIds" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByTeamsIds <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByTeamsIds"


      "ByTeamName" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByTeamName <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByTeamName"


      "ByTeamMemberId" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByTeamMemberId <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByTeamMemberId"


      "ByTeamMembersIds" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByTeamMembersIds <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByTeamMembersIds"


      "ByUserId" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByUserId <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByUserId"


      "ByUsersIds" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByUsersIds <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByUsersIds"


      "ByUserName" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByUserName <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByUserName"


      "ByUsersNames" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByUsersNames <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByUsersNames"


      "ByGlobalGroupId" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByGlobalGroupId <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByGlobalGroupId"


      "ByGlobalGroupsIds" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByGlobalGroupsIds <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByGlobalGroupsIds"


      "ByGroupId" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByGroupId <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByGroupId"


      "ByGroupsIds" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByGroupsIds <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByGroupsIds"


      "ByGroupMemberId" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByGroupMemberId <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByGroupMemberId"


      "ByGroupMembersIds" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByGroupMembersIds <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByGroupMembersIds"


      "ByForumId" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByForumId <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByForumId"


      "ByForumsIds" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByForumsIds <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByForumsIds"


      "ByForumName" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByForumName <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByForumName"


      "ByBoardId" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByBoardId <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByBoardId"


      "ByBoardsIds" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByBoardsIds <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByBoardsIds"


      "ByBoardName" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByBoardName <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByBoardName"


      "ByThreadId" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByThreadId <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByThreadId"


      "ByThreadsIds" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByThreadsIds <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByThreadsIds"


      "ByThreadName" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByThreadName <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByThreadName"


      "ByThreadPostId" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByThreadPostId <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByThreadPostId"


      "ByThreadPostsIds" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByThreadPostsIds <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByThreadPostsIds"


      "ByThreadPostName" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByThreadPostName <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByThreadPostName"


      "ByThreadPostLikeId" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByThreadPostLikeId <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByThreadPostLikeId"


      "ByThreadPostLikesIds" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByThreadPostLikesIds <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByThreadPostLikesIds"


      "ByThreadPostStarId" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByThreadPostStarId <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByThreadPostStarId"


      "ByThreadPostStarsIds" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByThreadPostStarsIds <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByThreadPostStarsIds"


      "ByBucketId" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByBucketId <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByBucketId"


      "ByResourceId" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByResourceId <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByResourceId"


      "ByResourcesIds" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByResourcesIds <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByResourcesIds"


      "ByResourceName" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByResourceName <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByResourceName"


      "ByLeuronId" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByLeuronId <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByLeuronId"


      "ByLeuronsIds" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByLeuronsIds <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByLeuronsIds"


      "ByPmId" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByPmId <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByPmId"


      "ByPmsIds" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByPmsIds <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByPmsIds"


      "ByReminderId" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByReminderId <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByReminderId"


      "ByReminderFolderId" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByReminderFolderId <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByReminderFolderId"


      "ByParentId" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByParentId <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByParentId"


      "ByParentsIds" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByParentsIds <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByParentsIds"


      "ByParentName" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ByParentName <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ByParentName"


      "BySelf" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> BySelf <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for BySelf"


      "Timestamp" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> Timestamp <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for Timestamp"


      "UnixTimestamp" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> UnixTimestamp <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for UnixTimestamp"


      "CreatedAtTimestamp" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> CreatedAtTimestamp <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for CreatedAtTimestamp"


      "CreatedAtUnixTimestamp" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> CreatedAtUnixTimestamp <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for CreatedAtUnixTimestamp"


      "RealIP" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> RealIP <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for RealIP"


      "IP" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> IP <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for IP"


      "WithOrganization" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> WithOrganization <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for WithOrganization"


      "WithForum" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> WithForum <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for WithForum"


      "WithBoard" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> WithBoard <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for WithBoard"


      "WithThread" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> WithThread <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for WithThread"


      "WithResource" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> WithResource <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for WithResource"


      _ -> Left $ "DecodeJson TypeMismatch for Param"



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
        r <- readProp "contents" json
        case r of
          [x0] -> Limit <$> read x0
          _ -> Left $ TypeMismatch "Limit" "Respondable"


      "Offset" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> Offset <$> read x0
          _ -> Left $ TypeMismatch "Offset" "Respondable"


      "SortOrder" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> SortOrder <$> read x0
          _ -> Left $ TypeMismatch "SortOrder" "Respondable"


      "Order" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> Order <$> read x0
          _ -> Left $ TypeMismatch "Order" "Respondable"


      "ByOrganizationId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByOrganizationId <$> read x0
          _ -> Left $ TypeMismatch "ByOrganizationId" "Respondable"


      "ByOrganizationsIds" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByOrganizationsIds <$> read x0
          _ -> Left $ TypeMismatch "ByOrganizationsIds" "Respondable"


      "ByOrganizationName" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByOrganizationName <$> read x0
          _ -> Left $ TypeMismatch "ByOrganizationName" "Respondable"


      "ByTeamId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByTeamId <$> read x0
          _ -> Left $ TypeMismatch "ByTeamId" "Respondable"


      "ByTeamsIds" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByTeamsIds <$> read x0
          _ -> Left $ TypeMismatch "ByTeamsIds" "Respondable"


      "ByTeamName" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByTeamName <$> read x0
          _ -> Left $ TypeMismatch "ByTeamName" "Respondable"


      "ByTeamMemberId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByTeamMemberId <$> read x0
          _ -> Left $ TypeMismatch "ByTeamMemberId" "Respondable"


      "ByTeamMembersIds" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByTeamMembersIds <$> read x0
          _ -> Left $ TypeMismatch "ByTeamMembersIds" "Respondable"


      "ByUserId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByUserId <$> read x0
          _ -> Left $ TypeMismatch "ByUserId" "Respondable"


      "ByUsersIds" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByUsersIds <$> read x0
          _ -> Left $ TypeMismatch "ByUsersIds" "Respondable"


      "ByUserName" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByUserName <$> read x0
          _ -> Left $ TypeMismatch "ByUserName" "Respondable"


      "ByUsersNames" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByUsersNames <$> read x0
          _ -> Left $ TypeMismatch "ByUsersNames" "Respondable"


      "ByGlobalGroupId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByGlobalGroupId <$> read x0
          _ -> Left $ TypeMismatch "ByGlobalGroupId" "Respondable"


      "ByGlobalGroupsIds" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByGlobalGroupsIds <$> read x0
          _ -> Left $ TypeMismatch "ByGlobalGroupsIds" "Respondable"


      "ByGroupId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByGroupId <$> read x0
          _ -> Left $ TypeMismatch "ByGroupId" "Respondable"


      "ByGroupsIds" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByGroupsIds <$> read x0
          _ -> Left $ TypeMismatch "ByGroupsIds" "Respondable"


      "ByGroupMemberId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByGroupMemberId <$> read x0
          _ -> Left $ TypeMismatch "ByGroupMemberId" "Respondable"


      "ByGroupMembersIds" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByGroupMembersIds <$> read x0
          _ -> Left $ TypeMismatch "ByGroupMembersIds" "Respondable"


      "ByForumId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByForumId <$> read x0
          _ -> Left $ TypeMismatch "ByForumId" "Respondable"


      "ByForumsIds" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByForumsIds <$> read x0
          _ -> Left $ TypeMismatch "ByForumsIds" "Respondable"


      "ByForumName" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByForumName <$> read x0
          _ -> Left $ TypeMismatch "ByForumName" "Respondable"


      "ByBoardId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByBoardId <$> read x0
          _ -> Left $ TypeMismatch "ByBoardId" "Respondable"


      "ByBoardsIds" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByBoardsIds <$> read x0
          _ -> Left $ TypeMismatch "ByBoardsIds" "Respondable"


      "ByBoardName" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByBoardName <$> read x0
          _ -> Left $ TypeMismatch "ByBoardName" "Respondable"


      "ByThreadId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByThreadId <$> read x0
          _ -> Left $ TypeMismatch "ByThreadId" "Respondable"


      "ByThreadsIds" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByThreadsIds <$> read x0
          _ -> Left $ TypeMismatch "ByThreadsIds" "Respondable"


      "ByThreadName" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByThreadName <$> read x0
          _ -> Left $ TypeMismatch "ByThreadName" "Respondable"


      "ByThreadPostId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByThreadPostId <$> read x0
          _ -> Left $ TypeMismatch "ByThreadPostId" "Respondable"


      "ByThreadPostsIds" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByThreadPostsIds <$> read x0
          _ -> Left $ TypeMismatch "ByThreadPostsIds" "Respondable"


      "ByThreadPostName" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByThreadPostName <$> read x0
          _ -> Left $ TypeMismatch "ByThreadPostName" "Respondable"


      "ByThreadPostLikeId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByThreadPostLikeId <$> read x0
          _ -> Left $ TypeMismatch "ByThreadPostLikeId" "Respondable"


      "ByThreadPostLikesIds" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByThreadPostLikesIds <$> read x0
          _ -> Left $ TypeMismatch "ByThreadPostLikesIds" "Respondable"


      "ByThreadPostStarId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByThreadPostStarId <$> read x0
          _ -> Left $ TypeMismatch "ByThreadPostStarId" "Respondable"


      "ByThreadPostStarsIds" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByThreadPostStarsIds <$> read x0
          _ -> Left $ TypeMismatch "ByThreadPostStarsIds" "Respondable"


      "ByBucketId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByBucketId <$> read x0
          _ -> Left $ TypeMismatch "ByBucketId" "Respondable"


      "ByResourceId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByResourceId <$> read x0
          _ -> Left $ TypeMismatch "ByResourceId" "Respondable"


      "ByResourcesIds" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByResourcesIds <$> read x0
          _ -> Left $ TypeMismatch "ByResourcesIds" "Respondable"


      "ByResourceName" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByResourceName <$> read x0
          _ -> Left $ TypeMismatch "ByResourceName" "Respondable"


      "ByLeuronId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByLeuronId <$> read x0
          _ -> Left $ TypeMismatch "ByLeuronId" "Respondable"


      "ByLeuronsIds" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByLeuronsIds <$> read x0
          _ -> Left $ TypeMismatch "ByLeuronsIds" "Respondable"


      "ByPmId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByPmId <$> read x0
          _ -> Left $ TypeMismatch "ByPmId" "Respondable"


      "ByPmsIds" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByPmsIds <$> read x0
          _ -> Left $ TypeMismatch "ByPmsIds" "Respondable"


      "ByReminderId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByReminderId <$> read x0
          _ -> Left $ TypeMismatch "ByReminderId" "Respondable"


      "ByReminderFolderId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByReminderFolderId <$> read x0
          _ -> Left $ TypeMismatch "ByReminderFolderId" "Respondable"


      "ByParentId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByParentId <$> read x0
          _ -> Left $ TypeMismatch "ByParentId" "Respondable"


      "ByParentsIds" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByParentsIds <$> read x0
          _ -> Left $ TypeMismatch "ByParentsIds" "Respondable"


      "ByParentName" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByParentName <$> read x0
          _ -> Left $ TypeMismatch "ByParentName" "Respondable"


      "BySelf" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> BySelf <$> read x0
          _ -> Left $ TypeMismatch "BySelf" "Respondable"


      "Timestamp" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> Timestamp <$> read x0
          _ -> Left $ TypeMismatch "Timestamp" "Respondable"


      "UnixTimestamp" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> UnixTimestamp <$> read x0
          _ -> Left $ TypeMismatch "UnixTimestamp" "Respondable"


      "CreatedAtTimestamp" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> CreatedAtTimestamp <$> read x0
          _ -> Left $ TypeMismatch "CreatedAtTimestamp" "Respondable"


      "CreatedAtUnixTimestamp" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> CreatedAtUnixTimestamp <$> read x0
          _ -> Left $ TypeMismatch "CreatedAtUnixTimestamp" "Respondable"


      "RealIP" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> RealIP <$> read x0
          _ -> Left $ TypeMismatch "RealIP" "Respondable"


      "IP" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> IP <$> read x0
          _ -> Left $ TypeMismatch "IP" "Respondable"


      "WithOrganization" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> WithOrganization <$> read x0
          _ -> Left $ TypeMismatch "WithOrganization" "Respondable"


      "WithForum" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> WithForum <$> read x0
          _ -> Left $ TypeMismatch "WithForum" "Respondable"


      "WithBoard" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> WithBoard <$> read x0
          _ -> Left $ TypeMismatch "WithBoard" "Respondable"


      "WithThread" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> WithThread <$> read x0
          _ -> Left $ TypeMismatch "WithThread" "Respondable"


      "WithResource" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> WithResource <$> read x0
          _ -> Left $ TypeMismatch "WithResource" "Respondable"


      _ -> Left $ TypeMismatch "Param" "Respondable"



instance paramIsForeign :: IsForeign Param where
  read json = do
    tag <- readProp "tag" json
    case tag of
      "Limit" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> Limit <$> read x0
          _ -> Left $ TypeMismatch "Limit" "IsForeign"


      "Offset" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> Offset <$> read x0
          _ -> Left $ TypeMismatch "Offset" "IsForeign"


      "SortOrder" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> SortOrder <$> read x0
          _ -> Left $ TypeMismatch "SortOrder" "IsForeign"


      "Order" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> Order <$> read x0
          _ -> Left $ TypeMismatch "Order" "IsForeign"


      "ByOrganizationId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByOrganizationId <$> read x0
          _ -> Left $ TypeMismatch "ByOrganizationId" "IsForeign"


      "ByOrganizationsIds" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByOrganizationsIds <$> read x0
          _ -> Left $ TypeMismatch "ByOrganizationsIds" "IsForeign"


      "ByOrganizationName" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByOrganizationName <$> read x0
          _ -> Left $ TypeMismatch "ByOrganizationName" "IsForeign"


      "ByTeamId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByTeamId <$> read x0
          _ -> Left $ TypeMismatch "ByTeamId" "IsForeign"


      "ByTeamsIds" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByTeamsIds <$> read x0
          _ -> Left $ TypeMismatch "ByTeamsIds" "IsForeign"


      "ByTeamName" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByTeamName <$> read x0
          _ -> Left $ TypeMismatch "ByTeamName" "IsForeign"


      "ByTeamMemberId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByTeamMemberId <$> read x0
          _ -> Left $ TypeMismatch "ByTeamMemberId" "IsForeign"


      "ByTeamMembersIds" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByTeamMembersIds <$> read x0
          _ -> Left $ TypeMismatch "ByTeamMembersIds" "IsForeign"


      "ByUserId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByUserId <$> read x0
          _ -> Left $ TypeMismatch "ByUserId" "IsForeign"


      "ByUsersIds" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByUsersIds <$> read x0
          _ -> Left $ TypeMismatch "ByUsersIds" "IsForeign"


      "ByUserName" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByUserName <$> read x0
          _ -> Left $ TypeMismatch "ByUserName" "IsForeign"


      "ByUsersNames" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByUsersNames <$> read x0
          _ -> Left $ TypeMismatch "ByUsersNames" "IsForeign"


      "ByGlobalGroupId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByGlobalGroupId <$> read x0
          _ -> Left $ TypeMismatch "ByGlobalGroupId" "IsForeign"


      "ByGlobalGroupsIds" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByGlobalGroupsIds <$> read x0
          _ -> Left $ TypeMismatch "ByGlobalGroupsIds" "IsForeign"


      "ByGroupId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByGroupId <$> read x0
          _ -> Left $ TypeMismatch "ByGroupId" "IsForeign"


      "ByGroupsIds" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByGroupsIds <$> read x0
          _ -> Left $ TypeMismatch "ByGroupsIds" "IsForeign"


      "ByGroupMemberId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByGroupMemberId <$> read x0
          _ -> Left $ TypeMismatch "ByGroupMemberId" "IsForeign"


      "ByGroupMembersIds" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByGroupMembersIds <$> read x0
          _ -> Left $ TypeMismatch "ByGroupMembersIds" "IsForeign"


      "ByForumId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByForumId <$> read x0
          _ -> Left $ TypeMismatch "ByForumId" "IsForeign"


      "ByForumsIds" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByForumsIds <$> read x0
          _ -> Left $ TypeMismatch "ByForumsIds" "IsForeign"


      "ByForumName" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByForumName <$> read x0
          _ -> Left $ TypeMismatch "ByForumName" "IsForeign"


      "ByBoardId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByBoardId <$> read x0
          _ -> Left $ TypeMismatch "ByBoardId" "IsForeign"


      "ByBoardsIds" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByBoardsIds <$> read x0
          _ -> Left $ TypeMismatch "ByBoardsIds" "IsForeign"


      "ByBoardName" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByBoardName <$> read x0
          _ -> Left $ TypeMismatch "ByBoardName" "IsForeign"


      "ByThreadId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByThreadId <$> read x0
          _ -> Left $ TypeMismatch "ByThreadId" "IsForeign"


      "ByThreadsIds" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByThreadsIds <$> read x0
          _ -> Left $ TypeMismatch "ByThreadsIds" "IsForeign"


      "ByThreadName" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByThreadName <$> read x0
          _ -> Left $ TypeMismatch "ByThreadName" "IsForeign"


      "ByThreadPostId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByThreadPostId <$> read x0
          _ -> Left $ TypeMismatch "ByThreadPostId" "IsForeign"


      "ByThreadPostsIds" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByThreadPostsIds <$> read x0
          _ -> Left $ TypeMismatch "ByThreadPostsIds" "IsForeign"


      "ByThreadPostName" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByThreadPostName <$> read x0
          _ -> Left $ TypeMismatch "ByThreadPostName" "IsForeign"


      "ByThreadPostLikeId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByThreadPostLikeId <$> read x0
          _ -> Left $ TypeMismatch "ByThreadPostLikeId" "IsForeign"


      "ByThreadPostLikesIds" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByThreadPostLikesIds <$> read x0
          _ -> Left $ TypeMismatch "ByThreadPostLikesIds" "IsForeign"


      "ByThreadPostStarId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByThreadPostStarId <$> read x0
          _ -> Left $ TypeMismatch "ByThreadPostStarId" "IsForeign"


      "ByThreadPostStarsIds" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByThreadPostStarsIds <$> read x0
          _ -> Left $ TypeMismatch "ByThreadPostStarsIds" "IsForeign"


      "ByBucketId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByBucketId <$> read x0
          _ -> Left $ TypeMismatch "ByBucketId" "IsForeign"


      "ByResourceId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByResourceId <$> read x0
          _ -> Left $ TypeMismatch "ByResourceId" "IsForeign"


      "ByResourcesIds" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByResourcesIds <$> read x0
          _ -> Left $ TypeMismatch "ByResourcesIds" "IsForeign"


      "ByResourceName" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByResourceName <$> read x0
          _ -> Left $ TypeMismatch "ByResourceName" "IsForeign"


      "ByLeuronId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByLeuronId <$> read x0
          _ -> Left $ TypeMismatch "ByLeuronId" "IsForeign"


      "ByLeuronsIds" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByLeuronsIds <$> read x0
          _ -> Left $ TypeMismatch "ByLeuronsIds" "IsForeign"


      "ByPmId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByPmId <$> read x0
          _ -> Left $ TypeMismatch "ByPmId" "IsForeign"


      "ByPmsIds" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByPmsIds <$> read x0
          _ -> Left $ TypeMismatch "ByPmsIds" "IsForeign"


      "ByReminderId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByReminderId <$> read x0
          _ -> Left $ TypeMismatch "ByReminderId" "IsForeign"


      "ByReminderFolderId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByReminderFolderId <$> read x0
          _ -> Left $ TypeMismatch "ByReminderFolderId" "IsForeign"


      "ByParentId" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByParentId <$> read x0
          _ -> Left $ TypeMismatch "ByParentId" "IsForeign"


      "ByParentsIds" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByParentsIds <$> read x0
          _ -> Left $ TypeMismatch "ByParentsIds" "IsForeign"


      "ByParentName" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ByParentName <$> read x0
          _ -> Left $ TypeMismatch "ByParentName" "IsForeign"


      "BySelf" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> BySelf <$> read x0
          _ -> Left $ TypeMismatch "BySelf" "IsForeign"


      "Timestamp" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> Timestamp <$> read x0
          _ -> Left $ TypeMismatch "Timestamp" "IsForeign"


      "UnixTimestamp" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> UnixTimestamp <$> read x0
          _ -> Left $ TypeMismatch "UnixTimestamp" "IsForeign"


      "CreatedAtTimestamp" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> CreatedAtTimestamp <$> read x0
          _ -> Left $ TypeMismatch "CreatedAtTimestamp" "IsForeign"


      "CreatedAtUnixTimestamp" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> CreatedAtUnixTimestamp <$> read x0
          _ -> Left $ TypeMismatch "CreatedAtUnixTimestamp" "IsForeign"


      "RealIP" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> RealIP <$> read x0
          _ -> Left $ TypeMismatch "RealIP" "IsForeign"


      "IP" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> IP <$> read x0
          _ -> Left $ TypeMismatch "IP" "IsForeign"


      "WithOrganization" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> WithOrganization <$> read x0
          _ -> Left $ TypeMismatch "WithOrganization" "IsForeign"


      "WithForum" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> WithForum <$> read x0
          _ -> Left $ TypeMismatch "WithForum" "IsForeign"


      "WithBoard" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> WithBoard <$> read x0
          _ -> Left $ TypeMismatch "WithBoard" "IsForeign"


      "WithThread" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> WithThread <$> read x0
          _ -> Left $ TypeMismatch "WithThread" "IsForeign"


      "WithResource" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> WithResource <$> read x0
          _ -> Left $ TypeMismatch "WithResource" "IsForeign"


      _ -> Left $ TypeMismatch "Param" "IsForeign"



instance paramEq :: Eq Param where
  eq (Limit x0a) (Limit x0b) = x0a == x0b
  eq (Offset x0a) (Offset x0b) = x0a == x0b
  eq (SortOrder x0a) (SortOrder x0b) = x0a == x0b
  eq (Order x0a) (Order x0b) = x0a == x0b
  eq (ByOrganizationId x0a) (ByOrganizationId x0b) = x0a == x0b
  eq (ByOrganizationsIds x0a) (ByOrganizationsIds x0b) = x0a == x0b
  eq (ByOrganizationName x0a) (ByOrganizationName x0b) = x0a == x0b
  eq (ByTeamId x0a) (ByTeamId x0b) = x0a == x0b
  eq (ByTeamsIds x0a) (ByTeamsIds x0b) = x0a == x0b
  eq (ByTeamName x0a) (ByTeamName x0b) = x0a == x0b
  eq (ByTeamMemberId x0a) (ByTeamMemberId x0b) = x0a == x0b
  eq (ByTeamMembersIds x0a) (ByTeamMembersIds x0b) = x0a == x0b
  eq (ByUserId x0a) (ByUserId x0b) = x0a == x0b
  eq (ByUsersIds x0a) (ByUsersIds x0b) = x0a == x0b
  eq (ByUserName x0a) (ByUserName x0b) = x0a == x0b
  eq (ByUsersNames x0a) (ByUsersNames x0b) = x0a == x0b
  eq (ByGlobalGroupId x0a) (ByGlobalGroupId x0b) = x0a == x0b
  eq (ByGlobalGroupsIds x0a) (ByGlobalGroupsIds x0b) = x0a == x0b
  eq (ByGroupId x0a) (ByGroupId x0b) = x0a == x0b
  eq (ByGroupsIds x0a) (ByGroupsIds x0b) = x0a == x0b
  eq (ByGroupMemberId x0a) (ByGroupMemberId x0b) = x0a == x0b
  eq (ByGroupMembersIds x0a) (ByGroupMembersIds x0b) = x0a == x0b
  eq (ByForumId x0a) (ByForumId x0b) = x0a == x0b
  eq (ByForumsIds x0a) (ByForumsIds x0b) = x0a == x0b
  eq (ByForumName x0a) (ByForumName x0b) = x0a == x0b
  eq (ByBoardId x0a) (ByBoardId x0b) = x0a == x0b
  eq (ByBoardsIds x0a) (ByBoardsIds x0b) = x0a == x0b
  eq (ByBoardName x0a) (ByBoardName x0b) = x0a == x0b
  eq (ByThreadId x0a) (ByThreadId x0b) = x0a == x0b
  eq (ByThreadsIds x0a) (ByThreadsIds x0b) = x0a == x0b
  eq (ByThreadName x0a) (ByThreadName x0b) = x0a == x0b
  eq (ByThreadPostId x0a) (ByThreadPostId x0b) = x0a == x0b
  eq (ByThreadPostsIds x0a) (ByThreadPostsIds x0b) = x0a == x0b
  eq (ByThreadPostName x0a) (ByThreadPostName x0b) = x0a == x0b
  eq (ByThreadPostLikeId x0a) (ByThreadPostLikeId x0b) = x0a == x0b
  eq (ByThreadPostLikesIds x0a) (ByThreadPostLikesIds x0b) = x0a == x0b
  eq (ByThreadPostStarId x0a) (ByThreadPostStarId x0b) = x0a == x0b
  eq (ByThreadPostStarsIds x0a) (ByThreadPostStarsIds x0b) = x0a == x0b
  eq (ByBucketId x0a) (ByBucketId x0b) = x0a == x0b
  eq (ByResourceId x0a) (ByResourceId x0b) = x0a == x0b
  eq (ByResourcesIds x0a) (ByResourcesIds x0b) = x0a == x0b
  eq (ByResourceName x0a) (ByResourceName x0b) = x0a == x0b
  eq (ByLeuronId x0a) (ByLeuronId x0b) = x0a == x0b
  eq (ByLeuronsIds x0a) (ByLeuronsIds x0b) = x0a == x0b
  eq (ByPmId x0a) (ByPmId x0b) = x0a == x0b
  eq (ByPmsIds x0a) (ByPmsIds x0b) = x0a == x0b
  eq (ByReminderId x0a) (ByReminderId x0b) = x0a == x0b
  eq (ByReminderFolderId x0a) (ByReminderFolderId x0b) = x0a == x0b
  eq (ByParentId x0a) (ByParentId x0b) = x0a == x0b
  eq (ByParentsIds x0a) (ByParentsIds x0b) = x0a == x0b
  eq (ByParentName x0a) (ByParentName x0b) = x0a == x0b
  eq (BySelf x0a) (BySelf x0b) = x0a == x0b
  eq (Timestamp x0a) (Timestamp x0b) = x0a == x0b
  eq (UnixTimestamp x0a) (UnixTimestamp x0b) = x0a == x0b
  eq (CreatedAtTimestamp x0a) (CreatedAtTimestamp x0b) = x0a == x0b
  eq (CreatedAtUnixTimestamp x0a) (CreatedAtUnixTimestamp x0b) = x0a == x0b
  eq (RealIP x0a) (RealIP x0b) = x0a == x0b
  eq (IP x0a) (IP x0b) = x0a == x0b
  eq (WithOrganization x0a) (WithOrganization x0b) = x0a == x0b
  eq (WithForum x0a) (WithForum x0b) = x0a == x0b
  eq (WithBoard x0a) (WithBoard x0b) = x0a == x0b
  eq (WithThread x0a) (WithThread x0b) = x0a == x0b
  eq (WithResource x0a) (WithResource x0b) = x0a == x0b
  eq _ _ = false

instance paramShow :: Show Param where
  show (Limit x0) = "Limit: " <> show x0
  show (Offset x0) = "Offset: " <> show x0
  show (SortOrder x0) = "SortOrder: " <> show x0
  show (Order x0) = "Order: " <> show x0
  show (ByOrganizationId x0) = "ByOrganizationId: " <> show x0
  show (ByOrganizationsIds x0) = "ByOrganizationsIds: " <> show x0
  show (ByOrganizationName x0) = "ByOrganizationName: " <> show x0
  show (ByTeamId x0) = "ByTeamId: " <> show x0
  show (ByTeamsIds x0) = "ByTeamsIds: " <> show x0
  show (ByTeamName x0) = "ByTeamName: " <> show x0
  show (ByTeamMemberId x0) = "ByTeamMemberId: " <> show x0
  show (ByTeamMembersIds x0) = "ByTeamMembersIds: " <> show x0
  show (ByUserId x0) = "ByUserId: " <> show x0
  show (ByUsersIds x0) = "ByUsersIds: " <> show x0
  show (ByUserName x0) = "ByUserName: " <> show x0
  show (ByUsersNames x0) = "ByUsersNames: " <> show x0
  show (ByGlobalGroupId x0) = "ByGlobalGroupId: " <> show x0
  show (ByGlobalGroupsIds x0) = "ByGlobalGroupsIds: " <> show x0
  show (ByGroupId x0) = "ByGroupId: " <> show x0
  show (ByGroupsIds x0) = "ByGroupsIds: " <> show x0
  show (ByGroupMemberId x0) = "ByGroupMemberId: " <> show x0
  show (ByGroupMembersIds x0) = "ByGroupMembersIds: " <> show x0
  show (ByForumId x0) = "ByForumId: " <> show x0
  show (ByForumsIds x0) = "ByForumsIds: " <> show x0
  show (ByForumName x0) = "ByForumName: " <> show x0
  show (ByBoardId x0) = "ByBoardId: " <> show x0
  show (ByBoardsIds x0) = "ByBoardsIds: " <> show x0
  show (ByBoardName x0) = "ByBoardName: " <> show x0
  show (ByThreadId x0) = "ByThreadId: " <> show x0
  show (ByThreadsIds x0) = "ByThreadsIds: " <> show x0
  show (ByThreadName x0) = "ByThreadName: " <> show x0
  show (ByThreadPostId x0) = "ByThreadPostId: " <> show x0
  show (ByThreadPostsIds x0) = "ByThreadPostsIds: " <> show x0
  show (ByThreadPostName x0) = "ByThreadPostName: " <> show x0
  show (ByThreadPostLikeId x0) = "ByThreadPostLikeId: " <> show x0
  show (ByThreadPostLikesIds x0) = "ByThreadPostLikesIds: " <> show x0
  show (ByThreadPostStarId x0) = "ByThreadPostStarId: " <> show x0
  show (ByThreadPostStarsIds x0) = "ByThreadPostStarsIds: " <> show x0
  show (ByBucketId x0) = "ByBucketId: " <> show x0
  show (ByResourceId x0) = "ByResourceId: " <> show x0
  show (ByResourcesIds x0) = "ByResourcesIds: " <> show x0
  show (ByResourceName x0) = "ByResourceName: " <> show x0
  show (ByLeuronId x0) = "ByLeuronId: " <> show x0
  show (ByLeuronsIds x0) = "ByLeuronsIds: " <> show x0
  show (ByPmId x0) = "ByPmId: " <> show x0
  show (ByPmsIds x0) = "ByPmsIds: " <> show x0
  show (ByReminderId x0) = "ByReminderId: " <> show x0
  show (ByReminderFolderId x0) = "ByReminderFolderId: " <> show x0
  show (ByParentId x0) = "ByParentId: " <> show x0
  show (ByParentsIds x0) = "ByParentsIds: " <> show x0
  show (ByParentName x0) = "ByParentName: " <> show x0
  show (BySelf x0) = "BySelf: " <> show x0
  show (Timestamp x0) = "Timestamp: " <> show x0
  show (UnixTimestamp x0) = "UnixTimestamp: " <> show x0
  show (CreatedAtTimestamp x0) = "CreatedAtTimestamp: " <> show x0
  show (CreatedAtUnixTimestamp x0) = "CreatedAtUnixTimestamp: " <> show x0
  show (RealIP x0) = "RealIP: " <> show x0
  show (IP x0) = "IP: " <> show x0
  show (WithOrganization x0) = "WithOrganization: " <> show x0
  show (WithForum x0) = "WithForum: " <> show x0
  show (WithBoard x0) = "WithBoard: " <> show x0
  show (WithThread x0) = "WithThread: " <> show x0
  show (WithResource x0) = "WithResource: " <> show x0


instance paramQueryParam :: QueryParam Param where
  qp (Limit x0) = Tuple "limit" (show x0)
  qp (Offset x0) = Tuple "offset" (show x0)
  qp (SortOrder x0) = Tuple "sort_order" (show x0)
  qp (Order x0) = Tuple "order" (show x0)
  qp (ByOrganizationId x0) = Tuple "by_organization_id" (show x0)
  qp (ByOrganizationsIds x0) = Tuple "by_organizations_ids" (show x0)
  qp (ByOrganizationName x0) = Tuple "by_organization_name" x0
  qp (ByTeamId x0) = Tuple "by_team_id" (show x0)
  qp (ByTeamsIds x0) = Tuple "by_teams_ids" (show x0)
  qp (ByTeamName x0) = Tuple "by_team_name" x0
  qp (ByTeamMemberId x0) = Tuple "by_team_member_id" (show x0)
  qp (ByTeamMembersIds x0) = Tuple "by_team_members_ids" (show x0)
  qp (ByUserId x0) = Tuple "by_user_id" (show x0)
  qp (ByUsersIds x0) = Tuple "by_users_ids" (show x0)
  qp (ByUserName x0) = Tuple "by_user_name" x0
  qp (ByUsersNames x0) = Tuple "by_users_names" (show x0)
  qp (ByGlobalGroupId x0) = Tuple "by_global_group_id" (show x0)
  qp (ByGlobalGroupsIds x0) = Tuple "by_global_groups_ids" (show x0)
  qp (ByGroupId x0) = Tuple "by_group_id" (show x0)
  qp (ByGroupsIds x0) = Tuple "by_groups_ids" (show x0)
  qp (ByGroupMemberId x0) = Tuple "by_group_member_id" (show x0)
  qp (ByGroupMembersIds x0) = Tuple "by_group_members_ids" (show x0)
  qp (ByForumId x0) = Tuple "by_forum_id" (show x0)
  qp (ByForumsIds x0) = Tuple "by_forums_ids" (show x0)
  qp (ByForumName x0) = Tuple "by_forum_name" x0
  qp (ByBoardId x0) = Tuple "by_board_id" (show x0)
  qp (ByBoardsIds x0) = Tuple "by_boards_ids" (show x0)
  qp (ByBoardName x0) = Tuple "by_board_name" x0
  qp (ByThreadId x0) = Tuple "by_thread_id" (show x0)
  qp (ByThreadsIds x0) = Tuple "by_threads_ids" (show x0)
  qp (ByThreadName x0) = Tuple "by_thread_name" x0
  qp (ByThreadPostId x0) = Tuple "by_thread_post_id" (show x0)
  qp (ByThreadPostsIds x0) = Tuple "by_thread_posts_ids" (show x0)
  qp (ByThreadPostName x0) = Tuple "by_thread_post_name" x0
  qp (ByThreadPostLikeId x0) = Tuple "by_thread_post_like_id" (show x0)
  qp (ByThreadPostLikesIds x0) = Tuple "by_thread_post_likes_ids" (show x0)
  qp (ByThreadPostStarId x0) = Tuple "by_thread_post_star_id" (show x0)
  qp (ByThreadPostStarsIds x0) = Tuple "by_thread_post_stars_ids" (show x0)
  qp (ByBucketId x0) = Tuple "by_bucket_id" (show x0)
  qp (ByResourceId x0) = Tuple "by_resource_id" (show x0)
  qp (ByResourcesIds x0) = Tuple "by_resources_ids" (show x0)
  qp (ByResourceName x0) = Tuple "by_resource_name" x0
  qp (ByLeuronId x0) = Tuple "by_leuron_id" (show x0)
  qp (ByLeuronsIds x0) = Tuple "by_leurons_ids" (show x0)
  qp (ByPmId x0) = Tuple "by_pm_id" (show x0)
  qp (ByPmsIds x0) = Tuple "by_pms_ids" (show x0)
  qp (ByReminderId x0) = Tuple "by_reminder_id" (show x0)
  qp (ByReminderFolderId x0) = Tuple "by_reminder_folder_id" (show x0)
  qp (ByParentId x0) = Tuple "by_parent_id" (show x0)
  qp (ByParentsIds x0) = Tuple "by_parents_ids" (show x0)
  qp (ByParentName x0) = Tuple "by_parent_name" x0
  qp (BySelf x0) = Tuple "by_self" (show x0)
  qp (Timestamp x0) = Tuple "timestamp" (show x0)
  qp (UnixTimestamp x0) = Tuple "unix_timestamp" (show x0)
  qp (CreatedAtTimestamp x0) = Tuple "created_at_timestamp" (show x0)
  qp (CreatedAtUnixTimestamp x0) = Tuple "created_at_unix_timestamp" (show x0)
  qp (RealIP x0) = Tuple "real_ip" x0
  qp (IP x0) = Tuple "ip" x0
  qp (WithOrganization x0) = Tuple "with_organization" (show x0)
  qp (WithForum x0) = Tuple "with_forum" (show x0)
  qp (WithBoard x0) = Tuple "with_board" (show x0)
  qp (WithThread x0) = Tuple "with_thread" (show x0)
  qp (WithResource x0) = Tuple "with_resource" (show x0)


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
  | ParamTag_ByUserName 
  | ParamTag_ByUsersNames 
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
  encodeJson (ParamTag_ByUserName ) =
       "tag" := "ParamTag_ByUserName"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (ParamTag_ByUsersNames ) =
       "tag" := "ParamTag_ByUsersNames"
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
        pure ParamTag_Limit

      "ParamTag_Offset" -> do
        pure ParamTag_Offset

      "ParamTag_SortOrder" -> do
        pure ParamTag_SortOrder

      "ParamTag_Order" -> do
        pure ParamTag_Order

      "ParamTag_ByOrganizationId" -> do
        pure ParamTag_ByOrganizationId

      "ParamTag_ByOrganizationsIds" -> do
        pure ParamTag_ByOrganizationsIds

      "ParamTag_ByOrganizationName" -> do
        pure ParamTag_ByOrganizationName

      "ParamTag_ByTeamId" -> do
        pure ParamTag_ByTeamId

      "ParamTag_ByTeamsIds" -> do
        pure ParamTag_ByTeamsIds

      "ParamTag_ByTeamName" -> do
        pure ParamTag_ByTeamName

      "ParamTag_ByTeamMemberId" -> do
        pure ParamTag_ByTeamMemberId

      "ParamTag_ByTeamMembersIds" -> do
        pure ParamTag_ByTeamMembersIds

      "ParamTag_ByUserId" -> do
        pure ParamTag_ByUserId

      "ParamTag_ByUsersIds" -> do
        pure ParamTag_ByUsersIds

      "ParamTag_ByUserName" -> do
        pure ParamTag_ByUserName

      "ParamTag_ByUsersNames" -> do
        pure ParamTag_ByUsersNames

      "ParamTag_ByGlobalGroupId" -> do
        pure ParamTag_ByGlobalGroupId

      "ParamTag_ByGlobalGroupsIds" -> do
        pure ParamTag_ByGlobalGroupsIds

      "ParamTag_ByGroupId" -> do
        pure ParamTag_ByGroupId

      "ParamTag_ByGroupsIds" -> do
        pure ParamTag_ByGroupsIds

      "ParamTag_ByGroupMemberId" -> do
        pure ParamTag_ByGroupMemberId

      "ParamTag_ByGroupMembersIds" -> do
        pure ParamTag_ByGroupMembersIds

      "ParamTag_ByForumId" -> do
        pure ParamTag_ByForumId

      "ParamTag_ByForumsIds" -> do
        pure ParamTag_ByForumsIds

      "ParamTag_ByForumName" -> do
        pure ParamTag_ByForumName

      "ParamTag_ByBoardId" -> do
        pure ParamTag_ByBoardId

      "ParamTag_ByBoardsIds" -> do
        pure ParamTag_ByBoardsIds

      "ParamTag_ByBoardName" -> do
        pure ParamTag_ByBoardName

      "ParamTag_ByThreadId" -> do
        pure ParamTag_ByThreadId

      "ParamTag_ByThreadsIds" -> do
        pure ParamTag_ByThreadsIds

      "ParamTag_ByThreadName" -> do
        pure ParamTag_ByThreadName

      "ParamTag_ByThreadPostId" -> do
        pure ParamTag_ByThreadPostId

      "ParamTag_ByThreadPostsIds" -> do
        pure ParamTag_ByThreadPostsIds

      "ParamTag_ByThreadPostName" -> do
        pure ParamTag_ByThreadPostName

      "ParamTag_ByThreadPostLikeId" -> do
        pure ParamTag_ByThreadPostLikeId

      "ParamTag_ByThreadPostLikesIds" -> do
        pure ParamTag_ByThreadPostLikesIds

      "ParamTag_ByThreadPostStarId" -> do
        pure ParamTag_ByThreadPostStarId

      "ParamTag_ByThreadPostStarsIds" -> do
        pure ParamTag_ByThreadPostStarsIds

      "ParamTag_ByBucketId" -> do
        pure ParamTag_ByBucketId

      "ParamTag_ByResourceId" -> do
        pure ParamTag_ByResourceId

      "ParamTag_ByResourcesIds" -> do
        pure ParamTag_ByResourcesIds

      "ParamTag_ByResourceName" -> do
        pure ParamTag_ByResourceName

      "ParamTag_ByLeuronId" -> do
        pure ParamTag_ByLeuronId

      "ParamTag_ByLeuronsIds" -> do
        pure ParamTag_ByLeuronsIds

      "ParamTag_ByPmId" -> do
        pure ParamTag_ByPmId

      "ParamTag_ByPmsIds" -> do
        pure ParamTag_ByPmsIds

      "ParamTag_ByReminderId" -> do
        pure ParamTag_ByReminderId

      "ParamTag_ByReminderFolderId" -> do
        pure ParamTag_ByReminderFolderId

      "ParamTag_ByParentId" -> do
        pure ParamTag_ByParentId

      "ParamTag_ByParentsIds" -> do
        pure ParamTag_ByParentsIds

      "ParamTag_ByParentName" -> do
        pure ParamTag_ByParentName

      "ParamTag_BySelf" -> do
        pure ParamTag_BySelf

      "ParamTag_Timestamp" -> do
        pure ParamTag_Timestamp

      "ParamTag_UnixTimestamp" -> do
        pure ParamTag_UnixTimestamp

      "ParamTag_CreatedAtTimestamp" -> do
        pure ParamTag_CreatedAtTimestamp

      "ParamTag_CreatedAtUnixTimestamp" -> do
        pure ParamTag_CreatedAtUnixTimestamp

      "ParamTag_RealIP" -> do
        pure ParamTag_RealIP

      "ParamTag_IP" -> do
        pure ParamTag_IP

      "ParamTag_WithOrganization" -> do
        pure ParamTag_WithOrganization

      "ParamTag_WithForum" -> do
        pure ParamTag_WithForum

      "ParamTag_WithBoard" -> do
        pure ParamTag_WithBoard

      "ParamTag_WithThread" -> do
        pure ParamTag_WithThread

      "ParamTag_WithResource" -> do
        pure ParamTag_WithResource

      _ -> Left $ "DecodeJson TypeMismatch for ParamTag"



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
        pure ParamTag_Limit

      "ParamTag_Offset" -> do
        pure ParamTag_Offset

      "ParamTag_SortOrder" -> do
        pure ParamTag_SortOrder

      "ParamTag_Order" -> do
        pure ParamTag_Order

      "ParamTag_ByOrganizationId" -> do
        pure ParamTag_ByOrganizationId

      "ParamTag_ByOrganizationsIds" -> do
        pure ParamTag_ByOrganizationsIds

      "ParamTag_ByOrganizationName" -> do
        pure ParamTag_ByOrganizationName

      "ParamTag_ByTeamId" -> do
        pure ParamTag_ByTeamId

      "ParamTag_ByTeamsIds" -> do
        pure ParamTag_ByTeamsIds

      "ParamTag_ByTeamName" -> do
        pure ParamTag_ByTeamName

      "ParamTag_ByTeamMemberId" -> do
        pure ParamTag_ByTeamMemberId

      "ParamTag_ByTeamMembersIds" -> do
        pure ParamTag_ByTeamMembersIds

      "ParamTag_ByUserId" -> do
        pure ParamTag_ByUserId

      "ParamTag_ByUsersIds" -> do
        pure ParamTag_ByUsersIds

      "ParamTag_ByUserName" -> do
        pure ParamTag_ByUserName

      "ParamTag_ByUsersNames" -> do
        pure ParamTag_ByUsersNames

      "ParamTag_ByGlobalGroupId" -> do
        pure ParamTag_ByGlobalGroupId

      "ParamTag_ByGlobalGroupsIds" -> do
        pure ParamTag_ByGlobalGroupsIds

      "ParamTag_ByGroupId" -> do
        pure ParamTag_ByGroupId

      "ParamTag_ByGroupsIds" -> do
        pure ParamTag_ByGroupsIds

      "ParamTag_ByGroupMemberId" -> do
        pure ParamTag_ByGroupMemberId

      "ParamTag_ByGroupMembersIds" -> do
        pure ParamTag_ByGroupMembersIds

      "ParamTag_ByForumId" -> do
        pure ParamTag_ByForumId

      "ParamTag_ByForumsIds" -> do
        pure ParamTag_ByForumsIds

      "ParamTag_ByForumName" -> do
        pure ParamTag_ByForumName

      "ParamTag_ByBoardId" -> do
        pure ParamTag_ByBoardId

      "ParamTag_ByBoardsIds" -> do
        pure ParamTag_ByBoardsIds

      "ParamTag_ByBoardName" -> do
        pure ParamTag_ByBoardName

      "ParamTag_ByThreadId" -> do
        pure ParamTag_ByThreadId

      "ParamTag_ByThreadsIds" -> do
        pure ParamTag_ByThreadsIds

      "ParamTag_ByThreadName" -> do
        pure ParamTag_ByThreadName

      "ParamTag_ByThreadPostId" -> do
        pure ParamTag_ByThreadPostId

      "ParamTag_ByThreadPostsIds" -> do
        pure ParamTag_ByThreadPostsIds

      "ParamTag_ByThreadPostName" -> do
        pure ParamTag_ByThreadPostName

      "ParamTag_ByThreadPostLikeId" -> do
        pure ParamTag_ByThreadPostLikeId

      "ParamTag_ByThreadPostLikesIds" -> do
        pure ParamTag_ByThreadPostLikesIds

      "ParamTag_ByThreadPostStarId" -> do
        pure ParamTag_ByThreadPostStarId

      "ParamTag_ByThreadPostStarsIds" -> do
        pure ParamTag_ByThreadPostStarsIds

      "ParamTag_ByBucketId" -> do
        pure ParamTag_ByBucketId

      "ParamTag_ByResourceId" -> do
        pure ParamTag_ByResourceId

      "ParamTag_ByResourcesIds" -> do
        pure ParamTag_ByResourcesIds

      "ParamTag_ByResourceName" -> do
        pure ParamTag_ByResourceName

      "ParamTag_ByLeuronId" -> do
        pure ParamTag_ByLeuronId

      "ParamTag_ByLeuronsIds" -> do
        pure ParamTag_ByLeuronsIds

      "ParamTag_ByPmId" -> do
        pure ParamTag_ByPmId

      "ParamTag_ByPmsIds" -> do
        pure ParamTag_ByPmsIds

      "ParamTag_ByReminderId" -> do
        pure ParamTag_ByReminderId

      "ParamTag_ByReminderFolderId" -> do
        pure ParamTag_ByReminderFolderId

      "ParamTag_ByParentId" -> do
        pure ParamTag_ByParentId

      "ParamTag_ByParentsIds" -> do
        pure ParamTag_ByParentsIds

      "ParamTag_ByParentName" -> do
        pure ParamTag_ByParentName

      "ParamTag_BySelf" -> do
        pure ParamTag_BySelf

      "ParamTag_Timestamp" -> do
        pure ParamTag_Timestamp

      "ParamTag_UnixTimestamp" -> do
        pure ParamTag_UnixTimestamp

      "ParamTag_CreatedAtTimestamp" -> do
        pure ParamTag_CreatedAtTimestamp

      "ParamTag_CreatedAtUnixTimestamp" -> do
        pure ParamTag_CreatedAtUnixTimestamp

      "ParamTag_RealIP" -> do
        pure ParamTag_RealIP

      "ParamTag_IP" -> do
        pure ParamTag_IP

      "ParamTag_WithOrganization" -> do
        pure ParamTag_WithOrganization

      "ParamTag_WithForum" -> do
        pure ParamTag_WithForum

      "ParamTag_WithBoard" -> do
        pure ParamTag_WithBoard

      "ParamTag_WithThread" -> do
        pure ParamTag_WithThread

      "ParamTag_WithResource" -> do
        pure ParamTag_WithResource

      _ -> Left $ TypeMismatch "ParamTag" "Respondable"



instance paramTagIsForeign :: IsForeign ParamTag where
  read json = do
    tag <- readProp "tag" json
    case tag of
      "ParamTag_Limit" -> do
        pure ParamTag_Limit

      "ParamTag_Offset" -> do
        pure ParamTag_Offset

      "ParamTag_SortOrder" -> do
        pure ParamTag_SortOrder

      "ParamTag_Order" -> do
        pure ParamTag_Order

      "ParamTag_ByOrganizationId" -> do
        pure ParamTag_ByOrganizationId

      "ParamTag_ByOrganizationsIds" -> do
        pure ParamTag_ByOrganizationsIds

      "ParamTag_ByOrganizationName" -> do
        pure ParamTag_ByOrganizationName

      "ParamTag_ByTeamId" -> do
        pure ParamTag_ByTeamId

      "ParamTag_ByTeamsIds" -> do
        pure ParamTag_ByTeamsIds

      "ParamTag_ByTeamName" -> do
        pure ParamTag_ByTeamName

      "ParamTag_ByTeamMemberId" -> do
        pure ParamTag_ByTeamMemberId

      "ParamTag_ByTeamMembersIds" -> do
        pure ParamTag_ByTeamMembersIds

      "ParamTag_ByUserId" -> do
        pure ParamTag_ByUserId

      "ParamTag_ByUsersIds" -> do
        pure ParamTag_ByUsersIds

      "ParamTag_ByUserName" -> do
        pure ParamTag_ByUserName

      "ParamTag_ByUsersNames" -> do
        pure ParamTag_ByUsersNames

      "ParamTag_ByGlobalGroupId" -> do
        pure ParamTag_ByGlobalGroupId

      "ParamTag_ByGlobalGroupsIds" -> do
        pure ParamTag_ByGlobalGroupsIds

      "ParamTag_ByGroupId" -> do
        pure ParamTag_ByGroupId

      "ParamTag_ByGroupsIds" -> do
        pure ParamTag_ByGroupsIds

      "ParamTag_ByGroupMemberId" -> do
        pure ParamTag_ByGroupMemberId

      "ParamTag_ByGroupMembersIds" -> do
        pure ParamTag_ByGroupMembersIds

      "ParamTag_ByForumId" -> do
        pure ParamTag_ByForumId

      "ParamTag_ByForumsIds" -> do
        pure ParamTag_ByForumsIds

      "ParamTag_ByForumName" -> do
        pure ParamTag_ByForumName

      "ParamTag_ByBoardId" -> do
        pure ParamTag_ByBoardId

      "ParamTag_ByBoardsIds" -> do
        pure ParamTag_ByBoardsIds

      "ParamTag_ByBoardName" -> do
        pure ParamTag_ByBoardName

      "ParamTag_ByThreadId" -> do
        pure ParamTag_ByThreadId

      "ParamTag_ByThreadsIds" -> do
        pure ParamTag_ByThreadsIds

      "ParamTag_ByThreadName" -> do
        pure ParamTag_ByThreadName

      "ParamTag_ByThreadPostId" -> do
        pure ParamTag_ByThreadPostId

      "ParamTag_ByThreadPostsIds" -> do
        pure ParamTag_ByThreadPostsIds

      "ParamTag_ByThreadPostName" -> do
        pure ParamTag_ByThreadPostName

      "ParamTag_ByThreadPostLikeId" -> do
        pure ParamTag_ByThreadPostLikeId

      "ParamTag_ByThreadPostLikesIds" -> do
        pure ParamTag_ByThreadPostLikesIds

      "ParamTag_ByThreadPostStarId" -> do
        pure ParamTag_ByThreadPostStarId

      "ParamTag_ByThreadPostStarsIds" -> do
        pure ParamTag_ByThreadPostStarsIds

      "ParamTag_ByBucketId" -> do
        pure ParamTag_ByBucketId

      "ParamTag_ByResourceId" -> do
        pure ParamTag_ByResourceId

      "ParamTag_ByResourcesIds" -> do
        pure ParamTag_ByResourcesIds

      "ParamTag_ByResourceName" -> do
        pure ParamTag_ByResourceName

      "ParamTag_ByLeuronId" -> do
        pure ParamTag_ByLeuronId

      "ParamTag_ByLeuronsIds" -> do
        pure ParamTag_ByLeuronsIds

      "ParamTag_ByPmId" -> do
        pure ParamTag_ByPmId

      "ParamTag_ByPmsIds" -> do
        pure ParamTag_ByPmsIds

      "ParamTag_ByReminderId" -> do
        pure ParamTag_ByReminderId

      "ParamTag_ByReminderFolderId" -> do
        pure ParamTag_ByReminderFolderId

      "ParamTag_ByParentId" -> do
        pure ParamTag_ByParentId

      "ParamTag_ByParentsIds" -> do
        pure ParamTag_ByParentsIds

      "ParamTag_ByParentName" -> do
        pure ParamTag_ByParentName

      "ParamTag_BySelf" -> do
        pure ParamTag_BySelf

      "ParamTag_Timestamp" -> do
        pure ParamTag_Timestamp

      "ParamTag_UnixTimestamp" -> do
        pure ParamTag_UnixTimestamp

      "ParamTag_CreatedAtTimestamp" -> do
        pure ParamTag_CreatedAtTimestamp

      "ParamTag_CreatedAtUnixTimestamp" -> do
        pure ParamTag_CreatedAtUnixTimestamp

      "ParamTag_RealIP" -> do
        pure ParamTag_RealIP

      "ParamTag_IP" -> do
        pure ParamTag_IP

      "ParamTag_WithOrganization" -> do
        pure ParamTag_WithOrganization

      "ParamTag_WithForum" -> do
        pure ParamTag_WithForum

      "ParamTag_WithBoard" -> do
        pure ParamTag_WithBoard

      "ParamTag_WithThread" -> do
        pure ParamTag_WithThread

      "ParamTag_WithResource" -> do
        pure ParamTag_WithResource

      _ -> Left $ TypeMismatch "ParamTag" "IsForeign"



instance paramTagEq :: Eq ParamTag where
  eq ParamTag_Limit ParamTag_Limit = true
  eq ParamTag_Offset ParamTag_Offset = true
  eq ParamTag_SortOrder ParamTag_SortOrder = true
  eq ParamTag_Order ParamTag_Order = true
  eq ParamTag_ByOrganizationId ParamTag_ByOrganizationId = true
  eq ParamTag_ByOrganizationsIds ParamTag_ByOrganizationsIds = true
  eq ParamTag_ByOrganizationName ParamTag_ByOrganizationName = true
  eq ParamTag_ByTeamId ParamTag_ByTeamId = true
  eq ParamTag_ByTeamsIds ParamTag_ByTeamsIds = true
  eq ParamTag_ByTeamName ParamTag_ByTeamName = true
  eq ParamTag_ByTeamMemberId ParamTag_ByTeamMemberId = true
  eq ParamTag_ByTeamMembersIds ParamTag_ByTeamMembersIds = true
  eq ParamTag_ByUserId ParamTag_ByUserId = true
  eq ParamTag_ByUsersIds ParamTag_ByUsersIds = true
  eq ParamTag_ByUserName ParamTag_ByUserName = true
  eq ParamTag_ByUsersNames ParamTag_ByUsersNames = true
  eq ParamTag_ByGlobalGroupId ParamTag_ByGlobalGroupId = true
  eq ParamTag_ByGlobalGroupsIds ParamTag_ByGlobalGroupsIds = true
  eq ParamTag_ByGroupId ParamTag_ByGroupId = true
  eq ParamTag_ByGroupsIds ParamTag_ByGroupsIds = true
  eq ParamTag_ByGroupMemberId ParamTag_ByGroupMemberId = true
  eq ParamTag_ByGroupMembersIds ParamTag_ByGroupMembersIds = true
  eq ParamTag_ByForumId ParamTag_ByForumId = true
  eq ParamTag_ByForumsIds ParamTag_ByForumsIds = true
  eq ParamTag_ByForumName ParamTag_ByForumName = true
  eq ParamTag_ByBoardId ParamTag_ByBoardId = true
  eq ParamTag_ByBoardsIds ParamTag_ByBoardsIds = true
  eq ParamTag_ByBoardName ParamTag_ByBoardName = true
  eq ParamTag_ByThreadId ParamTag_ByThreadId = true
  eq ParamTag_ByThreadsIds ParamTag_ByThreadsIds = true
  eq ParamTag_ByThreadName ParamTag_ByThreadName = true
  eq ParamTag_ByThreadPostId ParamTag_ByThreadPostId = true
  eq ParamTag_ByThreadPostsIds ParamTag_ByThreadPostsIds = true
  eq ParamTag_ByThreadPostName ParamTag_ByThreadPostName = true
  eq ParamTag_ByThreadPostLikeId ParamTag_ByThreadPostLikeId = true
  eq ParamTag_ByThreadPostLikesIds ParamTag_ByThreadPostLikesIds = true
  eq ParamTag_ByThreadPostStarId ParamTag_ByThreadPostStarId = true
  eq ParamTag_ByThreadPostStarsIds ParamTag_ByThreadPostStarsIds = true
  eq ParamTag_ByBucketId ParamTag_ByBucketId = true
  eq ParamTag_ByResourceId ParamTag_ByResourceId = true
  eq ParamTag_ByResourcesIds ParamTag_ByResourcesIds = true
  eq ParamTag_ByResourceName ParamTag_ByResourceName = true
  eq ParamTag_ByLeuronId ParamTag_ByLeuronId = true
  eq ParamTag_ByLeuronsIds ParamTag_ByLeuronsIds = true
  eq ParamTag_ByPmId ParamTag_ByPmId = true
  eq ParamTag_ByPmsIds ParamTag_ByPmsIds = true
  eq ParamTag_ByReminderId ParamTag_ByReminderId = true
  eq ParamTag_ByReminderFolderId ParamTag_ByReminderFolderId = true
  eq ParamTag_ByParentId ParamTag_ByParentId = true
  eq ParamTag_ByParentsIds ParamTag_ByParentsIds = true
  eq ParamTag_ByParentName ParamTag_ByParentName = true
  eq ParamTag_BySelf ParamTag_BySelf = true
  eq ParamTag_Timestamp ParamTag_Timestamp = true
  eq ParamTag_UnixTimestamp ParamTag_UnixTimestamp = true
  eq ParamTag_CreatedAtTimestamp ParamTag_CreatedAtTimestamp = true
  eq ParamTag_CreatedAtUnixTimestamp ParamTag_CreatedAtUnixTimestamp = true
  eq ParamTag_RealIP ParamTag_RealIP = true
  eq ParamTag_IP ParamTag_IP = true
  eq ParamTag_WithOrganization ParamTag_WithOrganization = true
  eq ParamTag_WithForum ParamTag_WithForum = true
  eq ParamTag_WithBoard ParamTag_WithBoard = true
  eq ParamTag_WithThread ParamTag_WithThread = true
  eq ParamTag_WithResource ParamTag_WithResource = true
  eq _ _ = false

instance paramTagShow :: Show ParamTag where
  show ParamTag_Limit = "limit"
  show ParamTag_Offset = "offset"
  show ParamTag_SortOrder = "sort_order"
  show ParamTag_Order = "order"
  show ParamTag_ByOrganizationId = "by_organization_id"
  show ParamTag_ByOrganizationsIds = "by_organizations_ids"
  show ParamTag_ByOrganizationName = "by_organization_name"
  show ParamTag_ByTeamId = "by_team_id"
  show ParamTag_ByTeamsIds = "by_teams_ids"
  show ParamTag_ByTeamName = "by_team_name"
  show ParamTag_ByTeamMemberId = "by_team_member_id"
  show ParamTag_ByTeamMembersIds = "by_team_members_ids"
  show ParamTag_ByUserId = "by_user_id"
  show ParamTag_ByUsersIds = "by_users_ids"
  show ParamTag_ByUserName = "by_user_name"
  show ParamTag_ByUsersNames = "by_users_names"
  show ParamTag_ByGlobalGroupId = "by_global_group_id"
  show ParamTag_ByGlobalGroupsIds = "by_global_groups_ids"
  show ParamTag_ByGroupId = "by_group_id"
  show ParamTag_ByGroupsIds = "by_groups_ids"
  show ParamTag_ByGroupMemberId = "by_group_member_id"
  show ParamTag_ByGroupMembersIds = "by_group_members_ids"
  show ParamTag_ByForumId = "by_forum_id"
  show ParamTag_ByForumsIds = "by_forums_ids"
  show ParamTag_ByForumName = "by_forum_name"
  show ParamTag_ByBoardId = "by_board_id"
  show ParamTag_ByBoardsIds = "by_boards_ids"
  show ParamTag_ByBoardName = "by_board_name"
  show ParamTag_ByThreadId = "by_thread_id"
  show ParamTag_ByThreadsIds = "by_threads_ids"
  show ParamTag_ByThreadName = "by_thread_name"
  show ParamTag_ByThreadPostId = "by_thread_post_id"
  show ParamTag_ByThreadPostsIds = "by_thread_posts_ids"
  show ParamTag_ByThreadPostName = "by_thread_post_name"
  show ParamTag_ByThreadPostLikeId = "by_thread_post_like_id"
  show ParamTag_ByThreadPostLikesIds = "by_thread_post_likes_ids"
  show ParamTag_ByThreadPostStarId = "by_thread_post_star_id"
  show ParamTag_ByThreadPostStarsIds = "by_thread_post_stars_ids"
  show ParamTag_ByBucketId = "by_bucket_id"
  show ParamTag_ByResourceId = "by_resource_id"
  show ParamTag_ByResourcesIds = "by_resources_ids"
  show ParamTag_ByResourceName = "by_resource_name"
  show ParamTag_ByLeuronId = "by_leuron_id"
  show ParamTag_ByLeuronsIds = "by_leurons_ids"
  show ParamTag_ByPmId = "by_pm_id"
  show ParamTag_ByPmsIds = "by_pms_ids"
  show ParamTag_ByReminderId = "by_reminder_id"
  show ParamTag_ByReminderFolderId = "by_reminder_folder_id"
  show ParamTag_ByParentId = "by_parent_id"
  show ParamTag_ByParentsIds = "by_parents_ids"
  show ParamTag_ByParentName = "by_parent_name"
  show ParamTag_BySelf = "by_self"
  show ParamTag_Timestamp = "timestamp"
  show ParamTag_UnixTimestamp = "unix_timestamp"
  show ParamTag_CreatedAtTimestamp = "created_at_timestamp"
  show ParamTag_CreatedAtUnixTimestamp = "created_at_unix_timestamp"
  show ParamTag_RealIP = "real_ip"
  show ParamTag_IP = "ip"
  show ParamTag_WithOrganization = "with_organization"
  show ParamTag_WithForum = "with_forum"
  show ParamTag_WithBoard = "with_board"
  show ParamTag_WithThread = "with_thread"
  show ParamTag_WithResource = "with_resource"


readParamTag :: String -> Maybe ParamTag
readParamTag "limit" = Just ParamTag_Limit
readParamTag "offset" = Just ParamTag_Offset
readParamTag "sort_order" = Just ParamTag_SortOrder
readParamTag "order" = Just ParamTag_Order
readParamTag "by_organization_id" = Just ParamTag_ByOrganizationId
readParamTag "by_organizations_ids" = Just ParamTag_ByOrganizationsIds
readParamTag "by_organization_name" = Just ParamTag_ByOrganizationName
readParamTag "by_team_id" = Just ParamTag_ByTeamId
readParamTag "by_teams_ids" = Just ParamTag_ByTeamsIds
readParamTag "by_team_name" = Just ParamTag_ByTeamName
readParamTag "by_team_member_id" = Just ParamTag_ByTeamMemberId
readParamTag "by_team_members_ids" = Just ParamTag_ByTeamMembersIds
readParamTag "by_user_id" = Just ParamTag_ByUserId
readParamTag "by_users_ids" = Just ParamTag_ByUsersIds
readParamTag "by_user_name" = Just ParamTag_ByUserName
readParamTag "by_users_names" = Just ParamTag_ByUsersNames
readParamTag "by_global_group_id" = Just ParamTag_ByGlobalGroupId
readParamTag "by_global_groups_ids" = Just ParamTag_ByGlobalGroupsIds
readParamTag "by_group_id" = Just ParamTag_ByGroupId
readParamTag "by_groups_ids" = Just ParamTag_ByGroupsIds
readParamTag "by_group_member_id" = Just ParamTag_ByGroupMemberId
readParamTag "by_group_members_ids" = Just ParamTag_ByGroupMembersIds
readParamTag "by_forum_id" = Just ParamTag_ByForumId
readParamTag "by_forums_ids" = Just ParamTag_ByForumsIds
readParamTag "by_forum_name" = Just ParamTag_ByForumName
readParamTag "by_board_id" = Just ParamTag_ByBoardId
readParamTag "by_boards_ids" = Just ParamTag_ByBoardsIds
readParamTag "by_board_name" = Just ParamTag_ByBoardName
readParamTag "by_thread_id" = Just ParamTag_ByThreadId
readParamTag "by_threads_ids" = Just ParamTag_ByThreadsIds
readParamTag "by_thread_name" = Just ParamTag_ByThreadName
readParamTag "by_thread_post_id" = Just ParamTag_ByThreadPostId
readParamTag "by_thread_posts_ids" = Just ParamTag_ByThreadPostsIds
readParamTag "by_thread_post_name" = Just ParamTag_ByThreadPostName
readParamTag "by_thread_post_like_id" = Just ParamTag_ByThreadPostLikeId
readParamTag "by_thread_post_likes_ids" = Just ParamTag_ByThreadPostLikesIds
readParamTag "by_thread_post_star_id" = Just ParamTag_ByThreadPostStarId
readParamTag "by_thread_post_stars_ids" = Just ParamTag_ByThreadPostStarsIds
readParamTag "by_bucket_id" = Just ParamTag_ByBucketId
readParamTag "by_resource_id" = Just ParamTag_ByResourceId
readParamTag "by_resources_ids" = Just ParamTag_ByResourcesIds
readParamTag "by_resource_name" = Just ParamTag_ByResourceName
readParamTag "by_leuron_id" = Just ParamTag_ByLeuronId
readParamTag "by_leurons_ids" = Just ParamTag_ByLeuronsIds
readParamTag "by_pm_id" = Just ParamTag_ByPmId
readParamTag "by_pms_ids" = Just ParamTag_ByPmsIds
readParamTag "by_reminder_id" = Just ParamTag_ByReminderId
readParamTag "by_reminder_folder_id" = Just ParamTag_ByReminderFolderId
readParamTag "by_parent_id" = Just ParamTag_ByParentId
readParamTag "by_parents_ids" = Just ParamTag_ByParentsIds
readParamTag "by_parent_name" = Just ParamTag_ByParentName
readParamTag "by_self" = Just ParamTag_BySelf
readParamTag "timestamp" = Just ParamTag_Timestamp
readParamTag "unix_timestamp" = Just ParamTag_UnixTimestamp
readParamTag "created_at_timestamp" = Just ParamTag_CreatedAtTimestamp
readParamTag "created_at_unix_timestamp" = Just ParamTag_CreatedAtUnixTimestamp
readParamTag "real_ip" = Just ParamTag_RealIP
readParamTag "ip" = Just ParamTag_IP
readParamTag "with_organization" = Just ParamTag_WithOrganization
readParamTag "with_forum" = Just ParamTag_WithForum
readParamTag "with_board" = Just ParamTag_WithBoard
readParamTag "with_thread" = Just ParamTag_WithThread
readParamTag "with_resource" = Just ParamTag_WithResource
readParamTag _ = Nothing

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
        pure SortOrderBy_Asc

      "SortOrderBy_Dsc" -> do
        pure SortOrderBy_Dsc

      "SortOrderBy_Rnd" -> do
        pure SortOrderBy_Rnd

      "SortOrderBy_None" -> do
        pure SortOrderBy_None

      _ -> Left $ "DecodeJson TypeMismatch for SortOrderBy"



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
        pure SortOrderBy_Asc

      "SortOrderBy_Dsc" -> do
        pure SortOrderBy_Dsc

      "SortOrderBy_Rnd" -> do
        pure SortOrderBy_Rnd

      "SortOrderBy_None" -> do
        pure SortOrderBy_None

      _ -> Left $ TypeMismatch "SortOrderBy" "Respondable"



instance sortOrderByIsForeign :: IsForeign SortOrderBy where
  read json = do
    tag <- readProp "tag" json
    case tag of
      "SortOrderBy_Asc" -> do
        pure SortOrderBy_Asc

      "SortOrderBy_Dsc" -> do
        pure SortOrderBy_Dsc

      "SortOrderBy_Rnd" -> do
        pure SortOrderBy_Rnd

      "SortOrderBy_None" -> do
        pure SortOrderBy_None

      _ -> Left $ TypeMismatch "SortOrderBy" "IsForeign"



instance sortOrderByEq :: Eq SortOrderBy where
  eq SortOrderBy_Asc SortOrderBy_Asc = true
  eq SortOrderBy_Dsc SortOrderBy_Dsc = true
  eq SortOrderBy_Rnd SortOrderBy_Rnd = true
  eq SortOrderBy_None SortOrderBy_None = true
  eq _ _ = false

instance sortOrderByShow :: Show SortOrderBy where
  show SortOrderBy_Asc = "asc"
  show SortOrderBy_Dsc = "dsc"
  show SortOrderBy_Rnd = "rnd"
  show SortOrderBy_None = "none"


readSortOrderBy :: String -> Maybe SortOrderBy
readSortOrderBy "asc" = Just SortOrderBy_Asc
readSortOrderBy "dsc" = Just SortOrderBy_Dsc
readSortOrderBy "rnd" = Just SortOrderBy_Rnd
readSortOrderBy "none" = Just SortOrderBy_None
readSortOrderBy _ = Nothing

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
        pure OrderBy_UserId

      "OrderBy_CreatedAt" -> do
        pure OrderBy_CreatedAt

      "OrderBy_ModifiedAt" -> do
        pure OrderBy_ModifiedAt

      "OrderBy_ModifiedBy" -> do
        pure OrderBy_ModifiedBy

      "OrderBy_ActivityAt" -> do
        pure OrderBy_ActivityAt

      "OrderBy_OrganizationId" -> do
        pure OrderBy_OrganizationId

      "OrderBy_TeamId" -> do
        pure OrderBy_TeamId

      "OrderBy_ForumId" -> do
        pure OrderBy_ForumId

      "OrderBy_BoardId" -> do
        pure OrderBy_BoardId

      "OrderBy_ThreadId" -> do
        pure OrderBy_ThreadId

      "OrderBy_Id" -> do
        pure OrderBy_Id

      "OrderBy_None" -> do
        pure OrderBy_None

      _ -> Left $ "DecodeJson TypeMismatch for OrderBy"



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
        pure OrderBy_UserId

      "OrderBy_CreatedAt" -> do
        pure OrderBy_CreatedAt

      "OrderBy_ModifiedAt" -> do
        pure OrderBy_ModifiedAt

      "OrderBy_ModifiedBy" -> do
        pure OrderBy_ModifiedBy

      "OrderBy_ActivityAt" -> do
        pure OrderBy_ActivityAt

      "OrderBy_OrganizationId" -> do
        pure OrderBy_OrganizationId

      "OrderBy_TeamId" -> do
        pure OrderBy_TeamId

      "OrderBy_ForumId" -> do
        pure OrderBy_ForumId

      "OrderBy_BoardId" -> do
        pure OrderBy_BoardId

      "OrderBy_ThreadId" -> do
        pure OrderBy_ThreadId

      "OrderBy_Id" -> do
        pure OrderBy_Id

      "OrderBy_None" -> do
        pure OrderBy_None

      _ -> Left $ TypeMismatch "OrderBy" "Respondable"



instance orderByIsForeign :: IsForeign OrderBy where
  read json = do
    tag <- readProp "tag" json
    case tag of
      "OrderBy_UserId" -> do
        pure OrderBy_UserId

      "OrderBy_CreatedAt" -> do
        pure OrderBy_CreatedAt

      "OrderBy_ModifiedAt" -> do
        pure OrderBy_ModifiedAt

      "OrderBy_ModifiedBy" -> do
        pure OrderBy_ModifiedBy

      "OrderBy_ActivityAt" -> do
        pure OrderBy_ActivityAt

      "OrderBy_OrganizationId" -> do
        pure OrderBy_OrganizationId

      "OrderBy_TeamId" -> do
        pure OrderBy_TeamId

      "OrderBy_ForumId" -> do
        pure OrderBy_ForumId

      "OrderBy_BoardId" -> do
        pure OrderBy_BoardId

      "OrderBy_ThreadId" -> do
        pure OrderBy_ThreadId

      "OrderBy_Id" -> do
        pure OrderBy_Id

      "OrderBy_None" -> do
        pure OrderBy_None

      _ -> Left $ TypeMismatch "OrderBy" "IsForeign"



instance orderByEq :: Eq OrderBy where
  eq OrderBy_UserId OrderBy_UserId = true
  eq OrderBy_CreatedAt OrderBy_CreatedAt = true
  eq OrderBy_ModifiedAt OrderBy_ModifiedAt = true
  eq OrderBy_ModifiedBy OrderBy_ModifiedBy = true
  eq OrderBy_ActivityAt OrderBy_ActivityAt = true
  eq OrderBy_OrganizationId OrderBy_OrganizationId = true
  eq OrderBy_TeamId OrderBy_TeamId = true
  eq OrderBy_ForumId OrderBy_ForumId = true
  eq OrderBy_BoardId OrderBy_BoardId = true
  eq OrderBy_ThreadId OrderBy_ThreadId = true
  eq OrderBy_Id OrderBy_Id = true
  eq OrderBy_None OrderBy_None = true
  eq _ _ = false

instance orderByShow :: Show OrderBy where
  show OrderBy_UserId = "user_id"
  show OrderBy_CreatedAt = "created_at"
  show OrderBy_ModifiedAt = "modified_at"
  show OrderBy_ModifiedBy = "modified_by"
  show OrderBy_ActivityAt = "activity_at"
  show OrderBy_OrganizationId = "organization_id"
  show OrderBy_TeamId = "team_id"
  show OrderBy_ForumId = "forum_id"
  show OrderBy_BoardId = "board_id"
  show OrderBy_ThreadId = "thread_id"
  show OrderBy_Id = "id"
  show OrderBy_None = "none"


readOrderBy :: String -> Maybe OrderBy
readOrderBy "user_id" = Just OrderBy_UserId
readOrderBy "created_at" = Just OrderBy_CreatedAt
readOrderBy "modified_at" = Just OrderBy_ModifiedAt
readOrderBy "modified_by" = Just OrderBy_ModifiedBy
readOrderBy "activity_at" = Just OrderBy_ActivityAt
readOrderBy "organization_id" = Just OrderBy_OrganizationId
readOrderBy "team_id" = Just OrderBy_TeamId
readOrderBy "forum_id" = Just OrderBy_ForumId
readOrderBy "board_id" = Just OrderBy_BoardId
readOrderBy "thread_id" = Just OrderBy_ThreadId
readOrderBy "id" = Just OrderBy_Id
readOrderBy "none" = Just OrderBy_None
readOrderBy _ = Nothing

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
        pure Perm_Create

      "Perm_Read" -> do
        pure Perm_Read

      "Perm_Update" -> do
        pure Perm_Update

      "Perm_Delete" -> do
        pure Perm_Delete

      "Perm_Execute" -> do
        pure Perm_Execute

      _ -> Left $ "DecodeJson TypeMismatch for Permission"



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
        pure Perm_Create

      "Perm_Read" -> do
        pure Perm_Read

      "Perm_Update" -> do
        pure Perm_Update

      "Perm_Delete" -> do
        pure Perm_Delete

      "Perm_Execute" -> do
        pure Perm_Execute

      _ -> Left $ TypeMismatch "Permission" "Respondable"



instance permissionIsForeign :: IsForeign Permission where
  read json = do
    tag <- readProp "tag" json
    case tag of
      "Perm_Create" -> do
        pure Perm_Create

      "Perm_Read" -> do
        pure Perm_Read

      "Perm_Update" -> do
        pure Perm_Update

      "Perm_Delete" -> do
        pure Perm_Delete

      "Perm_Execute" -> do
        pure Perm_Execute

      _ -> Left $ TypeMismatch "Permission" "IsForeign"



instance permissionEq :: Eq Permission where
  eq Perm_Create Perm_Create = true
  eq Perm_Read Perm_Read = true
  eq Perm_Update Perm_Update = true
  eq Perm_Delete Perm_Delete = true
  eq Perm_Execute Perm_Execute = true
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


mkPmRequest :: String -> String -> Int -> PmRequest
mkPmRequest subject body guard =
  PmRequest{subject, body, guard}


unwrapPmRequest :: PmRequest -> {
  subject :: String,
  body :: String,
  guard :: Int
}
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


mkPmResponse :: Int -> Int -> Int -> String -> String -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> PmResponse
mkPmResponse id userId toUserId subject body active guard createdAt modifiedAt activityAt =
  PmResponse{id, userId, toUserId, subject, body, active, guard, createdAt, modifiedAt, activityAt}


unwrapPmResponse :: PmResponse -> {
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
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)
      <*> (unNullOrUndefined <$> readProp "activity_at" json)


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
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)
      <*> (unNullOrUndefined <$> readProp "activity_at" json)


newtype PmResponses = PmResponses {
  pmResponses :: (Array PmResponse)
}


type PmResponsesR = {
  pmResponses :: (Array PmResponse)
}


mkPmResponses :: (Array PmResponse) -> PmResponses
mkPmResponses pmResponses =
  PmResponses{pmResponses}


unwrapPmResponses :: PmResponses -> {
  pmResponses :: (Array PmResponse)
}
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


mkPmInRequest :: (Maybe String) -> Boolean -> Boolean -> Int -> PmInRequest
mkPmInRequest label isRead isStarred guard =
  PmInRequest{label, isRead, isStarred, guard}


unwrapPmInRequest :: PmInRequest -> {
  label :: (Maybe String),
  isRead :: Boolean,
  isStarred :: Boolean,
  guard :: Int
}
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
      <$> (unNullOrUndefined <$> readProp "label" json)
      <*> readProp "is_read" json
      <*> readProp "is_starred" json
      <*> readProp "guard" json


instance pmInRequestIsForeign :: IsForeign PmInRequest where
  read json =
      mkPmInRequest
      <$> (unNullOrUndefined <$> readProp "label" json)
      <*> readProp "is_read" json
      <*> readProp "is_starred" json
      <*> readProp "guard" json


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


mkPmInResponse :: Int -> Int -> Int -> (Maybe String) -> Boolean -> Boolean -> Boolean -> Boolean -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> PmInResponse
mkPmInResponse id pmId userId label isRead isStarred isNew isSaved active guard createdAt modifiedAt =
  PmInResponse{id, pmId, userId, label, isRead, isStarred, isNew, isSaved, active, guard, createdAt, modifiedAt}


unwrapPmInResponse :: PmInResponse -> {
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
      <*> (unNullOrUndefined <$> readProp "label" json)
      <*> readProp "is_read" json
      <*> readProp "is_starred" json
      <*> readProp "is_new" json
      <*> readProp "is_saved" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)


instance pmInResponseIsForeign :: IsForeign PmInResponse where
  read json =
      mkPmInResponse
      <$> readProp "id" json
      <*> readProp "pm_id" json
      <*> readProp "user_id" json
      <*> (unNullOrUndefined <$> readProp "label" json)
      <*> readProp "is_read" json
      <*> readProp "is_starred" json
      <*> readProp "is_new" json
      <*> readProp "is_saved" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)


newtype PmInResponses = PmInResponses {
  pmInResponses :: (Array PmInResponse)
}


type PmInResponsesR = {
  pmInResponses :: (Array PmInResponse)
}


mkPmInResponses :: (Array PmInResponse) -> PmInResponses
mkPmInResponses pmInResponses =
  PmInResponses{pmInResponses}


unwrapPmInResponses :: PmInResponses -> {
  pmInResponses :: (Array PmInResponse)
}
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


newtype PmOutRequest = PmOutRequest {
  label :: (Maybe String),
  guard :: Int
}


type PmOutRequestR = {
  label :: (Maybe String),
  guard :: Int
}


mkPmOutRequest :: (Maybe String) -> Int -> PmOutRequest
mkPmOutRequest label guard =
  PmOutRequest{label, guard}


unwrapPmOutRequest :: PmOutRequest -> {
  label :: (Maybe String),
  guard :: Int
}
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
      <$> (unNullOrUndefined <$> readProp "label" json)
      <*> readProp "guard" json


instance pmOutRequestIsForeign :: IsForeign PmOutRequest where
  read json =
      mkPmOutRequest
      <$> (unNullOrUndefined <$> readProp "label" json)
      <*> readProp "guard" json


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


mkPmOutResponse :: Int -> Int -> Int -> (Maybe String) -> Boolean -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> PmOutResponse
mkPmOutResponse id pmId userId label isSaved active guard createdAt modifiedAt =
  PmOutResponse{id, pmId, userId, label, isSaved, active, guard, createdAt, modifiedAt}


unwrapPmOutResponse :: PmOutResponse -> {
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
      <*> (unNullOrUndefined <$> readProp "label" json)
      <*> readProp "is_saved" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)


instance pmOutResponseIsForeign :: IsForeign PmOutResponse where
  read json =
      mkPmOutResponse
      <$> readProp "id" json
      <*> readProp "pm_id" json
      <*> readProp "user_id" json
      <*> (unNullOrUndefined <$> readProp "label" json)
      <*> readProp "is_saved" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)


newtype PmOutResponses = PmOutResponses {
  pmOutResponses :: (Array PmOutResponse)
}


type PmOutResponsesR = {
  pmOutResponses :: (Array PmOutResponse)
}


mkPmOutResponses :: (Array PmOutResponse) -> PmOutResponses
mkPmOutResponses pmOutResponses =
  PmOutResponses{pmOutResponses}


unwrapPmOutResponses :: PmOutResponses -> {
  pmOutResponses :: (Array PmOutResponse)
}
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


mkProfileX :: String -> String -> String -> ProfileX
mkProfileX profileLogin profileName profileEmail =
  ProfileX{profileLogin, profileName, profileEmail}


unwrapProfileX :: ProfileX -> {
  profileLogin :: String,
  profileName :: String,
  profileEmail :: String
}
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
        pure GenderMale

      "GenderFemale" -> do
        pure GenderFemale

      "GenderUnknown" -> do
        pure GenderUnknown

      _ -> Left $ "DecodeJson TypeMismatch for ProfileGender"



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
        pure GenderMale

      "GenderFemale" -> do
        pure GenderFemale

      "GenderUnknown" -> do
        pure GenderUnknown

      _ -> Left $ TypeMismatch "ProfileGender" "Respondable"



instance profileGenderIsForeign :: IsForeign ProfileGender where
  read json = do
    tag <- readProp "tag" json
    case tag of
      "GenderMale" -> do
        pure GenderMale

      "GenderFemale" -> do
        pure GenderFemale

      "GenderUnknown" -> do
        pure GenderUnknown

      _ -> Left $ TypeMismatch "ProfileGender" "IsForeign"



instance profileGenderEq :: Eq ProfileGender where
  eq GenderMale GenderMale = true
  eq GenderFemale GenderFemale = true
  eq GenderUnknown GenderUnknown = true
  eq _ _ = false

readProfileGender :: String -> Maybe ProfileGender
readProfileGender "gender_male" = Just GenderMale
readProfileGender "gender_female" = Just GenderFemale
readProfileGender "gender_unknown" = Just GenderUnknown
readProfileGender _ = Nothing

newtype ProfileRequest = ProfileRequest {
  gender :: ProfileGender,
  birthdate :: Date,
  website :: (Maybe String),
  location :: (Maybe String),
  signature :: (Maybe String),
  debug :: Boolean,
  guard :: Int
}


type ProfileRequestR = {
  gender :: ProfileGender,
  birthdate :: Date,
  website :: (Maybe String),
  location :: (Maybe String),
  signature :: (Maybe String),
  debug :: Boolean,
  guard :: Int
}


mkProfileRequest :: ProfileGender -> Date -> (Maybe String) -> (Maybe String) -> (Maybe String) -> Boolean -> Int -> ProfileRequest
mkProfileRequest gender birthdate website location signature debug guard =
  ProfileRequest{gender, birthdate, website, location, signature, debug, guard}


unwrapProfileRequest :: ProfileRequest -> {
  gender :: ProfileGender,
  birthdate :: Date,
  website :: (Maybe String),
  location :: (Maybe String),
  signature :: (Maybe String),
  debug :: Boolean,
  guard :: Int
}
unwrapProfileRequest (ProfileRequest r) = r

instance profileRequestEncodeJson :: EncodeJson ProfileRequest where
  encodeJson (ProfileRequest o) =
       "tag" := "ProfileRequest"
    ~> "gender" := o.gender
    ~> "birthdate" := o.birthdate
    ~> "website" := o.website
    ~> "location" := o.location
    ~> "signature" := o.signature
    ~> "debug" := o.debug
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
    debug <- obj .? "debug"
    guard <- obj .? "guard"
    pure $ ProfileRequest {
      gender,
      birthdate,
      website,
      location,
      signature,
      debug,
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
      <*> (unNullOrUndefined <$> readProp "website" json)
      <*> (unNullOrUndefined <$> readProp "location" json)
      <*> (unNullOrUndefined <$> readProp "signature" json)
      <*> readProp "debug" json
      <*> readProp "guard" json


instance profileRequestIsForeign :: IsForeign ProfileRequest where
  read json =
      mkProfileRequest
      <$> readProp "gender" json
      <*> readProp "birthdate" json
      <*> (unNullOrUndefined <$> readProp "website" json)
      <*> (unNullOrUndefined <$> readProp "location" json)
      <*> (unNullOrUndefined <$> readProp "signature" json)
      <*> readProp "debug" json
      <*> readProp "guard" json


newtype ProfileResponse = ProfileResponse {
  id :: Int,
  ent :: Ent,
  entId :: Int,
  gender :: ProfileGender,
  birthdate :: Date,
  website :: (Maybe String),
  location :: (Maybe String),
  signature :: (Maybe String),
  debug :: Boolean,
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
  debug :: Boolean,
  karmaGood :: Int,
  karmaBad :: Int,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}


mkProfileResponse :: Int -> Ent -> Int -> ProfileGender -> Date -> (Maybe String) -> (Maybe String) -> (Maybe String) -> Boolean -> Int -> Int -> Int -> (Maybe Date) -> (Maybe Date) -> ProfileResponse
mkProfileResponse id ent entId gender birthdate website location signature debug karmaGood karmaBad guard createdAt modifiedAt =
  ProfileResponse{id, ent, entId, gender, birthdate, website, location, signature, debug, karmaGood, karmaBad, guard, createdAt, modifiedAt}


unwrapProfileResponse :: ProfileResponse -> {
  id :: Int,
  ent :: Ent,
  entId :: Int,
  gender :: ProfileGender,
  birthdate :: Date,
  website :: (Maybe String),
  location :: (Maybe String),
  signature :: (Maybe String),
  debug :: Boolean,
  karmaGood :: Int,
  karmaBad :: Int,
  guard :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}
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
    ~> "debug" := o.debug
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
    debug <- obj .? "debug"
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
      debug,
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
      <*> (unNullOrUndefined <$> readProp "website" json)
      <*> (unNullOrUndefined <$> readProp "location" json)
      <*> (unNullOrUndefined <$> readProp "signature" json)
      <*> readProp "debug" json
      <*> readProp "karma_good" json
      <*> readProp "karma_bad" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)


instance profileResponseIsForeign :: IsForeign ProfileResponse where
  read json =
      mkProfileResponse
      <$> readProp "id" json
      <*> readProp "ent" json
      <*> readProp "ent_id" json
      <*> readProp "gender" json
      <*> readProp "birthdate" json
      <*> (unNullOrUndefined <$> readProp "website" json)
      <*> (unNullOrUndefined <$> readProp "location" json)
      <*> (unNullOrUndefined <$> readProp "signature" json)
      <*> readProp "debug" json
      <*> readProp "karma_good" json
      <*> readProp "karma_bad" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)


newtype ProfileResponses = ProfileResponses {
  profileResponses :: (Array ProfileResponse)
}


type ProfileResponsesR = {
  profileResponses :: (Array ProfileResponse)
}


mkProfileResponses :: (Array ProfileResponse) -> ProfileResponses
mkProfileResponses profileResponses =
  ProfileResponses{profileResponses}


unwrapProfileResponses :: ProfileResponses -> {
  profileResponses :: (Array ProfileResponse)
}
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


newtype ReminderRequest = ReminderRequest {
  dataP :: String,
  guard :: Int
}


type ReminderRequestR = {
  dataP :: String,
  guard :: Int
}


mkReminderRequest :: String -> Int -> ReminderRequest
mkReminderRequest dataP guard =
  ReminderRequest{dataP, guard}


unwrapReminderRequest :: ReminderRequest -> {
  dataP :: String,
  guard :: Int
}
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


mkReminderResponse :: Int -> Int -> Int -> String -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> ReminderResponse
mkReminderResponse id userId parentFolderId dataP active guard createdAt modifiedAt activityAt =
  ReminderResponse{id, userId, parentFolderId, dataP, active, guard, createdAt, modifiedAt, activityAt}


unwrapReminderResponse :: ReminderResponse -> {
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
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)
      <*> (unNullOrUndefined <$> readProp "activity_at" json)


instance reminderResponseIsForeign :: IsForeign ReminderResponse where
  read json =
      mkReminderResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "parent_folder_id" json
      <*> readProp "data" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)
      <*> (unNullOrUndefined <$> readProp "activity_at" json)


newtype ReminderResponses = ReminderResponses {
  reminderResponses :: (Array ReminderResponse)
}


type ReminderResponsesR = {
  reminderResponses :: (Array ReminderResponse)
}


mkReminderResponses :: (Array ReminderResponse) -> ReminderResponses
mkReminderResponses reminderResponses =
  ReminderResponses{reminderResponses}


unwrapReminderResponses :: ReminderResponses -> {
  reminderResponses :: (Array ReminderResponse)
}
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


mkReminderFolderRequest :: String -> (Maybe String) -> Visibility -> Int -> ReminderFolderRequest
mkReminderFolderRequest displayName description visibility guard =
  ReminderFolderRequest{displayName, description, visibility, guard}


unwrapReminderFolderRequest :: ReminderFolderRequest -> {
  displayName :: String,
  description :: (Maybe String),
  visibility :: Visibility,
  guard :: Int
}
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
      <*> (unNullOrUndefined <$> readProp "description" json)
      <*> readProp "visibility" json
      <*> readProp "guard" json


instance reminderFolderRequestIsForeign :: IsForeign ReminderFolderRequest where
  read json =
      mkReminderFolderRequest
      <$> readProp "display_name" json
      <*> (unNullOrUndefined <$> readProp "description" json)
      <*> readProp "visibility" json
      <*> readProp "guard" json


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


mkReminderFolderResponse :: Int -> Int -> (Maybe Int) -> String -> String -> Visibility -> (Maybe String) -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> ReminderFolderResponse
mkReminderFolderResponse id userId parentFolderId name displayName visibility description active guard createdAt modifiedAt activityAt =
  ReminderFolderResponse{id, userId, parentFolderId, name, displayName, visibility, description, active, guard, createdAt, modifiedAt, activityAt}


unwrapReminderFolderResponse :: ReminderFolderResponse -> {
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
      <*> (unNullOrUndefined <$> readProp "parent_folder_id" json)
      <*> readProp "name" json
      <*> readProp "display_name" json
      <*> readProp "visibility" json
      <*> (unNullOrUndefined <$> readProp "description" json)
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)
      <*> (unNullOrUndefined <$> readProp "activity_at" json)


instance reminderFolderResponseIsForeign :: IsForeign ReminderFolderResponse where
  read json =
      mkReminderFolderResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> (unNullOrUndefined <$> readProp "parent_folder_id" json)
      <*> readProp "name" json
      <*> readProp "display_name" json
      <*> readProp "visibility" json
      <*> (unNullOrUndefined <$> readProp "description" json)
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)
      <*> (unNullOrUndefined <$> readProp "activity_at" json)


newtype ReminderFolderResponses = ReminderFolderResponses {
  reminderFolderResponses :: (Array ReminderFolderResponse)
}


type ReminderFolderResponsesR = {
  reminderFolderResponses :: (Array ReminderFolderResponse)
}


mkReminderFolderResponses :: (Array ReminderFolderResponse) -> ReminderFolderResponses
mkReminderFolderResponses reminderFolderResponses =
  ReminderFolderResponses{reminderFolderResponses}


unwrapReminderFolderResponses :: ReminderFolderResponses -> {
  reminderFolderResponses :: (Array ReminderFolderResponse)
}
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


data ResourceType
  = ISBN13 String
  | ISBN10 String
  | ISBN String
  | URL String
  | SourceNone 



instance resourceTypeEncodeJson :: EncodeJson ResourceType where
  encodeJson (ISBN13 x0) =
       "tag" := "ISBN13"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ISBN10 x0) =
       "tag" := "ISBN10"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (ISBN x0) =
       "tag" := "ISBN"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (URL x0) =
       "tag" := "URL"
    ~> "contents" := [encodeJson x0]
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
        r <- obj .? "contents"
        case r of
          [x0] -> ISBN13 <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ISBN13"


      "ISBN10" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ISBN10 <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ISBN10"


      "ISBN" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> ISBN <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for ISBN"


      "URL" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> URL <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for URL"


      "SourceNone" -> do
        pure SourceNone

      _ -> Left $ "DecodeJson TypeMismatch for ResourceType"



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
        r <- readProp "contents" json
        case r of
          [x0] -> ISBN13 <$> read x0
          _ -> Left $ TypeMismatch "ISBN13" "Respondable"


      "ISBN10" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ISBN10 <$> read x0
          _ -> Left $ TypeMismatch "ISBN10" "Respondable"


      "ISBN" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ISBN <$> read x0
          _ -> Left $ TypeMismatch "ISBN" "Respondable"


      "URL" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> URL <$> read x0
          _ -> Left $ TypeMismatch "URL" "Respondable"


      "SourceNone" -> do
        pure SourceNone

      _ -> Left $ TypeMismatch "ResourceType" "Respondable"



instance resourceTypeIsForeign :: IsForeign ResourceType where
  read json = do
    tag <- readProp "tag" json
    case tag of
      "ISBN13" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ISBN13 <$> read x0
          _ -> Left $ TypeMismatch "ISBN13" "IsForeign"


      "ISBN10" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ISBN10 <$> read x0
          _ -> Left $ TypeMismatch "ISBN10" "IsForeign"


      "ISBN" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> ISBN <$> read x0
          _ -> Left $ TypeMismatch "ISBN" "IsForeign"


      "URL" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> URL <$> read x0
          _ -> Left $ TypeMismatch "URL" "IsForeign"


      "SourceNone" -> do
        pure SourceNone

      _ -> Left $ TypeMismatch "ResourceType" "IsForeign"



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
        pure TyISBN13

      "TyISBN10" -> do
        pure TyISBN10

      "TyISBN" -> do
        pure TyISBN

      "TyURL" -> do
        pure TyURL

      "TySourceNone" -> do
        pure TySourceNone

      _ -> Left $ "DecodeJson TypeMismatch for TyResourceType"



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
        pure TyISBN13

      "TyISBN10" -> do
        pure TyISBN10

      "TyISBN" -> do
        pure TyISBN

      "TyURL" -> do
        pure TyURL

      "TySourceNone" -> do
        pure TySourceNone

      _ -> Left $ TypeMismatch "TyResourceType" "Respondable"



instance tyResourceTypeIsForeign :: IsForeign TyResourceType where
  read json = do
    tag <- readProp "tag" json
    case tag of
      "TyISBN13" -> do
        pure TyISBN13

      "TyISBN10" -> do
        pure TyISBN10

      "TyISBN" -> do
        pure TyISBN

      "TyURL" -> do
        pure TyURL

      "TySourceNone" -> do
        pure TySourceNone

      _ -> Left $ TypeMismatch "TyResourceType" "IsForeign"



instance tyResourceTypeEq :: Eq TyResourceType where
  eq TyISBN13 TyISBN13 = true
  eq TyISBN10 TyISBN10 = true
  eq TyISBN TyISBN = true
  eq TyURL TyURL = true
  eq TySourceNone TySourceNone = true
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


mkResourceRequest :: String -> String -> ResourceType -> (Maybe (Array String)) -> (DepList String) -> (DepList String) -> Visibility -> Int -> (Maybe String) -> (Maybe (Array String)) -> (Maybe String) -> (Array String) -> Int -> ResourceRequest
mkResourceRequest displayName description source author prerequisites categories visibility counter version urls icon tags guard =
  ResourceRequest{displayName, description, source, author, prerequisites, categories, visibility, counter, version, urls, icon, tags, guard}


unwrapResourceRequest :: ResourceRequest -> {
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
      <*> (unNullOrUndefined <$> readProp "author" json)
      <*> readProp "prerequisites" json
      <*> readProp "categories" json
      <*> readProp "visibility" json
      <*> readProp "counter" json
      <*> (unNullOrUndefined <$> readProp "version" json)
      <*> (unNullOrUndefined <$> readProp "urls" json)
      <*> (unNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "guard" json


instance resourceRequestIsForeign :: IsForeign ResourceRequest where
  read json =
      mkResourceRequest
      <$> readProp "display_name" json
      <*> readProp "description" json
      <*> readProp "source" json
      <*> (unNullOrUndefined <$> readProp "author" json)
      <*> readProp "prerequisites" json
      <*> readProp "categories" json
      <*> readProp "visibility" json
      <*> readProp "counter" json
      <*> (unNullOrUndefined <$> readProp "version" json)
      <*> (unNullOrUndefined <$> readProp "urls" json)
      <*> (unNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "guard" json


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


mkResourceResponse :: Int -> Int -> String -> String -> String -> ResourceType -> (Maybe (Array String)) -> (DepList String) -> (DepList String) -> Visibility -> Int -> (Maybe String) -> (Maybe (Array String)) -> (Maybe String) -> (Array String) -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> ResourceResponse
mkResourceResponse id userId name displayName description source author prerequisites categories visibility counter version urls icon tags active guard createdAt modifiedAt activityAt =
  ResourceResponse{id, userId, name, displayName, description, source, author, prerequisites, categories, visibility, counter, version, urls, icon, tags, active, guard, createdAt, modifiedAt, activityAt}


unwrapResourceResponse :: ResourceResponse -> {
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
      <*> (unNullOrUndefined <$> readProp "author" json)
      <*> readProp "prerequisites" json
      <*> readProp "categories" json
      <*> readProp "visibility" json
      <*> readProp "counter" json
      <*> (unNullOrUndefined <$> readProp "version" json)
      <*> (unNullOrUndefined <$> readProp "urls" json)
      <*> (unNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)
      <*> (unNullOrUndefined <$> readProp "activity_at" json)


instance resourceResponseIsForeign :: IsForeign ResourceResponse where
  read json =
      mkResourceResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "name" json
      <*> readProp "display_name" json
      <*> readProp "description" json
      <*> readProp "source" json
      <*> (unNullOrUndefined <$> readProp "author" json)
      <*> readProp "prerequisites" json
      <*> readProp "categories" json
      <*> readProp "visibility" json
      <*> readProp "counter" json
      <*> (unNullOrUndefined <$> readProp "version" json)
      <*> (unNullOrUndefined <$> readProp "urls" json)
      <*> (unNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)
      <*> (unNullOrUndefined <$> readProp "activity_at" json)


newtype ResourceResponses = ResourceResponses {
  resourceResponses :: (Array ResourceResponse)
}


type ResourceResponsesR = {
  resourceResponses :: (Array ResourceResponse)
}


mkResourceResponses :: (Array ResourceResponse) -> ResourceResponses
mkResourceResponses resourceResponses =
  ResourceResponses{resourceResponses}


unwrapResourceResponses :: ResourceResponses -> {
  resourceResponses :: (Array ResourceResponse)
}
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


mkResourceStatResponse :: Int -> Int -> Int -> Int -> Int -> Int -> Int -> ResourceStatResponse
mkResourceStatResponse resourceId leurons likes neutral dislikes stars views =
  ResourceStatResponse{resourceId, leurons, likes, neutral, dislikes, stars, views}


unwrapResourceStatResponse :: ResourceStatResponse -> {
  resourceId :: Int,
  leurons :: Int,
  likes :: Int,
  neutral :: Int,
  dislikes :: Int,
  stars :: Int,
  views :: Int
}
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


newtype ResourceStatResponses = ResourceStatResponses {
  resourceStatResponses :: (Array ResourceStatResponse)
}


type ResourceStatResponsesR = {
  resourceStatResponses :: (Array ResourceStatResponse)
}


mkResourceStatResponses :: (Array ResourceStatResponse) -> ResourceStatResponses
mkResourceStatResponses resourceStatResponses =
  ResourceStatResponses{resourceStatResponses}


unwrapResourceStatResponses :: ResourceStatResponses -> {
  resourceStatResponses :: (Array ResourceStatResponse)
}
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
        pure XSmall

      "Small" -> do
        pure Small

      "Medium" -> do
        pure Medium

      "Large" -> do
        pure Large

      "XLarge" -> do
        pure XLarge

      _ -> Left $ "DecodeJson TypeMismatch for Size"



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
        pure XSmall

      "Small" -> do
        pure Small

      "Medium" -> do
        pure Medium

      "Large" -> do
        pure Large

      "XLarge" -> do
        pure XLarge

      _ -> Left $ TypeMismatch "Size" "Respondable"



instance sizeIsForeign :: IsForeign Size where
  read json = do
    tag <- readProp "tag" json
    case tag of
      "XSmall" -> do
        pure XSmall

      "Small" -> do
        pure Small

      "Medium" -> do
        pure Medium

      "Large" -> do
        pure Large

      "XLarge" -> do
        pure XLarge

      _ -> Left $ TypeMismatch "Size" "IsForeign"



instance sizeEq :: Eq Size where
  eq XSmall XSmall = true
  eq Small Small = true
  eq Medium Medium = true
  eq Large Large = true
  eq XLarge XLarge = true
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
        r <- obj .? "contents"
        case r of
          [x0, x1, x2] -> SplitAt <$> decodeJson x0 <*> decodeJson x1 <*> decodeJson x2
          _ -> Left $ "DecodeJson TypeMismatch for SplitAt"


      "SplitNone" -> do
        pure SplitNone

      _ -> Left $ "DecodeJson TypeMismatch for Splits"



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
        r <- readProp "contents" json
        case r of
          [x0, x1, x2] -> SplitAt <$> read x0 <*> read x1 <*> read x2
          _ -> Left $ TypeMismatch "SplitAt" "Respondable"


      "SplitNone" -> do
        pure SplitNone

      _ -> Left $ TypeMismatch "Splits" "Respondable"



instance splitsIsForeign :: IsForeign Splits where
  read json = do
    tag <- readProp "tag" json
    case tag of
      "SplitAt" -> do
        r <- readProp "contents" json
        case r of
          [x0, x1, x2] -> SplitAt <$> read x0 <*> read x1 <*> read x2
          _ -> Left $ TypeMismatch "SplitAt" "IsForeign"


      "SplitNone" -> do
        pure SplitNone

      _ -> Left $ TypeMismatch "Splits" "IsForeign"



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
        pure TySplitA

      "TySplitNone" -> do
        pure TySplitNone

      _ -> Left $ "DecodeJson TypeMismatch for TySplits"



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
        pure TySplitA

      "TySplitNone" -> do
        pure TySplitNone

      _ -> Left $ TypeMismatch "TySplits" "Respondable"



instance tySplitsIsForeign :: IsForeign TySplits where
  read json = do
    tag <- readProp "tag" json
    case tag of
      "TySplitA" -> do
        pure TySplitA

      "TySplitNone" -> do
        pure TySplitNone

      _ -> Left $ TypeMismatch "TySplits" "IsForeign"



instance tySplitsEq :: Eq TySplits where
  eq TySplitA TySplitA = true
  eq TySplitNone TySplitNone = true
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
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (SubsAllOf x0) =
       "tag" := "SubsAllOf"
    ~> "contents" := [encodeJson x0]
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
        r <- obj .? "contents"
        case r of
          [x0, x1] -> SubsExpr <$> decodeJson x0 <*> decodeJson x1
          _ -> Left $ "DecodeJson TypeMismatch for SubsExpr"


      "SubsOneOf" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> SubsOneOf <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for SubsOneOf"


      "SubsAllOf" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> SubsAllOf <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for SubsAllOf"


      "SubsBoth" -> do
        r <- obj .? "contents"
        case r of
          [x0, x1] -> SubsBoth <$> decodeJson x0 <*> decodeJson x1
          _ -> Left $ "DecodeJson TypeMismatch for SubsBoth"


      _ -> Left $ "DecodeJson TypeMismatch for Substitutions"



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
        r <- readProp "contents" json
        case r of
          [x0, x1] -> SubsExpr <$> read x0 <*> read x1
          _ -> Left $ TypeMismatch "SubsExpr" "Respondable"


      "SubsOneOf" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> SubsOneOf <$> read x0
          _ -> Left $ TypeMismatch "SubsOneOf" "Respondable"


      "SubsAllOf" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> SubsAllOf <$> read x0
          _ -> Left $ TypeMismatch "SubsAllOf" "Respondable"


      "SubsBoth" -> do
        r <- readProp "contents" json
        case r of
          [x0, x1] -> SubsBoth <$> read x0 <*> read x1
          _ -> Left $ TypeMismatch "SubsBoth" "Respondable"


      _ -> Left $ TypeMismatch "Substitutions" "Respondable"



instance substitutionsIsForeign :: IsForeign Substitutions where
  read json = do
    tag <- readProp "tag" json
    case tag of
      "SubsExpr" -> do
        r <- readProp "contents" json
        case r of
          [x0, x1] -> SubsExpr <$> read x0 <*> read x1
          _ -> Left $ TypeMismatch "SubsExpr" "IsForeign"


      "SubsOneOf" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> SubsOneOf <$> read x0
          _ -> Left $ TypeMismatch "SubsOneOf" "IsForeign"


      "SubsAllOf" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> SubsAllOf <$> read x0
          _ -> Left $ TypeMismatch "SubsAllOf" "IsForeign"


      "SubsBoth" -> do
        r <- readProp "contents" json
        case r of
          [x0, x1] -> SubsBoth <$> read x0 <*> read x1
          _ -> Left $ TypeMismatch "SubsBoth" "IsForeign"


      _ -> Left $ TypeMismatch "Substitutions" "IsForeign"



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
        pure TySubsExpr

      "TySubsOneOf" -> do
        pure TySubsOneOf

      "TySubsAllOf" -> do
        pure TySubsAllOf

      "TySubsBoth" -> do
        pure TySubsBoth

      _ -> Left $ "DecodeJson TypeMismatch for TySubstitutions"



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
        pure TySubsExpr

      "TySubsOneOf" -> do
        pure TySubsOneOf

      "TySubsAllOf" -> do
        pure TySubsAllOf

      "TySubsBoth" -> do
        pure TySubsBoth

      _ -> Left $ TypeMismatch "TySubstitutions" "Respondable"



instance tySubstitutionsIsForeign :: IsForeign TySubstitutions where
  read json = do
    tag <- readProp "tag" json
    case tag of
      "TySubsExpr" -> do
        pure TySubsExpr

      "TySubsOneOf" -> do
        pure TySubsOneOf

      "TySubsAllOf" -> do
        pure TySubsAllOf

      "TySubsBoth" -> do
        pure TySubsBoth

      _ -> Left $ TypeMismatch "TySubstitutions" "IsForeign"



instance tySubstitutionsEq :: Eq TySubstitutions where
  eq TySubsExpr TySubsExpr = true
  eq TySubsOneOf TySubsOneOf = true
  eq TySubsAllOf TySubsAllOf = true
  eq TySubsBoth TySubsBoth = true
  eq _ _ = false

newtype StarRequest = StarRequest {
  reason :: (Maybe String),
  guard :: Int
}


type StarRequestR = {
  reason :: (Maybe String),
  guard :: Int
}


mkStarRequest :: (Maybe String) -> Int -> StarRequest
mkStarRequest reason guard =
  StarRequest{reason, guard}


unwrapStarRequest :: StarRequest -> {
  reason :: (Maybe String),
  guard :: Int
}
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
      <$> (unNullOrUndefined <$> readProp "reason" json)
      <*> readProp "guard" json


instance starRequestIsForeign :: IsForeign StarRequest where
  read json =
      mkStarRequest
      <$> (unNullOrUndefined <$> readProp "reason" json)
      <*> readProp "guard" json


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


mkStarResponse :: Int -> Ent -> Int -> Int -> (Maybe String) -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> StarResponse
mkStarResponse id ent entId userId reason active guard createdAt modifiedAt =
  StarResponse{id, ent, entId, userId, reason, active, guard, createdAt, modifiedAt}


unwrapStarResponse :: StarResponse -> {
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
      <*> (unNullOrUndefined <$> readProp "reason" json)
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)


instance starResponseIsForeign :: IsForeign StarResponse where
  read json =
      mkStarResponse
      <$> readProp "id" json
      <*> readProp "ent" json
      <*> readProp "ent_id" json
      <*> readProp "user_id" json
      <*> (unNullOrUndefined <$> readProp "reason" json)
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)


newtype StarResponses = StarResponses {
  starResponses :: (Array StarResponse)
}


type StarResponsesR = {
  starResponses :: (Array StarResponse)
}


mkStarResponses :: (Array StarResponse) -> StarResponses
mkStarResponses starResponses =
  StarResponses{starResponses}


unwrapStarResponses :: StarResponses -> {
  starResponses :: (Array StarResponse)
}
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


mkStarStatResponse :: Ent -> Int -> Int -> StarStatResponse
mkStarStatResponse ent entId stars =
  StarStatResponse{ent, entId, stars}


unwrapStarStatResponse :: StarStatResponse -> {
  ent :: Ent,
  entId :: Int,
  stars :: Int
}
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


newtype StarStatResponses = StarStatResponses {
  starStatResponses :: (Array StarStatResponse)
}


type StarStatResponsesR = {
  starStatResponses :: (Array StarStatResponse)
}


mkStarStatResponses :: (Array StarStatResponse) -> StarStatResponses
mkStarStatResponses starStatResponses =
  StarStatResponses{starStatResponses}


unwrapStarStatResponses :: StarStatResponses -> {
  starStatResponses :: (Array StarStatResponse)
}
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
        pure Team_Owners

      "Team_Members" -> do
        pure Team_Members

      _ -> Left $ "DecodeJson TypeMismatch for SystemTeam"



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
        pure Team_Owners

      "Team_Members" -> do
        pure Team_Members

      _ -> Left $ TypeMismatch "SystemTeam" "Respondable"



instance systemTeamIsForeign :: IsForeign SystemTeam where
  read json = do
    tag <- readProp "tag" json
    case tag of
      "Team_Owners" -> do
        pure Team_Owners

      "Team_Members" -> do
        pure Team_Members

      _ -> Left $ TypeMismatch "SystemTeam" "IsForeign"



instance systemTeamEq :: Eq SystemTeam where
  eq Team_Owners Team_Owners = true
  eq Team_Members Team_Members = true
  eq _ _ = false

readSystemTeam :: String -> Maybe SystemTeam
readSystemTeam "team_owners" = Just Team_Owners
readSystemTeam "team_members" = Just Team_Members
readSystemTeam _ = Nothing

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


mkTeamRequest :: Membership -> (Maybe String) -> (Array String) -> Visibility -> Int -> TeamRequest
mkTeamRequest membership icon tags visibility guard =
  TeamRequest{membership, icon, tags, visibility, guard}


unwrapTeamRequest :: TeamRequest -> {
  membership :: Membership,
  icon :: (Maybe String),
  tags :: (Array String),
  visibility :: Visibility,
  guard :: Int
}
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
      <*> (unNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "visibility" json
      <*> readProp "guard" json


instance teamRequestIsForeign :: IsForeign TeamRequest where
  read json =
      mkTeamRequest
      <$> readProp "membership" json
      <*> (unNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "visibility" json
      <*> readProp "guard" json


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


mkTeamResponse :: Int -> Int -> Int -> SystemTeam -> Membership -> (Maybe String) -> (Array String) -> Visibility -> Boolean -> Int -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> TeamResponse
mkTeamResponse id userId orgId system membership icon tags visibility active guard createdAt modifiedBy modifiedAt activityAt =
  TeamResponse{id, userId, orgId, system, membership, icon, tags, visibility, active, guard, createdAt, modifiedBy, modifiedAt, activityAt}


unwrapTeamResponse :: TeamResponse -> {
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
      <*> (unNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "visibility" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_by" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)
      <*> (unNullOrUndefined <$> readProp "activity_at" json)


instance teamResponseIsForeign :: IsForeign TeamResponse where
  read json =
      mkTeamResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "org_id" json
      <*> readProp "system" json
      <*> readProp "membership" json
      <*> (unNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "visibility" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_by" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)
      <*> (unNullOrUndefined <$> readProp "activity_at" json)


newtype TeamResponses = TeamResponses {
  teamResponses :: (Array TeamResponse)
}


type TeamResponsesR = {
  teamResponses :: (Array TeamResponse)
}


mkTeamResponses :: (Array TeamResponse) -> TeamResponses
mkTeamResponses teamResponses =
  TeamResponses{teamResponses}


unwrapTeamResponses :: TeamResponses -> {
  teamResponses :: (Array TeamResponse)
}
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


newtype TeamStatResponse = TeamStatResponse {
  members :: Int
}


type TeamStatResponseR = {
  members :: Int
}


mkTeamStatResponse :: Int -> TeamStatResponse
mkTeamStatResponse members =
  TeamStatResponse{members}


unwrapTeamStatResponse :: TeamStatResponse -> {
  members :: Int
}
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


newtype TeamStatResponses = TeamStatResponses {
  teamStatResponses :: (Array TeamStatResponse)
}


type TeamStatResponsesR = {
  teamStatResponses :: (Array TeamStatResponse)
}


mkTeamStatResponses :: (Array TeamStatResponse) -> TeamStatResponses
mkTeamStatResponses teamStatResponses =
  TeamStatResponses{teamStatResponses}


unwrapTeamStatResponses :: TeamStatResponses -> {
  teamStatResponses :: (Array TeamStatResponse)
}
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


newtype TeamMemberRequest = TeamMemberRequest {
  guard :: Int
}


type TeamMemberRequestR = {
  guard :: Int
}


mkTeamMemberRequest :: Int -> TeamMemberRequest
mkTeamMemberRequest guard =
  TeamMemberRequest{guard}


unwrapTeamMemberRequest :: TeamMemberRequest -> {
  guard :: Int
}
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


newtype TeamMemberResponse = TeamMemberResponse {
  id :: Int,
  userId :: Int,
  orgId :: Int,
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
  orgId :: Int,
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


mkTeamMemberResponse :: Int -> Int -> Int -> Int -> Boolean -> (Maybe Date) -> Boolean -> (Maybe Date) -> Boolean -> Int -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> TeamMemberResponse
mkTeamMemberResponse id userId orgId teamId isAccepted acceptedAt isBlocked blockedAt active guard createdAt modifiedBy modifiedAt activityAt =
  TeamMemberResponse{id, userId, orgId, teamId, isAccepted, acceptedAt, isBlocked, blockedAt, active, guard, createdAt, modifiedBy, modifiedAt, activityAt}


unwrapTeamMemberResponse :: TeamMemberResponse -> {
  id :: Int,
  userId :: Int,
  orgId :: Int,
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
unwrapTeamMemberResponse (TeamMemberResponse r) = r

instance teamMemberResponseEncodeJson :: EncodeJson TeamMemberResponse where
  encodeJson (TeamMemberResponse o) =
       "tag" := "TeamMemberResponse"
    ~> "id" := o.id
    ~> "user_id" := o.userId
    ~> "org_id" := o.orgId
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
    orgId <- obj .? "org_id"
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
      orgId,
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
      <*> readProp "org_id" json
      <*> readProp "team_id" json
      <*> readProp "is_accepted" json
      <*> (unNullOrUndefined <$> readProp "accepted_at" json)
      <*> readProp "is_blocked" json
      <*> (unNullOrUndefined <$> readProp "blocked_at" json)
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_by" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)
      <*> (unNullOrUndefined <$> readProp "activity_at" json)


instance teamMemberResponseIsForeign :: IsForeign TeamMemberResponse where
  read json =
      mkTeamMemberResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "org_id" json
      <*> readProp "team_id" json
      <*> readProp "is_accepted" json
      <*> (unNullOrUndefined <$> readProp "accepted_at" json)
      <*> readProp "is_blocked" json
      <*> (unNullOrUndefined <$> readProp "blocked_at" json)
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_by" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)
      <*> (unNullOrUndefined <$> readProp "activity_at" json)


newtype TeamMemberResponses = TeamMemberResponses {
  teamMemberResponses :: (Array TeamMemberResponse)
}


type TeamMemberResponsesR = {
  teamMemberResponses :: (Array TeamMemberResponse)
}


mkTeamMemberResponses :: (Array TeamMemberResponse) -> TeamMemberResponses
mkTeamMemberResponses teamMemberResponses =
  TeamMemberResponses{teamMemberResponses}


unwrapTeamMemberResponses :: TeamMemberResponses -> {
  teamMemberResponses :: (Array TeamMemberResponse)
}
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
        pure TeamMemberStatResponse

      _ -> Left $ "DecodeJson TypeMismatch for TeamMemberStatResponse"



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
        pure TeamMemberStatResponse

      _ -> Left $ TypeMismatch "TeamMemberStatResponse" "Respondable"



instance teamMemberStatResponseIsForeign :: IsForeign TeamMemberStatResponse where
  read json = do
    tag <- readProp "tag" json
    case tag of
      "TeamMemberStatResponse" -> do
        pure TeamMemberStatResponse

      _ -> Left $ TypeMismatch "TeamMemberStatResponse" "IsForeign"



newtype TeamMemberStatResponses = TeamMemberStatResponses {
  teamMemberStatResponses :: (Array TeamMemberStatResponse)
}


type TeamMemberStatResponsesR = {
  teamMemberStatResponses :: (Array TeamMemberStatResponse)
}


mkTeamMemberStatResponses :: (Array TeamMemberStatResponse) -> TeamMemberStatResponses
mkTeamMemberStatResponses teamMemberStatResponses =
  TeamMemberStatResponses{teamMemberStatResponses}


unwrapTeamMemberStatResponses :: TeamMemberStatResponses -> {
  teamMemberStatResponses :: (Array TeamMemberStatResponse)
}
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


newtype TestRequest = TestRequest {
  msg :: String
}


type TestRequestR = {
  msg :: String
}


mkTestRequest :: String -> TestRequest
mkTestRequest msg =
  TestRequest{msg}


unwrapTestRequest :: TestRequest -> {
  msg :: String
}
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


mkTestResponse :: Int -> Int -> String -> (Maybe Date) -> (Maybe Date) -> TestResponse
mkTestResponse id userId msg createdAt modifiedAt =
  TestResponse{id, userId, msg, createdAt, modifiedAt}


unwrapTestResponse :: TestResponse -> {
  id :: Int,
  userId :: Int,
  msg :: String,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}
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
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)


instance testResponseIsForeign :: IsForeign TestResponse where
  read json =
      mkTestResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "msg" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)


newtype TestResponses = TestResponses {
  testResponses :: (Array TestResponse)
}


type TestResponsesR = {
  testResponses :: (Array TestResponse)
}


mkTestResponses :: (Array TestResponse) -> TestResponses
mkTestResponses testResponses =
  TestResponses{testResponses}


unwrapTestResponses :: TestResponses -> {
  testResponses :: (Array TestResponse)
}
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


mkThreadRequest :: String -> (Maybe String) -> Boolean -> Boolean -> (Maybe String) -> (Maybe String) -> (Array String) -> Int -> ThreadRequest
mkThreadRequest displayName description sticky locked poll icon tags guard =
  ThreadRequest{displayName, description, sticky, locked, poll, icon, tags, guard}


unwrapThreadRequest :: ThreadRequest -> {
  displayName :: String,
  description :: (Maybe String),
  sticky :: Boolean,
  locked :: Boolean,
  poll :: (Maybe String),
  icon :: (Maybe String),
  tags :: (Array String),
  guard :: Int
}
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
      <*> (unNullOrUndefined <$> readProp "description" json)
      <*> readProp "sticky" json
      <*> readProp "locked" json
      <*> (unNullOrUndefined <$> readProp "poll" json)
      <*> (unNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "guard" json


instance threadRequestIsForeign :: IsForeign ThreadRequest where
  read json =
      mkThreadRequest
      <$> readProp "display_name" json
      <*> (unNullOrUndefined <$> readProp "description" json)
      <*> readProp "sticky" json
      <*> readProp "locked" json
      <*> (unNullOrUndefined <$> readProp "poll" json)
      <*> (unNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "guard" json


newtype ThreadResponse = ThreadResponse {
  id :: Int,
  userId :: Int,
  orgId :: Int,
  forumId :: Int,
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
  orgId :: Int,
  forumId :: Int,
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


mkThreadResponse :: Int -> Int -> Int -> Int -> Int -> String -> String -> (Maybe String) -> Boolean -> Boolean -> (Maybe String) -> (Maybe String) -> (Array String) -> Boolean -> Int -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> ThreadResponse
mkThreadResponse id userId orgId forumId boardId name displayName description sticky locked poll icon tags active guard createdAt modifiedBy modifiedAt activityAt =
  ThreadResponse{id, userId, orgId, forumId, boardId, name, displayName, description, sticky, locked, poll, icon, tags, active, guard, createdAt, modifiedBy, modifiedAt, activityAt}


unwrapThreadResponse :: ThreadResponse -> {
  id :: Int,
  userId :: Int,
  orgId :: Int,
  forumId :: Int,
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
unwrapThreadResponse (ThreadResponse r) = r

instance threadResponseEncodeJson :: EncodeJson ThreadResponse where
  encodeJson (ThreadResponse o) =
       "tag" := "ThreadResponse"
    ~> "id" := o.id
    ~> "user_id" := o.userId
    ~> "org_id" := o.orgId
    ~> "forum_id" := o.forumId
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
    orgId <- obj .? "org_id"
    forumId <- obj .? "forum_id"
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
      orgId,
      forumId,
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
      <*> readProp "org_id" json
      <*> readProp "forum_id" json
      <*> readProp "board_id" json
      <*> readProp "name" json
      <*> readProp "display_name" json
      <*> (unNullOrUndefined <$> readProp "description" json)
      <*> readProp "sticky" json
      <*> readProp "locked" json
      <*> (unNullOrUndefined <$> readProp "poll" json)
      <*> (unNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_by" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)
      <*> (unNullOrUndefined <$> readProp "activity_at" json)


instance threadResponseIsForeign :: IsForeign ThreadResponse where
  read json =
      mkThreadResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "org_id" json
      <*> readProp "forum_id" json
      <*> readProp "board_id" json
      <*> readProp "name" json
      <*> readProp "display_name" json
      <*> (unNullOrUndefined <$> readProp "description" json)
      <*> readProp "sticky" json
      <*> readProp "locked" json
      <*> (unNullOrUndefined <$> readProp "poll" json)
      <*> (unNullOrUndefined <$> readProp "icon" json)
      <*> readProp "tags" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_by" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)
      <*> (unNullOrUndefined <$> readProp "activity_at" json)


newtype ThreadResponses = ThreadResponses {
  threadResponses :: (Array ThreadResponse)
}


type ThreadResponsesR = {
  threadResponses :: (Array ThreadResponse)
}


mkThreadResponses :: (Array ThreadResponse) -> ThreadResponses
mkThreadResponses threadResponses =
  ThreadResponses{threadResponses}


unwrapThreadResponses :: ThreadResponses -> {
  threadResponses :: (Array ThreadResponse)
}
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


mkThreadStatResponse :: Int -> Int -> Int -> ThreadStatResponse
mkThreadStatResponse threadId threadPosts views =
  ThreadStatResponse{threadId, threadPosts, views}


unwrapThreadStatResponse :: ThreadStatResponse -> {
  threadId :: Int,
  threadPosts :: Int,
  views :: Int
}
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


newtype ThreadStatResponses = ThreadStatResponses {
  threadStatResponses :: (Array ThreadStatResponse)
}


type ThreadStatResponsesR = {
  threadStatResponses :: (Array ThreadStatResponse)
}


mkThreadStatResponses :: (Array ThreadStatResponse) -> ThreadStatResponses
mkThreadStatResponses threadStatResponses =
  ThreadStatResponses{threadStatResponses}


unwrapThreadStatResponses :: ThreadStatResponses -> {
  threadStatResponses :: (Array ThreadStatResponse)
}
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
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (PostDataMarkdown x0) =
       "tag" := "PostDataMarkdown"
    ~> "contents" := [encodeJson x0]
    ~> jsonEmptyObject
  encodeJson (PostDataBBCode x0) =
       "tag" := "PostDataBBCode"
    ~> "contents" := [encodeJson x0]
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
        r <- obj .? "contents"
        case r of
          [x0] -> PostDataRaw <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for PostDataRaw"


      "PostDataMarkdown" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> PostDataMarkdown <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for PostDataMarkdown"


      "PostDataBBCode" -> do
        r <- obj .? "contents"
        case r of
          [x0] -> PostDataBBCode <$> decodeJson x0
          _ -> Left $ "DecodeJson TypeMismatch for PostDataBBCode"


      "PostDataCode" -> do
        r <- obj .? "contents"
        case r of
          [x0, x1] -> PostDataCode <$> decodeJson x0 <*> decodeJson x1
          _ -> Left $ "DecodeJson TypeMismatch for PostDataCode"


      "PostDataOther" -> do
        r <- obj .? "contents"
        case r of
          [x0, x1] -> PostDataOther <$> decodeJson x0 <*> decodeJson x1
          _ -> Left $ "DecodeJson TypeMismatch for PostDataOther"


      "PostDataEmpty" -> do
        pure PostDataEmpty

      _ -> Left $ "DecodeJson TypeMismatch for PostData"



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
        r <- readProp "contents" json
        case r of
          [x0] -> PostDataRaw <$> read x0
          _ -> Left $ TypeMismatch "PostDataRaw" "Respondable"


      "PostDataMarkdown" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> PostDataMarkdown <$> read x0
          _ -> Left $ TypeMismatch "PostDataMarkdown" "Respondable"


      "PostDataBBCode" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> PostDataBBCode <$> read x0
          _ -> Left $ TypeMismatch "PostDataBBCode" "Respondable"


      "PostDataCode" -> do
        r <- readProp "contents" json
        case r of
          [x0, x1] -> PostDataCode <$> read x0 <*> read x1
          _ -> Left $ TypeMismatch "PostDataCode" "Respondable"


      "PostDataOther" -> do
        r <- readProp "contents" json
        case r of
          [x0, x1] -> PostDataOther <$> read x0 <*> read x1
          _ -> Left $ TypeMismatch "PostDataOther" "Respondable"


      "PostDataEmpty" -> do
        pure PostDataEmpty

      _ -> Left $ TypeMismatch "PostData" "Respondable"



instance postDataIsForeign :: IsForeign PostData where
  read json = do
    tag <- readProp "tag" json
    case tag of
      "PostDataRaw" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> PostDataRaw <$> read x0
          _ -> Left $ TypeMismatch "PostDataRaw" "IsForeign"


      "PostDataMarkdown" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> PostDataMarkdown <$> read x0
          _ -> Left $ TypeMismatch "PostDataMarkdown" "IsForeign"


      "PostDataBBCode" -> do
        r <- readProp "contents" json
        case r of
          [x0] -> PostDataBBCode <$> read x0
          _ -> Left $ TypeMismatch "PostDataBBCode" "IsForeign"


      "PostDataCode" -> do
        r <- readProp "contents" json
        case r of
          [x0, x1] -> PostDataCode <$> read x0 <*> read x1
          _ -> Left $ TypeMismatch "PostDataCode" "IsForeign"


      "PostDataOther" -> do
        r <- readProp "contents" json
        case r of
          [x0, x1] -> PostDataOther <$> read x0 <*> read x1
          _ -> Left $ TypeMismatch "PostDataOther" "IsForeign"


      "PostDataEmpty" -> do
        pure PostDataEmpty

      _ -> Left $ TypeMismatch "PostData" "IsForeign"



instance postDataEq :: Eq PostData where
  eq (PostDataRaw x0a) (PostDataRaw x0b) = x0a == x0b
  eq (PostDataMarkdown x0a) (PostDataMarkdown x0b) = x0a == x0b
  eq (PostDataBBCode x0a) (PostDataBBCode x0b) = x0a == x0b
  eq (PostDataCode x0a x1a) (PostDataCode x0b x1b) = x0a == x0b && x1a == x1b
  eq (PostDataOther x0a x1a) (PostDataOther x0b x1b) = x0a == x0b && x1a == x1b
  eq PostDataEmpty PostDataEmpty = true
  eq _ _ = false

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


mkThreadPostRequest :: (Maybe String) -> PostData -> (Array String) -> (Array String) -> Int -> ThreadPostRequest
mkThreadPostRequest title body tags privateTags guard =
  ThreadPostRequest{title, body, tags, privateTags, guard}


unwrapThreadPostRequest :: ThreadPostRequest -> {
  title :: (Maybe String),
  body :: PostData,
  tags :: (Array String),
  privateTags :: (Array String),
  guard :: Int
}
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
      <$> (unNullOrUndefined <$> readProp "title" json)
      <*> readProp "body" json
      <*> readProp "tags" json
      <*> readProp "private_tags" json
      <*> readProp "guard" json


instance threadPostRequestIsForeign :: IsForeign ThreadPostRequest where
  read json =
      mkThreadPostRequest
      <$> (unNullOrUndefined <$> readProp "title" json)
      <*> readProp "body" json
      <*> readProp "tags" json
      <*> readProp "private_tags" json
      <*> readProp "guard" json


newtype ThreadPostResponse = ThreadPostResponse {
  id :: Int,
  userId :: Int,
  orgId :: Int,
  forumId :: Int,
  boardId :: Int,
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
  orgId :: Int,
  forumId :: Int,
  boardId :: Int,
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


mkThreadPostResponse :: Int -> Int -> Int -> Int -> Int -> Int -> (Maybe Int) -> (Maybe String) -> PostData -> (Array String) -> (Array String) -> Boolean -> Int -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> ThreadPostResponse
mkThreadPostResponse id userId orgId forumId boardId threadId parentId title body tags privateTags active guard createdAt modifiedBy modifiedAt activityAt =
  ThreadPostResponse{id, userId, orgId, forumId, boardId, threadId, parentId, title, body, tags, privateTags, active, guard, createdAt, modifiedBy, modifiedAt, activityAt}


unwrapThreadPostResponse :: ThreadPostResponse -> {
  id :: Int,
  userId :: Int,
  orgId :: Int,
  forumId :: Int,
  boardId :: Int,
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
unwrapThreadPostResponse (ThreadPostResponse r) = r

instance threadPostResponseEncodeJson :: EncodeJson ThreadPostResponse where
  encodeJson (ThreadPostResponse o) =
       "tag" := "ThreadPostResponse"
    ~> "id" := o.id
    ~> "user_id" := o.userId
    ~> "org_id" := o.orgId
    ~> "forum_id" := o.forumId
    ~> "board_id" := o.boardId
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
    orgId <- obj .? "org_id"
    forumId <- obj .? "forum_id"
    boardId <- obj .? "board_id"
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
      orgId,
      forumId,
      boardId,
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
      <*> readProp "org_id" json
      <*> readProp "forum_id" json
      <*> readProp "board_id" json
      <*> readProp "thread_id" json
      <*> (unNullOrUndefined <$> readProp "parent_id" json)
      <*> (unNullOrUndefined <$> readProp "title" json)
      <*> readProp "body" json
      <*> readProp "tags" json
      <*> readProp "private_tags" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_by" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)
      <*> (unNullOrUndefined <$> readProp "activity_at" json)


instance threadPostResponseIsForeign :: IsForeign ThreadPostResponse where
  read json =
      mkThreadPostResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "org_id" json
      <*> readProp "forum_id" json
      <*> readProp "board_id" json
      <*> readProp "thread_id" json
      <*> (unNullOrUndefined <$> readProp "parent_id" json)
      <*> (unNullOrUndefined <$> readProp "title" json)
      <*> readProp "body" json
      <*> readProp "tags" json
      <*> readProp "private_tags" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_by" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)
      <*> (unNullOrUndefined <$> readProp "activity_at" json)


newtype ThreadPostResponses = ThreadPostResponses {
  threadPostResponses :: (Array ThreadPostResponse)
}


type ThreadPostResponsesR = {
  threadPostResponses :: (Array ThreadPostResponse)
}


mkThreadPostResponses :: (Array ThreadPostResponse) -> ThreadPostResponses
mkThreadPostResponses threadPostResponses =
  ThreadPostResponses{threadPostResponses}


unwrapThreadPostResponses :: ThreadPostResponses -> {
  threadPostResponses :: (Array ThreadPostResponse)
}
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


mkThreadPostStatResponse :: Int -> Int -> Int -> Int -> Int -> Int -> ThreadPostStatResponse
mkThreadPostStatResponse threadPostId likes neutral dislikes stars views =
  ThreadPostStatResponse{threadPostId, likes, neutral, dislikes, stars, views}


unwrapThreadPostStatResponse :: ThreadPostStatResponse -> {
  threadPostId :: Int,
  likes :: Int,
  neutral :: Int,
  dislikes :: Int,
  stars :: Int,
  views :: Int
}
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


newtype ThreadPostStatResponses = ThreadPostStatResponses {
  threadPostStatResponses :: (Array ThreadPostStatResponse)
}


type ThreadPostStatResponsesR = {
  threadPostStatResponses :: (Array ThreadPostStatResponse)
}


mkThreadPostStatResponses :: (Array ThreadPostStatResponse) -> ThreadPostStatResponses
mkThreadPostStatResponses threadPostStatResponses =
  ThreadPostStatResponses{threadPostStatResponses}


unwrapThreadPostStatResponses :: ThreadPostStatResponses -> {
  threadPostStatResponses :: (Array ThreadPostStatResponse)
}
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


newtype UserRequest = UserRequest {
  displayName :: String,
  fullName :: String,
  email :: String,
  plugin :: String,
  ident :: String,
  acceptTOS :: (Maybe Date)
}


type UserRequestR = {
  displayName :: String,
  fullName :: String,
  email :: String,
  plugin :: String,
  ident :: String,
  acceptTOS :: (Maybe Date)
}


mkUserRequest :: String -> String -> String -> String -> String -> (Maybe Date) -> UserRequest
mkUserRequest displayName fullName email plugin ident acceptTOS =
  UserRequest{displayName, fullName, email, plugin, ident, acceptTOS}


unwrapUserRequest :: UserRequest -> {
  displayName :: String,
  fullName :: String,
  email :: String,
  plugin :: String,
  ident :: String,
  acceptTOS :: (Maybe Date)
}
unwrapUserRequest (UserRequest r) = r

instance userRequestEncodeJson :: EncodeJson UserRequest where
  encodeJson (UserRequest o) =
       "tag" := "UserRequest"
    ~> "display_name" := o.displayName
    ~> "full_name" := o.fullName
    ~> "email" := o.email
    ~> "plugin" := o.plugin
    ~> "ident" := o.ident
    ~> "accept_tos" := o.acceptTOS
    ~> jsonEmptyObject


instance userRequestDecodeJson :: DecodeJson UserRequest where
  decodeJson o = do
    obj <- decodeJson o
    displayName <- obj .? "display_name"
    fullName <- obj .? "full_name"
    email <- obj .? "email"
    plugin <- obj .? "plugin"
    ident <- obj .? "ident"
    acceptTOS <- obj .? "accept_tos"
    pure $ UserRequest {
      displayName,
      fullName,
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
      <$> readProp "display_name" json
      <*> readProp "full_name" json
      <*> readProp "email" json
      <*> readProp "plugin" json
      <*> readProp "ident" json
      <*> (unNullOrUndefined <$> readProp "accept_tos" json)


instance userRequestIsForeign :: IsForeign UserRequest where
  read json =
      mkUserRequest
      <$> readProp "display_name" json
      <*> readProp "full_name" json
      <*> readProp "email" json
      <*> readProp "plugin" json
      <*> readProp "ident" json
      <*> (unNullOrUndefined <$> readProp "accept_tos" json)


newtype UserResponse = UserResponse {
  id :: Int,
  name :: String,
  displayName :: String,
  fullName :: String,
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
  name :: String,
  displayName :: String,
  fullName :: String,
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


mkUserResponse :: Int -> String -> String -> String -> String -> String -> String -> String -> (Maybe Date) -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> UserResponse
mkUserResponse id name displayName fullName email emailMD5 plugin ident acceptTOS active guard createdAt modifiedAt deactivatedAt activityAt =
  UserResponse{id, name, displayName, fullName, email, emailMD5, plugin, ident, acceptTOS, active, guard, createdAt, modifiedAt, deactivatedAt, activityAt}


unwrapUserResponse :: UserResponse -> {
  id :: Int,
  name :: String,
  displayName :: String,
  fullName :: String,
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
unwrapUserResponse (UserResponse r) = r

instance userResponseEncodeJson :: EncodeJson UserResponse where
  encodeJson (UserResponse o) =
       "tag" := "UserResponse"
    ~> "id" := o.id
    ~> "name" := o.name
    ~> "display_name" := o.displayName
    ~> "full_name" := o.fullName
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
    name <- obj .? "name"
    displayName <- obj .? "display_name"
    fullName <- obj .? "full_name"
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
      name,
      displayName,
      fullName,
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
      <*> readProp "name" json
      <*> readProp "display_name" json
      <*> readProp "full_name" json
      <*> readProp "email" json
      <*> readProp "email_md5" json
      <*> readProp "plugin" json
      <*> readProp "ident" json
      <*> (unNullOrUndefined <$> readProp "accept_tos" json)
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)
      <*> (unNullOrUndefined <$> readProp "deactivated_at" json)
      <*> (unNullOrUndefined <$> readProp "activity_at" json)


instance userResponseIsForeign :: IsForeign UserResponse where
  read json =
      mkUserResponse
      <$> readProp "id" json
      <*> readProp "name" json
      <*> readProp "display_name" json
      <*> readProp "full_name" json
      <*> readProp "email" json
      <*> readProp "email_md5" json
      <*> readProp "plugin" json
      <*> readProp "ident" json
      <*> (unNullOrUndefined <$> readProp "accept_tos" json)
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "modified_at" json)
      <*> (unNullOrUndefined <$> readProp "deactivated_at" json)
      <*> (unNullOrUndefined <$> readProp "activity_at" json)


newtype UserResponses = UserResponses {
  userResponses :: (Array UserResponse)
}


type UserResponsesR = {
  userResponses :: (Array UserResponse)
}


mkUserResponses :: (Array UserResponse) -> UserResponses
mkUserResponses userResponses =
  UserResponses{userResponses}


unwrapUserResponses :: UserResponses -> {
  userResponses :: (Array UserResponse)
}
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


newtype UserSanitizedResponse = UserSanitizedResponse {
  id :: Int,
  name :: String,
  displayName :: String,
  emailMD5 :: String,
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


type UserSanitizedResponseR = {
  id :: Int,
  name :: String,
  displayName :: String,
  emailMD5 :: String,
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}


mkUserSanitizedResponse :: Int -> String -> String -> String -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> UserSanitizedResponse
mkUserSanitizedResponse id name displayName emailMD5 active guard createdAt activityAt =
  UserSanitizedResponse{id, name, displayName, emailMD5, active, guard, createdAt, activityAt}


unwrapUserSanitizedResponse :: UserSanitizedResponse -> {
  id :: Int,
  name :: String,
  displayName :: String,
  emailMD5 :: String,
  active :: Boolean,
  guard :: Int,
  createdAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}
unwrapUserSanitizedResponse (UserSanitizedResponse r) = r

instance userSanitizedResponseEncodeJson :: EncodeJson UserSanitizedResponse where
  encodeJson (UserSanitizedResponse o) =
       "tag" := "UserSanitizedResponse"
    ~> "id" := o.id
    ~> "name" := o.name
    ~> "display_name" := o.displayName
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
    name <- obj .? "name"
    displayName <- obj .? "display_name"
    emailMD5 <- obj .? "email_md5"
    active <- obj .? "active"
    guard <- obj .? "guard"
    createdAt <- obj .? "created_at"
    activityAt <- obj .? "activity_at"
    pure $ UserSanitizedResponse {
      id,
      name,
      displayName,
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
      <*> readProp "name" json
      <*> readProp "display_name" json
      <*> readProp "email_md5" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "activity_at" json)


instance userSanitizedResponseIsForeign :: IsForeign UserSanitizedResponse where
  read json =
      mkUserSanitizedResponse
      <$> readProp "id" json
      <*> readProp "name" json
      <*> readProp "display_name" json
      <*> readProp "email_md5" json
      <*> readProp "active" json
      <*> readProp "guard" json
      <*> (unNullOrUndefined <$> readProp "created_at" json)
      <*> (unNullOrUndefined <$> readProp "activity_at" json)


newtype UserSanitizedResponses = UserSanitizedResponses {
  userSanitizedResponses :: (Array UserSanitizedResponse)
}


type UserSanitizedResponsesR = {
  userSanitizedResponses :: (Array UserSanitizedResponse)
}


mkUserSanitizedResponses :: (Array UserSanitizedResponse) -> UserSanitizedResponses
mkUserSanitizedResponses userSanitizedResponses =
  UserSanitizedResponses{userSanitizedResponses}


unwrapUserSanitizedResponses :: UserSanitizedResponses -> {
  userSanitizedResponses :: (Array UserSanitizedResponse)
}
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


mkUserSanitizedStatResponse :: Int -> Int -> Int -> Int -> Int -> Int -> Int -> UserSanitizedStatResponse
mkUserSanitizedStatResponse userId threads threadPosts respect resources leurons workouts =
  UserSanitizedStatResponse{userId, threads, threadPosts, respect, resources, leurons, workouts}


unwrapUserSanitizedStatResponse :: UserSanitizedStatResponse -> {
  userId :: Int,
  threads :: Int,
  threadPosts :: Int,
  respect :: Int,
  resources :: Int,
  leurons :: Int,
  workouts :: Int
}
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


newtype UserSanitizedStatResponses = UserSanitizedStatResponses {
  userSanitizedStatResponses :: (Array UserSanitizedStatResponse)
}


type UserSanitizedStatResponsesR = {
  userSanitizedStatResponses :: (Array UserSanitizedStatResponse)
}


mkUserSanitizedStatResponses :: (Array UserSanitizedStatResponse) -> UserSanitizedStatResponses
mkUserSanitizedStatResponses userSanitizedStatResponses =
  UserSanitizedStatResponses{userSanitizedStatResponses}


unwrapUserSanitizedStatResponses :: UserSanitizedStatResponses -> {
  userSanitizedStatResponses :: (Array UserSanitizedStatResponse)
}
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
        pure Public

      "Private" -> do
        pure Private

      _ -> Left $ "DecodeJson TypeMismatch for Visibility"



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
        pure Public

      "Private" -> do
        pure Private

      _ -> fail $ TypeMismatch "Visibility" "Respondable"



instance visibilityIsForeign :: IsForeign Visibility where
  read json = do
    tag <- readProp "tag" json
    case tag of
      "Public" -> do
        pure Public

      "Private" -> do
        pure Private

      _ -> fail $ TypeMismatch "Visibility" "IsForeign"



instance visibilityEq :: Eq Visibility where
  eq Public Public = true
  eq Private Private = true
  eq _ _ = false

readVisibility :: String -> Maybe Visibility
readVisibility "public" = Just Public
readVisibility "private" = Just Private
readVisibility _ = Nothing

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


mkOrganizationPackResponse :: UserSanitizedResponse -> Int -> OrganizationResponse -> Int -> OrganizationStatResponse -> (Maybe LikeResponse) -> (Maybe StarResponse) -> Permissions -> (Array SystemTeam) -> OrganizationPackResponse
mkOrganizationPackResponse user userId organization organizationId stat like star permissions teams =
  OrganizationPackResponse{user, userId, organization, organizationId, stat, like, star, permissions, teams}


unwrapOrganizationPackResponse :: OrganizationPackResponse -> {
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
      <*> (unNullOrUndefined <$> readProp "like" json)
      <*> (unNullOrUndefined <$> readProp "star" json)
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
      <*> (unNullOrUndefined <$> readProp "like" json)
      <*> (unNullOrUndefined <$> readProp "star" json)
      <*> readProp "permissions" json
      <*> readProp "teams" json


newtype OrganizationPackResponses = OrganizationPackResponses {
  organizationPackResponses :: (Array OrganizationPackResponse)
}


type OrganizationPackResponsesR = {
  organizationPackResponses :: (Array OrganizationPackResponse)
}


mkOrganizationPackResponses :: (Array OrganizationPackResponse) -> OrganizationPackResponses
mkOrganizationPackResponses organizationPackResponses =
  OrganizationPackResponses{organizationPackResponses}


unwrapOrganizationPackResponses :: OrganizationPackResponses -> {
  organizationPackResponses :: (Array OrganizationPackResponse)
}
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


mkTeamPackResponse :: UserSanitizedResponse -> Int -> TeamResponse -> Int -> TeamStatResponse -> Permissions -> TeamPackResponse
mkTeamPackResponse user userId team teamId stat permissions =
  TeamPackResponse{user, userId, team, teamId, stat, permissions}


unwrapTeamPackResponse :: TeamPackResponse -> {
  user :: UserSanitizedResponse,
  userId :: Int,
  team :: TeamResponse,
  teamId :: Int,
  stat :: TeamStatResponse,
  permissions :: Permissions
}
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


newtype TeamPackResponses = TeamPackResponses {
  teamPackResponses :: (Array TeamPackResponse)
}


type TeamPackResponsesR = {
  teamPackResponses :: (Array TeamPackResponse)
}


mkTeamPackResponses :: (Array TeamPackResponse) -> TeamPackResponses
mkTeamPackResponses teamPackResponses =
  TeamPackResponses{teamPackResponses}


unwrapTeamPackResponses :: TeamPackResponses -> {
  teamPackResponses :: (Array TeamPackResponse)
}
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


mkTeamMemberPackResponse :: UserSanitizedResponse -> Int -> TeamMemberResponse -> Int -> Permissions -> TeamMemberPackResponse
mkTeamMemberPackResponse user userId teamMember teamMemberId permissions =
  TeamMemberPackResponse{user, userId, teamMember, teamMemberId, permissions}


unwrapTeamMemberPackResponse :: TeamMemberPackResponse -> {
  user :: UserSanitizedResponse,
  userId :: Int,
  teamMember :: TeamMemberResponse,
  teamMemberId :: Int,
  permissions :: Permissions
}
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


newtype TeamMemberPackResponses = TeamMemberPackResponses {
  teamMemberPackResponses :: (Array TeamMemberPackResponse)
}


type TeamMemberPackResponsesR = {
  teamMemberPackResponses :: (Array TeamMemberPackResponse)
}


mkTeamMemberPackResponses :: (Array TeamMemberPackResponse) -> TeamMemberPackResponses
mkTeamMemberPackResponses teamMemberPackResponses =
  TeamMemberPackResponses{teamMemberPackResponses}


unwrapTeamMemberPackResponses :: TeamMemberPackResponses -> {
  teamMemberPackResponses :: (Array TeamMemberPackResponse)
}
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


mkUserPackResponse :: UserResponse -> Int -> UserSanitizedStatResponse -> ProfileResponse -> Int -> UserPackResponse
mkUserPackResponse user userId stat profile profileId =
  UserPackResponse{user, userId, stat, profile, profileId}


unwrapUserPackResponse :: UserPackResponse -> {
  user :: UserResponse,
  userId :: Int,
  stat :: UserSanitizedStatResponse,
  profile :: ProfileResponse,
  profileId :: Int
}
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


newtype UserPackResponses = UserPackResponses {
  userPackResponses :: (Array UserPackResponse)
}


type UserPackResponsesR = {
  userPackResponses :: (Array UserPackResponse)
}


mkUserPackResponses :: (Array UserPackResponse) -> UserPackResponses
mkUserPackResponses userPackResponses =
  UserPackResponses{userPackResponses}


unwrapUserPackResponses :: UserPackResponses -> {
  userPackResponses :: (Array UserPackResponse)
}
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


mkUserSanitizedPackResponse :: UserSanitizedResponse -> Int -> ProfileResponse -> Int -> UserSanitizedStatResponse -> (Maybe LikeResponse) -> (Maybe StarResponse) -> UserSanitizedPackResponse
mkUserSanitizedPackResponse user userId profile profileId stat like star =
  UserSanitizedPackResponse{user, userId, profile, profileId, stat, like, star}


unwrapUserSanitizedPackResponse :: UserSanitizedPackResponse -> {
  user :: UserSanitizedResponse,
  userId :: Int,
  profile :: ProfileResponse,
  profileId :: Int,
  stat :: UserSanitizedStatResponse,
  like :: (Maybe LikeResponse),
  star :: (Maybe StarResponse)
}
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
      <*> (unNullOrUndefined <$> readProp "like" json)
      <*> (unNullOrUndefined <$> readProp "star" json)


instance userSanitizedPackResponseIsForeign :: IsForeign UserSanitizedPackResponse where
  read json =
      mkUserSanitizedPackResponse
      <$> readProp "user" json
      <*> readProp "user_id" json
      <*> readProp "profile" json
      <*> readProp "profile_id" json
      <*> readProp "stat" json
      <*> (unNullOrUndefined <$> readProp "like" json)
      <*> (unNullOrUndefined <$> readProp "star" json)


newtype UserSanitizedPackResponses = UserSanitizedPackResponses {
  userSanitizedPackResponses :: (Array UserSanitizedPackResponse)
}


type UserSanitizedPackResponsesR = {
  userSanitizedPackResponses :: (Array UserSanitizedPackResponse)
}


mkUserSanitizedPackResponses :: (Array UserSanitizedPackResponse) -> UserSanitizedPackResponses
mkUserSanitizedPackResponses userSanitizedPackResponses =
  UserSanitizedPackResponses{userSanitizedPackResponses}


unwrapUserSanitizedPackResponses :: UserSanitizedPackResponses -> {
  userSanitizedPackResponses :: (Array UserSanitizedPackResponse)
}
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


mkGlobalGroupPackResponse :: UserSanitizedResponse -> Int -> GlobalGroupResponse -> Int -> GlobalGroupStatResponse -> Permissions -> GlobalGroupPackResponse
mkGlobalGroupPackResponse user userId globalGroup globalGroupId stat permissions =
  GlobalGroupPackResponse{user, userId, globalGroup, globalGroupId, stat, permissions}


unwrapGlobalGroupPackResponse :: GlobalGroupPackResponse -> {
  user :: UserSanitizedResponse,
  userId :: Int,
  globalGroup :: GlobalGroupResponse,
  globalGroupId :: Int,
  stat :: GlobalGroupStatResponse,
  permissions :: Permissions
}
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


newtype GlobalGroupPackResponses = GlobalGroupPackResponses {
  globalGroupPackResponses :: (Array GlobalGroupPackResponse)
}


type GlobalGroupPackResponsesR = {
  globalGroupPackResponses :: (Array GlobalGroupPackResponse)
}


mkGlobalGroupPackResponses :: (Array GlobalGroupPackResponse) -> GlobalGroupPackResponses
mkGlobalGroupPackResponses globalGroupPackResponses =
  GlobalGroupPackResponses{globalGroupPackResponses}


unwrapGlobalGroupPackResponses :: GlobalGroupPackResponses -> {
  globalGroupPackResponses :: (Array GlobalGroupPackResponse)
}
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


mkGroupPackResponse :: UserSanitizedResponse -> Int -> GroupResponse -> Int -> OrganizationResponse -> Int -> GroupStatResponse -> Permissions -> GroupPackResponse
mkGroupPackResponse user userId group groupId organization organizationId stat permissions =
  GroupPackResponse{user, userId, group, groupId, organization, organizationId, stat, permissions}


unwrapGroupPackResponse :: GroupPackResponse -> {
  user :: UserSanitizedResponse,
  userId :: Int,
  group :: GroupResponse,
  groupId :: Int,
  organization :: OrganizationResponse,
  organizationId :: Int,
  stat :: GroupStatResponse,
  permissions :: Permissions
}
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


newtype GroupPackResponses = GroupPackResponses {
  groupPackResponses :: (Array GroupPackResponse)
}


type GroupPackResponsesR = {
  groupPackResponses :: (Array GroupPackResponse)
}


mkGroupPackResponses :: (Array GroupPackResponse) -> GroupPackResponses
mkGroupPackResponses groupPackResponses =
  GroupPackResponses{groupPackResponses}


unwrapGroupPackResponses :: GroupPackResponses -> {
  groupPackResponses :: (Array GroupPackResponse)
}
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


mkGroupMemberPackResponse :: UserSanitizedResponse -> Int -> GroupMemberResponse -> Int -> Boolean -> GroupMemberPackResponse
mkGroupMemberPackResponse user userId groupMember groupMemberId isOwner =
  GroupMemberPackResponse{user, userId, groupMember, groupMemberId, isOwner}


unwrapGroupMemberPackResponse :: GroupMemberPackResponse -> {
  user :: UserSanitizedResponse,
  userId :: Int,
  groupMember :: GroupMemberResponse,
  groupMemberId :: Int,
  isOwner :: Boolean
}
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


newtype GroupMemberPackResponses = GroupMemberPackResponses {
  groupMemberPackResponses :: (Array GroupMemberPackResponse)
}


type GroupMemberPackResponsesR = {
  groupMemberPackResponses :: (Array GroupMemberPackResponse)
}


mkGroupMemberPackResponses :: (Array GroupMemberPackResponse) -> GroupMemberPackResponses
mkGroupMemberPackResponses groupMemberPackResponses =
  GroupMemberPackResponses{groupMemberPackResponses}


unwrapGroupMemberPackResponses :: GroupMemberPackResponses -> {
  groupMemberPackResponses :: (Array GroupMemberPackResponse)
}
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


mkForumPackResponse :: ForumResponse -> Int -> ForumStatResponse -> (Maybe LikeResponse) -> (Maybe StarResponse) -> (Maybe OrganizationResponse) -> Permissions -> ForumPackResponse
mkForumPackResponse forum forumId stat like star withOrganization permissions =
  ForumPackResponse{forum, forumId, stat, like, star, withOrganization, permissions}


unwrapForumPackResponse :: ForumPackResponse -> {
  forum :: ForumResponse,
  forumId :: Int,
  stat :: ForumStatResponse,
  like :: (Maybe LikeResponse),
  star :: (Maybe StarResponse),
  withOrganization :: (Maybe OrganizationResponse),
  permissions :: Permissions
}
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
      <*> (unNullOrUndefined <$> readProp "like" json)
      <*> (unNullOrUndefined <$> readProp "star" json)
      <*> (unNullOrUndefined <$> readProp "with_organization" json)
      <*> readProp "permissions" json


instance forumPackResponseIsForeign :: IsForeign ForumPackResponse where
  read json =
      mkForumPackResponse
      <$> readProp "forum" json
      <*> readProp "forum_id" json
      <*> readProp "stat" json
      <*> (unNullOrUndefined <$> readProp "like" json)
      <*> (unNullOrUndefined <$> readProp "star" json)
      <*> (unNullOrUndefined <$> readProp "with_organization" json)
      <*> readProp "permissions" json


newtype ForumPackResponses = ForumPackResponses {
  forumPackResponses :: (Array ForumPackResponse)
}


type ForumPackResponsesR = {
  forumPackResponses :: (Array ForumPackResponse)
}


mkForumPackResponses :: (Array ForumPackResponse) -> ForumPackResponses
mkForumPackResponses forumPackResponses =
  ForumPackResponses{forumPackResponses}


unwrapForumPackResponses :: ForumPackResponses -> {
  forumPackResponses :: (Array ForumPackResponse)
}
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


mkBoardPackResponse :: BoardResponse -> Int -> BoardStatResponse -> (Maybe LikeResponse) -> (Maybe StarResponse) -> (Maybe ThreadResponse) -> (Maybe ThreadPostResponse) -> (Maybe UserSanitizedResponse) -> (Maybe OrganizationResponse) -> (Maybe ForumResponse) -> Permissions -> BoardPackResponse
mkBoardPackResponse board boardId stat like star latestThread latestThreadPost latestThreadPostUser withOrganization withForum permissions =
  BoardPackResponse{board, boardId, stat, like, star, latestThread, latestThreadPost, latestThreadPostUser, withOrganization, withForum, permissions}


unwrapBoardPackResponse :: BoardPackResponse -> {
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
      <*> (unNullOrUndefined <$> readProp "like" json)
      <*> (unNullOrUndefined <$> readProp "star" json)
      <*> (unNullOrUndefined <$> readProp "latest_thread" json)
      <*> (unNullOrUndefined <$> readProp "latest_thread_post" json)
      <*> (unNullOrUndefined <$> readProp "latest_thread_post_user" json)
      <*> (unNullOrUndefined <$> readProp "with_organization" json)
      <*> (unNullOrUndefined <$> readProp "with_forum" json)
      <*> readProp "permissions" json


instance boardPackResponseIsForeign :: IsForeign BoardPackResponse where
  read json =
      mkBoardPackResponse
      <$> readProp "board" json
      <*> readProp "board_id" json
      <*> readProp "stat" json
      <*> (unNullOrUndefined <$> readProp "like" json)
      <*> (unNullOrUndefined <$> readProp "star" json)
      <*> (unNullOrUndefined <$> readProp "latest_thread" json)
      <*> (unNullOrUndefined <$> readProp "latest_thread_post" json)
      <*> (unNullOrUndefined <$> readProp "latest_thread_post_user" json)
      <*> (unNullOrUndefined <$> readProp "with_organization" json)
      <*> (unNullOrUndefined <$> readProp "with_forum" json)
      <*> readProp "permissions" json


newtype BoardPackResponses = BoardPackResponses {
  boardPackResponses :: (Array BoardPackResponse)
}


type BoardPackResponsesR = {
  boardPackResponses :: (Array BoardPackResponse)
}


mkBoardPackResponses :: (Array BoardPackResponse) -> BoardPackResponses
mkBoardPackResponses boardPackResponses =
  BoardPackResponses{boardPackResponses}


unwrapBoardPackResponses :: BoardPackResponses -> {
  boardPackResponses :: (Array BoardPackResponse)
}
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


mkThreadPackResponse :: ThreadResponse -> Int -> UserSanitizedResponse -> Int -> ThreadStatResponse -> (Maybe LikeResponse) -> (Maybe StarResponse) -> (Maybe ThreadPostResponse) -> (Maybe UserSanitizedResponse) -> (Maybe OrganizationResponse) -> (Maybe ForumResponse) -> (Maybe BoardResponse) -> Permissions -> ThreadPackResponse
mkThreadPackResponse thread threadId user userId stat like star latestThreadPost latestThreadPostUser withOrganization withForum withBoard permissions =
  ThreadPackResponse{thread, threadId, user, userId, stat, like, star, latestThreadPost, latestThreadPostUser, withOrganization, withForum, withBoard, permissions}


unwrapThreadPackResponse :: ThreadPackResponse -> {
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
      <*> (unNullOrUndefined <$> readProp "like" json)
      <*> (unNullOrUndefined <$> readProp "star" json)
      <*> (unNullOrUndefined <$> readProp "latest_thread_post" json)
      <*> (unNullOrUndefined <$> readProp "latest_thread_post_user" json)
      <*> (unNullOrUndefined <$> readProp "with_organization" json)
      <*> (unNullOrUndefined <$> readProp "with_forum" json)
      <*> (unNullOrUndefined <$> readProp "with_board" json)
      <*> readProp "permissions" json


instance threadPackResponseIsForeign :: IsForeign ThreadPackResponse where
  read json =
      mkThreadPackResponse
      <$> readProp "thread" json
      <*> readProp "thread_id" json
      <*> readProp "user" json
      <*> readProp "user_id" json
      <*> readProp "stat" json
      <*> (unNullOrUndefined <$> readProp "like" json)
      <*> (unNullOrUndefined <$> readProp "star" json)
      <*> (unNullOrUndefined <$> readProp "latest_thread_post" json)
      <*> (unNullOrUndefined <$> readProp "latest_thread_post_user" json)
      <*> (unNullOrUndefined <$> readProp "with_organization" json)
      <*> (unNullOrUndefined <$> readProp "with_forum" json)
      <*> (unNullOrUndefined <$> readProp "with_board" json)
      <*> readProp "permissions" json


newtype ThreadPackResponses = ThreadPackResponses {
  threadPackResponses :: (Array ThreadPackResponse)
}


type ThreadPackResponsesR = {
  threadPackResponses :: (Array ThreadPackResponse)
}


mkThreadPackResponses :: (Array ThreadPackResponse) -> ThreadPackResponses
mkThreadPackResponses threadPackResponses =
  ThreadPackResponses{threadPackResponses}


unwrapThreadPackResponses :: ThreadPackResponses -> {
  threadPackResponses :: (Array ThreadPackResponse)
}
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


mkThreadPostPackResponse :: ThreadPostResponse -> Int -> UserSanitizedResponse -> Int -> ThreadPostStatResponse -> (Maybe LikeResponse) -> (Maybe StarResponse) -> (Maybe OrganizationResponse) -> (Maybe ForumResponse) -> (Maybe BoardResponse) -> (Maybe ThreadResponse) -> Permissions -> ThreadPostPackResponse
mkThreadPostPackResponse threadPost threadPostId user userId stat like star withOrganization withForum withBoard withThread permissions =
  ThreadPostPackResponse{threadPost, threadPostId, user, userId, stat, like, star, withOrganization, withForum, withBoard, withThread, permissions}


unwrapThreadPostPackResponse :: ThreadPostPackResponse -> {
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
      <*> (unNullOrUndefined <$> readProp "like" json)
      <*> (unNullOrUndefined <$> readProp "star" json)
      <*> (unNullOrUndefined <$> readProp "with_organization" json)
      <*> (unNullOrUndefined <$> readProp "with_forum" json)
      <*> (unNullOrUndefined <$> readProp "with_board" json)
      <*> (unNullOrUndefined <$> readProp "with_thread" json)
      <*> readProp "permissions" json


instance threadPostPackResponseIsForeign :: IsForeign ThreadPostPackResponse where
  read json =
      mkThreadPostPackResponse
      <$> readProp "thread_post" json
      <*> readProp "thread_post_id" json
      <*> readProp "user" json
      <*> readProp "user_id" json
      <*> readProp "stat" json
      <*> (unNullOrUndefined <$> readProp "like" json)
      <*> (unNullOrUndefined <$> readProp "star" json)
      <*> (unNullOrUndefined <$> readProp "with_organization" json)
      <*> (unNullOrUndefined <$> readProp "with_forum" json)
      <*> (unNullOrUndefined <$> readProp "with_board" json)
      <*> (unNullOrUndefined <$> readProp "with_thread" json)
      <*> readProp "permissions" json


newtype ThreadPostPackResponses = ThreadPostPackResponses {
  threadPostPackResponses :: (Array ThreadPostPackResponse)
}


type ThreadPostPackResponsesR = {
  threadPostPackResponses :: (Array ThreadPostPackResponse)
}


mkThreadPostPackResponses :: (Array ThreadPostPackResponse) -> ThreadPostPackResponses
mkThreadPostPackResponses threadPostPackResponses =
  ThreadPostPackResponses{threadPostPackResponses}


unwrapThreadPostPackResponses :: ThreadPostPackResponses -> {
  threadPostPackResponses :: (Array ThreadPostPackResponse)
}
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


mkResourcePackResponse :: ResourceResponse -> Int -> UserSanitizedResponse -> Int -> ResourceStatResponse -> (Maybe LikeResponse) -> (Maybe StarResponse) -> Permissions -> ResourcePackResponse
mkResourcePackResponse resource resourceId user userId stat like star permissions =
  ResourcePackResponse{resource, resourceId, user, userId, stat, like, star, permissions}


unwrapResourcePackResponse :: ResourcePackResponse -> {
  resource :: ResourceResponse,
  resourceId :: Int,
  user :: UserSanitizedResponse,
  userId :: Int,
  stat :: ResourceStatResponse,
  like :: (Maybe LikeResponse),
  star :: (Maybe StarResponse),
  permissions :: Permissions
}
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
      <*> (unNullOrUndefined <$> readProp "like" json)
      <*> (unNullOrUndefined <$> readProp "star" json)
      <*> readProp "permissions" json


instance resourcePackResponseIsForeign :: IsForeign ResourcePackResponse where
  read json =
      mkResourcePackResponse
      <$> readProp "resource" json
      <*> readProp "resource_id" json
      <*> readProp "user" json
      <*> readProp "user_id" json
      <*> readProp "stat" json
      <*> (unNullOrUndefined <$> readProp "like" json)
      <*> (unNullOrUndefined <$> readProp "star" json)
      <*> readProp "permissions" json


newtype ResourcePackResponses = ResourcePackResponses {
  resourcePackResponses :: (Array ResourcePackResponse)
}


type ResourcePackResponsesR = {
  resourcePackResponses :: (Array ResourcePackResponse)
}


mkResourcePackResponses :: (Array ResourcePackResponse) -> ResourcePackResponses
mkResourcePackResponses resourcePackResponses =
  ResourcePackResponses{resourcePackResponses}


unwrapResourcePackResponses :: ResourcePackResponses -> {
  resourcePackResponses :: (Array ResourcePackResponse)
}
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


mkLeuronPackResponse :: LeuronResponse -> Int -> UserSanitizedResponse -> Int -> LeuronTrainingResponse -> LeuronStatResponse -> (Maybe LikeResponse) -> (Maybe StarResponse) -> Permissions -> LeuronPackResponse
mkLeuronPackResponse leuron leuronId user userId training stat like star permissions =
  LeuronPackResponse{leuron, leuronId, user, userId, training, stat, like, star, permissions}


unwrapLeuronPackResponse :: LeuronPackResponse -> {
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
      <*> (unNullOrUndefined <$> readProp "like" json)
      <*> (unNullOrUndefined <$> readProp "star" json)
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
      <*> (unNullOrUndefined <$> readProp "like" json)
      <*> (unNullOrUndefined <$> readProp "star" json)
      <*> readProp "permissions" json


newtype LeuronPackResponses = LeuronPackResponses {
  leuronPackResponses :: (Array LeuronPackResponse)
}


type LeuronPackResponsesR = {
  leuronPackResponses :: (Array LeuronPackResponse)
}


mkLeuronPackResponses :: (Array LeuronPackResponse) -> LeuronPackResponses
mkLeuronPackResponses leuronPackResponses =
  LeuronPackResponses{leuronPackResponses}


unwrapLeuronPackResponses :: LeuronPackResponses -> {
  leuronPackResponses :: (Array LeuronPackResponse)
}
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


newtype PmInPackResponse = PmInPackResponse {
  pmIn :: PmInResponse,
  pmInId :: Int,
  user :: UserSanitizedResponse,
  userId :: Int
}


type PmInPackResponseR = {
  pmIn :: PmInResponse,
  pmInId :: Int,
  user :: UserSanitizedResponse,
  userId :: Int
}


mkPmInPackResponse :: PmInResponse -> Int -> UserSanitizedResponse -> Int -> PmInPackResponse
mkPmInPackResponse pmIn pmInId user userId =
  PmInPackResponse{pmIn, pmInId, user, userId}


unwrapPmInPackResponse :: PmInPackResponse -> {
  pmIn :: PmInResponse,
  pmInId :: Int,
  user :: UserSanitizedResponse,
  userId :: Int
}
unwrapPmInPackResponse (PmInPackResponse r) = r

instance pmInPackResponseEncodeJson :: EncodeJson PmInPackResponse where
  encodeJson (PmInPackResponse o) =
       "tag" := "PmInPackResponse"
    ~> "pm_in" := o.pmIn
    ~> "pm_in_id" := o.pmInId
    ~> "user" := o.user
    ~> "user_id" := o.userId
    ~> jsonEmptyObject


instance pmInPackResponseDecodeJson :: DecodeJson PmInPackResponse where
  decodeJson o = do
    obj <- decodeJson o
    pmIn <- obj .? "pm_in"
    pmInId <- obj .? "pm_in_id"
    user <- obj .? "user"
    userId <- obj .? "user_id"
    pure $ PmInPackResponse {
      pmIn,
      pmInId,
      user,
      userId
    }


instance pmInPackResponseRequestable :: Requestable PmInPackResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance pmInPackResponseRespondable :: Respondable PmInPackResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkPmInPackResponse
      <$> readProp "pm_in" json
      <*> readProp "pm_in_id" json
      <*> readProp "user" json
      <*> readProp "user_id" json


instance pmInPackResponseIsForeign :: IsForeign PmInPackResponse where
  read json =
      mkPmInPackResponse
      <$> readProp "pm_in" json
      <*> readProp "pm_in_id" json
      <*> readProp "user" json
      <*> readProp "user_id" json


newtype PmInPackResponses = PmInPackResponses {
  pmInPackResponses :: (Array PmInPackResponse)
}


type PmInPackResponsesR = {
  pmInPackResponses :: (Array PmInPackResponse)
}


mkPmInPackResponses :: (Array PmInPackResponse) -> PmInPackResponses
mkPmInPackResponses pmInPackResponses =
  PmInPackResponses{pmInPackResponses}


unwrapPmInPackResponses :: PmInPackResponses -> {
  pmInPackResponses :: (Array PmInPackResponse)
}
unwrapPmInPackResponses (PmInPackResponses r) = r

instance pmInPackResponsesEncodeJson :: EncodeJson PmInPackResponses where
  encodeJson (PmInPackResponses o) =
       "tag" := "PmInPackResponses"
    ~> "pm_in_pack_responses" := o.pmInPackResponses
    ~> jsonEmptyObject


instance pmInPackResponsesDecodeJson :: DecodeJson PmInPackResponses where
  decodeJson o = do
    obj <- decodeJson o
    pmInPackResponses <- obj .? "pm_in_pack_responses"
    pure $ PmInPackResponses {
      pmInPackResponses
    }


instance pmInPackResponsesRequestable :: Requestable PmInPackResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance pmInPackResponsesRespondable :: Respondable PmInPackResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkPmInPackResponses
      <$> readProp "pm_in_pack_responses" json


instance pmInPackResponsesIsForeign :: IsForeign PmInPackResponses where
  read json =
      mkPmInPackResponses
      <$> readProp "pm_in_pack_responses" json


newtype PmOutPackResponse = PmOutPackResponse {
  pmOut :: PmOutResponse,
  pmOutId :: Int,
  user :: UserSanitizedResponse,
  userId :: Int
}


type PmOutPackResponseR = {
  pmOut :: PmOutResponse,
  pmOutId :: Int,
  user :: UserSanitizedResponse,
  userId :: Int
}


mkPmOutPackResponse :: PmOutResponse -> Int -> UserSanitizedResponse -> Int -> PmOutPackResponse
mkPmOutPackResponse pmOut pmOutId user userId =
  PmOutPackResponse{pmOut, pmOutId, user, userId}


unwrapPmOutPackResponse :: PmOutPackResponse -> {
  pmOut :: PmOutResponse,
  pmOutId :: Int,
  user :: UserSanitizedResponse,
  userId :: Int
}
unwrapPmOutPackResponse (PmOutPackResponse r) = r

instance pmOutPackResponseEncodeJson :: EncodeJson PmOutPackResponse where
  encodeJson (PmOutPackResponse o) =
       "tag" := "PmOutPackResponse"
    ~> "pm_out" := o.pmOut
    ~> "pm_out_id" := o.pmOutId
    ~> "user" := o.user
    ~> "user_id" := o.userId
    ~> jsonEmptyObject


instance pmOutPackResponseDecodeJson :: DecodeJson PmOutPackResponse where
  decodeJson o = do
    obj <- decodeJson o
    pmOut <- obj .? "pm_out"
    pmOutId <- obj .? "pm_out_id"
    user <- obj .? "user"
    userId <- obj .? "user_id"
    pure $ PmOutPackResponse {
      pmOut,
      pmOutId,
      user,
      userId
    }


instance pmOutPackResponseRequestable :: Requestable PmOutPackResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance pmOutPackResponseRespondable :: Respondable PmOutPackResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkPmOutPackResponse
      <$> readProp "pm_out" json
      <*> readProp "pm_out_id" json
      <*> readProp "user" json
      <*> readProp "user_id" json


instance pmOutPackResponseIsForeign :: IsForeign PmOutPackResponse where
  read json =
      mkPmOutPackResponse
      <$> readProp "pm_out" json
      <*> readProp "pm_out_id" json
      <*> readProp "user" json
      <*> readProp "user_id" json


newtype PmOutPackResponses = PmOutPackResponses {
  pmOutPackResponses :: (Array PmOutPackResponse)
}


type PmOutPackResponsesR = {
  pmOutPackResponses :: (Array PmOutPackResponse)
}


mkPmOutPackResponses :: (Array PmOutPackResponse) -> PmOutPackResponses
mkPmOutPackResponses pmOutPackResponses =
  PmOutPackResponses{pmOutPackResponses}


unwrapPmOutPackResponses :: PmOutPackResponses -> {
  pmOutPackResponses :: (Array PmOutPackResponse)
}
unwrapPmOutPackResponses (PmOutPackResponses r) = r

instance pmOutPackResponsesEncodeJson :: EncodeJson PmOutPackResponses where
  encodeJson (PmOutPackResponses o) =
       "tag" := "PmOutPackResponses"
    ~> "pm_out_pack_responses" := o.pmOutPackResponses
    ~> jsonEmptyObject


instance pmOutPackResponsesDecodeJson :: DecodeJson PmOutPackResponses where
  decodeJson o = do
    obj <- decodeJson o
    pmOutPackResponses <- obj .? "pm_out_pack_responses"
    pure $ PmOutPackResponses {
      pmOutPackResponses
    }


instance pmOutPackResponsesRequestable :: Requestable PmOutPackResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance pmOutPackResponsesRespondable :: Respondable PmOutPackResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkPmOutPackResponses
      <$> readProp "pm_out_pack_responses" json


instance pmOutPackResponsesIsForeign :: IsForeign PmOutPackResponses where
  read json =
      mkPmOutPackResponses
      <$> readProp "pm_out_pack_responses" json


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


debug_ :: forall b a r. Lens { debug :: a | r } { debug :: b | r } a b
debug_ f o = o { debug = _ } <$> f o.debug


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


fullName_ :: forall b a r. Lens { fullName :: a | r } { fullName :: b | r } a b
fullName_ f o = o { fullName = _ } <$> f o.fullName


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


motwLimit_ :: forall b a r. Lens { motwLimit :: a | r } { motwLimit :: b | r } a b
motwLimit_ f o = o { motwLimit = _ } <$> f o.motwLimit


msg_ :: forall b a r. Lens { msg :: a | r } { msg :: b | r } a b
msg_ f o = o { msg = _ } <$> f o.msg


n_ :: forall b a r. Lens { n :: a | r } { n :: b | r } a b
n_ f o = o { n = _ } <$> f o.n


name_ :: forall b a r. Lens { name :: a | r } { name :: b | r } a b
name_ f o = o { name = _ } <$> f o.name


neutral_ :: forall b a r. Lens { neutral :: a | r } { neutral :: b | r } a b
neutral_ f o = o { neutral = _ } <$> f o.neutral


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


pmIn_ :: forall b a r. Lens { pmIn :: a | r } { pmIn :: b | r } a b
pmIn_ f o = o { pmIn = _ } <$> f o.pmIn


pmInId_ :: forall b a r. Lens { pmInId :: a | r } { pmInId :: b | r } a b
pmInId_ f o = o { pmInId = _ } <$> f o.pmInId


pmInPackResponses_ :: forall b a r. Lens { pmInPackResponses :: a | r } { pmInPackResponses :: b | r } a b
pmInPackResponses_ f o = o { pmInPackResponses = _ } <$> f o.pmInPackResponses


pmInResponses_ :: forall b a r. Lens { pmInResponses :: a | r } { pmInResponses :: b | r } a b
pmInResponses_ f o = o { pmInResponses = _ } <$> f o.pmInResponses


pmOut_ :: forall b a r. Lens { pmOut :: a | r } { pmOut :: b | r } a b
pmOut_ f o = o { pmOut = _ } <$> f o.pmOut


pmOutId_ :: forall b a r. Lens { pmOutId :: a | r } { pmOutId :: b | r } a b
pmOutId_ f o = o { pmOutId = _ } <$> f o.pmOutId


pmOutPackResponses_ :: forall b a r. Lens { pmOutPackResponses :: a | r } { pmOutPackResponses :: b | r } a b
pmOutPackResponses_ f o = o { pmOutPackResponses = _ } <$> f o.pmOutPackResponses


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


recentPostsLimit_ :: forall b a r. Lens { recentPostsLimit :: a | r } { recentPostsLimit :: b | r } a b
recentPostsLimit_ f o = o { recentPostsLimit = _ } <$> f o.recentPostsLimit


recentThreadsLimit_ :: forall b a r. Lens { recentThreadsLimit :: a | r } { recentThreadsLimit :: b | r } a b
recentThreadsLimit_ f o = o { recentThreadsLimit = _ } <$> f o.recentThreadsLimit


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
