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

newtype ApiRequest = ApiRequest {
  comment :: (Maybe String)
}


_ApiRequest :: LensP ApiRequest {
  comment :: (Maybe String)
}
_ApiRequest f (ApiRequest o) = ApiRequest <$> f o


mkApiRequest :: (Maybe String) -> ApiRequest
mkApiRequest comment =
  ApiRequest{comment}


unwrapApiRequest (ApiRequest r) = r

instance apiRequestEncodeJson :: EncodeJson ApiRequest where
  encodeJson (ApiRequest o) =
       "tag" := "ApiRequest"
    ~> "comment" := o.comment
    ~> jsonEmptyObject


instance apiRequestDecodeJson :: DecodeJson ApiRequest where
  decodeJson o = do
    obj <- decodeJson o
    comment <- obj .? "comment"
    pure $ ApiRequest {
      comment
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


instance apiRequestIsForeign :: IsForeign ApiRequest where
  read json =
      mkApiRequest
      <$> (runNullOrUndefined <$> readProp "comment" json)


instance apiRequestShow :: Show ApiRequest where
    show (ApiRequest o) = show "comment: " ++ show o.comment

newtype ApiResponse = ApiResponse {
  id :: Int,
  userId :: Int,
  key :: String,
  comment :: (Maybe String),
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}


_ApiResponse :: LensP ApiResponse {
  id :: Int,
  userId :: Int,
  key :: String,
  comment :: (Maybe String),
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}
_ApiResponse f (ApiResponse o) = ApiResponse <$> f o


mkApiResponse :: Int -> Int -> String -> (Maybe String) -> (Maybe Date) -> (Maybe Date) -> ApiResponse
mkApiResponse id userId key comment createdAt modifiedAt =
  ApiResponse{id, userId, key, comment, createdAt, modifiedAt}


unwrapApiResponse (ApiResponse r) = r

instance apiResponseEncodeJson :: EncodeJson ApiResponse where
  encodeJson (ApiResponse o) =
       "tag" := "ApiResponse"
    ~> "id" := o.id
    ~> "user_id" := o.userId
    ~> "key" := o.key
    ~> "comment" := o.comment
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
    createdAt <- obj .? "created_at"
    modifiedAt <- obj .? "modified_at"
    pure $ ApiResponse {
      id,
      userId,
      key,
      comment,
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
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance apiResponseIsForeign :: IsForeign ApiResponse where
  read json =
      mkApiResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "key" json
      <*> (runNullOrUndefined <$> readProp "comment" json)
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance apiResponseShow :: Show ApiResponse where
    show (ApiResponse o) = show "id: " ++ show o.id ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "key: " ++ show o.key ++ ", " ++ show "comment: " ++ show o.comment ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt

newtype ApiResponses = ApiResponses {
  apiResponses :: (Array  ApiResponse)
}


_ApiResponses :: LensP ApiResponses {
  apiResponses :: (Array  ApiResponse)
}
_ApiResponses f (ApiResponses o) = ApiResponses <$> f o


mkApiResponses :: (Array  ApiResponse) -> ApiResponses
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
  name :: String,
  description :: (Maybe String)
}


_BoardRequest :: LensP BoardRequest {
  name :: String,
  description :: (Maybe String)
}
_BoardRequest f (BoardRequest o) = BoardRequest <$> f o


mkBoardRequest :: String -> (Maybe String) -> BoardRequest
mkBoardRequest name description =
  BoardRequest{name, description}


unwrapBoardRequest (BoardRequest r) = r

instance boardRequestEncodeJson :: EncodeJson BoardRequest where
  encodeJson (BoardRequest o) =
       "tag" := "BoardRequest"
    ~> "name" := o.name
    ~> "description" := o.description
    ~> jsonEmptyObject


instance boardRequestDecodeJson :: DecodeJson BoardRequest where
  decodeJson o = do
    obj <- decodeJson o
    name <- obj .? "name"
    description <- obj .? "description"
    pure $ BoardRequest {
      name,
      description
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
      <$> readProp "name" json
      <*> (runNullOrUndefined <$> readProp "description" json)


instance boardRequestIsForeign :: IsForeign BoardRequest where
  read json =
      mkBoardRequest
      <$> readProp "name" json
      <*> (runNullOrUndefined <$> readProp "description" json)


instance boardRequestShow :: Show BoardRequest where
    show (BoardRequest o) = show "name: " ++ show o.name ++ ", " ++ show "description: " ++ show o.description

newtype BoardResponse = BoardResponse {
  id :: Int,
  userId :: Int,
  forumId :: Int,
  parentId :: (Maybe Int),
  name :: String,
  description :: (Maybe String),
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date)
}


_BoardResponse :: LensP BoardResponse {
  id :: Int,
  userId :: Int,
  forumId :: Int,
  parentId :: (Maybe Int),
  name :: String,
  description :: (Maybe String),
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date)
}
_BoardResponse f (BoardResponse o) = BoardResponse <$> f o


mkBoardResponse :: Int -> Int -> Int -> (Maybe Int) -> String -> (Maybe String) -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> BoardResponse
mkBoardResponse id userId forumId parentId name description createdAt modifiedBy modifiedAt =
  BoardResponse{id, userId, forumId, parentId, name, description, createdAt, modifiedBy, modifiedAt}


unwrapBoardResponse (BoardResponse r) = r

instance boardResponseEncodeJson :: EncodeJson BoardResponse where
  encodeJson (BoardResponse o) =
       "tag" := "BoardResponse"
    ~> "id" := o.id
    ~> "user_id" := o.userId
    ~> "forum_id" := o.forumId
    ~> "parent_id" := o.parentId
    ~> "name" := o.name
    ~> "description" := o.description
    ~> "created_at" := o.createdAt
    ~> "modified_by" := o.modifiedBy
    ~> "modified_at" := o.modifiedAt
    ~> jsonEmptyObject


instance boardResponseDecodeJson :: DecodeJson BoardResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    userId <- obj .? "user_id"
    forumId <- obj .? "forum_id"
    parentId <- obj .? "parent_id"
    name <- obj .? "name"
    description <- obj .? "description"
    createdAt <- obj .? "created_at"
    modifiedBy <- obj .? "modified_by"
    modifiedAt <- obj .? "modified_at"
    pure $ BoardResponse {
      id,
      userId,
      forumId,
      parentId,
      name,
      description,
      createdAt,
      modifiedBy,
      modifiedAt
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
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance boardResponseIsForeign :: IsForeign BoardResponse where
  read json =
      mkBoardResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "forum_id" json
      <*> (runNullOrUndefined <$> readProp "parent_id" json)
      <*> readProp "name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance boardResponseShow :: Show BoardResponse where
    show (BoardResponse o) = show "id: " ++ show o.id ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "forumId: " ++ show o.forumId ++ ", " ++ show "parentId: " ++ show o.parentId ++ ", " ++ show "name: " ++ show o.name ++ ", " ++ show "description: " ++ show o.description ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedBy: " ++ show o.modifiedBy ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt

newtype BoardResponses = BoardResponses {
  boardResponses :: (Array  BoardResponse)
}


_BoardResponses :: LensP BoardResponses {
  boardResponses :: (Array  BoardResponse)
}
_BoardResponses f (BoardResponses o) = BoardResponses <$> f o


mkBoardResponses :: (Array  BoardResponse) -> BoardResponses
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
  boardStatResponses :: (Array  BoardStatResponse)
}


_BoardStatResponses :: LensP BoardStatResponses {
  boardStatResponses :: (Array  BoardStatResponse)
}
_BoardStatResponses f (BoardStatResponses o) = BoardStatResponses <$> f o


mkBoardStatResponses :: (Array  BoardStatResponse) -> BoardStatResponses
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
  name :: String,
  description :: (Maybe String),
  scoreLo :: Int,
  scoreHi :: Int,
  leurons :: (Array  Int),
  resources :: (Array  Int),
  categories :: (Array  String),
  filters :: (Array  Int)
}


_BucketRequest :: LensP BucketRequest {
  name :: String,
  description :: (Maybe String),
  scoreLo :: Int,
  scoreHi :: Int,
  leurons :: (Array  Int),
  resources :: (Array  Int),
  categories :: (Array  String),
  filters :: (Array  Int)
}
_BucketRequest f (BucketRequest o) = BucketRequest <$> f o


mkBucketRequest :: String -> (Maybe String) -> Int -> Int -> (Array  Int) -> (Array  Int) -> (Array  String) -> (Array  Int) -> BucketRequest
mkBucketRequest name description scoreLo scoreHi leurons resources categories filters =
  BucketRequest{name, description, scoreLo, scoreHi, leurons, resources, categories, filters}


unwrapBucketRequest (BucketRequest r) = r

instance bucketRequestEncodeJson :: EncodeJson BucketRequest where
  encodeJson (BucketRequest o) =
       "tag" := "BucketRequest"
    ~> "name" := o.name
    ~> "description" := o.description
    ~> "score_lo" := o.scoreLo
    ~> "score_hi" := o.scoreHi
    ~> "leurons" := o.leurons
    ~> "resources" := o.resources
    ~> "categories" := o.categories
    ~> "filters" := o.filters
    ~> jsonEmptyObject


instance bucketRequestDecodeJson :: DecodeJson BucketRequest where
  decodeJson o = do
    obj <- decodeJson o
    name <- obj .? "name"
    description <- obj .? "description"
    scoreLo <- obj .? "score_lo"
    scoreHi <- obj .? "score_hi"
    leurons <- obj .? "leurons"
    resources <- obj .? "resources"
    categories <- obj .? "categories"
    filters <- obj .? "filters"
    pure $ BucketRequest {
      name,
      description,
      scoreLo,
      scoreHi,
      leurons,
      resources,
      categories,
      filters
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
      <$> readProp "name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "score_lo" json
      <*> readProp "score_hi" json
      <*> readProp "leurons" json
      <*> readProp "resources" json
      <*> readProp "categories" json
      <*> readProp "filters" json


instance bucketRequestIsForeign :: IsForeign BucketRequest where
  read json =
      mkBucketRequest
      <$> readProp "name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "score_lo" json
      <*> readProp "score_hi" json
      <*> readProp "leurons" json
      <*> readProp "resources" json
      <*> readProp "categories" json
      <*> readProp "filters" json


instance bucketRequestShow :: Show BucketRequest where
    show (BucketRequest o) = show "name: " ++ show o.name ++ ", " ++ show "description: " ++ show o.description ++ ", " ++ show "scoreLo: " ++ show o.scoreLo ++ ", " ++ show "scoreHi: " ++ show o.scoreHi ++ ", " ++ show "leurons: " ++ show o.leurons ++ ", " ++ show "resources: " ++ show o.resources ++ ", " ++ show "categories: " ++ show o.categories ++ ", " ++ show "filters: " ++ show o.filters

newtype BucketResponse = BucketResponse {
  id :: Int,
  userId :: Int,
  name :: String,
  description :: (Maybe String),
  scoreLo :: Int,
  scoreHi :: Int,
  leurons :: (Array  Int),
  resources :: (Array  Int),
  categories :: (Array  String),
  filters :: (Array  Int),
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}


_BucketResponse :: LensP BucketResponse {
  id :: Int,
  userId :: Int,
  name :: String,
  description :: (Maybe String),
  scoreLo :: Int,
  scoreHi :: Int,
  leurons :: (Array  Int),
  resources :: (Array  Int),
  categories :: (Array  String),
  filters :: (Array  Int),
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}
_BucketResponse f (BucketResponse o) = BucketResponse <$> f o


mkBucketResponse :: Int -> Int -> String -> (Maybe String) -> Int -> Int -> (Array  Int) -> (Array  Int) -> (Array  String) -> (Array  Int) -> (Maybe Date) -> (Maybe Date) -> BucketResponse
mkBucketResponse id userId name description scoreLo scoreHi leurons resources categories filters createdAt modifiedAt =
  BucketResponse{id, userId, name, description, scoreLo, scoreHi, leurons, resources, categories, filters, createdAt, modifiedAt}


unwrapBucketResponse (BucketResponse r) = r

instance bucketResponseEncodeJson :: EncodeJson BucketResponse where
  encodeJson (BucketResponse o) =
       "tag" := "BucketResponse"
    ~> "id" := o.id
    ~> "user_id" := o.userId
    ~> "name" := o.name
    ~> "description" := o.description
    ~> "score_lo" := o.scoreLo
    ~> "score_hi" := o.scoreHi
    ~> "leurons" := o.leurons
    ~> "resources" := o.resources
    ~> "categories" := o.categories
    ~> "filters" := o.filters
    ~> "created_at" := o.createdAt
    ~> "modified_at" := o.modifiedAt
    ~> jsonEmptyObject


instance bucketResponseDecodeJson :: DecodeJson BucketResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    userId <- obj .? "user_id"
    name <- obj .? "name"
    description <- obj .? "description"
    scoreLo <- obj .? "score_lo"
    scoreHi <- obj .? "score_hi"
    leurons <- obj .? "leurons"
    resources <- obj .? "resources"
    categories <- obj .? "categories"
    filters <- obj .? "filters"
    createdAt <- obj .? "created_at"
    modifiedAt <- obj .? "modified_at"
    pure $ BucketResponse {
      id,
      userId,
      name,
      description,
      scoreLo,
      scoreHi,
      leurons,
      resources,
      categories,
      filters,
      createdAt,
      modifiedAt
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
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "score_lo" json
      <*> readProp "score_hi" json
      <*> readProp "leurons" json
      <*> readProp "resources" json
      <*> readProp "categories" json
      <*> readProp "filters" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance bucketResponseIsForeign :: IsForeign BucketResponse where
  read json =
      mkBucketResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "score_lo" json
      <*> readProp "score_hi" json
      <*> readProp "leurons" json
      <*> readProp "resources" json
      <*> readProp "categories" json
      <*> readProp "filters" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance bucketResponseShow :: Show BucketResponse where
    show (BucketResponse o) = show "id: " ++ show o.id ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "name: " ++ show o.name ++ ", " ++ show "description: " ++ show o.description ++ ", " ++ show "scoreLo: " ++ show o.scoreLo ++ ", " ++ show "scoreHi: " ++ show o.scoreHi ++ ", " ++ show "leurons: " ++ show o.leurons ++ ", " ++ show "resources: " ++ show o.resources ++ ", " ++ show "categories: " ++ show o.categories ++ ", " ++ show "filters: " ++ show o.filters ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt

newtype BucketResponses = BucketResponses {
  bucketResponses :: (Array  BucketResponse)
}


_BucketResponses :: LensP BucketResponses {
  bucketResponses :: (Array  BucketResponse)
}
_BucketResponses f (BucketResponses o) = BucketResponses <$> f o


mkBucketResponses :: (Array  BucketResponse) -> BucketResponses
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
  countResponses :: (Array  CountResponse)
}


_CountResponses :: LensP CountResponses {
  countResponses :: (Array  CountResponse)
}
_CountResponses f (CountResponses o) = CountResponses <$> f o


mkCountResponses :: (Array  CountResponse) -> CountResponses
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

type DepList a = (Array  (Array  a))


newtype EmptyRequest = EmptyRequest {
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
  emptyResponses :: (Array  EmptyResponse)
}


_EmptyResponses :: LensP EmptyResponses {
  emptyResponses :: (Array  EmptyResponse)
}
_EmptyResponses f (EmptyResponses o) = EmptyResponses <$> f o


mkEmptyResponses :: (Array  EmptyResponse) -> EmptyResponses
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

newtype ForumRequest = ForumRequest {
  name :: String,
  description :: (Maybe String)
}


_ForumRequest :: LensP ForumRequest {
  name :: String,
  description :: (Maybe String)
}
_ForumRequest f (ForumRequest o) = ForumRequest <$> f o


mkForumRequest :: String -> (Maybe String) -> ForumRequest
mkForumRequest name description =
  ForumRequest{name, description}


unwrapForumRequest (ForumRequest r) = r

instance forumRequestEncodeJson :: EncodeJson ForumRequest where
  encodeJson (ForumRequest o) =
       "tag" := "ForumRequest"
    ~> "name" := o.name
    ~> "description" := o.description
    ~> jsonEmptyObject


instance forumRequestDecodeJson :: DecodeJson ForumRequest where
  decodeJson o = do
    obj <- decodeJson o
    name <- obj .? "name"
    description <- obj .? "description"
    pure $ ForumRequest {
      name,
      description
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
      <$> readProp "name" json
      <*> (runNullOrUndefined <$> readProp "description" json)


instance forumRequestIsForeign :: IsForeign ForumRequest where
  read json =
      mkForumRequest
      <$> readProp "name" json
      <*> (runNullOrUndefined <$> readProp "description" json)


instance forumRequestShow :: Show ForumRequest where
    show (ForumRequest o) = show "name: " ++ show o.name ++ ", " ++ show "description: " ++ show o.description

newtype ForumResponse = ForumResponse {
  id :: Int,
  userId :: Int,
  orgId :: Int,
  name :: String,
  description :: (Maybe String),
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date)
}


_ForumResponse :: LensP ForumResponse {
  id :: Int,
  userId :: Int,
  orgId :: Int,
  name :: String,
  description :: (Maybe String),
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date)
}
_ForumResponse f (ForumResponse o) = ForumResponse <$> f o


mkForumResponse :: Int -> Int -> Int -> String -> (Maybe String) -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> ForumResponse
mkForumResponse id userId orgId name description createdAt modifiedBy modifiedAt =
  ForumResponse{id, userId, orgId, name, description, createdAt, modifiedBy, modifiedAt}


unwrapForumResponse (ForumResponse r) = r

instance forumResponseEncodeJson :: EncodeJson ForumResponse where
  encodeJson (ForumResponse o) =
       "tag" := "ForumResponse"
    ~> "id" := o.id
    ~> "user_id" := o.userId
    ~> "org_id" := o.orgId
    ~> "name" := o.name
    ~> "description" := o.description
    ~> "created_at" := o.createdAt
    ~> "modified_by" := o.modifiedBy
    ~> "modified_at" := o.modifiedAt
    ~> jsonEmptyObject


instance forumResponseDecodeJson :: DecodeJson ForumResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    userId <- obj .? "user_id"
    orgId <- obj .? "org_id"
    name <- obj .? "name"
    description <- obj .? "description"
    createdAt <- obj .? "created_at"
    modifiedBy <- obj .? "modified_by"
    modifiedAt <- obj .? "modified_at"
    pure $ ForumResponse {
      id,
      userId,
      orgId,
      name,
      description,
      createdAt,
      modifiedBy,
      modifiedAt
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
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance forumResponseIsForeign :: IsForeign ForumResponse where
  read json =
      mkForumResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "org_id" json
      <*> readProp "name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance forumResponseShow :: Show ForumResponse where
    show (ForumResponse o) = show "id: " ++ show o.id ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "orgId: " ++ show o.orgId ++ ", " ++ show "name: " ++ show o.name ++ ", " ++ show "description: " ++ show o.description ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedBy: " ++ show o.modifiedBy ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt

newtype ForumResponses = ForumResponses {
  forumResponses :: (Array  ForumResponse)
}


_ForumResponses :: LensP ForumResponses {
  forumResponses :: (Array  ForumResponse)
}
_ForumResponses f (ForumResponses o) = ForumResponses <$> f o


mkForumResponses :: (Array  ForumResponse) -> ForumResponses
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
  forumStatResponses :: (Array  ForumStatResponse)
}


_ForumStatResponses :: LensP ForumStatResponses {
  forumStatResponses :: (Array  ForumStatResponse)
}
_ForumStatResponses f (ForumStatResponses o) = ForumStatResponses <$> f o


mkForumStatResponses :: (Array  ForumStatResponse) -> ForumStatResponses
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

newtype LeuronRequest = LeuronRequest {
  dataP :: LeuronData,
  title :: (Maybe String),
  description :: (Maybe String),
  section :: (Maybe String),
  page :: (Maybe String),
  examples :: (Maybe (Array  String)),
  strengths :: (Maybe (Array  String)),
  categories :: (DepList String),
  splits :: (Maybe (Array  Splits)),
  substitutions :: (Maybe (Array  Substitutions)),
  tags :: (Maybe (Array  String)),
  style :: (Maybe (Array  String))
}


_LeuronRequest :: LensP LeuronRequest {
  dataP :: LeuronData,
  title :: (Maybe String),
  description :: (Maybe String),
  section :: (Maybe String),
  page :: (Maybe String),
  examples :: (Maybe (Array  String)),
  strengths :: (Maybe (Array  String)),
  categories :: (DepList String),
  splits :: (Maybe (Array  Splits)),
  substitutions :: (Maybe (Array  Substitutions)),
  tags :: (Maybe (Array  String)),
  style :: (Maybe (Array  String))
}
_LeuronRequest f (LeuronRequest o) = LeuronRequest <$> f o


mkLeuronRequest :: LeuronData -> (Maybe String) -> (Maybe String) -> (Maybe String) -> (Maybe String) -> (Maybe (Array  String)) -> (Maybe (Array  String)) -> (DepList String) -> (Maybe (Array  Splits)) -> (Maybe (Array  Substitutions)) -> (Maybe (Array  String)) -> (Maybe (Array  String)) -> LeuronRequest
mkLeuronRequest dataP title description section page examples strengths categories splits substitutions tags style =
  LeuronRequest{dataP, title, description, section, page, examples, strengths, categories, splits, substitutions, tags, style}


unwrapLeuronRequest (LeuronRequest r) = r

instance leuronRequestEncodeJson :: EncodeJson LeuronRequest where
  encodeJson (LeuronRequest o) =
       "tag" := "LeuronRequest"
    ~> "data_p" := o.dataP
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
    ~> jsonEmptyObject


instance leuronRequestDecodeJson :: DecodeJson LeuronRequest where
  decodeJson o = do
    obj <- decodeJson o
    dataP <- obj .? "data_p"
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
      style
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
      <$> readProp "data_p" json
      <*> (runNullOrUndefined <$> readProp "title" json)
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> (runNullOrUndefined <$> readProp "section" json)
      <*> (runNullOrUndefined <$> readProp "page" json)
      <*> (runNullOrUndefined <$> readProp "examples" json)
      <*> (runNullOrUndefined <$> readProp "strengths" json)
      <*> readProp "categories" json
      <*> (runNullOrUndefined <$> readProp "splits" json)
      <*> (runNullOrUndefined <$> readProp "substitutions" json)
      <*> (runNullOrUndefined <$> readProp "tags" json)
      <*> (runNullOrUndefined <$> readProp "style" json)


instance leuronRequestIsForeign :: IsForeign LeuronRequest where
  read json =
      mkLeuronRequest
      <$> readProp "data_p" json
      <*> (runNullOrUndefined <$> readProp "title" json)
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> (runNullOrUndefined <$> readProp "section" json)
      <*> (runNullOrUndefined <$> readProp "page" json)
      <*> (runNullOrUndefined <$> readProp "examples" json)
      <*> (runNullOrUndefined <$> readProp "strengths" json)
      <*> readProp "categories" json
      <*> (runNullOrUndefined <$> readProp "splits" json)
      <*> (runNullOrUndefined <$> readProp "substitutions" json)
      <*> (runNullOrUndefined <$> readProp "tags" json)
      <*> (runNullOrUndefined <$> readProp "style" json)


instance leuronRequestShow :: Show LeuronRequest where
    show (LeuronRequest o) = show "dataP: " ++ show o.dataP ++ ", " ++ show "title: " ++ show o.title ++ ", " ++ show "description: " ++ show o.description ++ ", " ++ show "section: " ++ show o.section ++ ", " ++ show "page: " ++ show o.page ++ ", " ++ show "examples: " ++ show o.examples ++ ", " ++ show "strengths: " ++ show o.strengths ++ ", " ++ show "categories: " ++ show o.categories ++ ", " ++ show "splits: " ++ show o.splits ++ ", " ++ show "substitutions: " ++ show o.substitutions ++ ", " ++ show "tags: " ++ show o.tags ++ ", " ++ show "style: " ++ show o.style

newtype LeuronResponse = LeuronResponse {
  id :: Int,
  userId :: Int,
  resourceId :: Int,
  dataP :: LeuronData,
  title :: (Maybe String),
  description :: (Maybe String),
  section :: (Maybe String),
  page :: (Maybe String),
  examples :: (Maybe (Array  String)),
  strengths :: (Maybe (Array  String)),
  categories :: (DepList String),
  splits :: (Maybe (Array  Splits)),
  substitutions :: (Maybe (Array  Substitutions)),
  tags :: (Maybe (Array  String)),
  style :: (Maybe (Array  String)),
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
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
  examples :: (Maybe (Array  String)),
  strengths :: (Maybe (Array  String)),
  categories :: (DepList String),
  splits :: (Maybe (Array  Splits)),
  substitutions :: (Maybe (Array  Substitutions)),
  tags :: (Maybe (Array  String)),
  style :: (Maybe (Array  String)),
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}
_LeuronResponse f (LeuronResponse o) = LeuronResponse <$> f o


mkLeuronResponse :: Int -> Int -> Int -> LeuronData -> (Maybe String) -> (Maybe String) -> (Maybe String) -> (Maybe String) -> (Maybe (Array  String)) -> (Maybe (Array  String)) -> (DepList String) -> (Maybe (Array  Splits)) -> (Maybe (Array  Substitutions)) -> (Maybe (Array  String)) -> (Maybe (Array  String)) -> (Maybe Date) -> (Maybe Date) -> LeuronResponse
mkLeuronResponse id userId resourceId dataP title description section page examples strengths categories splits substitutions tags style createdAt modifiedAt =
  LeuronResponse{id, userId, resourceId, dataP, title, description, section, page, examples, strengths, categories, splits, substitutions, tags, style, createdAt, modifiedAt}


unwrapLeuronResponse (LeuronResponse r) = r

instance leuronResponseEncodeJson :: EncodeJson LeuronResponse where
  encodeJson (LeuronResponse o) =
       "tag" := "LeuronResponse"
    ~> "id" := o.id
    ~> "user_id" := o.userId
    ~> "resource_id" := o.resourceId
    ~> "data_p" := o.dataP
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
    ~> "created_at" := o.createdAt
    ~> "modified_at" := o.modifiedAt
    ~> jsonEmptyObject


instance leuronResponseDecodeJson :: DecodeJson LeuronResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    userId <- obj .? "user_id"
    resourceId <- obj .? "resource_id"
    dataP <- obj .? "data_p"
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
    createdAt <- obj .? "created_at"
    modifiedAt <- obj .? "modified_at"
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
      createdAt,
      modifiedAt
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
      <*> readProp "data_p" json
      <*> (runNullOrUndefined <$> readProp "title" json)
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> (runNullOrUndefined <$> readProp "section" json)
      <*> (runNullOrUndefined <$> readProp "page" json)
      <*> (runNullOrUndefined <$> readProp "examples" json)
      <*> (runNullOrUndefined <$> readProp "strengths" json)
      <*> readProp "categories" json
      <*> (runNullOrUndefined <$> readProp "splits" json)
      <*> (runNullOrUndefined <$> readProp "substitutions" json)
      <*> (runNullOrUndefined <$> readProp "tags" json)
      <*> (runNullOrUndefined <$> readProp "style" json)
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance leuronResponseIsForeign :: IsForeign LeuronResponse where
  read json =
      mkLeuronResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "resource_id" json
      <*> readProp "data_p" json
      <*> (runNullOrUndefined <$> readProp "title" json)
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> (runNullOrUndefined <$> readProp "section" json)
      <*> (runNullOrUndefined <$> readProp "page" json)
      <*> (runNullOrUndefined <$> readProp "examples" json)
      <*> (runNullOrUndefined <$> readProp "strengths" json)
      <*> readProp "categories" json
      <*> (runNullOrUndefined <$> readProp "splits" json)
      <*> (runNullOrUndefined <$> readProp "substitutions" json)
      <*> (runNullOrUndefined <$> readProp "tags" json)
      <*> (runNullOrUndefined <$> readProp "style" json)
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance leuronResponseShow :: Show LeuronResponse where
    show (LeuronResponse o) = show "id: " ++ show o.id ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "resourceId: " ++ show o.resourceId ++ ", " ++ show "dataP: " ++ show o.dataP ++ ", " ++ show "title: " ++ show o.title ++ ", " ++ show "description: " ++ show o.description ++ ", " ++ show "section: " ++ show o.section ++ ", " ++ show "page: " ++ show o.page ++ ", " ++ show "examples: " ++ show o.examples ++ ", " ++ show "strengths: " ++ show o.strengths ++ ", " ++ show "categories: " ++ show o.categories ++ ", " ++ show "splits: " ++ show o.splits ++ ", " ++ show "substitutions: " ++ show o.substitutions ++ ", " ++ show "tags: " ++ show o.tags ++ ", " ++ show "style: " ++ show o.style ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt

newtype LeuronResponses = LeuronResponses {
  leuronResponses :: (Array  LeuronResponse)
}


_LeuronResponses :: LensP LeuronResponses {
  leuronResponses :: (Array  LeuronResponse)
}
_LeuronResponses f (LeuronResponses o) = LeuronResponses <$> f o


mkLeuronResponses :: (Array  LeuronResponse) -> LeuronResponses
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


newtype Fact = Fact {
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
  list :: (Array  String)
}


_FactList :: LensP FactList {
  fact :: String,
  list :: (Array  String)
}
_FactList f (FactList o) = FactList <$> f o


mkFactList :: String -> (Array  String) -> FactList
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
  dcardFront :: String,
  dcardBack :: String
}


_DCard :: LensP DCard {
  dcardFront :: String,
  dcardBack :: String
}
_DCard f (DCard o) = DCard <$> f o


mkDCard :: String -> String -> DCard
mkDCard dcardFront dcardBack =
  DCard{dcardFront, dcardBack}


unwrapDCard (DCard r) = r

instance dCardEncodeJson :: EncodeJson DCard where
  encodeJson (DCard o) =
       "tag" := "DCard"
    ~> "dcard_front" := o.dcardFront
    ~> "dcard_back" := o.dcardBack
    ~> jsonEmptyObject


instance dCardDecodeJson :: DecodeJson DCard where
  decodeJson o = do
    obj <- decodeJson o
    dcardFront <- obj .? "dcard_front"
    dcardBack <- obj .? "dcard_back"
    pure $ DCard {
      dcardFront,
      dcardBack
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
      <$> readProp "dcard_front" json
      <*> readProp "dcard_back" json


instance dCardIsForeign :: IsForeign DCard where
  read json =
      mkDCard
      <$> readProp "dcard_front" json
      <*> readProp "dcard_back" json


instance dCardShow :: Show DCard where
    show (DCard o) = show "dcardFront: " ++ show o.dcardFront ++ ", " ++ show "dcardBack: " ++ show o.dcardBack

newtype DCardX = DCardX {
  dcardxFront :: (Array  String),
  dcardxBack :: (Array  String)
}


_DCardX :: LensP DCardX {
  dcardxFront :: (Array  String),
  dcardxBack :: (Array  String)
}
_DCardX f (DCardX o) = DCardX <$> f o


mkDCardX :: (Array  String) -> (Array  String) -> DCardX
mkDCardX dcardxFront dcardxBack =
  DCardX{dcardxFront, dcardxBack}


unwrapDCardX (DCardX r) = r

instance dCardXEncodeJson :: EncodeJson DCardX where
  encodeJson (DCardX o) =
       "tag" := "DCardX"
    ~> "dcardx_front" := o.dcardxFront
    ~> "dcardx_back" := o.dcardxBack
    ~> jsonEmptyObject


instance dCardXDecodeJson :: DecodeJson DCardX where
  decodeJson o = do
    obj <- decodeJson o
    dcardxFront <- obj .? "dcardx_front"
    dcardxBack <- obj .? "dcardx_back"
    pure $ DCardX {
      dcardxFront,
      dcardxBack
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
      <$> readProp "dcardx_front" json
      <*> readProp "dcardx_back" json


instance dCardXIsForeign :: IsForeign DCardX where
  read json =
      mkDCardX
      <$> readProp "dcardx_front" json
      <*> readProp "dcardx_back" json


instance dCardXShow :: Show DCardX where
    show (DCardX o) = show "dcardxFront: " ++ show o.dcardxFront ++ ", " ++ show "dcardxBack: " ++ show o.dcardxBack

newtype Acronym = Acronym {
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
  values :: (Array  TemplateValue)
}


_Template :: LensP Template {
  template :: String,
  values :: (Array  TemplateValue)
}
_Template f (Template o) = Template <$> f o


mkTemplate :: String -> (Array  TemplateValue) -> Template
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

type TemplateValue = ((Tuple  String) (Array  String))


newtype ImageAssociation = ImageAssociation {
  imageUrl :: (Array  String),
  assocBy :: (Array  String),
  assocResult :: (Array  String)
}


_ImageAssociation :: LensP ImageAssociation {
  imageUrl :: (Array  String),
  assocBy :: (Array  String),
  assocResult :: (Array  String)
}
_ImageAssociation f (ImageAssociation o) = ImageAssociation <$> f o


mkImageAssociation :: (Array  String) -> (Array  String) -> (Array  String) -> ImageAssociation
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

type LDContent = String


type LDHint = (Maybe String)


type LinearDemoNode = ((Tuple  LDContent) LDHint)


newtype LinearDemo = LinearDemo {
  label :: String,
  content :: (Array  LinearDemoNode)
}


_LinearDemo :: LensP LinearDemo {
  label :: String,
  content :: (Array  LinearDemoNode)
}
_LinearDemo f (LinearDemo o) = LinearDemo <$> f o


mkLinearDemo :: String -> (Array  LinearDemoNode) -> LinearDemo
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
  qaQuestion :: String,
  qaAnswer :: String
}


_QA :: LensP QA {
  qaQuestion :: String,
  qaAnswer :: String
}
_QA f (QA o) = QA <$> f o


mkQA :: String -> String -> QA
mkQA qaQuestion qaAnswer =
  QA{qaQuestion, qaAnswer}


unwrapQA (QA r) = r

instance qAEncodeJson :: EncodeJson QA where
  encodeJson (QA o) =
       "tag" := "QA"
    ~> "qa_question" := o.qaQuestion
    ~> "qa_answer" := o.qaAnswer
    ~> jsonEmptyObject


instance qADecodeJson :: DecodeJson QA where
  decodeJson o = do
    obj <- decodeJson o
    qaQuestion <- obj .? "qa_question"
    qaAnswer <- obj .? "qa_answer"
    pure $ QA {
      qaQuestion,
      qaAnswer
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
      <$> readProp "qa_question" json
      <*> readProp "qa_answer" json


instance qAIsForeign :: IsForeign QA where
  read json =
      mkQA
      <$> readProp "qa_question" json
      <*> readProp "qa_answer" json


instance qAShow :: Show QA where
    show (QA o) = show "qaQuestion: " ++ show o.qaQuestion ++ ", " ++ show "qaAnswer: " ++ show o.qaAnswer

newtype Table = Table {
  title :: String,
  columns :: (Array  String),
  rows :: (Array  (Array  (Maybe String)))
}


_Table :: LensP Table {
  title :: String,
  columns :: (Array  String),
  rows :: (Array  (Array  (Maybe String)))
}
_Table f (Table o) = Table <$> f o


mkTable :: String -> (Array  String) -> (Array  (Array  (Maybe String))) -> Table
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


newtype OrganizationRequest = OrganizationRequest {
  name :: String,
  description :: (Maybe String),
  company :: String,
  location :: String,
  email :: String
}


_OrganizationRequest :: LensP OrganizationRequest {
  name :: String,
  description :: (Maybe String),
  company :: String,
  location :: String,
  email :: String
}
_OrganizationRequest f (OrganizationRequest o) = OrganizationRequest <$> f o


mkOrganizationRequest :: String -> (Maybe String) -> String -> String -> String -> OrganizationRequest
mkOrganizationRequest name description company location email =
  OrganizationRequest{name, description, company, location, email}


unwrapOrganizationRequest (OrganizationRequest r) = r

instance organizationRequestEncodeJson :: EncodeJson OrganizationRequest where
  encodeJson (OrganizationRequest o) =
       "tag" := "OrganizationRequest"
    ~> "name" := o.name
    ~> "description" := o.description
    ~> "company" := o.company
    ~> "location" := o.location
    ~> "email" := o.email
    ~> jsonEmptyObject


instance organizationRequestDecodeJson :: DecodeJson OrganizationRequest where
  decodeJson o = do
    obj <- decodeJson o
    name <- obj .? "name"
    description <- obj .? "description"
    company <- obj .? "company"
    location <- obj .? "location"
    email <- obj .? "email"
    pure $ OrganizationRequest {
      name,
      description,
      company,
      location,
      email
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
      <$> readProp "name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "company" json
      <*> readProp "location" json
      <*> readProp "email" json


instance organizationRequestIsForeign :: IsForeign OrganizationRequest where
  read json =
      mkOrganizationRequest
      <$> readProp "name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "company" json
      <*> readProp "location" json
      <*> readProp "email" json


instance organizationRequestShow :: Show OrganizationRequest where
    show (OrganizationRequest o) = show "name: " ++ show o.name ++ ", " ++ show "description: " ++ show o.description ++ ", " ++ show "company: " ++ show o.company ++ ", " ++ show "location: " ++ show o.location ++ ", " ++ show "email: " ++ show o.email

newtype OrganizationResponse = OrganizationResponse {
  id :: Int,
  userId :: Int,
  name :: String,
  description :: (Maybe String),
  company :: String,
  location :: String,
  email :: String,
  emailMD5 :: String,
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date)
}


_OrganizationResponse :: LensP OrganizationResponse {
  id :: Int,
  userId :: Int,
  name :: String,
  description :: (Maybe String),
  company :: String,
  location :: String,
  email :: String,
  emailMD5 :: String,
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date)
}
_OrganizationResponse f (OrganizationResponse o) = OrganizationResponse <$> f o


mkOrganizationResponse :: Int -> Int -> String -> (Maybe String) -> String -> String -> String -> String -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> OrganizationResponse
mkOrganizationResponse id userId name description company location email emailMD5 createdAt modifiedBy modifiedAt =
  OrganizationResponse{id, userId, name, description, company, location, email, emailMD5, createdAt, modifiedBy, modifiedAt}


unwrapOrganizationResponse (OrganizationResponse r) = r

instance organizationResponseEncodeJson :: EncodeJson OrganizationResponse where
  encodeJson (OrganizationResponse o) =
       "tag" := "OrganizationResponse"
    ~> "id" := o.id
    ~> "user_id" := o.userId
    ~> "name" := o.name
    ~> "description" := o.description
    ~> "company" := o.company
    ~> "location" := o.location
    ~> "email" := o.email
    ~> "email_md5" := o.emailMD5
    ~> "created_at" := o.createdAt
    ~> "modified_by" := o.modifiedBy
    ~> "modified_at" := o.modifiedAt
    ~> jsonEmptyObject


instance organizationResponseDecodeJson :: DecodeJson OrganizationResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    userId <- obj .? "user_id"
    name <- obj .? "name"
    description <- obj .? "description"
    company <- obj .? "company"
    location <- obj .? "location"
    email <- obj .? "email"
    emailMD5 <- obj .? "email_md5"
    createdAt <- obj .? "created_at"
    modifiedBy <- obj .? "modified_by"
    modifiedAt <- obj .? "modified_at"
    pure $ OrganizationResponse {
      id,
      userId,
      name,
      description,
      company,
      location,
      email,
      emailMD5,
      createdAt,
      modifiedBy,
      modifiedAt
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
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "company" json
      <*> readProp "location" json
      <*> readProp "email" json
      <*> readProp "email_md5" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance organizationResponseIsForeign :: IsForeign OrganizationResponse where
  read json =
      mkOrganizationResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "company" json
      <*> readProp "location" json
      <*> readProp "email" json
      <*> readProp "email_md5" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance organizationResponseShow :: Show OrganizationResponse where
    show (OrganizationResponse o) = show "id: " ++ show o.id ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "name: " ++ show o.name ++ ", " ++ show "description: " ++ show o.description ++ ", " ++ show "company: " ++ show o.company ++ ", " ++ show "location: " ++ show o.location ++ ", " ++ show "email: " ++ show o.email ++ ", " ++ show "emailMD5: " ++ show o.emailMD5 ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedBy: " ++ show o.modifiedBy ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt

newtype OrganizationResponses = OrganizationResponses {
  organizationResponses :: (Array  OrganizationResponse)
}


_OrganizationResponses :: LensP OrganizationResponses {
  organizationResponses :: (Array  OrganizationResponse)
}
_OrganizationResponses f (OrganizationResponses o) = OrganizationResponses <$> f o


mkOrganizationResponses :: (Array  OrganizationResponse) -> OrganizationResponses
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
  organizationStatResponses :: (Array  OrganizationStatResponse)
}


_OrganizationStatResponses :: LensP OrganizationStatResponses {
  organizationStatResponses :: (Array  OrganizationStatResponse)
}
_OrganizationStatResponses f (OrganizationStatResponses o) = OrganizationStatResponses <$> f o


mkOrganizationStatResponses :: (Array  OrganizationStatResponse) -> OrganizationStatResponses
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
  | ByOrganizationsIds (Array  Int)
  | ByOrganizationName String
  | ByTeamId Int
  | ByTeamsIds (Array  Int)
  | ByTeamName String
  | ByUserId Int
  | ByUsersIds (Array  Int)
  | ByUserNick String
  | ByUsersNicks (Array  String)
  | ByForumId Int
  | ByForumsIds (Array  Int)
  | ByForumName String
  | ByBoardId Int
  | ByBoardsIds (Array  Int)
  | ByBoardName String
  | ByThreadId Int
  | ByThreadsIds (Array  Int)
  | ByThreadName String
  | ByThreadPostId Int
  | ByThreadPostsIds (Array  Int)
  | ByThreadPostName String
  | ByThreadPostLikeId Int
  | ByThreadPostLikesIds (Array  Int)
  | ByBucketId Int
  | ByResourceId Int
  | ByResourcesIds (Array  Int)
  | ByResourceName String
  | ByLeuronId Int
  | ByLeuronsIds (Array  Int)
  | ByPmId Int
  | ByPmsIds (Array  Int)
  | ByReminderId Int
  | ByReminderFolderId Int
  | ByParentId Int
  | ByParentsIds (Array  Int)
  | ByParentName String
  | Timestamp Date
  | UnixTimestamp Int
  | CreatedAtTimestamp Date
  | CreatedAtUnixTimestamp Int
  | RealIP String
  | IP String



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
  | ParamTag_ByUserId 
  | ParamTag_ByUsersIds 
  | ParamTag_ByUserNick 
  | ParamTag_ByUsersNicks 
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
  | ParamTag_Timestamp 
  | ParamTag_UnixTimestamp 
  | ParamTag_CreatedAtTimestamp 
  | ParamTag_CreatedAtUnixTimestamp 
  | ParamTag_RealIP 
  | ParamTag_IP 



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

        "ParamTag_ByUserId" -> do
          return ParamTag_ByUserId

        "ParamTag_ByUsersIds" -> do
          return ParamTag_ByUsersIds

        "ParamTag_ByUserNick" -> do
          return ParamTag_ByUserNick

        "ParamTag_ByUsersNicks" -> do
          return ParamTag_ByUsersNicks

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

        "ParamTag_ByUserId" -> do
          return ParamTag_ByUserId

        "ParamTag_ByUsersIds" -> do
          return ParamTag_ByUsersIds

        "ParamTag_ByUserNick" -> do
          return ParamTag_ByUserNick

        "ParamTag_ByUsersNicks" -> do
          return ParamTag_ByUsersNicks

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

        "ParamTag_ByUserId" -> do
          return ParamTag_ByUserId

        "ParamTag_ByUsersIds" -> do
          return ParamTag_ByUsersIds

        "ParamTag_ByUserNick" -> do
          return ParamTag_ByUserNick

        "ParamTag_ByUsersNicks" -> do
          return ParamTag_ByUsersNicks

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



newtype PmRequest = PmRequest {
  subject :: String,
  body :: String
}


_PmRequest :: LensP PmRequest {
  subject :: String,
  body :: String
}
_PmRequest f (PmRequest o) = PmRequest <$> f o


mkPmRequest :: String -> String -> PmRequest
mkPmRequest subject body =
  PmRequest{subject, body}


unwrapPmRequest (PmRequest r) = r

instance pmRequestEncodeJson :: EncodeJson PmRequest where
  encodeJson (PmRequest o) =
       "tag" := "PmRequest"
    ~> "subject" := o.subject
    ~> "body" := o.body
    ~> jsonEmptyObject


instance pmRequestDecodeJson :: DecodeJson PmRequest where
  decodeJson o = do
    obj <- decodeJson o
    subject <- obj .? "subject"
    body <- obj .? "body"
    pure $ PmRequest {
      subject,
      body
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


instance pmRequestIsForeign :: IsForeign PmRequest where
  read json =
      mkPmRequest
      <$> readProp "subject" json
      <*> readProp "body" json


instance pmRequestShow :: Show PmRequest where
    show (PmRequest o) = show "subject: " ++ show o.subject ++ ", " ++ show "body: " ++ show o.body

newtype PmResponse = PmResponse {
  id :: Int,
  userId :: Int,
  toUserId :: Int,
  subject :: String,
  body :: String,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}


_PmResponse :: LensP PmResponse {
  id :: Int,
  userId :: Int,
  toUserId :: Int,
  subject :: String,
  body :: String,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}
_PmResponse f (PmResponse o) = PmResponse <$> f o


mkPmResponse :: Int -> Int -> Int -> String -> String -> (Maybe Date) -> (Maybe Date) -> PmResponse
mkPmResponse id userId toUserId subject body createdAt modifiedAt =
  PmResponse{id, userId, toUserId, subject, body, createdAt, modifiedAt}


unwrapPmResponse (PmResponse r) = r

instance pmResponseEncodeJson :: EncodeJson PmResponse where
  encodeJson (PmResponse o) =
       "tag" := "PmResponse"
    ~> "id" := o.id
    ~> "user_id" := o.userId
    ~> "to_user_id" := o.toUserId
    ~> "subject" := o.subject
    ~> "body" := o.body
    ~> "created_at" := o.createdAt
    ~> "modified_at" := o.modifiedAt
    ~> jsonEmptyObject


instance pmResponseDecodeJson :: DecodeJson PmResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    userId <- obj .? "user_id"
    toUserId <- obj .? "to_user_id"
    subject <- obj .? "subject"
    body <- obj .? "body"
    createdAt <- obj .? "created_at"
    modifiedAt <- obj .? "modified_at"
    pure $ PmResponse {
      id,
      userId,
      toUserId,
      subject,
      body,
      createdAt,
      modifiedAt
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
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance pmResponseIsForeign :: IsForeign PmResponse where
  read json =
      mkPmResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "to_user_id" json
      <*> readProp "subject" json
      <*> readProp "body" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance pmResponseShow :: Show PmResponse where
    show (PmResponse o) = show "id: " ++ show o.id ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "toUserId: " ++ show o.toUserId ++ ", " ++ show "subject: " ++ show o.subject ++ ", " ++ show "body: " ++ show o.body ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt

newtype PmResponses = PmResponses {
  pmResponses :: (Array  PmResponse)
}


_PmResponses :: LensP PmResponses {
  pmResponses :: (Array  PmResponse)
}
_PmResponses f (PmResponses o) = PmResponses <$> f o


mkPmResponses :: (Array  PmResponse) -> PmResponses
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
  isStarred :: Boolean
}


_PmInRequest :: LensP PmInRequest {
  label :: (Maybe String),
  isRead :: Boolean,
  isStarred :: Boolean
}
_PmInRequest f (PmInRequest o) = PmInRequest <$> f o


mkPmInRequest :: (Maybe String) -> Boolean -> Boolean -> PmInRequest
mkPmInRequest label isRead isStarred =
  PmInRequest{label, isRead, isStarred}


unwrapPmInRequest (PmInRequest r) = r

instance pmInRequestEncodeJson :: EncodeJson PmInRequest where
  encodeJson (PmInRequest o) =
       "tag" := "PmInRequest"
    ~> "label" := o.label
    ~> "is_read" := o.isRead
    ~> "is_starred" := o.isStarred
    ~> jsonEmptyObject


instance pmInRequestDecodeJson :: DecodeJson PmInRequest where
  decodeJson o = do
    obj <- decodeJson o
    label <- obj .? "label"
    isRead <- obj .? "is_read"
    isStarred <- obj .? "is_starred"
    pure $ PmInRequest {
      label,
      isRead,
      isStarred
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


instance pmInRequestIsForeign :: IsForeign PmInRequest where
  read json =
      mkPmInRequest
      <$> (runNullOrUndefined <$> readProp "label" json)
      <*> readProp "is_read" json
      <*> readProp "is_starred" json


instance pmInRequestShow :: Show PmInRequest where
    show (PmInRequest o) = show "label: " ++ show o.label ++ ", " ++ show "isRead: " ++ show o.isRead ++ ", " ++ show "isStarred: " ++ show o.isStarred

newtype PmInResponse = PmInResponse {
  id :: Int,
  pmId :: Int,
  userId :: Int,
  label :: (Maybe String),
  isRead :: Boolean,
  isStarred :: Boolean,
  isNew :: Boolean,
  isSaved :: Boolean,
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
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}
_PmInResponse f (PmInResponse o) = PmInResponse <$> f o


mkPmInResponse :: Int -> Int -> Int -> (Maybe String) -> Boolean -> Boolean -> Boolean -> Boolean -> (Maybe Date) -> (Maybe Date) -> PmInResponse
mkPmInResponse id pmId userId label isRead isStarred isNew isSaved createdAt modifiedAt =
  PmInResponse{id, pmId, userId, label, isRead, isStarred, isNew, isSaved, createdAt, modifiedAt}


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
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance pmInResponseShow :: Show PmInResponse where
    show (PmInResponse o) = show "id: " ++ show o.id ++ ", " ++ show "pmId: " ++ show o.pmId ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "label: " ++ show o.label ++ ", " ++ show "isRead: " ++ show o.isRead ++ ", " ++ show "isStarred: " ++ show o.isStarred ++ ", " ++ show "isNew: " ++ show o.isNew ++ ", " ++ show "isSaved: " ++ show o.isSaved ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt

newtype PmInResponses = PmInResponses {
  pmInResponses :: (Array  PmInResponse)
}


_PmInResponses :: LensP PmInResponses {
  pmInResponses :: (Array  PmInResponse)
}
_PmInResponses f (PmInResponses o) = PmInResponses <$> f o


mkPmInResponses :: (Array  PmInResponse) -> PmInResponses
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
  label :: (Maybe String)
}


_PmOutRequest :: LensP PmOutRequest {
  label :: (Maybe String)
}
_PmOutRequest f (PmOutRequest o) = PmOutRequest <$> f o


mkPmOutRequest :: (Maybe String) -> PmOutRequest
mkPmOutRequest label =
  PmOutRequest{label}


unwrapPmOutRequest (PmOutRequest r) = r

instance pmOutRequestEncodeJson :: EncodeJson PmOutRequest where
  encodeJson (PmOutRequest o) =
       "tag" := "PmOutRequest"
    ~> "label" := o.label
    ~> jsonEmptyObject


instance pmOutRequestDecodeJson :: DecodeJson PmOutRequest where
  decodeJson o = do
    obj <- decodeJson o
    label <- obj .? "label"
    pure $ PmOutRequest {
      label
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


instance pmOutRequestIsForeign :: IsForeign PmOutRequest where
  read json =
      mkPmOutRequest
      <$> (runNullOrUndefined <$> readProp "label" json)


instance pmOutRequestShow :: Show PmOutRequest where
    show (PmOutRequest o) = show "label: " ++ show o.label

newtype PmOutResponse = PmOutResponse {
  id :: Int,
  pmId :: Int,
  userId :: Int,
  label :: (Maybe String),
  isSaved :: Boolean,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}


_PmOutResponse :: LensP PmOutResponse {
  id :: Int,
  pmId :: Int,
  userId :: Int,
  label :: (Maybe String),
  isSaved :: Boolean,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}
_PmOutResponse f (PmOutResponse o) = PmOutResponse <$> f o


mkPmOutResponse :: Int -> Int -> Int -> (Maybe String) -> Boolean -> (Maybe Date) -> (Maybe Date) -> PmOutResponse
mkPmOutResponse id pmId userId label isSaved createdAt modifiedAt =
  PmOutResponse{id, pmId, userId, label, isSaved, createdAt, modifiedAt}


unwrapPmOutResponse (PmOutResponse r) = r

instance pmOutResponseEncodeJson :: EncodeJson PmOutResponse where
  encodeJson (PmOutResponse o) =
       "tag" := "PmOutResponse"
    ~> "id" := o.id
    ~> "pm_id" := o.pmId
    ~> "user_id" := o.userId
    ~> "label" := o.label
    ~> "is_saved" := o.isSaved
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
    createdAt <- obj .? "created_at"
    modifiedAt <- obj .? "modified_at"
    pure $ PmOutResponse {
      id,
      pmId,
      userId,
      label,
      isSaved,
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
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance pmOutResponseShow :: Show PmOutResponse where
    show (PmOutResponse o) = show "id: " ++ show o.id ++ ", " ++ show "pmId: " ++ show o.pmId ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "label: " ++ show o.label ++ ", " ++ show "isSaved: " ++ show o.isSaved ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt

newtype PmOutResponses = PmOutResponses {
  pmOutResponses :: (Array  PmOutResponse)
}


_PmOutResponses :: LensP PmOutResponses {
  pmOutResponses :: (Array  PmOutResponse)
}
_PmOutResponses f (PmOutResponses o) = PmOutResponses <$> f o


mkPmOutResponses :: (Array  PmOutResponse) -> PmOutResponses
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
  profileName :: String,
  profileEmail :: String
}


_ProfileX :: LensP ProfileX {
  profileName :: String,
  profileEmail :: String
}
_ProfileX f (ProfileX o) = ProfileX <$> f o


mkProfileX :: String -> String -> ProfileX
mkProfileX profileName profileEmail =
  ProfileX{profileName, profileEmail}


unwrapProfileX (ProfileX r) = r

instance profileXEncodeJson :: EncodeJson ProfileX where
  encodeJson (ProfileX o) =
       "tag" := "ProfileX"
    ~> "profile_name" := o.profileName
    ~> "profile_email" := o.profileEmail
    ~> jsonEmptyObject


instance profileXDecodeJson :: DecodeJson ProfileX where
  decodeJson o = do
    obj <- decodeJson o
    profileName <- obj .? "profile_name"
    profileEmail <- obj .? "profile_email"
    pure $ ProfileX {
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
      <$> readProp "profile_name" json
      <*> readProp "profile_email" json


instance profileXIsForeign :: IsForeign ProfileX where
  read json =
      mkProfileX
      <$> readProp "profile_name" json
      <*> readProp "profile_email" json


instance profileXShow :: Show ProfileX where
    show (ProfileX o) = show "profileName: " ++ show o.profileName ++ ", " ++ show "profileEmail: " ++ show o.profileEmail

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
  signature :: (Maybe String)
}


_ProfileRequest :: LensP ProfileRequest {
  gender :: ProfileGender,
  birthdate :: Date,
  website :: (Maybe String),
  location :: (Maybe String),
  signature :: (Maybe String)
}
_ProfileRequest f (ProfileRequest o) = ProfileRequest <$> f o


mkProfileRequest :: ProfileGender -> Date -> (Maybe String) -> (Maybe String) -> (Maybe String) -> ProfileRequest
mkProfileRequest gender birthdate website location signature =
  ProfileRequest{gender, birthdate, website, location, signature}


unwrapProfileRequest (ProfileRequest r) = r

instance profileRequestEncodeJson :: EncodeJson ProfileRequest where
  encodeJson (ProfileRequest o) =
       "tag" := "ProfileRequest"
    ~> "gender" := o.gender
    ~> "birthdate" := o.birthdate
    ~> "website" := o.website
    ~> "location" := o.location
    ~> "signature" := o.signature
    ~> jsonEmptyObject


instance profileRequestDecodeJson :: DecodeJson ProfileRequest where
  decodeJson o = do
    obj <- decodeJson o
    gender <- obj .? "gender"
    birthdate <- obj .? "birthdate"
    website <- obj .? "website"
    location <- obj .? "location"
    signature <- obj .? "signature"
    pure $ ProfileRequest {
      gender,
      birthdate,
      website,
      location,
      signature
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


instance profileRequestIsForeign :: IsForeign ProfileRequest where
  read json =
      mkProfileRequest
      <$> readProp "gender" json
      <*> readProp "birthdate" json
      <*> (runNullOrUndefined <$> readProp "website" json)
      <*> (runNullOrUndefined <$> readProp "location" json)
      <*> (runNullOrUndefined <$> readProp "signature" json)


instance profileRequestShow :: Show ProfileRequest where
    show (ProfileRequest o) = show "gender: " ++ show o.gender ++ ", " ++ show "birthdate: " ++ show o.birthdate ++ ", " ++ show "website: " ++ show o.website ++ ", " ++ show "location: " ++ show o.location ++ ", " ++ show "signature: " ++ show o.signature

newtype ProfileResponse = ProfileResponse {
  id :: Int,
  entityId :: Int,
  gender :: ProfileGender,
  birthdate :: Date,
  website :: (Maybe String),
  location :: (Maybe String),
  signature :: (Maybe String),
  karmaGood :: Int,
  karmaBad :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}


_ProfileResponse :: LensP ProfileResponse {
  id :: Int,
  entityId :: Int,
  gender :: ProfileGender,
  birthdate :: Date,
  website :: (Maybe String),
  location :: (Maybe String),
  signature :: (Maybe String),
  karmaGood :: Int,
  karmaBad :: Int,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}
_ProfileResponse f (ProfileResponse o) = ProfileResponse <$> f o


mkProfileResponse :: Int -> Int -> ProfileGender -> Date -> (Maybe String) -> (Maybe String) -> (Maybe String) -> Int -> Int -> (Maybe Date) -> (Maybe Date) -> ProfileResponse
mkProfileResponse id entityId gender birthdate website location signature karmaGood karmaBad createdAt modifiedAt =
  ProfileResponse{id, entityId, gender, birthdate, website, location, signature, karmaGood, karmaBad, createdAt, modifiedAt}


unwrapProfileResponse (ProfileResponse r) = r

instance profileResponseEncodeJson :: EncodeJson ProfileResponse where
  encodeJson (ProfileResponse o) =
       "tag" := "ProfileResponse"
    ~> "id" := o.id
    ~> "entity_id" := o.entityId
    ~> "gender" := o.gender
    ~> "birthdate" := o.birthdate
    ~> "website" := o.website
    ~> "location" := o.location
    ~> "signature" := o.signature
    ~> "karma_good" := o.karmaGood
    ~> "karma_bad" := o.karmaBad
    ~> "created_at" := o.createdAt
    ~> "modified_at" := o.modifiedAt
    ~> jsonEmptyObject


instance profileResponseDecodeJson :: DecodeJson ProfileResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    entityId <- obj .? "entity_id"
    gender <- obj .? "gender"
    birthdate <- obj .? "birthdate"
    website <- obj .? "website"
    location <- obj .? "location"
    signature <- obj .? "signature"
    karmaGood <- obj .? "karma_good"
    karmaBad <- obj .? "karma_bad"
    createdAt <- obj .? "created_at"
    modifiedAt <- obj .? "modified_at"
    pure $ ProfileResponse {
      id,
      entityId,
      gender,
      birthdate,
      website,
      location,
      signature,
      karmaGood,
      karmaBad,
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
      <*> readProp "entity_id" json
      <*> readProp "gender" json
      <*> readProp "birthdate" json
      <*> (runNullOrUndefined <$> readProp "website" json)
      <*> (runNullOrUndefined <$> readProp "location" json)
      <*> (runNullOrUndefined <$> readProp "signature" json)
      <*> readProp "karma_good" json
      <*> readProp "karma_bad" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance profileResponseIsForeign :: IsForeign ProfileResponse where
  read json =
      mkProfileResponse
      <$> readProp "id" json
      <*> readProp "entity_id" json
      <*> readProp "gender" json
      <*> readProp "birthdate" json
      <*> (runNullOrUndefined <$> readProp "website" json)
      <*> (runNullOrUndefined <$> readProp "location" json)
      <*> (runNullOrUndefined <$> readProp "signature" json)
      <*> readProp "karma_good" json
      <*> readProp "karma_bad" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance profileResponseShow :: Show ProfileResponse where
    show (ProfileResponse o) = show "id: " ++ show o.id ++ ", " ++ show "entityId: " ++ show o.entityId ++ ", " ++ show "gender: " ++ show o.gender ++ ", " ++ show "birthdate: " ++ show o.birthdate ++ ", " ++ show "website: " ++ show o.website ++ ", " ++ show "location: " ++ show o.location ++ ", " ++ show "signature: " ++ show o.signature ++ ", " ++ show "karmaGood: " ++ show o.karmaGood ++ ", " ++ show "karmaBad: " ++ show o.karmaBad ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt

newtype ProfileResponses = ProfileResponses {
  profileResponses :: (Array  ProfileResponse)
}


_ProfileResponses :: LensP ProfileResponses {
  profileResponses :: (Array  ProfileResponse)
}
_ProfileResponses f (ProfileResponses o) = ProfileResponses <$> f o


mkProfileResponses :: (Array  ProfileResponse) -> ProfileResponses
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
  dataP :: String
}


_ReminderRequest :: LensP ReminderRequest {
  dataP :: String
}
_ReminderRequest f (ReminderRequest o) = ReminderRequest <$> f o


mkReminderRequest :: String -> ReminderRequest
mkReminderRequest dataP =
  ReminderRequest{dataP}


unwrapReminderRequest (ReminderRequest r) = r

instance reminderRequestEncodeJson :: EncodeJson ReminderRequest where
  encodeJson (ReminderRequest o) =
       "tag" := "ReminderRequest"
    ~> "data_p" := o.dataP
    ~> jsonEmptyObject


instance reminderRequestDecodeJson :: DecodeJson ReminderRequest where
  decodeJson o = do
    obj <- decodeJson o
    dataP <- obj .? "data_p"
    pure $ ReminderRequest {
      dataP
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
      <$> readProp "data_p" json


instance reminderRequestIsForeign :: IsForeign ReminderRequest where
  read json =
      mkReminderRequest
      <$> readProp "data_p" json


instance reminderRequestShow :: Show ReminderRequest where
    show (ReminderRequest o) = show "dataP: " ++ show o.dataP

newtype ReminderResponse = ReminderResponse {
  id :: Int,
  userId :: Int,
  parentFolderId :: Int,
  dataP :: String,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}


_ReminderResponse :: LensP ReminderResponse {
  id :: Int,
  userId :: Int,
  parentFolderId :: Int,
  dataP :: String,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}
_ReminderResponse f (ReminderResponse o) = ReminderResponse <$> f o


mkReminderResponse :: Int -> Int -> Int -> String -> (Maybe Date) -> (Maybe Date) -> ReminderResponse
mkReminderResponse id userId parentFolderId dataP createdAt modifiedAt =
  ReminderResponse{id, userId, parentFolderId, dataP, createdAt, modifiedAt}


unwrapReminderResponse (ReminderResponse r) = r

instance reminderResponseEncodeJson :: EncodeJson ReminderResponse where
  encodeJson (ReminderResponse o) =
       "tag" := "ReminderResponse"
    ~> "id" := o.id
    ~> "user_id" := o.userId
    ~> "parent_folder_id" := o.parentFolderId
    ~> "data_p" := o.dataP
    ~> "created_at" := o.createdAt
    ~> "modified_at" := o.modifiedAt
    ~> jsonEmptyObject


instance reminderResponseDecodeJson :: DecodeJson ReminderResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    userId <- obj .? "user_id"
    parentFolderId <- obj .? "parent_folder_id"
    dataP <- obj .? "data_p"
    createdAt <- obj .? "created_at"
    modifiedAt <- obj .? "modified_at"
    pure $ ReminderResponse {
      id,
      userId,
      parentFolderId,
      dataP,
      createdAt,
      modifiedAt
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
      <*> readProp "data_p" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance reminderResponseIsForeign :: IsForeign ReminderResponse where
  read json =
      mkReminderResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "parent_folder_id" json
      <*> readProp "data_p" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance reminderResponseShow :: Show ReminderResponse where
    show (ReminderResponse o) = show "id: " ++ show o.id ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "parentFolderId: " ++ show o.parentFolderId ++ ", " ++ show "dataP: " ++ show o.dataP ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt

newtype ReminderResponses = ReminderResponses {
  reminderResponses :: (Array  ReminderResponse)
}


_ReminderResponses :: LensP ReminderResponses {
  reminderResponses :: (Array  ReminderResponse)
}
_ReminderResponses f (ReminderResponses o) = ReminderResponses <$> f o


mkReminderResponses :: (Array  ReminderResponse) -> ReminderResponses
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
  name :: String,
  description :: (Maybe String),
  visibility :: Visibility
}


_ReminderFolderRequest :: LensP ReminderFolderRequest {
  name :: String,
  description :: (Maybe String),
  visibility :: Visibility
}
_ReminderFolderRequest f (ReminderFolderRequest o) = ReminderFolderRequest <$> f o


mkReminderFolderRequest :: String -> (Maybe String) -> Visibility -> ReminderFolderRequest
mkReminderFolderRequest name description visibility =
  ReminderFolderRequest{name, description, visibility}


unwrapReminderFolderRequest (ReminderFolderRequest r) = r

instance reminderFolderRequestEncodeJson :: EncodeJson ReminderFolderRequest where
  encodeJson (ReminderFolderRequest o) =
       "tag" := "ReminderFolderRequest"
    ~> "name" := o.name
    ~> "description" := o.description
    ~> "visibility" := o.visibility
    ~> jsonEmptyObject


instance reminderFolderRequestDecodeJson :: DecodeJson ReminderFolderRequest where
  decodeJson o = do
    obj <- decodeJson o
    name <- obj .? "name"
    description <- obj .? "description"
    visibility <- obj .? "visibility"
    pure $ ReminderFolderRequest {
      name,
      description,
      visibility
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
      <$> readProp "name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "visibility" json


instance reminderFolderRequestIsForeign :: IsForeign ReminderFolderRequest where
  read json =
      mkReminderFolderRequest
      <$> readProp "name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "visibility" json


instance reminderFolderRequestShow :: Show ReminderFolderRequest where
    show (ReminderFolderRequest o) = show "name: " ++ show o.name ++ ", " ++ show "description: " ++ show o.description ++ ", " ++ show "visibility: " ++ show o.visibility

newtype ReminderFolderResponse = ReminderFolderResponse {
  id :: Int,
  userId :: Int,
  parentFolderId :: (Maybe Int),
  name :: String,
  visibility :: Visibility,
  description :: (Maybe String),
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}


_ReminderFolderResponse :: LensP ReminderFolderResponse {
  id :: Int,
  userId :: Int,
  parentFolderId :: (Maybe Int),
  name :: String,
  visibility :: Visibility,
  description :: (Maybe String),
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}
_ReminderFolderResponse f (ReminderFolderResponse o) = ReminderFolderResponse <$> f o


mkReminderFolderResponse :: Int -> Int -> (Maybe Int) -> String -> Visibility -> (Maybe String) -> (Maybe Date) -> (Maybe Date) -> ReminderFolderResponse
mkReminderFolderResponse id userId parentFolderId name visibility description createdAt modifiedAt =
  ReminderFolderResponse{id, userId, parentFolderId, name, visibility, description, createdAt, modifiedAt}


unwrapReminderFolderResponse (ReminderFolderResponse r) = r

instance reminderFolderResponseEncodeJson :: EncodeJson ReminderFolderResponse where
  encodeJson (ReminderFolderResponse o) =
       "tag" := "ReminderFolderResponse"
    ~> "id" := o.id
    ~> "user_id" := o.userId
    ~> "parent_folder_id" := o.parentFolderId
    ~> "name" := o.name
    ~> "visibility" := o.visibility
    ~> "description" := o.description
    ~> "created_at" := o.createdAt
    ~> "modified_at" := o.modifiedAt
    ~> jsonEmptyObject


instance reminderFolderResponseDecodeJson :: DecodeJson ReminderFolderResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    userId <- obj .? "user_id"
    parentFolderId <- obj .? "parent_folder_id"
    name <- obj .? "name"
    visibility <- obj .? "visibility"
    description <- obj .? "description"
    createdAt <- obj .? "created_at"
    modifiedAt <- obj .? "modified_at"
    pure $ ReminderFolderResponse {
      id,
      userId,
      parentFolderId,
      name,
      visibility,
      description,
      createdAt,
      modifiedAt
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
      <*> readProp "visibility" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance reminderFolderResponseIsForeign :: IsForeign ReminderFolderResponse where
  read json =
      mkReminderFolderResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> (runNullOrUndefined <$> readProp "parent_folder_id" json)
      <*> readProp "name" json
      <*> readProp "visibility" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance reminderFolderResponseShow :: Show ReminderFolderResponse where
    show (ReminderFolderResponse o) = show "id: " ++ show o.id ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "parentFolderId: " ++ show o.parentFolderId ++ ", " ++ show "name: " ++ show o.name ++ ", " ++ show "visibility: " ++ show o.visibility ++ ", " ++ show "description: " ++ show o.description ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt

newtype ReminderFolderResponses = ReminderFolderResponses {
  reminderFolderResponses :: (Array  ReminderFolderResponse)
}


_ReminderFolderResponses :: LensP ReminderFolderResponses {
  reminderFolderResponses :: (Array  ReminderFolderResponse)
}
_ReminderFolderResponses f (ReminderFolderResponses o) = ReminderFolderResponses <$> f o


mkReminderFolderResponses :: (Array  ReminderFolderResponse) -> ReminderFolderResponses
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


newtype ResourceRequest = ResourceRequest {
  title :: String,
  description :: String,
  source :: ResourceType,
  author :: (Maybe (Array  String)),
  prerequisites :: (DepList String),
  categories :: (DepList String),
  visibility :: Visibility,
  counter :: Int,
  version :: (Maybe String),
  urls :: (Maybe (Array  String))
}


_ResourceRequest :: LensP ResourceRequest {
  title :: String,
  description :: String,
  source :: ResourceType,
  author :: (Maybe (Array  String)),
  prerequisites :: (DepList String),
  categories :: (DepList String),
  visibility :: Visibility,
  counter :: Int,
  version :: (Maybe String),
  urls :: (Maybe (Array  String))
}
_ResourceRequest f (ResourceRequest o) = ResourceRequest <$> f o


mkResourceRequest :: String -> String -> ResourceType -> (Maybe (Array  String)) -> (DepList String) -> (DepList String) -> Visibility -> Int -> (Maybe String) -> (Maybe (Array  String)) -> ResourceRequest
mkResourceRequest title description source author prerequisites categories visibility counter version urls =
  ResourceRequest{title, description, source, author, prerequisites, categories, visibility, counter, version, urls}


unwrapResourceRequest (ResourceRequest r) = r

instance resourceRequestEncodeJson :: EncodeJson ResourceRequest where
  encodeJson (ResourceRequest o) =
       "tag" := "ResourceRequest"
    ~> "title" := o.title
    ~> "description" := o.description
    ~> "source" := o.source
    ~> "author" := o.author
    ~> "prerequisites" := o.prerequisites
    ~> "categories" := o.categories
    ~> "visibility" := o.visibility
    ~> "counter" := o.counter
    ~> "version" := o.version
    ~> "urls" := o.urls
    ~> jsonEmptyObject


instance resourceRequestDecodeJson :: DecodeJson ResourceRequest where
  decodeJson o = do
    obj <- decodeJson o
    title <- obj .? "title"
    description <- obj .? "description"
    source <- obj .? "source"
    author <- obj .? "author"
    prerequisites <- obj .? "prerequisites"
    categories <- obj .? "categories"
    visibility <- obj .? "visibility"
    counter <- obj .? "counter"
    version <- obj .? "version"
    urls <- obj .? "urls"
    pure $ ResourceRequest {
      title,
      description,
      source,
      author,
      prerequisites,
      categories,
      visibility,
      counter,
      version,
      urls
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
      <$> readProp "title" json
      <*> readProp "description" json
      <*> readProp "source" json
      <*> (runNullOrUndefined <$> readProp "author" json)
      <*> readProp "prerequisites" json
      <*> readProp "categories" json
      <*> readProp "visibility" json
      <*> readProp "counter" json
      <*> (runNullOrUndefined <$> readProp "version" json)
      <*> (runNullOrUndefined <$> readProp "urls" json)


instance resourceRequestIsForeign :: IsForeign ResourceRequest where
  read json =
      mkResourceRequest
      <$> readProp "title" json
      <*> readProp "description" json
      <*> readProp "source" json
      <*> (runNullOrUndefined <$> readProp "author" json)
      <*> readProp "prerequisites" json
      <*> readProp "categories" json
      <*> readProp "visibility" json
      <*> readProp "counter" json
      <*> (runNullOrUndefined <$> readProp "version" json)
      <*> (runNullOrUndefined <$> readProp "urls" json)


instance resourceRequestShow :: Show ResourceRequest where
    show (ResourceRequest o) = show "title: " ++ show o.title ++ ", " ++ show "description: " ++ show o.description ++ ", " ++ show "source: " ++ show o.source ++ ", " ++ show "author: " ++ show o.author ++ ", " ++ show "prerequisites: " ++ show o.prerequisites ++ ", " ++ show "categories: " ++ show o.categories ++ ", " ++ show "visibility: " ++ show o.visibility ++ ", " ++ show "counter: " ++ show o.counter ++ ", " ++ show "version: " ++ show o.version ++ ", " ++ show "urls: " ++ show o.urls

newtype ResourceResponse = ResourceResponse {
  id :: Int,
  userId :: Int,
  title :: String,
  description :: String,
  source :: ResourceType,
  author :: (Maybe (Array  String)),
  prerequisites :: (DepList String),
  categories :: (DepList String),
  visibility :: Visibility,
  counter :: Int,
  version :: (Maybe String),
  urls :: (Maybe (Array  String)),
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}


_ResourceResponse :: LensP ResourceResponse {
  id :: Int,
  userId :: Int,
  title :: String,
  description :: String,
  source :: ResourceType,
  author :: (Maybe (Array  String)),
  prerequisites :: (DepList String),
  categories :: (DepList String),
  visibility :: Visibility,
  counter :: Int,
  version :: (Maybe String),
  urls :: (Maybe (Array  String)),
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}
_ResourceResponse f (ResourceResponse o) = ResourceResponse <$> f o


mkResourceResponse :: Int -> Int -> String -> String -> ResourceType -> (Maybe (Array  String)) -> (DepList String) -> (DepList String) -> Visibility -> Int -> (Maybe String) -> (Maybe (Array  String)) -> (Maybe Date) -> (Maybe Date) -> ResourceResponse
mkResourceResponse id userId title description source author prerequisites categories visibility counter version urls createdAt modifiedAt =
  ResourceResponse{id, userId, title, description, source, author, prerequisites, categories, visibility, counter, version, urls, createdAt, modifiedAt}


unwrapResourceResponse (ResourceResponse r) = r

instance resourceResponseEncodeJson :: EncodeJson ResourceResponse where
  encodeJson (ResourceResponse o) =
       "tag" := "ResourceResponse"
    ~> "id" := o.id
    ~> "user_id" := o.userId
    ~> "title" := o.title
    ~> "description" := o.description
    ~> "source" := o.source
    ~> "author" := o.author
    ~> "prerequisites" := o.prerequisites
    ~> "categories" := o.categories
    ~> "visibility" := o.visibility
    ~> "counter" := o.counter
    ~> "version" := o.version
    ~> "urls" := o.urls
    ~> "created_at" := o.createdAt
    ~> "modified_at" := o.modifiedAt
    ~> jsonEmptyObject


instance resourceResponseDecodeJson :: DecodeJson ResourceResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    userId <- obj .? "user_id"
    title <- obj .? "title"
    description <- obj .? "description"
    source <- obj .? "source"
    author <- obj .? "author"
    prerequisites <- obj .? "prerequisites"
    categories <- obj .? "categories"
    visibility <- obj .? "visibility"
    counter <- obj .? "counter"
    version <- obj .? "version"
    urls <- obj .? "urls"
    createdAt <- obj .? "created_at"
    modifiedAt <- obj .? "modified_at"
    pure $ ResourceResponse {
      id,
      userId,
      title,
      description,
      source,
      author,
      prerequisites,
      categories,
      visibility,
      counter,
      version,
      urls,
      createdAt,
      modifiedAt
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
      <*> readProp "title" json
      <*> readProp "description" json
      <*> readProp "source" json
      <*> (runNullOrUndefined <$> readProp "author" json)
      <*> readProp "prerequisites" json
      <*> readProp "categories" json
      <*> readProp "visibility" json
      <*> readProp "counter" json
      <*> (runNullOrUndefined <$> readProp "version" json)
      <*> (runNullOrUndefined <$> readProp "urls" json)
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance resourceResponseIsForeign :: IsForeign ResourceResponse where
  read json =
      mkResourceResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "title" json
      <*> readProp "description" json
      <*> readProp "source" json
      <*> (runNullOrUndefined <$> readProp "author" json)
      <*> readProp "prerequisites" json
      <*> readProp "categories" json
      <*> readProp "visibility" json
      <*> readProp "counter" json
      <*> (runNullOrUndefined <$> readProp "version" json)
      <*> (runNullOrUndefined <$> readProp "urls" json)
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance resourceResponseShow :: Show ResourceResponse where
    show (ResourceResponse o) = show "id: " ++ show o.id ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "title: " ++ show o.title ++ ", " ++ show "description: " ++ show o.description ++ ", " ++ show "source: " ++ show o.source ++ ", " ++ show "author: " ++ show o.author ++ ", " ++ show "prerequisites: " ++ show o.prerequisites ++ ", " ++ show "categories: " ++ show o.categories ++ ", " ++ show "visibility: " ++ show o.visibility ++ ", " ++ show "counter: " ++ show o.counter ++ ", " ++ show "version: " ++ show o.version ++ ", " ++ show "urls: " ++ show o.urls ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt

newtype ResourceResponses = ResourceResponses {
  resourceResponses :: (Array  ResourceResponse)
}


_ResourceResponses :: LensP ResourceResponses {
  resourceResponses :: (Array  ResourceResponse)
}
_ResourceResponses f (ResourceResponses o) = ResourceResponses <$> f o


mkResourceResponses :: (Array  ResourceResponse) -> ResourceResponses
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


data Substitutions
  = SubsExpr Substitutions Substitutions
  | SubsOneOf (Array  String)
  | SubsAllOf (Array  String)
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


newtype TeamRequest = TeamRequest {
  name :: String,
  description :: (Maybe String)
}


_TeamRequest :: LensP TeamRequest {
  name :: String,
  description :: (Maybe String)
}
_TeamRequest f (TeamRequest o) = TeamRequest <$> f o


mkTeamRequest :: String -> (Maybe String) -> TeamRequest
mkTeamRequest name description =
  TeamRequest{name, description}


unwrapTeamRequest (TeamRequest r) = r

instance teamRequestEncodeJson :: EncodeJson TeamRequest where
  encodeJson (TeamRequest o) =
       "tag" := "TeamRequest"
    ~> "name" := o.name
    ~> "description" := o.description
    ~> jsonEmptyObject


instance teamRequestDecodeJson :: DecodeJson TeamRequest where
  decodeJson o = do
    obj <- decodeJson o
    name <- obj .? "name"
    description <- obj .? "description"
    pure $ TeamRequest {
      name,
      description
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
      <$> readProp "name" json
      <*> (runNullOrUndefined <$> readProp "description" json)


instance teamRequestIsForeign :: IsForeign TeamRequest where
  read json =
      mkTeamRequest
      <$> readProp "name" json
      <*> (runNullOrUndefined <$> readProp "description" json)


instance teamRequestShow :: Show TeamRequest where
    show (TeamRequest o) = show "name: " ++ show o.name ++ ", " ++ show "description: " ++ show o.description

newtype TeamResponse = TeamResponse {
  id :: Int,
  userId :: Int,
  orgId :: Int,
  name :: String,
  description :: (Maybe String),
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date)
}


_TeamResponse :: LensP TeamResponse {
  id :: Int,
  userId :: Int,
  orgId :: Int,
  name :: String,
  description :: (Maybe String),
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date)
}
_TeamResponse f (TeamResponse o) = TeamResponse <$> f o


mkTeamResponse :: Int -> Int -> Int -> String -> (Maybe String) -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> TeamResponse
mkTeamResponse id userId orgId name description createdAt modifiedBy modifiedAt =
  TeamResponse{id, userId, orgId, name, description, createdAt, modifiedBy, modifiedAt}


unwrapTeamResponse (TeamResponse r) = r

instance teamResponseEncodeJson :: EncodeJson TeamResponse where
  encodeJson (TeamResponse o) =
       "tag" := "TeamResponse"
    ~> "id" := o.id
    ~> "user_id" := o.userId
    ~> "org_id" := o.orgId
    ~> "name" := o.name
    ~> "description" := o.description
    ~> "created_at" := o.createdAt
    ~> "modified_by" := o.modifiedBy
    ~> "modified_at" := o.modifiedAt
    ~> jsonEmptyObject


instance teamResponseDecodeJson :: DecodeJson TeamResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    userId <- obj .? "user_id"
    orgId <- obj .? "org_id"
    name <- obj .? "name"
    description <- obj .? "description"
    createdAt <- obj .? "created_at"
    modifiedBy <- obj .? "modified_by"
    modifiedAt <- obj .? "modified_at"
    pure $ TeamResponse {
      id,
      userId,
      orgId,
      name,
      description,
      createdAt,
      modifiedBy,
      modifiedAt
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
      <*> readProp "name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance teamResponseIsForeign :: IsForeign TeamResponse where
  read json =
      mkTeamResponse
      <$> readProp "id" json
      <*> readProp "user_id" json
      <*> readProp "org_id" json
      <*> readProp "name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance teamResponseShow :: Show TeamResponse where
    show (TeamResponse o) = show "id: " ++ show o.id ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "orgId: " ++ show o.orgId ++ ", " ++ show "name: " ++ show o.name ++ ", " ++ show "description: " ++ show o.description ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedBy: " ++ show o.modifiedBy ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt

newtype TeamResponses = TeamResponses {
  teamResponses :: (Array  TeamResponse)
}


_TeamResponses :: LensP TeamResponses {
  teamResponses :: (Array  TeamResponse)
}
_TeamResponses f (TeamResponses o) = TeamResponses <$> f o


mkTeamResponses :: (Array  TeamResponse) -> TeamResponses
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

newtype TestRequest = TestRequest {
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
  testResponses :: (Array  TestResponse)
}


_TestResponses :: LensP TestResponses {
  testResponses :: (Array  TestResponse)
}
_TestResponses f (TestResponses o) = TestResponses <$> f o


mkTestResponses :: (Array  TestResponse) -> TestResponses
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
  name :: String,
  description :: (Maybe String),
  sticky :: Boolean,
  locked :: Boolean,
  poll :: (Maybe String)
}


_ThreadRequest :: LensP ThreadRequest {
  name :: String,
  description :: (Maybe String),
  sticky :: Boolean,
  locked :: Boolean,
  poll :: (Maybe String)
}
_ThreadRequest f (ThreadRequest o) = ThreadRequest <$> f o


mkThreadRequest :: String -> (Maybe String) -> Boolean -> Boolean -> (Maybe String) -> ThreadRequest
mkThreadRequest name description sticky locked poll =
  ThreadRequest{name, description, sticky, locked, poll}


unwrapThreadRequest (ThreadRequest r) = r

instance threadRequestEncodeJson :: EncodeJson ThreadRequest where
  encodeJson (ThreadRequest o) =
       "tag" := "ThreadRequest"
    ~> "name" := o.name
    ~> "description" := o.description
    ~> "sticky" := o.sticky
    ~> "locked" := o.locked
    ~> "poll" := o.poll
    ~> jsonEmptyObject


instance threadRequestDecodeJson :: DecodeJson ThreadRequest where
  decodeJson o = do
    obj <- decodeJson o
    name <- obj .? "name"
    description <- obj .? "description"
    sticky <- obj .? "sticky"
    locked <- obj .? "locked"
    poll <- obj .? "poll"
    pure $ ThreadRequest {
      name,
      description,
      sticky,
      locked,
      poll
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
      <$> readProp "name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "sticky" json
      <*> readProp "locked" json
      <*> (runNullOrUndefined <$> readProp "poll" json)


instance threadRequestIsForeign :: IsForeign ThreadRequest where
  read json =
      mkThreadRequest
      <$> readProp "name" json
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "sticky" json
      <*> readProp "locked" json
      <*> (runNullOrUndefined <$> readProp "poll" json)


instance threadRequestShow :: Show ThreadRequest where
    show (ThreadRequest o) = show "name: " ++ show o.name ++ ", " ++ show "description: " ++ show o.description ++ ", " ++ show "sticky: " ++ show o.sticky ++ ", " ++ show "locked: " ++ show o.locked ++ ", " ++ show "poll: " ++ show o.poll

newtype ThreadResponse = ThreadResponse {
  id :: Int,
  userId :: Int,
  boardId :: Int,
  name :: String,
  description :: (Maybe String),
  sticky :: Boolean,
  locked :: Boolean,
  poll :: (Maybe String),
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
  description :: (Maybe String),
  sticky :: Boolean,
  locked :: Boolean,
  poll :: (Maybe String),
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date),
  activityAt :: (Maybe Date)
}
_ThreadResponse f (ThreadResponse o) = ThreadResponse <$> f o


mkThreadResponse :: Int -> Int -> Int -> String -> (Maybe String) -> Boolean -> Boolean -> (Maybe String) -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> ThreadResponse
mkThreadResponse id userId boardId name description sticky locked poll createdAt modifiedBy modifiedAt activityAt =
  ThreadResponse{id, userId, boardId, name, description, sticky, locked, poll, createdAt, modifiedBy, modifiedAt, activityAt}


unwrapThreadResponse (ThreadResponse r) = r

instance threadResponseEncodeJson :: EncodeJson ThreadResponse where
  encodeJson (ThreadResponse o) =
       "tag" := "ThreadResponse"
    ~> "id" := o.id
    ~> "user_id" := o.userId
    ~> "board_id" := o.boardId
    ~> "name" := o.name
    ~> "description" := o.description
    ~> "sticky" := o.sticky
    ~> "locked" := o.locked
    ~> "poll" := o.poll
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
    description <- obj .? "description"
    sticky <- obj .? "sticky"
    locked <- obj .? "locked"
    poll <- obj .? "poll"
    createdAt <- obj .? "created_at"
    modifiedBy <- obj .? "modified_by"
    modifiedAt <- obj .? "modified_at"
    activityAt <- obj .? "activity_at"
    pure $ ThreadResponse {
      id,
      userId,
      boardId,
      name,
      description,
      sticky,
      locked,
      poll,
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
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "sticky" json
      <*> readProp "locked" json
      <*> (runNullOrUndefined <$> readProp "poll" json)
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
      <*> (runNullOrUndefined <$> readProp "description" json)
      <*> readProp "sticky" json
      <*> readProp "locked" json
      <*> (runNullOrUndefined <$> readProp "poll" json)
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "activity_at" json)


instance threadResponseShow :: Show ThreadResponse where
    show (ThreadResponse o) = show "id: " ++ show o.id ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "boardId: " ++ show o.boardId ++ ", " ++ show "name: " ++ show o.name ++ ", " ++ show "description: " ++ show o.description ++ ", " ++ show "sticky: " ++ show o.sticky ++ ", " ++ show "locked: " ++ show o.locked ++ ", " ++ show "poll: " ++ show o.poll ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedBy: " ++ show o.modifiedBy ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt ++ ", " ++ show "activityAt: " ++ show o.activityAt

newtype ThreadResponses = ThreadResponses {
  threadResponses :: (Array  ThreadResponse)
}


_ThreadResponses :: LensP ThreadResponses {
  threadResponses :: (Array  ThreadResponse)
}
_ThreadResponses f (ThreadResponses o) = ThreadResponses <$> f o


mkThreadResponses :: (Array  ThreadResponse) -> ThreadResponses
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
  threadStatResponses :: (Array  ThreadStatResponse)
}


_ThreadStatResponses :: LensP ThreadStatResponses {
  threadStatResponses :: (Array  ThreadStatResponse)
}
_ThreadStatResponses f (ThreadStatResponses o) = ThreadStatResponses <$> f o


mkThreadStatResponses :: (Array  ThreadStatResponse) -> ThreadStatResponses
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
  tags :: (Array  String),
  privateTags :: (Array  String)
}


_ThreadPostRequest :: LensP ThreadPostRequest {
  title :: (Maybe String),
  body :: PostData,
  tags :: (Array  String),
  privateTags :: (Array  String)
}
_ThreadPostRequest f (ThreadPostRequest o) = ThreadPostRequest <$> f o


mkThreadPostRequest :: (Maybe String) -> PostData -> (Array  String) -> (Array  String) -> ThreadPostRequest
mkThreadPostRequest title body tags privateTags =
  ThreadPostRequest{title, body, tags, privateTags}


unwrapThreadPostRequest (ThreadPostRequest r) = r

instance threadPostRequestEncodeJson :: EncodeJson ThreadPostRequest where
  encodeJson (ThreadPostRequest o) =
       "tag" := "ThreadPostRequest"
    ~> "title" := o.title
    ~> "body" := o.body
    ~> "tags" := o.tags
    ~> "private_tags" := o.privateTags
    ~> jsonEmptyObject


instance threadPostRequestDecodeJson :: DecodeJson ThreadPostRequest where
  decodeJson o = do
    obj <- decodeJson o
    title <- obj .? "title"
    body <- obj .? "body"
    tags <- obj .? "tags"
    privateTags <- obj .? "private_tags"
    pure $ ThreadPostRequest {
      title,
      body,
      tags,
      privateTags
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


instance threadPostRequestIsForeign :: IsForeign ThreadPostRequest where
  read json =
      mkThreadPostRequest
      <$> (runNullOrUndefined <$> readProp "title" json)
      <*> readProp "body" json
      <*> readProp "tags" json
      <*> readProp "private_tags" json


instance threadPostRequestShow :: Show ThreadPostRequest where
    show (ThreadPostRequest o) = show "title: " ++ show o.title ++ ", " ++ show "body: " ++ show o.body ++ ", " ++ show "tags: " ++ show o.tags ++ ", " ++ show "privateTags: " ++ show o.privateTags

newtype ThreadPostResponse = ThreadPostResponse {
  id :: Int,
  userId :: Int,
  threadId :: Int,
  parentId :: (Maybe Int),
  title :: (Maybe String),
  body :: PostData,
  tags :: (Array  String),
  privateTags :: (Array  String),
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date)
}


_ThreadPostResponse :: LensP ThreadPostResponse {
  id :: Int,
  userId :: Int,
  threadId :: Int,
  parentId :: (Maybe Int),
  title :: (Maybe String),
  body :: PostData,
  tags :: (Array  String),
  privateTags :: (Array  String),
  createdAt :: (Maybe Date),
  modifiedBy :: (Maybe Int),
  modifiedAt :: (Maybe Date)
}
_ThreadPostResponse f (ThreadPostResponse o) = ThreadPostResponse <$> f o


mkThreadPostResponse :: Int -> Int -> Int -> (Maybe Int) -> (Maybe String) -> PostData -> (Array  String) -> (Array  String) -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> ThreadPostResponse
mkThreadPostResponse id userId threadId parentId title body tags privateTags createdAt modifiedBy modifiedAt =
  ThreadPostResponse{id, userId, threadId, parentId, title, body, tags, privateTags, createdAt, modifiedBy, modifiedAt}


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
    ~> "created_at" := o.createdAt
    ~> "modified_by" := o.modifiedBy
    ~> "modified_at" := o.modifiedAt
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
    createdAt <- obj .? "created_at"
    modifiedBy <- obj .? "modified_by"
    modifiedAt <- obj .? "modified_at"
    pure $ ThreadPostResponse {
      id,
      userId,
      threadId,
      parentId,
      title,
      body,
      tags,
      privateTags,
      createdAt,
      modifiedBy,
      modifiedAt
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
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


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
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_by" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance threadPostResponseShow :: Show ThreadPostResponse where
    show (ThreadPostResponse o) = show "id: " ++ show o.id ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "threadId: " ++ show o.threadId ++ ", " ++ show "parentId: " ++ show o.parentId ++ ", " ++ show "title: " ++ show o.title ++ ", " ++ show "body: " ++ show o.body ++ ", " ++ show "tags: " ++ show o.tags ++ ", " ++ show "privateTags: " ++ show o.privateTags ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedBy: " ++ show o.modifiedBy ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt

newtype ThreadPostResponses = ThreadPostResponses {
  threadPostResponses :: (Array  ThreadPostResponse)
}


_ThreadPostResponses :: LensP ThreadPostResponses {
  threadPostResponses :: (Array  ThreadPostResponse)
}
_ThreadPostResponses f (ThreadPostResponses o) = ThreadPostResponses <$> f o


mkThreadPostResponses :: (Array  ThreadPostResponse) -> ThreadPostResponses
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
  starred :: Int,
  views :: Int
}


_ThreadPostStatResponse :: LensP ThreadPostStatResponse {
  threadPostId :: Int,
  likes :: Int,
  neutral :: Int,
  dislikes :: Int,
  starred :: Int,
  views :: Int
}
_ThreadPostStatResponse f (ThreadPostStatResponse o) = ThreadPostStatResponse <$> f o


mkThreadPostStatResponse :: Int -> Int -> Int -> Int -> Int -> Int -> ThreadPostStatResponse
mkThreadPostStatResponse threadPostId likes neutral dislikes starred views =
  ThreadPostStatResponse{threadPostId, likes, neutral, dislikes, starred, views}


unwrapThreadPostStatResponse (ThreadPostStatResponse r) = r

instance threadPostStatResponseEncodeJson :: EncodeJson ThreadPostStatResponse where
  encodeJson (ThreadPostStatResponse o) =
       "tag" := "ThreadPostStatResponse"
    ~> "thread_post_id" := o.threadPostId
    ~> "likes" := o.likes
    ~> "neutral" := o.neutral
    ~> "dislikes" := o.dislikes
    ~> "starred" := o.starred
    ~> "views" := o.views
    ~> jsonEmptyObject


instance threadPostStatResponseDecodeJson :: DecodeJson ThreadPostStatResponse where
  decodeJson o = do
    obj <- decodeJson o
    threadPostId <- obj .? "thread_post_id"
    likes <- obj .? "likes"
    neutral <- obj .? "neutral"
    dislikes <- obj .? "dislikes"
    starred <- obj .? "starred"
    views <- obj .? "views"
    pure $ ThreadPostStatResponse {
      threadPostId,
      likes,
      neutral,
      dislikes,
      starred,
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
      <*> readProp "starred" json
      <*> readProp "views" json


instance threadPostStatResponseIsForeign :: IsForeign ThreadPostStatResponse where
  read json =
      mkThreadPostStatResponse
      <$> readProp "thread_post_id" json
      <*> readProp "likes" json
      <*> readProp "neutral" json
      <*> readProp "dislikes" json
      <*> readProp "starred" json
      <*> readProp "views" json


instance threadPostStatResponseShow :: Show ThreadPostStatResponse where
    show (ThreadPostStatResponse o) = show "threadPostId: " ++ show o.threadPostId ++ ", " ++ show "likes: " ++ show o.likes ++ ", " ++ show "neutral: " ++ show o.neutral ++ ", " ++ show "dislikes: " ++ show o.dislikes ++ ", " ++ show "starred: " ++ show o.starred ++ ", " ++ show "views: " ++ show o.views

newtype ThreadPostStatResponses = ThreadPostStatResponses {
  threadPostStatResponses :: (Array  ThreadPostStatResponse)
}


_ThreadPostStatResponses :: LensP ThreadPostStatResponses {
  threadPostStatResponses :: (Array  ThreadPostStatResponse)
}
_ThreadPostStatResponses f (ThreadPostStatResponses o) = ThreadPostStatResponses <$> f o


mkThreadPostStatResponses :: (Array  ThreadPostStatResponse) -> ThreadPostStatResponses
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

newtype ThreadPostLikeRequest = ThreadPostLikeRequest {
  opt :: LikeOpt,
  reason :: (Maybe String)
}


_ThreadPostLikeRequest :: LensP ThreadPostLikeRequest {
  opt :: LikeOpt,
  reason :: (Maybe String)
}
_ThreadPostLikeRequest f (ThreadPostLikeRequest o) = ThreadPostLikeRequest <$> f o


mkThreadPostLikeRequest :: LikeOpt -> (Maybe String) -> ThreadPostLikeRequest
mkThreadPostLikeRequest opt reason =
  ThreadPostLikeRequest{opt, reason}


unwrapThreadPostLikeRequest (ThreadPostLikeRequest r) = r

instance threadPostLikeRequestEncodeJson :: EncodeJson ThreadPostLikeRequest where
  encodeJson (ThreadPostLikeRequest o) =
       "tag" := "ThreadPostLikeRequest"
    ~> "opt" := o.opt
    ~> "reason" := o.reason
    ~> jsonEmptyObject


instance threadPostLikeRequestDecodeJson :: DecodeJson ThreadPostLikeRequest where
  decodeJson o = do
    obj <- decodeJson o
    opt <- obj .? "opt"
    reason <- obj .? "reason"
    pure $ ThreadPostLikeRequest {
      opt,
      reason
    }


instance threadPostLikeRequestRequestable :: Requestable ThreadPostLikeRequest where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance threadPostLikeRequestRespondable :: Respondable ThreadPostLikeRequest where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkThreadPostLikeRequest
      <$> readProp "opt" json
      <*> (runNullOrUndefined <$> readProp "reason" json)


instance threadPostLikeRequestIsForeign :: IsForeign ThreadPostLikeRequest where
  read json =
      mkThreadPostLikeRequest
      <$> readProp "opt" json
      <*> (runNullOrUndefined <$> readProp "reason" json)


instance threadPostLikeRequestShow :: Show ThreadPostLikeRequest where
    show (ThreadPostLikeRequest o) = show "opt: " ++ show o.opt ++ ", " ++ show "reason: " ++ show o.reason

newtype ThreadPostLikeResponse = ThreadPostLikeResponse {
  id :: Int,
  threadPostId :: Int,
  userId :: Int,
  opt :: LikeOpt,
  score :: Int,
  reason :: (Maybe String),
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}


_ThreadPostLikeResponse :: LensP ThreadPostLikeResponse {
  id :: Int,
  threadPostId :: Int,
  userId :: Int,
  opt :: LikeOpt,
  score :: Int,
  reason :: (Maybe String),
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date)
}
_ThreadPostLikeResponse f (ThreadPostLikeResponse o) = ThreadPostLikeResponse <$> f o


mkThreadPostLikeResponse :: Int -> Int -> Int -> LikeOpt -> Int -> (Maybe String) -> (Maybe Date) -> (Maybe Date) -> ThreadPostLikeResponse
mkThreadPostLikeResponse id threadPostId userId opt score reason createdAt modifiedAt =
  ThreadPostLikeResponse{id, threadPostId, userId, opt, score, reason, createdAt, modifiedAt}


unwrapThreadPostLikeResponse (ThreadPostLikeResponse r) = r

instance threadPostLikeResponseEncodeJson :: EncodeJson ThreadPostLikeResponse where
  encodeJson (ThreadPostLikeResponse o) =
       "tag" := "ThreadPostLikeResponse"
    ~> "id" := o.id
    ~> "thread_post_id" := o.threadPostId
    ~> "user_id" := o.userId
    ~> "opt" := o.opt
    ~> "score" := o.score
    ~> "reason" := o.reason
    ~> "created_at" := o.createdAt
    ~> "modified_at" := o.modifiedAt
    ~> jsonEmptyObject


instance threadPostLikeResponseDecodeJson :: DecodeJson ThreadPostLikeResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    threadPostId <- obj .? "thread_post_id"
    userId <- obj .? "user_id"
    opt <- obj .? "opt"
    score <- obj .? "score"
    reason <- obj .? "reason"
    createdAt <- obj .? "created_at"
    modifiedAt <- obj .? "modified_at"
    pure $ ThreadPostLikeResponse {
      id,
      threadPostId,
      userId,
      opt,
      score,
      reason,
      createdAt,
      modifiedAt
    }


instance threadPostLikeResponseRequestable :: Requestable ThreadPostLikeResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance threadPostLikeResponseRespondable :: Respondable ThreadPostLikeResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkThreadPostLikeResponse
      <$> readProp "id" json
      <*> readProp "thread_post_id" json
      <*> readProp "user_id" json
      <*> readProp "opt" json
      <*> readProp "score" json
      <*> (runNullOrUndefined <$> readProp "reason" json)
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance threadPostLikeResponseIsForeign :: IsForeign ThreadPostLikeResponse where
  read json =
      mkThreadPostLikeResponse
      <$> readProp "id" json
      <*> readProp "thread_post_id" json
      <*> readProp "user_id" json
      <*> readProp "opt" json
      <*> readProp "score" json
      <*> (runNullOrUndefined <$> readProp "reason" json)
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)


instance threadPostLikeResponseShow :: Show ThreadPostLikeResponse where
    show (ThreadPostLikeResponse o) = show "id: " ++ show o.id ++ ", " ++ show "threadPostId: " ++ show o.threadPostId ++ ", " ++ show "userId: " ++ show o.userId ++ ", " ++ show "opt: " ++ show o.opt ++ ", " ++ show "score: " ++ show o.score ++ ", " ++ show "reason: " ++ show o.reason ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt

newtype ThreadPostLikeResponses = ThreadPostLikeResponses {
  threadPostLikeResponses :: (Array  ThreadPostLikeResponse)
}


_ThreadPostLikeResponses :: LensP ThreadPostLikeResponses {
  threadPostLikeResponses :: (Array  ThreadPostLikeResponse)
}
_ThreadPostLikeResponses f (ThreadPostLikeResponses o) = ThreadPostLikeResponses <$> f o


mkThreadPostLikeResponses :: (Array  ThreadPostLikeResponse) -> ThreadPostLikeResponses
mkThreadPostLikeResponses threadPostLikeResponses =
  ThreadPostLikeResponses{threadPostLikeResponses}


unwrapThreadPostLikeResponses (ThreadPostLikeResponses r) = r

instance threadPostLikeResponsesEncodeJson :: EncodeJson ThreadPostLikeResponses where
  encodeJson (ThreadPostLikeResponses o) =
       "tag" := "ThreadPostLikeResponses"
    ~> "thread_post_like_responses" := o.threadPostLikeResponses
    ~> jsonEmptyObject


instance threadPostLikeResponsesDecodeJson :: DecodeJson ThreadPostLikeResponses where
  decodeJson o = do
    obj <- decodeJson o
    threadPostLikeResponses <- obj .? "thread_post_like_responses"
    pure $ ThreadPostLikeResponses {
      threadPostLikeResponses
    }


instance threadPostLikeResponsesRequestable :: Requestable ThreadPostLikeResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance threadPostLikeResponsesRespondable :: Respondable ThreadPostLikeResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkThreadPostLikeResponses
      <$> readProp "thread_post_like_responses" json


instance threadPostLikeResponsesIsForeign :: IsForeign ThreadPostLikeResponses where
  read json =
      mkThreadPostLikeResponses
      <$> readProp "thread_post_like_responses" json


instance threadPostLikeResponsesShow :: Show ThreadPostLikeResponses where
    show (ThreadPostLikeResponses o) = show "threadPostLikeResponses: " ++ show o.threadPostLikeResponses

newtype ThreadPostLikeStatResponse = ThreadPostLikeStatResponse {
  id :: Int,
  score :: Int,
  like :: Int,
  dislike :: Int
}


_ThreadPostLikeStatResponse :: LensP ThreadPostLikeStatResponse {
  id :: Int,
  score :: Int,
  like :: Int,
  dislike :: Int
}
_ThreadPostLikeStatResponse f (ThreadPostLikeStatResponse o) = ThreadPostLikeStatResponse <$> f o


mkThreadPostLikeStatResponse :: Int -> Int -> Int -> Int -> ThreadPostLikeStatResponse
mkThreadPostLikeStatResponse id score like dislike =
  ThreadPostLikeStatResponse{id, score, like, dislike}


unwrapThreadPostLikeStatResponse (ThreadPostLikeStatResponse r) = r

instance threadPostLikeStatResponseEncodeJson :: EncodeJson ThreadPostLikeStatResponse where
  encodeJson (ThreadPostLikeStatResponse o) =
       "tag" := "ThreadPostLikeStatResponse"
    ~> "id" := o.id
    ~> "score" := o.score
    ~> "like" := o.like
    ~> "dislike" := o.dislike
    ~> jsonEmptyObject


instance threadPostLikeStatResponseDecodeJson :: DecodeJson ThreadPostLikeStatResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    score <- obj .? "score"
    like <- obj .? "like"
    dislike <- obj .? "dislike"
    pure $ ThreadPostLikeStatResponse {
      id,
      score,
      like,
      dislike
    }


instance threadPostLikeStatResponseRequestable :: Requestable ThreadPostLikeStatResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance threadPostLikeStatResponseRespondable :: Respondable ThreadPostLikeStatResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkThreadPostLikeStatResponse
      <$> readProp "id" json
      <*> readProp "score" json
      <*> readProp "like" json
      <*> readProp "dislike" json


instance threadPostLikeStatResponseIsForeign :: IsForeign ThreadPostLikeStatResponse where
  read json =
      mkThreadPostLikeStatResponse
      <$> readProp "id" json
      <*> readProp "score" json
      <*> readProp "like" json
      <*> readProp "dislike" json


instance threadPostLikeStatResponseShow :: Show ThreadPostLikeStatResponse where
    show (ThreadPostLikeStatResponse o) = show "id: " ++ show o.id ++ ", " ++ show "score: " ++ show o.score ++ ", " ++ show "like: " ++ show o.like ++ ", " ++ show "dislike: " ++ show o.dislike

newtype ThreadPostLikeStatResponses = ThreadPostLikeStatResponses {
  threadPostLikeStatResponses :: (Array  ThreadPostLikeStatResponse)
}


_ThreadPostLikeStatResponses :: LensP ThreadPostLikeStatResponses {
  threadPostLikeStatResponses :: (Array  ThreadPostLikeStatResponse)
}
_ThreadPostLikeStatResponses f (ThreadPostLikeStatResponses o) = ThreadPostLikeStatResponses <$> f o


mkThreadPostLikeStatResponses :: (Array  ThreadPostLikeStatResponse) -> ThreadPostLikeStatResponses
mkThreadPostLikeStatResponses threadPostLikeStatResponses =
  ThreadPostLikeStatResponses{threadPostLikeStatResponses}


unwrapThreadPostLikeStatResponses (ThreadPostLikeStatResponses r) = r

instance threadPostLikeStatResponsesEncodeJson :: EncodeJson ThreadPostLikeStatResponses where
  encodeJson (ThreadPostLikeStatResponses o) =
       "tag" := "ThreadPostLikeStatResponses"
    ~> "thread_post_like_stat_responses" := o.threadPostLikeStatResponses
    ~> jsonEmptyObject


instance threadPostLikeStatResponsesDecodeJson :: DecodeJson ThreadPostLikeStatResponses where
  decodeJson o = do
    obj <- decodeJson o
    threadPostLikeStatResponses <- obj .? "thread_post_like_stat_responses"
    pure $ ThreadPostLikeStatResponses {
      threadPostLikeStatResponses
    }


instance threadPostLikeStatResponsesRequestable :: Requestable ThreadPostLikeStatResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
    in toRequest str


instance threadPostLikeStatResponsesRespondable :: Respondable ThreadPostLikeStatResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
      mkThreadPostLikeStatResponses
      <$> readProp "thread_post_like_stat_responses" json


instance threadPostLikeStatResponsesIsForeign :: IsForeign ThreadPostLikeStatResponses where
  read json =
      mkThreadPostLikeStatResponses
      <$> readProp "thread_post_like_stat_responses" json


instance threadPostLikeStatResponsesShow :: Show ThreadPostLikeStatResponses where
    show (ThreadPostLikeStatResponses o) = show "threadPostLikeStatResponses: " ++ show o.threadPostLikeStatResponses

newtype UserRequest = UserRequest {
  nick :: String,
  displayNick :: String,
  name :: String,
  email :: String,
  plugin :: String,
  ident :: String
}


_UserRequest :: LensP UserRequest {
  nick :: String,
  displayNick :: String,
  name :: String,
  email :: String,
  plugin :: String,
  ident :: String
}
_UserRequest f (UserRequest o) = UserRequest <$> f o


mkUserRequest :: String -> String -> String -> String -> String -> String -> UserRequest
mkUserRequest nick displayNick name email plugin ident =
  UserRequest{nick, displayNick, name, email, plugin, ident}


unwrapUserRequest (UserRequest r) = r

instance userRequestEncodeJson :: EncodeJson UserRequest where
  encodeJson (UserRequest o) =
       "tag" := "UserRequest"
    ~> "nick" := o.nick
    ~> "display_nick" := o.displayNick
    ~> "name" := o.name
    ~> "email" := o.email
    ~> "plugin" := o.plugin
    ~> "ident" := o.ident
    ~> jsonEmptyObject


instance userRequestDecodeJson :: DecodeJson UserRequest where
  decodeJson o = do
    obj <- decodeJson o
    nick <- obj .? "nick"
    displayNick <- obj .? "display_nick"
    name <- obj .? "name"
    email <- obj .? "email"
    plugin <- obj .? "plugin"
    ident <- obj .? "ident"
    pure $ UserRequest {
      nick,
      displayNick,
      name,
      email,
      plugin,
      ident
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
      <$> readProp "nick" json
      <*> readProp "display_nick" json
      <*> readProp "name" json
      <*> readProp "email" json
      <*> readProp "plugin" json
      <*> readProp "ident" json


instance userRequestIsForeign :: IsForeign UserRequest where
  read json =
      mkUserRequest
      <$> readProp "nick" json
      <*> readProp "display_nick" json
      <*> readProp "name" json
      <*> readProp "email" json
      <*> readProp "plugin" json
      <*> readProp "ident" json


instance userRequestShow :: Show UserRequest where
    show (UserRequest o) = show "nick: " ++ show o.nick ++ ", " ++ show "displayNick: " ++ show o.displayNick ++ ", " ++ show "name: " ++ show o.name ++ ", " ++ show "email: " ++ show o.email ++ ", " ++ show "plugin: " ++ show o.plugin ++ ", " ++ show "ident: " ++ show o.ident

newtype UserResponse = UserResponse {
  id :: Int,
  nick :: String,
  displayNick :: String,
  name :: String,
  email :: String,
  emailMD5 :: String,
  plugin :: String,
  ident :: String,
  active :: Boolean,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date),
  deactivatedAt :: (Maybe Date)
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
  active :: Boolean,
  createdAt :: (Maybe Date),
  modifiedAt :: (Maybe Date),
  deactivatedAt :: (Maybe Date)
}
_UserResponse f (UserResponse o) = UserResponse <$> f o


mkUserResponse :: Int -> String -> String -> String -> String -> String -> String -> String -> Boolean -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> UserResponse
mkUserResponse id nick displayNick name email emailMD5 plugin ident active createdAt modifiedAt deactivatedAt =
  UserResponse{id, nick, displayNick, name, email, emailMD5, plugin, ident, active, createdAt, modifiedAt, deactivatedAt}


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
    ~> "active" := o.active
    ~> "created_at" := o.createdAt
    ~> "modified_at" := o.modifiedAt
    ~> "deactivated_at" := o.deactivatedAt
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
    active <- obj .? "active"
    createdAt <- obj .? "created_at"
    modifiedAt <- obj .? "modified_at"
    deactivatedAt <- obj .? "deactivated_at"
    pure $ UserResponse {
      id,
      nick,
      displayNick,
      name,
      email,
      emailMD5,
      plugin,
      ident,
      active,
      createdAt,
      modifiedAt,
      deactivatedAt
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
      <*> readProp "active" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "deactivated_at" json)


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
      <*> readProp "active" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)
      <*> (runNullOrUndefined <$> readProp "modified_at" json)
      <*> (runNullOrUndefined <$> readProp "deactivated_at" json)


instance userResponseShow :: Show UserResponse where
    show (UserResponse o) = show "id: " ++ show o.id ++ ", " ++ show "nick: " ++ show o.nick ++ ", " ++ show "displayNick: " ++ show o.displayNick ++ ", " ++ show "name: " ++ show o.name ++ ", " ++ show "email: " ++ show o.email ++ ", " ++ show "emailMD5: " ++ show o.emailMD5 ++ ", " ++ show "plugin: " ++ show o.plugin ++ ", " ++ show "ident: " ++ show o.ident ++ ", " ++ show "active: " ++ show o.active ++ ", " ++ show "createdAt: " ++ show o.createdAt ++ ", " ++ show "modifiedAt: " ++ show o.modifiedAt ++ ", " ++ show "deactivatedAt: " ++ show o.deactivatedAt

newtype UserResponses = UserResponses {
  userResponses :: (Array  UserResponse)
}


_UserResponses :: LensP UserResponses {
  userResponses :: (Array  UserResponse)
}
_UserResponses f (UserResponses o) = UserResponses <$> f o


mkUserResponses :: (Array  UserResponse) -> UserResponses
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
  createdAt :: (Maybe Date)
}


_UserSanitizedResponse :: LensP UserSanitizedResponse {
  id :: Int,
  nick :: String,
  displayNick :: String,
  emailMD5 :: String,
  active :: Boolean,
  createdAt :: (Maybe Date)
}
_UserSanitizedResponse f (UserSanitizedResponse o) = UserSanitizedResponse <$> f o


mkUserSanitizedResponse :: Int -> String -> String -> String -> Boolean -> (Maybe Date) -> UserSanitizedResponse
mkUserSanitizedResponse id nick displayNick emailMD5 active createdAt =
  UserSanitizedResponse{id, nick, displayNick, emailMD5, active, createdAt}


unwrapUserSanitizedResponse (UserSanitizedResponse r) = r

instance userSanitizedResponseEncodeJson :: EncodeJson UserSanitizedResponse where
  encodeJson (UserSanitizedResponse o) =
       "tag" := "UserSanitizedResponse"
    ~> "id" := o.id
    ~> "nick" := o.nick
    ~> "display_nick" := o.displayNick
    ~> "email_md5" := o.emailMD5
    ~> "active" := o.active
    ~> "created_at" := o.createdAt
    ~> jsonEmptyObject


instance userSanitizedResponseDecodeJson :: DecodeJson UserSanitizedResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    nick <- obj .? "nick"
    displayNick <- obj .? "display_nick"
    emailMD5 <- obj .? "email_md5"
    active <- obj .? "active"
    createdAt <- obj .? "created_at"
    pure $ UserSanitizedResponse {
      id,
      nick,
      displayNick,
      emailMD5,
      active,
      createdAt
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
      <*> (runNullOrUndefined <$> readProp "created_at" json)


instance userSanitizedResponseIsForeign :: IsForeign UserSanitizedResponse where
  read json =
      mkUserSanitizedResponse
      <$> readProp "id" json
      <*> readProp "nick" json
      <*> readProp "display_nick" json
      <*> readProp "email_md5" json
      <*> readProp "active" json
      <*> (runNullOrUndefined <$> readProp "created_at" json)


instance userSanitizedResponseShow :: Show UserSanitizedResponse where
    show (UserSanitizedResponse o) = show "id: " ++ show o.id ++ ", " ++ show "nick: " ++ show o.nick ++ ", " ++ show "displayNick: " ++ show o.displayNick ++ ", " ++ show "emailMD5: " ++ show o.emailMD5 ++ ", " ++ show "active: " ++ show o.active ++ ", " ++ show "createdAt: " ++ show o.createdAt

newtype UserSanitizedResponses = UserSanitizedResponses {
  userSanitizedResponses :: (Array  UserSanitizedResponse)
}


_UserSanitizedResponses :: LensP UserSanitizedResponses {
  userSanitizedResponses :: (Array  UserSanitizedResponse)
}
_UserSanitizedResponses f (UserSanitizedResponses o) = UserSanitizedResponses <$> f o


mkUserSanitizedResponses :: (Array  UserSanitizedResponse) -> UserSanitizedResponses
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
  userSanitizedStatResponses :: (Array  UserSanitizedStatResponse)
}


_UserSanitizedStatResponses :: LensP UserSanitizedStatResponses {
  userSanitizedStatResponses :: (Array  UserSanitizedStatResponse)
}
_UserSanitizedStatResponses f (UserSanitizedStatResponses o) = UserSanitizedStatResponses <$> f o


mkUserSanitizedStatResponses :: (Array  UserSanitizedStatResponse) -> UserSanitizedStatResponses
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


newtype BoardPackResponse = BoardPackResponse {
  board :: BoardResponse,
  boardStat :: BoardStatResponse,
  latestThread :: (Maybe ThreadResponse),
  latestThreadPost :: (Maybe ThreadPostResponse),
  latestThreadPostUser :: (Maybe UserSanitizedResponse)
}


_BoardPackResponse :: LensP BoardPackResponse {
  board :: BoardResponse,
  boardStat :: BoardStatResponse,
  latestThread :: (Maybe ThreadResponse),
  latestThreadPost :: (Maybe ThreadPostResponse),
  latestThreadPostUser :: (Maybe UserSanitizedResponse)
}
_BoardPackResponse f (BoardPackResponse o) = BoardPackResponse <$> f o


mkBoardPackResponse :: BoardResponse -> BoardStatResponse -> (Maybe ThreadResponse) -> (Maybe ThreadPostResponse) -> (Maybe UserSanitizedResponse) -> BoardPackResponse
mkBoardPackResponse board boardStat latestThread latestThreadPost latestThreadPostUser =
  BoardPackResponse{board, boardStat, latestThread, latestThreadPost, latestThreadPostUser}


unwrapBoardPackResponse (BoardPackResponse r) = r

instance boardPackResponseEncodeJson :: EncodeJson BoardPackResponse where
  encodeJson (BoardPackResponse o) =
       "tag" := "BoardPackResponse"
    ~> "board" := o.board
    ~> "board_stat" := o.boardStat
    ~> "latest_thread" := o.latestThread
    ~> "latest_thread_post" := o.latestThreadPost
    ~> "latest_thread_post_user" := o.latestThreadPostUser
    ~> jsonEmptyObject


instance boardPackResponseDecodeJson :: DecodeJson BoardPackResponse where
  decodeJson o = do
    obj <- decodeJson o
    board <- obj .? "board"
    boardStat <- obj .? "board_stat"
    latestThread <- obj .? "latest_thread"
    latestThreadPost <- obj .? "latest_thread_post"
    latestThreadPostUser <- obj .? "latest_thread_post_user"
    pure $ BoardPackResponse {
      board,
      boardStat,
      latestThread,
      latestThreadPost,
      latestThreadPostUser
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
      <*> readProp "board_stat" json
      <*> (runNullOrUndefined <$> readProp "latest_thread" json)
      <*> (runNullOrUndefined <$> readProp "latest_thread_post" json)
      <*> (runNullOrUndefined <$> readProp "latest_thread_post_user" json)


instance boardPackResponseIsForeign :: IsForeign BoardPackResponse where
  read json =
      mkBoardPackResponse
      <$> readProp "board" json
      <*> readProp "board_stat" json
      <*> (runNullOrUndefined <$> readProp "latest_thread" json)
      <*> (runNullOrUndefined <$> readProp "latest_thread_post" json)
      <*> (runNullOrUndefined <$> readProp "latest_thread_post_user" json)


instance boardPackResponseShow :: Show BoardPackResponse where
    show (BoardPackResponse o) = show "board: " ++ show o.board ++ ", " ++ show "boardStat: " ++ show o.boardStat ++ ", " ++ show "latestThread: " ++ show o.latestThread ++ ", " ++ show "latestThreadPost: " ++ show o.latestThreadPost ++ ", " ++ show "latestThreadPostUser: " ++ show o.latestThreadPostUser

newtype BoardPackResponses = BoardPackResponses {
  boardPackResponses :: (Array  BoardPackResponse)
}


_BoardPackResponses :: LensP BoardPackResponses {
  boardPackResponses :: (Array  BoardPackResponse)
}
_BoardPackResponses f (BoardPackResponses o) = BoardPackResponses <$> f o


mkBoardPackResponses :: (Array  BoardPackResponse) -> BoardPackResponses
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

newtype OrganizationPackResponse = OrganizationPackResponse {
  organization :: OrganizationResponse,
  organizationStat :: OrganizationStatResponse
}


_OrganizationPackResponse :: LensP OrganizationPackResponse {
  organization :: OrganizationResponse,
  organizationStat :: OrganizationStatResponse
}
_OrganizationPackResponse f (OrganizationPackResponse o) = OrganizationPackResponse <$> f o


mkOrganizationPackResponse :: OrganizationResponse -> OrganizationStatResponse -> OrganizationPackResponse
mkOrganizationPackResponse organization organizationStat =
  OrganizationPackResponse{organization, organizationStat}


unwrapOrganizationPackResponse (OrganizationPackResponse r) = r

instance organizationPackResponseEncodeJson :: EncodeJson OrganizationPackResponse where
  encodeJson (OrganizationPackResponse o) =
       "tag" := "OrganizationPackResponse"
    ~> "organization" := o.organization
    ~> "organization_stat" := o.organizationStat
    ~> jsonEmptyObject


instance organizationPackResponseDecodeJson :: DecodeJson OrganizationPackResponse where
  decodeJson o = do
    obj <- decodeJson o
    organization <- obj .? "organization"
    organizationStat <- obj .? "organization_stat"
    pure $ OrganizationPackResponse {
      organization,
      organizationStat
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
      <$> readProp "organization" json
      <*> readProp "organization_stat" json


instance organizationPackResponseIsForeign :: IsForeign OrganizationPackResponse where
  read json =
      mkOrganizationPackResponse
      <$> readProp "organization" json
      <*> readProp "organization_stat" json


instance organizationPackResponseShow :: Show OrganizationPackResponse where
    show (OrganizationPackResponse o) = show "organization: " ++ show o.organization ++ ", " ++ show "organizationStat: " ++ show o.organizationStat

newtype OrganizationPackResponses = OrganizationPackResponses {
  organizationPackResponses :: (Array  OrganizationPackResponse)
}


_OrganizationPackResponses :: LensP OrganizationPackResponses {
  organizationPackResponses :: (Array  OrganizationPackResponse)
}
_OrganizationPackResponses f (OrganizationPackResponses o) = OrganizationPackResponses <$> f o


mkOrganizationPackResponses :: (Array  OrganizationPackResponse) -> OrganizationPackResponses
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

newtype ThreadPackResponse = ThreadPackResponse {
  thread :: ThreadResponse,
  threadUser :: UserSanitizedResponse,
  threadStat :: ThreadStatResponse,
  latestThreadPost :: (Maybe ThreadPostResponse),
  latestThreadPostUser :: (Maybe UserSanitizedResponse)
}


_ThreadPackResponse :: LensP ThreadPackResponse {
  thread :: ThreadResponse,
  threadUser :: UserSanitizedResponse,
  threadStat :: ThreadStatResponse,
  latestThreadPost :: (Maybe ThreadPostResponse),
  latestThreadPostUser :: (Maybe UserSanitizedResponse)
}
_ThreadPackResponse f (ThreadPackResponse o) = ThreadPackResponse <$> f o


mkThreadPackResponse :: ThreadResponse -> UserSanitizedResponse -> ThreadStatResponse -> (Maybe ThreadPostResponse) -> (Maybe UserSanitizedResponse) -> ThreadPackResponse
mkThreadPackResponse thread threadUser threadStat latestThreadPost latestThreadPostUser =
  ThreadPackResponse{thread, threadUser, threadStat, latestThreadPost, latestThreadPostUser}


unwrapThreadPackResponse (ThreadPackResponse r) = r

instance threadPackResponseEncodeJson :: EncodeJson ThreadPackResponse where
  encodeJson (ThreadPackResponse o) =
       "tag" := "ThreadPackResponse"
    ~> "thread" := o.thread
    ~> "thread_user" := o.threadUser
    ~> "thread_stat" := o.threadStat
    ~> "latest_thread_post" := o.latestThreadPost
    ~> "latest_thread_post_user" := o.latestThreadPostUser
    ~> jsonEmptyObject


instance threadPackResponseDecodeJson :: DecodeJson ThreadPackResponse where
  decodeJson o = do
    obj <- decodeJson o
    thread <- obj .? "thread"
    threadUser <- obj .? "thread_user"
    threadStat <- obj .? "thread_stat"
    latestThreadPost <- obj .? "latest_thread_post"
    latestThreadPostUser <- obj .? "latest_thread_post_user"
    pure $ ThreadPackResponse {
      thread,
      threadUser,
      threadStat,
      latestThreadPost,
      latestThreadPostUser
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
      <*> readProp "thread_user" json
      <*> readProp "thread_stat" json
      <*> (runNullOrUndefined <$> readProp "latest_thread_post" json)
      <*> (runNullOrUndefined <$> readProp "latest_thread_post_user" json)


instance threadPackResponseIsForeign :: IsForeign ThreadPackResponse where
  read json =
      mkThreadPackResponse
      <$> readProp "thread" json
      <*> readProp "thread_user" json
      <*> readProp "thread_stat" json
      <*> (runNullOrUndefined <$> readProp "latest_thread_post" json)
      <*> (runNullOrUndefined <$> readProp "latest_thread_post_user" json)


instance threadPackResponseShow :: Show ThreadPackResponse where
    show (ThreadPackResponse o) = show "thread: " ++ show o.thread ++ ", " ++ show "threadUser: " ++ show o.threadUser ++ ", " ++ show "threadStat: " ++ show o.threadStat ++ ", " ++ show "latestThreadPost: " ++ show o.latestThreadPost ++ ", " ++ show "latestThreadPostUser: " ++ show o.latestThreadPostUser

newtype ThreadPackResponses = ThreadPackResponses {
  threadPackResponses :: (Array  ThreadPackResponse)
}


_ThreadPackResponses :: LensP ThreadPackResponses {
  threadPackResponses :: (Array  ThreadPackResponse)
}
_ThreadPackResponses f (ThreadPackResponses o) = ThreadPackResponses <$> f o


mkThreadPackResponses :: (Array  ThreadPackResponse) -> ThreadPackResponses
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
  user :: UserSanitizedResponse,
  stat :: ThreadPostStatResponse,
  like :: (Maybe ThreadPostLikeResponse)
}


_ThreadPostPackResponse :: LensP ThreadPostPackResponse {
  threadPost :: ThreadPostResponse,
  user :: UserSanitizedResponse,
  stat :: ThreadPostStatResponse,
  like :: (Maybe ThreadPostLikeResponse)
}
_ThreadPostPackResponse f (ThreadPostPackResponse o) = ThreadPostPackResponse <$> f o


mkThreadPostPackResponse :: ThreadPostResponse -> UserSanitizedResponse -> ThreadPostStatResponse -> (Maybe ThreadPostLikeResponse) -> ThreadPostPackResponse
mkThreadPostPackResponse threadPost user stat like =
  ThreadPostPackResponse{threadPost, user, stat, like}


unwrapThreadPostPackResponse (ThreadPostPackResponse r) = r

instance threadPostPackResponseEncodeJson :: EncodeJson ThreadPostPackResponse where
  encodeJson (ThreadPostPackResponse o) =
       "tag" := "ThreadPostPackResponse"
    ~> "thread_post" := o.threadPost
    ~> "user" := o.user
    ~> "stat" := o.stat
    ~> "like" := o.like
    ~> jsonEmptyObject


instance threadPostPackResponseDecodeJson :: DecodeJson ThreadPostPackResponse where
  decodeJson o = do
    obj <- decodeJson o
    threadPost <- obj .? "thread_post"
    user <- obj .? "user"
    stat <- obj .? "stat"
    like <- obj .? "like"
    pure $ ThreadPostPackResponse {
      threadPost,
      user,
      stat,
      like
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
      <*> readProp "user" json
      <*> readProp "stat" json
      <*> (runNullOrUndefined <$> readProp "like" json)


instance threadPostPackResponseIsForeign :: IsForeign ThreadPostPackResponse where
  read json =
      mkThreadPostPackResponse
      <$> readProp "thread_post" json
      <*> readProp "user" json
      <*> readProp "stat" json
      <*> (runNullOrUndefined <$> readProp "like" json)


instance threadPostPackResponseShow :: Show ThreadPostPackResponse where
    show (ThreadPostPackResponse o) = show "threadPost: " ++ show o.threadPost ++ ", " ++ show "user: " ++ show o.user ++ ", " ++ show "stat: " ++ show o.stat ++ ", " ++ show "like: " ++ show o.like

newtype ThreadPostPackResponses = ThreadPostPackResponses {
  threadPostPackResponses :: (Array  ThreadPostPackResponse)
}


_ThreadPostPackResponses :: LensP ThreadPostPackResponses {
  threadPostPackResponses :: (Array  ThreadPostPackResponse)
}
_ThreadPostPackResponses f (ThreadPostPackResponses o) = ThreadPostPackResponses <$> f o


mkThreadPostPackResponses :: (Array  ThreadPostPackResponse) -> ThreadPostPackResponses
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

newtype UserPackResponse = UserPackResponse {
  user :: UserResponse,
  userStat :: UserSanitizedStatResponse,
  userProfile :: ProfileResponse
}


_UserPackResponse :: LensP UserPackResponse {
  user :: UserResponse,
  userStat :: UserSanitizedStatResponse,
  userProfile :: ProfileResponse
}
_UserPackResponse f (UserPackResponse o) = UserPackResponse <$> f o


mkUserPackResponse :: UserResponse -> UserSanitizedStatResponse -> ProfileResponse -> UserPackResponse
mkUserPackResponse user userStat userProfile =
  UserPackResponse{user, userStat, userProfile}


unwrapUserPackResponse (UserPackResponse r) = r

instance userPackResponseEncodeJson :: EncodeJson UserPackResponse where
  encodeJson (UserPackResponse o) =
       "tag" := "UserPackResponse"
    ~> "user" := o.user
    ~> "user_stat" := o.userStat
    ~> "user_profile" := o.userProfile
    ~> jsonEmptyObject


instance userPackResponseDecodeJson :: DecodeJson UserPackResponse where
  decodeJson o = do
    obj <- decodeJson o
    user <- obj .? "user"
    userStat <- obj .? "user_stat"
    userProfile <- obj .? "user_profile"
    pure $ UserPackResponse {
      user,
      userStat,
      userProfile
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
      <*> readProp "user_stat" json
      <*> readProp "user_profile" json


instance userPackResponseIsForeign :: IsForeign UserPackResponse where
  read json =
      mkUserPackResponse
      <$> readProp "user" json
      <*> readProp "user_stat" json
      <*> readProp "user_profile" json


instance userPackResponseShow :: Show UserPackResponse where
    show (UserPackResponse o) = show "user: " ++ show o.user ++ ", " ++ show "userStat: " ++ show o.userStat ++ ", " ++ show "userProfile: " ++ show o.userProfile

newtype UserPackResponses = UserPackResponses {
  userPackResponses :: (Array  UserPackResponse)
}


_UserPackResponses :: LensP UserPackResponses {
  userPackResponses :: (Array  UserPackResponse)
}
_UserPackResponses f (UserPackResponses o) = UserPackResponses <$> f o


mkUserPackResponses :: (Array  UserPackResponse) -> UserPackResponses
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
  userStat :: UserSanitizedStatResponse,
  userProfile :: ProfileResponse
}


_UserSanitizedPackResponse :: LensP UserSanitizedPackResponse {
  user :: UserSanitizedResponse,
  userStat :: UserSanitizedStatResponse,
  userProfile :: ProfileResponse
}
_UserSanitizedPackResponse f (UserSanitizedPackResponse o) = UserSanitizedPackResponse <$> f o


mkUserSanitizedPackResponse :: UserSanitizedResponse -> UserSanitizedStatResponse -> ProfileResponse -> UserSanitizedPackResponse
mkUserSanitizedPackResponse user userStat userProfile =
  UserSanitizedPackResponse{user, userStat, userProfile}


unwrapUserSanitizedPackResponse (UserSanitizedPackResponse r) = r

instance userSanitizedPackResponseEncodeJson :: EncodeJson UserSanitizedPackResponse where
  encodeJson (UserSanitizedPackResponse o) =
       "tag" := "UserSanitizedPackResponse"
    ~> "user" := o.user
    ~> "user_stat" := o.userStat
    ~> "user_profile" := o.userProfile
    ~> jsonEmptyObject


instance userSanitizedPackResponseDecodeJson :: DecodeJson UserSanitizedPackResponse where
  decodeJson o = do
    obj <- decodeJson o
    user <- obj .? "user"
    userStat <- obj .? "user_stat"
    userProfile <- obj .? "user_profile"
    pure $ UserSanitizedPackResponse {
      user,
      userStat,
      userProfile
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
      <*> readProp "user_stat" json
      <*> readProp "user_profile" json


instance userSanitizedPackResponseIsForeign :: IsForeign UserSanitizedPackResponse where
  read json =
      mkUserSanitizedPackResponse
      <$> readProp "user" json
      <*> readProp "user_stat" json
      <*> readProp "user_profile" json


instance userSanitizedPackResponseShow :: Show UserSanitizedPackResponse where
    show (UserSanitizedPackResponse o) = show "user: " ++ show o.user ++ ", " ++ show "userStat: " ++ show o.userStat ++ ", " ++ show "userProfile: " ++ show o.userProfile

newtype UserSanitizedPackResponses = UserSanitizedPackResponses {
  userSanitizedPackResponses :: (Array  UserSanitizedPackResponse)
}


_UserSanitizedPackResponses :: LensP UserSanitizedPackResponses {
  userSanitizedPackResponses :: (Array  UserSanitizedPackResponse)
}
_UserSanitizedPackResponses f (UserSanitizedPackResponses o) = UserSanitizedPackResponses <$> f o


mkUserSanitizedPackResponses :: (Array  UserSanitizedPackResponse) -> UserSanitizedPackResponses
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

a_ :: forall b a r. Lens { a :: a | r } { a :: b | r } a b
a_ f o = o { a = _ } <$> f o.a


abbreviation_ :: forall b a r. Lens { abbreviation :: a | r } { abbreviation :: b | r } a b
abbreviation_ f o = o { abbreviation = _ } <$> f o.abbreviation


active_ :: forall b a r. Lens { active :: a | r } { active :: b | r } a b
active_ f o = o { active = _ } <$> f o.active


activityAt_ :: forall b a r. Lens { activityAt :: a | r } { activityAt :: b | r } a b
activityAt_ f o = o { activityAt = _ } <$> f o.activityAt


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


board_ :: forall b a r. Lens { board :: a | r } { board :: b | r } a b
board_ f o = o { board = _ } <$> f o.board


boardId_ :: forall b a r. Lens { boardId :: a | r } { boardId :: b | r } a b
boardId_ f o = o { boardId = _ } <$> f o.boardId


boardPackResponses_ :: forall b a r. Lens { boardPackResponses :: a | r } { boardPackResponses :: b | r } a b
boardPackResponses_ f o = o { boardPackResponses = _ } <$> f o.boardPackResponses


boardResponses_ :: forall b a r. Lens { boardResponses :: a | r } { boardResponses :: b | r } a b
boardResponses_ f o = o { boardResponses = _ } <$> f o.boardResponses


boardStat_ :: forall b a r. Lens { boardStat :: a | r } { boardStat :: b | r } a b
boardStat_ f o = o { boardStat = _ } <$> f o.boardStat


boardStatResponses_ :: forall b a r. Lens { boardStatResponses :: a | r } { boardStatResponses :: b | r } a b
boardStatResponses_ f o = o { boardStatResponses = _ } <$> f o.boardStatResponses


boards_ :: forall b a r. Lens { boards :: a | r } { boards :: b | r } a b
boards_ f o = o { boards = _ } <$> f o.boards


body_ :: forall b a r. Lens { body :: a | r } { body :: b | r } a b
body_ f o = o { body = _ } <$> f o.body


bucketResponses_ :: forall b a r. Lens { bucketResponses :: a | r } { bucketResponses :: b | r } a b
bucketResponses_ f o = o { bucketResponses = _ } <$> f o.bucketResponses


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


dcardBack_ :: forall b a r. Lens { dcardBack :: a | r } { dcardBack :: b | r } a b
dcardBack_ f o = o { dcardBack = _ } <$> f o.dcardBack


dcardFront_ :: forall b a r. Lens { dcardFront :: a | r } { dcardFront :: b | r } a b
dcardFront_ f o = o { dcardFront = _ } <$> f o.dcardFront


dcardxBack_ :: forall b a r. Lens { dcardxBack :: a | r } { dcardxBack :: b | r } a b
dcardxBack_ f o = o { dcardxBack = _ } <$> f o.dcardxBack


dcardxFront_ :: forall b a r. Lens { dcardxFront :: a | r } { dcardxFront :: b | r } a b
dcardxFront_ f o = o { dcardxFront = _ } <$> f o.dcardxFront


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


displayNick_ :: forall b a r. Lens { displayNick :: a | r } { displayNick :: b | r } a b
displayNick_ f o = o { displayNick = _ } <$> f o.displayNick


email_ :: forall b a r. Lens { email :: a | r } { email :: b | r } a b
email_ f o = o { email = _ } <$> f o.email


emailMD5_ :: forall b a r. Lens { emailMD5 :: a | r } { emailMD5 :: b | r } a b
emailMD5_ f o = o { emailMD5 = _ } <$> f o.emailMD5


emptyResponses_ :: forall b a r. Lens { emptyResponses :: a | r } { emptyResponses :: b | r } a b
emptyResponses_ f o = o { emptyResponses = _ } <$> f o.emptyResponses


entityId_ :: forall b a r. Lens { entityId :: a | r } { entityId :: b | r } a b
entityId_ f o = o { entityId = _ } <$> f o.entityId


examples_ :: forall b a r. Lens { examples :: a | r } { examples :: b | r } a b
examples_ f o = o { examples = _ } <$> f o.examples


fact_ :: forall b a r. Lens { fact :: a | r } { fact :: b | r } a b
fact_ f o = o { fact = _ } <$> f o.fact


filters_ :: forall b a r. Lens { filters :: a | r } { filters :: b | r } a b
filters_ f o = o { filters = _ } <$> f o.filters


forumId_ :: forall b a r. Lens { forumId :: a | r } { forumId :: b | r } a b
forumId_ f o = o { forumId = _ } <$> f o.forumId


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


id_ :: forall b a r. Lens { id :: a | r } { id :: b | r } a b
id_ f o = o { id = _ } <$> f o.id


ident_ :: forall b a r. Lens { ident :: a | r } { ident :: b | r } a b
ident_ f o = o { ident = _ } <$> f o.ident


imageUrl_ :: forall b a r. Lens { imageUrl :: a | r } { imageUrl :: b | r } a b
imageUrl_ f o = o { imageUrl = _ } <$> f o.imageUrl


isNew_ :: forall b a r. Lens { isNew :: a | r } { isNew :: b | r } a b
isNew_ f o = o { isNew = _ } <$> f o.isNew


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


leuronResponses_ :: forall b a r. Lens { leuronResponses :: a | r } { leuronResponses :: b | r } a b
leuronResponses_ f o = o { leuronResponses = _ } <$> f o.leuronResponses


leurons_ :: forall b a r. Lens { leurons :: a | r } { leurons :: b | r } a b
leurons_ f o = o { leurons = _ } <$> f o.leurons


like_ :: forall b a r. Lens { like :: a | r } { like :: b | r } a b
like_ f o = o { like = _ } <$> f o.like


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


organizationStat_ :: forall b a r. Lens { organizationStat :: a | r } { organizationStat :: b | r } a b
organizationStat_ f o = o { organizationStat = _ } <$> f o.organizationStat


organizationStatResponses_ :: forall b a r. Lens { organizationStatResponses :: a | r } { organizationStatResponses :: b | r } a b
organizationStatResponses_ f o = o { organizationStatResponses = _ } <$> f o.organizationStatResponses


page_ :: forall b a r. Lens { page :: a | r } { page :: b | r } a b
page_ f o = o { page = _ } <$> f o.page


parentFolderId_ :: forall b a r. Lens { parentFolderId :: a | r } { parentFolderId :: b | r } a b
parentFolderId_ f o = o { parentFolderId = _ } <$> f o.parentFolderId


parentId_ :: forall b a r. Lens { parentId :: a | r } { parentId :: b | r } a b
parentId_ f o = o { parentId = _ } <$> f o.parentId


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


profileEmail_ :: forall b a r. Lens { profileEmail :: a | r } { profileEmail :: b | r } a b
profileEmail_ f o = o { profileEmail = _ } <$> f o.profileEmail


profileName_ :: forall b a r. Lens { profileName :: a | r } { profileName :: b | r } a b
profileName_ f o = o { profileName = _ } <$> f o.profileName


profileResponses_ :: forall b a r. Lens { profileResponses :: a | r } { profileResponses :: b | r } a b
profileResponses_ f o = o { profileResponses = _ } <$> f o.profileResponses


qaAnswer_ :: forall b a r. Lens { qaAnswer :: a | r } { qaAnswer :: b | r } a b
qaAnswer_ f o = o { qaAnswer = _ } <$> f o.qaAnswer


qaQuestion_ :: forall b a r. Lens { qaQuestion :: a | r } { qaQuestion :: b | r } a b
qaQuestion_ f o = o { qaQuestion = _ } <$> f o.qaQuestion


reason_ :: forall b a r. Lens { reason :: a | r } { reason :: b | r } a b
reason_ f o = o { reason = _ } <$> f o.reason


reminderFolderResponses_ :: forall b a r. Lens { reminderFolderResponses :: a | r } { reminderFolderResponses :: b | r } a b
reminderFolderResponses_ f o = o { reminderFolderResponses = _ } <$> f o.reminderFolderResponses


reminderResponses_ :: forall b a r. Lens { reminderResponses :: a | r } { reminderResponses :: b | r } a b
reminderResponses_ f o = o { reminderResponses = _ } <$> f o.reminderResponses


resourceId_ :: forall b a r. Lens { resourceId :: a | r } { resourceId :: b | r } a b
resourceId_ f o = o { resourceId = _ } <$> f o.resourceId


resourceResponses_ :: forall b a r. Lens { resourceResponses :: a | r } { resourceResponses :: b | r } a b
resourceResponses_ f o = o { resourceResponses = _ } <$> f o.resourceResponses


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


starred_ :: forall b a r. Lens { starred :: a | r } { starred :: b | r } a b
starred_ f o = o { starred = _ } <$> f o.starred


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


tags_ :: forall b a r. Lens { tags :: a | r } { tags :: b | r } a b
tags_ f o = o { tags = _ } <$> f o.tags


teamResponses_ :: forall b a r. Lens { teamResponses :: a | r } { teamResponses :: b | r } a b
teamResponses_ f o = o { teamResponses = _ } <$> f o.teamResponses


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


threadPostLikeResponses_ :: forall b a r. Lens { threadPostLikeResponses :: a | r } { threadPostLikeResponses :: b | r } a b
threadPostLikeResponses_ f o = o { threadPostLikeResponses = _ } <$> f o.threadPostLikeResponses


threadPostLikeStatResponses_ :: forall b a r. Lens { threadPostLikeStatResponses :: a | r } { threadPostLikeStatResponses :: b | r } a b
threadPostLikeStatResponses_ f o = o { threadPostLikeStatResponses = _ } <$> f o.threadPostLikeStatResponses


threadPostPackResponses_ :: forall b a r. Lens { threadPostPackResponses :: a | r } { threadPostPackResponses :: b | r } a b
threadPostPackResponses_ f o = o { threadPostPackResponses = _ } <$> f o.threadPostPackResponses


threadPostResponses_ :: forall b a r. Lens { threadPostResponses :: a | r } { threadPostResponses :: b | r } a b
threadPostResponses_ f o = o { threadPostResponses = _ } <$> f o.threadPostResponses


threadPostStatResponses_ :: forall b a r. Lens { threadPostStatResponses :: a | r } { threadPostStatResponses :: b | r } a b
threadPostStatResponses_ f o = o { threadPostStatResponses = _ } <$> f o.threadPostStatResponses


threadPosts_ :: forall b a r. Lens { threadPosts :: a | r } { threadPosts :: b | r } a b
threadPosts_ f o = o { threadPosts = _ } <$> f o.threadPosts


threadResponses_ :: forall b a r. Lens { threadResponses :: a | r } { threadResponses :: b | r } a b
threadResponses_ f o = o { threadResponses = _ } <$> f o.threadResponses


threadStat_ :: forall b a r. Lens { threadStat :: a | r } { threadStat :: b | r } a b
threadStat_ f o = o { threadStat = _ } <$> f o.threadStat


threadStatResponses_ :: forall b a r. Lens { threadStatResponses :: a | r } { threadStatResponses :: b | r } a b
threadStatResponses_ f o = o { threadStatResponses = _ } <$> f o.threadStatResponses


threadUser_ :: forall b a r. Lens { threadUser :: a | r } { threadUser :: b | r } a b
threadUser_ f o = o { threadUser = _ } <$> f o.threadUser


threads_ :: forall b a r. Lens { threads :: a | r } { threads :: b | r } a b
threads_ f o = o { threads = _ } <$> f o.threads


title_ :: forall b a r. Lens { title :: a | r } { title :: b | r } a b
title_ f o = o { title = _ } <$> f o.title


toUserId_ :: forall b a r. Lens { toUserId :: a | r } { toUserId :: b | r } a b
toUserId_ f o = o { toUserId = _ } <$> f o.toUserId


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


userProfile_ :: forall b a r. Lens { userProfile :: a | r } { userProfile :: b | r } a b
userProfile_ f o = o { userProfile = _ } <$> f o.userProfile


userResponses_ :: forall b a r. Lens { userResponses :: a | r } { userResponses :: b | r } a b
userResponses_ f o = o { userResponses = _ } <$> f o.userResponses


userSanitizedPackResponses_ :: forall b a r. Lens { userSanitizedPackResponses :: a | r } { userSanitizedPackResponses :: b | r } a b
userSanitizedPackResponses_ f o = o { userSanitizedPackResponses = _ } <$> f o.userSanitizedPackResponses


userSanitizedResponses_ :: forall b a r. Lens { userSanitizedResponses :: a | r } { userSanitizedResponses :: b | r } a b
userSanitizedResponses_ f o = o { userSanitizedResponses = _ } <$> f o.userSanitizedResponses


userSanitizedStatResponses_ :: forall b a r. Lens { userSanitizedStatResponses :: a | r } { userSanitizedStatResponses :: b | r } a b
userSanitizedStatResponses_ f o = o { userSanitizedStatResponses = _ } <$> f o.userSanitizedStatResponses


userStat_ :: forall b a r. Lens { userStat :: a | r } { userStat :: b | r } a b
userStat_ f o = o { userStat = _ } <$> f o.userStat


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
  qp (ByUserId user_id)                  = Tuple "user_id" (show user_id)
  qp (ByUsersIds users_ids)              = Tuple "users_ids" (show users_ids)
  qp (ByUserNick nick)                   = Tuple "user_nick" (show nick)
  qp (ByUsersNicks nicks)                = Tuple "users_nicks" (show nicks)
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
  qp (Timestamp ts)                      = Tuple "ts" (show ts)
  qp (UnixTimestamp unix_ts)             = Tuple "unix_ts" (show unix_ts)
  qp (CreatedAtTimestamp created_at)     = Tuple "created_at_ts" (show created_at)
  qp (CreatedAtUnixTimestamp created_at) = Tuple "created_at_unix_ts" (show created_at)
  qp (RealIP real_ip)                    = Tuple "real_ip" (real_ip)
  qp (IP ip)                             = Tuple "ip" (ip)



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
  show ParamTag_ByUserId               = "user_id"
  show ParamTag_ByUsersIds             = "users_ids"
  show ParamTag_ByUserNick             = "user_nick"
  show ParamTag_ByUsersNicks           = "users_nicks"
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
  show ParamTag_Timestamp              = "ts"
  show ParamTag_UnixTimestamp          = "unix_ts"
  show ParamTag_CreatedAtTimestamp     = "created_at_ts"
  show ParamTag_CreatedAtUnixTimestamp = "created_at_unix_ts"
  show ParamTag_RealIP                 = "real_ip"
  show ParamTag_IP                     = "ip"



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
