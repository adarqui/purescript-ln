module LN.T.Internal.Convert where


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

import LN.T.Internal.Types

apiRequestToApiResponse :: Int -> Int -> String -> (Maybe Date) -> (Maybe Date) -> ApiRequest -> ApiResponse
apiRequestToApiResponse id userId key createdAt modifiedAt (ApiRequest o) =
  ApiResponse {
    id: id,
    userId: userId,
    key: key,
    comment: o.comment,
    createdAt: createdAt,
    modifiedAt: modifiedAt
  }


apiResponseToApiRequest :: ApiResponse -> ApiRequest
apiResponseToApiRequest  (ApiResponse o) =
  ApiRequest {
    comment: o.comment
  }


boardRequestToBoardResponse :: Int -> Int -> Int -> (Maybe Int) -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> BoardRequest -> BoardResponse
boardRequestToBoardResponse id userId forumId parentId createdAt modifiedBy modifiedAt (BoardRequest o) =
  BoardResponse {
    id: id,
    userId: userId,
    forumId: forumId,
    parentId: parentId,
    name: o.name,
    description: o.description,
    icon: o.icon,
    tags: o.tags,
    createdAt: createdAt,
    modifiedBy: modifiedBy,
    modifiedAt: modifiedAt
  }


boardResponseToBoardRequest :: BoardResponse -> BoardRequest
boardResponseToBoardRequest  (BoardResponse o) =
  BoardRequest {
    name: o.name,
    description: o.description,
    icon: o.icon,
    tags: o.tags
  }


bucketRequestToBucketResponse :: Int -> Int -> (Maybe Date) -> (Maybe Date) -> BucketRequest -> BucketResponse
bucketRequestToBucketResponse id userId createdAt modifiedAt (BucketRequest o) =
  BucketResponse {
    id: id,
    userId: userId,
    name: o.name,
    description: o.description,
    scoreLo: o.scoreLo,
    scoreHi: o.scoreHi,
    leurons: o.leurons,
    resources: o.resources,
    categories: o.categories,
    filters: o.filters,
    createdAt: createdAt,
    modifiedAt: modifiedAt
  }


bucketResponseToBucketRequest :: BucketResponse -> BucketRequest
bucketResponseToBucketRequest  (BucketResponse o) =
  BucketRequest {
    name: o.name,
    description: o.description,
    scoreLo: o.scoreLo,
    scoreHi: o.scoreHi,
    leurons: o.leurons,
    resources: o.resources,
    categories: o.categories,
    filters: o.filters
  }


emptyRequestToEmptyResponse :: Int -> Int -> (Maybe Date) -> (Maybe Date) -> EmptyRequest -> EmptyResponse
emptyRequestToEmptyResponse id userId createdAt modifiedAt (EmptyRequest o) =
  EmptyResponse {
    id: id,
    userId: userId,
    value: o.value,
    createdAt: createdAt,
    modifiedAt: modifiedAt
  }


emptyResponseToEmptyRequest :: EmptyResponse -> EmptyRequest
emptyResponseToEmptyRequest  (EmptyResponse o) =
  EmptyRequest {
    value: o.value
  }


forumRequestToForumResponse :: Int -> Int -> Int -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> ForumRequest -> ForumResponse
forumRequestToForumResponse id userId orgId createdAt modifiedBy modifiedAt (ForumRequest o) =
  ForumResponse {
    id: id,
    userId: userId,
    orgId: orgId,
    name: o.name,
    description: o.description,
    icon: o.icon,
    tags: o.tags,
    visibility: o.visibility,
    createdAt: createdAt,
    modifiedBy: modifiedBy,
    modifiedAt: modifiedAt
  }


forumResponseToForumRequest :: ForumResponse -> ForumRequest
forumResponseToForumRequest  (ForumResponse o) =
  ForumRequest {
    name: o.name,
    description: o.description,
    icon: o.icon,
    tags: o.tags,
    visibility: o.visibility
  }


leuronRequestToLeuronResponse :: Int -> Int -> Int -> (Maybe Date) -> (Maybe Date) -> LeuronRequest -> LeuronResponse
leuronRequestToLeuronResponse id userId resourceId createdAt modifiedAt (LeuronRequest o) =
  LeuronResponse {
    id: id,
    userId: userId,
    resourceId: resourceId,
    dataP: o.dataP,
    title: o.title,
    description: o.description,
    section: o.section,
    page: o.page,
    examples: o.examples,
    strengths: o.strengths,
    categories: o.categories,
    splits: o.splits,
    substitutions: o.substitutions,
    tags: o.tags,
    style: o.style,
    createdAt: createdAt,
    modifiedAt: modifiedAt
  }


leuronResponseToLeuronRequest :: LeuronResponse -> LeuronRequest
leuronResponseToLeuronRequest  (LeuronResponse o) =
  LeuronRequest {
    dataP: o.dataP,
    title: o.title,
    description: o.description,
    section: o.section,
    page: o.page,
    examples: o.examples,
    strengths: o.strengths,
    categories: o.categories,
    splits: o.splits,
    substitutions: o.substitutions,
    tags: o.tags,
    style: o.style
  }


leuronTrainingRequestToLeuronTrainingResponse :: Int -> Int -> Int -> (Maybe Date) -> (Maybe Date) -> LeuronTrainingRequest -> LeuronTrainingResponse
leuronTrainingRequestToLeuronTrainingResponse id userId leuronId createdAt modifiedAt (LeuronTrainingRequest o) =
  LeuronTrainingResponse {
    id: id,
    userId: userId,
    leuronId: leuronId,
    summary: o.summary,
    createdAt: createdAt,
    modifiedAt: modifiedAt
  }


leuronTrainingResponseToLeuronTrainingRequest :: LeuronTrainingResponse -> LeuronTrainingRequest
leuronTrainingResponseToLeuronTrainingRequest  (LeuronTrainingResponse o) =
  LeuronTrainingRequest {
    summary: o.summary
  }


likeRequestToLikeResponse :: Int -> Ent -> Int -> Int -> Int -> (Maybe Date) -> (Maybe Date) -> LikeRequest -> LikeResponse
likeRequestToLikeResponse id ent entId userId score createdAt modifiedAt (LikeRequest o) =
  LikeResponse {
    id: id,
    ent: ent,
    entId: entId,
    userId: userId,
    opt: o.opt,
    score: score,
    reason: o.reason,
    createdAt: createdAt,
    modifiedAt: modifiedAt
  }


likeResponseToLikeRequest :: LikeResponse -> LikeRequest
likeResponseToLikeRequest  (LikeResponse o) =
  LikeRequest {
    opt: o.opt,
    reason: o.reason
  }


organizationRequestToOrganizationResponse :: Int -> Int -> String -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> OrganizationRequest -> OrganizationResponse
organizationRequestToOrganizationResponse id userId emailMD5 createdAt modifiedBy modifiedAt (OrganizationRequest o) =
  OrganizationResponse {
    id: id,
    userId: userId,
    name: o.name,
    description: o.description,
    company: o.company,
    location: o.location,
    email: o.email,
    emailMD5: emailMD5,
    membership: o.membership,
    icon: o.icon,
    tags: o.tags,
    visibility: o.visibility,
    createdAt: createdAt,
    modifiedBy: modifiedBy,
    modifiedAt: modifiedAt
  }


organizationResponseToOrganizationRequest :: OrganizationResponse -> OrganizationRequest
organizationResponseToOrganizationRequest  (OrganizationResponse o) =
  OrganizationRequest {
    name: o.name,
    description: o.description,
    company: o.company,
    location: o.location,
    email: o.email,
    membership: o.membership,
    tags: o.tags,
    icon: o.icon,
    visibility: o.visibility
  }


pmRequestToPmResponse :: Int -> Int -> Int -> (Maybe Date) -> (Maybe Date) -> PmRequest -> PmResponse
pmRequestToPmResponse id userId toUserId createdAt modifiedAt (PmRequest o) =
  PmResponse {
    id: id,
    userId: userId,
    toUserId: toUserId,
    subject: o.subject,
    body: o.body,
    createdAt: createdAt,
    modifiedAt: modifiedAt
  }


pmResponseToPmRequest :: PmResponse -> PmRequest
pmResponseToPmRequest  (PmResponse o) =
  PmRequest {
    subject: o.subject,
    body: o.body
  }


pmInRequestToPmInResponse :: Int -> Int -> Int -> Boolean -> Boolean -> (Maybe Date) -> (Maybe Date) -> PmInRequest -> PmInResponse
pmInRequestToPmInResponse id pmId userId isNew isSaved createdAt modifiedAt (PmInRequest o) =
  PmInResponse {
    id: id,
    pmId: pmId,
    userId: userId,
    label: o.label,
    isRead: o.isRead,
    isStarred: o.isStarred,
    isNew: isNew,
    isSaved: isSaved,
    createdAt: createdAt,
    modifiedAt: modifiedAt
  }


pmInResponseToPmInRequest :: PmInResponse -> PmInRequest
pmInResponseToPmInRequest  (PmInResponse o) =
  PmInRequest {
    label: o.label,
    isRead: o.isRead,
    isStarred: o.isStarred
  }


pmOutRequestToPmOutResponse :: Int -> Int -> Int -> Boolean -> (Maybe Date) -> (Maybe Date) -> PmOutRequest -> PmOutResponse
pmOutRequestToPmOutResponse id pmId userId isSaved createdAt modifiedAt (PmOutRequest o) =
  PmOutResponse {
    id: id,
    pmId: pmId,
    userId: userId,
    label: o.label,
    isSaved: isSaved,
    createdAt: createdAt,
    modifiedAt: modifiedAt
  }


pmOutResponseToPmOutRequest :: PmOutResponse -> PmOutRequest
pmOutResponseToPmOutRequest  (PmOutResponse o) =
  PmOutRequest {
    label: o.label
  }


profileRequestToProfileResponse :: Int -> Int -> Int -> Int -> (Maybe Date) -> (Maybe Date) -> ProfileRequest -> ProfileResponse
profileRequestToProfileResponse id entityId karmaGood karmaBad createdAt modifiedAt (ProfileRequest o) =
  ProfileResponse {
    id: id,
    entityId: entityId,
    gender: o.gender,
    birthdate: o.birthdate,
    website: o.website,
    location: o.location,
    signature: o.signature,
    karmaGood: karmaGood,
    karmaBad: karmaBad,
    createdAt: createdAt,
    modifiedAt: modifiedAt
  }


profileResponseToProfileRequest :: ProfileResponse -> ProfileRequest
profileResponseToProfileRequest  (ProfileResponse o) =
  ProfileRequest {
    gender: o.gender,
    birthdate: o.birthdate,
    website: o.website,
    location: o.location,
    signature: o.signature
  }


reminderRequestToReminderResponse :: Int -> Int -> Int -> (Maybe Date) -> (Maybe Date) -> ReminderRequest -> ReminderResponse
reminderRequestToReminderResponse id userId parentFolderId createdAt modifiedAt (ReminderRequest o) =
  ReminderResponse {
    id: id,
    userId: userId,
    parentFolderId: parentFolderId,
    dataP: o.dataP,
    createdAt: createdAt,
    modifiedAt: modifiedAt
  }


reminderResponseToReminderRequest :: ReminderResponse -> ReminderRequest
reminderResponseToReminderRequest  (ReminderResponse o) =
  ReminderRequest {
    dataP: o.dataP
  }


reminderFolderRequestToReminderFolderResponse :: Int -> Int -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> ReminderFolderRequest -> ReminderFolderResponse
reminderFolderRequestToReminderFolderResponse id userId parentFolderId createdAt modifiedAt (ReminderFolderRequest o) =
  ReminderFolderResponse {
    id: id,
    userId: userId,
    parentFolderId: parentFolderId,
    name: o.name,
    visibility: o.visibility,
    description: o.description,
    createdAt: createdAt,
    modifiedAt: modifiedAt
  }


reminderFolderResponseToReminderFolderRequest :: ReminderFolderResponse -> ReminderFolderRequest
reminderFolderResponseToReminderFolderRequest  (ReminderFolderResponse o) =
  ReminderFolderRequest {
    name: o.name,
    description: o.description,
    visibility: o.visibility
  }


resourceRequestToResourceResponse :: Int -> Int -> (Maybe Date) -> (Maybe Date) -> ResourceRequest -> ResourceResponse
resourceRequestToResourceResponse id userId createdAt modifiedAt (ResourceRequest o) =
  ResourceResponse {
    id: id,
    userId: userId,
    title: o.title,
    description: o.description,
    source: o.source,
    author: o.author,
    prerequisites: o.prerequisites,
    categories: o.categories,
    visibility: o.visibility,
    counter: o.counter,
    version: o.version,
    urls: o.urls,
    createdAt: createdAt,
    modifiedAt: modifiedAt
  }


resourceResponseToResourceRequest :: ResourceResponse -> ResourceRequest
resourceResponseToResourceRequest  (ResourceResponse o) =
  ResourceRequest {
    title: o.title,
    description: o.description,
    source: o.source,
    author: o.author,
    prerequisites: o.prerequisites,
    categories: o.categories,
    visibility: o.visibility,
    counter: o.counter,
    version: o.version,
    urls: o.urls
  }


starRequestToStarResponse :: Int -> Ent -> Int -> (Maybe Date) -> (Maybe Date) -> StarRequest -> StarResponse
starRequestToStarResponse id entity userId createdAt modifiedAt (StarRequest o) =
  StarResponse {
    id: id,
    entity: entity,
    userId: userId,
    reason: o.reason,
    createdAt: createdAt,
    modifiedAt: modifiedAt
  }


starResponseToStarRequest :: StarResponse -> StarRequest
starResponseToStarRequest  (StarResponse o) =
  StarRequest {
    reason: o.reason
  }


teamRequestToTeamResponse :: Int -> Int -> Int -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> TeamRequest -> TeamResponse
teamRequestToTeamResponse id userId orgId createdAt modifiedBy modifiedAt (TeamRequest o) =
  TeamResponse {
    id: id,
    userId: userId,
    orgId: orgId,
    name: o.name,
    description: o.description,
    membership: o.membership,
    icon: o.icon,
    tags: o.tags,
    visibility: o.visibility,
    createdAt: createdAt,
    modifiedBy: modifiedBy,
    modifiedAt: modifiedAt
  }


teamResponseToTeamRequest :: TeamResponse -> TeamRequest
teamResponseToTeamRequest  (TeamResponse o) =
  TeamRequest {
    name: o.name,
    description: o.description,
    membership: o.membership,
    icon: o.icon,
    tags: o.tags,
    visibility: o.visibility
  }


threadRequestToThreadResponse :: Int -> Int -> Int -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> ThreadRequest -> ThreadResponse
threadRequestToThreadResponse id userId boardId createdAt modifiedBy modifiedAt activityAt (ThreadRequest o) =
  ThreadResponse {
    id: id,
    userId: userId,
    boardId: boardId,
    name: o.name,
    description: o.description,
    sticky: o.sticky,
    locked: o.locked,
    poll: o.poll,
    icon: o.icon,
    tags: o.tags,
    createdAt: createdAt,
    modifiedBy: modifiedBy,
    modifiedAt: modifiedAt,
    activityAt: activityAt
  }


threadResponseToThreadRequest :: ThreadResponse -> ThreadRequest
threadResponseToThreadRequest  (ThreadResponse o) =
  ThreadRequest {
    name: o.name,
    description: o.description,
    sticky: o.sticky,
    locked: o.locked,
    poll: o.poll,
    icon: o.icon,
    tags: o.tags
  }


threadPostRequestToThreadPostResponse :: Int -> Int -> Int -> (Maybe Int) -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> ThreadPostRequest -> ThreadPostResponse
threadPostRequestToThreadPostResponse id userId threadId parentId createdAt modifiedBy modifiedAt (ThreadPostRequest o) =
  ThreadPostResponse {
    id: id,
    userId: userId,
    threadId: threadId,
    parentId: parentId,
    title: o.title,
    body: o.body,
    tags: o.tags,
    privateTags: o.privateTags,
    createdAt: createdAt,
    modifiedBy: modifiedBy,
    modifiedAt: modifiedAt
  }


threadPostResponseToThreadPostRequest :: ThreadPostResponse -> ThreadPostRequest
threadPostResponseToThreadPostRequest  (ThreadPostResponse o) =
  ThreadPostRequest {
    title: o.title,
    body: o.body,
    tags: o.tags,
    privateTags: o.privateTags
  }


userRequestToUserResponse :: Int -> String -> Boolean -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> UserRequest -> UserResponse
userRequestToUserResponse id emailMD5 active createdAt modifiedAt deactivatedAt (UserRequest o) =
  UserResponse {
    id: id,
    nick: o.nick,
    displayNick: o.displayNick,
    name: o.name,
    email: o.email,
    emailMD5: emailMD5,
    plugin: o.plugin,
    ident: o.ident,
    active: active,
    createdAt: createdAt,
    modifiedAt: modifiedAt,
    deactivatedAt: deactivatedAt
  }


userResponseToUserRequest :: UserResponse -> UserRequest
userResponseToUserRequest  (UserResponse o) =
  UserRequest {
    nick: o.nick,
    displayNick: o.displayNick,
    name: o.name,
    email: o.email,
    plugin: o.plugin,
    ident: o.ident
  }


userRequestToUserSanitizedResponse :: Int -> String -> Boolean -> (Maybe Date) -> UserRequest -> UserSanitizedResponse
userRequestToUserSanitizedResponse id emailMD5 active createdAt (UserRequest o) =
  UserSanitizedResponse {
    id: id,
    nick: o.nick,
    displayNick: o.displayNick,
    emailMD5: emailMD5,
    active: active,
    createdAt: createdAt
  }


userSanitizedResponseToUserRequest :: String -> String -> String -> String -> UserSanitizedResponse -> UserRequest
userSanitizedResponseToUserRequest name email plugin ident (UserSanitizedResponse o) =
  UserRequest {
    nick: o.nick,
    displayNick: o.displayNick,
    name: name,
    email: email,
    plugin: plugin,
    ident: ident
  }



-- footer