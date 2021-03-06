## Module LN.T


### Re-exported from LN.T.Internal.Convert:

#### `apiRequestToApiResponse`

``` purescript
apiRequestToApiResponse :: Int -> Int -> String -> (Maybe Date) -> (Maybe Date) -> ApiRequest -> ApiResponse
```

#### `apiResponseToApiRequest`

``` purescript
apiResponseToApiRequest :: ApiResponse -> ApiRequest
```

#### `boardRequestToBoardResponse`

``` purescript
boardRequestToBoardResponse :: Int -> Int -> Int -> (Maybe Int) -> String -> Boolean -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> BoardRequest -> BoardResponse
```

#### `boardResponseToBoardRequest`

``` purescript
boardResponseToBoardRequest :: BoardResponse -> BoardRequest
```

#### `bucketRequestToBucketResponse`

``` purescript
bucketRequestToBucketResponse :: Int -> Int -> String -> Boolean -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> BucketRequest -> BucketResponse
```

#### `bucketResponseToBucketRequest`

``` purescript
bucketResponseToBucketRequest :: BucketResponse -> BucketRequest
```

#### `emptyRequestToEmptyResponse`

``` purescript
emptyRequestToEmptyResponse :: Int -> Int -> (Maybe Date) -> (Maybe Date) -> EmptyRequest -> EmptyResponse
```

#### `emptyResponseToEmptyRequest`

``` purescript
emptyResponseToEmptyRequest :: EmptyResponse -> EmptyRequest
```

#### `forumRequestToForumResponse`

``` purescript
forumRequestToForumResponse :: Int -> Int -> Int -> String -> Boolean -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> ForumRequest -> ForumResponse
```

#### `forumResponseToForumRequest`

``` purescript
forumResponseToForumRequest :: ForumResponse -> ForumRequest
```

#### `leuronRequestToLeuronResponse`

``` purescript
leuronRequestToLeuronResponse :: Int -> Int -> Int -> Boolean -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> LeuronRequest -> LeuronResponse
```

#### `leuronResponseToLeuronRequest`

``` purescript
leuronResponseToLeuronRequest :: LeuronResponse -> LeuronRequest
```

#### `leuronTrainingRequestToLeuronTrainingResponse`

``` purescript
leuronTrainingRequestToLeuronTrainingResponse :: Int -> Int -> Int -> (Maybe Date) -> (Maybe Date) -> LeuronTrainingRequest -> LeuronTrainingResponse
```

#### `leuronTrainingResponseToLeuronTrainingRequest`

``` purescript
leuronTrainingResponseToLeuronTrainingRequest :: LeuronTrainingResponse -> LeuronTrainingRequest
```

#### `likeRequestToLikeResponse`

``` purescript
likeRequestToLikeResponse :: Int -> Ent -> Int -> Int -> Int -> Boolean -> (Maybe Date) -> (Maybe Date) -> LikeRequest -> LikeResponse
```

#### `likeResponseToLikeRequest`

``` purescript
likeResponseToLikeRequest :: LikeResponse -> LikeRequest
```

#### `organizationRequestToOrganizationResponse`

``` purescript
organizationRequestToOrganizationResponse :: Int -> Int -> String -> String -> Boolean -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> OrganizationRequest -> OrganizationResponse
```

#### `organizationResponseToOrganizationRequest`

``` purescript
organizationResponseToOrganizationRequest :: OrganizationResponse -> OrganizationRequest
```

#### `pmInRequestToPmInResponse`

``` purescript
pmInRequestToPmInResponse :: Int -> Int -> Int -> Boolean -> Boolean -> Boolean -> (Maybe Date) -> (Maybe Date) -> PmInRequest -> PmInResponse
```

#### `pmInResponseToPmInRequest`

``` purescript
pmInResponseToPmInRequest :: PmInResponse -> PmInRequest
```

#### `pmOutRequestToPmOutResponse`

``` purescript
pmOutRequestToPmOutResponse :: Int -> Int -> Int -> Boolean -> Boolean -> (Maybe Date) -> (Maybe Date) -> PmOutRequest -> PmOutResponse
```

#### `pmOutResponseToPmOutRequest`

``` purescript
pmOutResponseToPmOutRequest :: PmOutResponse -> PmOutRequest
```

#### `pmRequestToPmResponse`

``` purescript
pmRequestToPmResponse :: Int -> Int -> Int -> Boolean -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> PmRequest -> PmResponse
```

#### `pmResponseToPmRequest`

``` purescript
pmResponseToPmRequest :: PmResponse -> PmRequest
```

#### `profileRequestToProfileResponse`

``` purescript
profileRequestToProfileResponse :: Int -> Ent -> Int -> Int -> Int -> (Maybe Date) -> (Maybe Date) -> ProfileRequest -> ProfileResponse
```

#### `profileResponseToProfileRequest`

``` purescript
profileResponseToProfileRequest :: ProfileResponse -> ProfileRequest
```

#### `reminderFolderRequestToReminderFolderResponse`

``` purescript
reminderFolderRequestToReminderFolderResponse :: Int -> Int -> (Maybe Int) -> String -> Boolean -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> ReminderFolderRequest -> ReminderFolderResponse
```

#### `reminderFolderResponseToReminderFolderRequest`

``` purescript
reminderFolderResponseToReminderFolderRequest :: ReminderFolderResponse -> ReminderFolderRequest
```

#### `reminderRequestToReminderResponse`

``` purescript
reminderRequestToReminderResponse :: Int -> Int -> Int -> Boolean -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> ReminderRequest -> ReminderResponse
```

#### `reminderResponseToReminderRequest`

``` purescript
reminderResponseToReminderRequest :: ReminderResponse -> ReminderRequest
```

#### `resourceRequestToResourceResponse`

``` purescript
resourceRequestToResourceResponse :: Int -> Int -> String -> Boolean -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> ResourceRequest -> ResourceResponse
```

#### `resourceResponseToResourceRequest`

``` purescript
resourceResponseToResourceRequest :: ResourceResponse -> ResourceRequest
```

#### `starRequestToStarResponse`

``` purescript
starRequestToStarResponse :: Int -> Ent -> Int -> Int -> Boolean -> (Maybe Date) -> (Maybe Date) -> StarRequest -> StarResponse
```

#### `starResponseToStarRequest`

``` purescript
starResponseToStarRequest :: StarResponse -> StarRequest
```

#### `teamRequestToTeamResponse`

``` purescript
teamRequestToTeamResponse :: Int -> Int -> Int -> String -> Boolean -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> TeamRequest -> TeamResponse
```

#### `teamResponseToTeamRequest`

``` purescript
teamResponseToTeamRequest :: TeamResponse -> TeamRequest
```

#### `threadPostRequestToThreadPostResponse`

``` purescript
threadPostRequestToThreadPostResponse :: Int -> Int -> Int -> (Maybe Int) -> Boolean -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> ThreadPostRequest -> ThreadPostResponse
```

#### `threadPostResponseToThreadPostRequest`

``` purescript
threadPostResponseToThreadPostRequest :: ThreadPostResponse -> ThreadPostRequest
```

#### `threadRequestToThreadResponse`

``` purescript
threadRequestToThreadResponse :: Int -> Int -> Int -> String -> Boolean -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> ThreadRequest -> ThreadResponse
```

#### `threadResponseToThreadRequest`

``` purescript
threadResponseToThreadRequest :: ThreadResponse -> ThreadRequest
```

#### `userRequestToUserResponse`

``` purescript
userRequestToUserResponse :: Int -> String -> String -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> UserRequest -> UserResponse
```

#### `userRequestToUserSanitizedResponse`

``` purescript
userRequestToUserSanitizedResponse :: Int -> String -> String -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> UserRequest -> UserSanitizedResponse
```

#### `userResponseToUserRequest`

``` purescript
userResponseToUserRequest :: UserResponse -> UserRequest
```

#### `userSanitizedResponseToUserRequest`

``` purescript
userSanitizedResponseToUserRequest :: String -> String -> String -> String -> (Maybe Date) -> UserSanitizedResponse -> UserRequest
```

### Re-exported from LN.T.Internal.Types:

#### `Acronym`

``` purescript
newtype Acronym
  = Acronym { abbreviation :: String, meaning :: String }
```

##### Instances
``` purescript
EncodeJson Acronym
DecodeJson Acronym
Requestable Acronym
Respondable Acronym
IsForeign Acronym
Show Acronym
```

#### `AcronymR`

``` purescript
type AcronymR = { abbreviation :: String, meaning :: String }
```

#### `Antonym`

``` purescript
newtype Antonym
  = Antonym { a :: String, b :: String }
```

##### Instances
``` purescript
EncodeJson Antonym
DecodeJson Antonym
Requestable Antonym
Respondable Antonym
IsForeign Antonym
Show Antonym
```

#### `AntonymR`

``` purescript
type AntonymR = { a :: String, b :: String }
```

#### `ApiRequest`

``` purescript
newtype ApiRequest
  = ApiRequest { comment :: Maybe String, guard :: Int }
```

##### Instances
``` purescript
EncodeJson ApiRequest
DecodeJson ApiRequest
Requestable ApiRequest
Respondable ApiRequest
IsForeign ApiRequest
Show ApiRequest
```

#### `ApiRequestR`

``` purescript
type ApiRequestR = { comment :: Maybe String, guard :: Int }
```

#### `ApiResponse`

``` purescript
newtype ApiResponse
  = ApiResponse { id :: Int, userId :: Int, key :: String, comment :: Maybe String, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date }
```

##### Instances
``` purescript
EncodeJson ApiResponse
DecodeJson ApiResponse
Requestable ApiResponse
Respondable ApiResponse
IsForeign ApiResponse
Show ApiResponse
```

#### `ApiResponseR`

``` purescript
type ApiResponseR = { id :: Int, userId :: Int, key :: String, comment :: Maybe String, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date }
```

#### `ApiResponses`

``` purescript
newtype ApiResponses
  = ApiResponses { apiResponses :: Array ApiResponse }
```

##### Instances
``` purescript
EncodeJson ApiResponses
DecodeJson ApiResponses
Requestable ApiResponses
Respondable ApiResponses
IsForeign ApiResponses
Show ApiResponses
```

#### `ApiResponsesR`

``` purescript
type ApiResponsesR = { apiResponses :: Array ApiResponse }
```

#### `BoardPackResponse`

``` purescript
newtype BoardPackResponse
  = BoardPackResponse { board :: BoardResponse, boardId :: Int, stat :: BoardStatResponse, like :: Maybe LikeResponse, star :: Maybe StarResponse, latestThread :: Maybe ThreadResponse, latestThreadPost :: Maybe ThreadPostResponse, latestThreadPostUser :: Maybe UserSanitizedResponse, isOwner :: Boolean }
```

##### Instances
``` purescript
EncodeJson BoardPackResponse
DecodeJson BoardPackResponse
Requestable BoardPackResponse
Respondable BoardPackResponse
IsForeign BoardPackResponse
Show BoardPackResponse
```

#### `BoardPackResponseR`

``` purescript
type BoardPackResponseR = { board :: BoardResponse, boardId :: Int, stat :: BoardStatResponse, like :: Maybe LikeResponse, star :: Maybe StarResponse, latestThread :: Maybe ThreadResponse, latestThreadPost :: Maybe ThreadPostResponse, latestThreadPostUser :: Maybe UserSanitizedResponse, isOwner :: Boolean }
```

#### `BoardPackResponses`

``` purescript
newtype BoardPackResponses
  = BoardPackResponses { boardPackResponses :: Array BoardPackResponse }
```

##### Instances
``` purescript
EncodeJson BoardPackResponses
DecodeJson BoardPackResponses
Requestable BoardPackResponses
Respondable BoardPackResponses
IsForeign BoardPackResponses
Show BoardPackResponses
```

#### `BoardPackResponsesR`

``` purescript
type BoardPackResponsesR = { boardPackResponses :: Array BoardPackResponse }
```

#### `BoardRequest`

``` purescript
newtype BoardRequest
  = BoardRequest { displayName :: String, description :: Maybe String, isAnonymous :: Boolean, canCreateSubBoards :: Boolean, canCreateThreads :: Boolean, suggestedTags :: Array String, icon :: Maybe String, tags :: Array String, guard :: Int }
```

##### Instances
``` purescript
EncodeJson BoardRequest
DecodeJson BoardRequest
Requestable BoardRequest
Respondable BoardRequest
IsForeign BoardRequest
Show BoardRequest
```

#### `BoardRequestR`

``` purescript
type BoardRequestR = { displayName :: String, description :: Maybe String, isAnonymous :: Boolean, canCreateSubBoards :: Boolean, canCreateThreads :: Boolean, suggestedTags :: Array String, icon :: Maybe String, tags :: Array String, guard :: Int }
```

#### `BoardResponse`

``` purescript
newtype BoardResponse
  = BoardResponse { id :: Int, userId :: Int, forumId :: Int, parentId :: Maybe Int, name :: String, displayName :: String, description :: Maybe String, isAnonymous :: Boolean, canCreateSubBoards :: Boolean, canCreateThreads :: Boolean, suggestedTags :: Array String, icon :: Maybe String, tags :: Array String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

##### Instances
``` purescript
EncodeJson BoardResponse
DecodeJson BoardResponse
Requestable BoardResponse
Respondable BoardResponse
IsForeign BoardResponse
Show BoardResponse
```

#### `BoardResponseR`

``` purescript
type BoardResponseR = { id :: Int, userId :: Int, forumId :: Int, parentId :: Maybe Int, name :: String, displayName :: String, description :: Maybe String, isAnonymous :: Boolean, canCreateSubBoards :: Boolean, canCreateThreads :: Boolean, suggestedTags :: Array String, icon :: Maybe String, tags :: Array String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `BoardResponses`

``` purescript
newtype BoardResponses
  = BoardResponses { boardResponses :: Array BoardResponse }
```

##### Instances
``` purescript
EncodeJson BoardResponses
DecodeJson BoardResponses
Requestable BoardResponses
Respondable BoardResponses
IsForeign BoardResponses
Show BoardResponses
```

#### `BoardResponsesR`

``` purescript
type BoardResponsesR = { boardResponses :: Array BoardResponse }
```

#### `BoardStatResponse`

``` purescript
newtype BoardStatResponse
  = BoardStatResponse { boardId :: Int, threads :: Int, threadPosts :: Int, views :: Int }
```

##### Instances
``` purescript
EncodeJson BoardStatResponse
DecodeJson BoardStatResponse
Requestable BoardStatResponse
Respondable BoardStatResponse
IsForeign BoardStatResponse
Show BoardStatResponse
```

#### `BoardStatResponseR`

``` purescript
type BoardStatResponseR = { boardId :: Int, threads :: Int, threadPosts :: Int, views :: Int }
```

#### `BoardStatResponses`

``` purescript
newtype BoardStatResponses
  = BoardStatResponses { boardStatResponses :: Array BoardStatResponse }
```

##### Instances
``` purescript
EncodeJson BoardStatResponses
DecodeJson BoardStatResponses
Requestable BoardStatResponses
Respondable BoardStatResponses
IsForeign BoardStatResponses
Show BoardStatResponses
```

#### `BoardStatResponsesR`

``` purescript
type BoardStatResponsesR = { boardStatResponses :: Array BoardStatResponse }
```

#### `BucketRequest`

``` purescript
newtype BucketRequest
  = BucketRequest { displayName :: String, description :: Maybe String, scoreLo :: Int, scoreHi :: Int, leurons :: Array Int, resources :: Array Int, categories :: Array String, filters :: Array Int, guard :: Int }
```

##### Instances
``` purescript
EncodeJson BucketRequest
DecodeJson BucketRequest
Requestable BucketRequest
Respondable BucketRequest
IsForeign BucketRequest
Show BucketRequest
```

#### `BucketRequestR`

``` purescript
type BucketRequestR = { displayName :: String, description :: Maybe String, scoreLo :: Int, scoreHi :: Int, leurons :: Array Int, resources :: Array Int, categories :: Array String, filters :: Array Int, guard :: Int }
```

#### `BucketResponse`

``` purescript
newtype BucketResponse
  = BucketResponse { id :: Int, userId :: Int, name :: String, displayName :: String, description :: Maybe String, scoreLo :: Int, scoreHi :: Int, leurons :: Array Int, resources :: Array Int, categories :: Array String, filters :: Array Int, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

##### Instances
``` purescript
EncodeJson BucketResponse
DecodeJson BucketResponse
Requestable BucketResponse
Respondable BucketResponse
IsForeign BucketResponse
Show BucketResponse
```

#### `BucketResponseR`

``` purescript
type BucketResponseR = { id :: Int, userId :: Int, name :: String, displayName :: String, description :: Maybe String, scoreLo :: Int, scoreHi :: Int, leurons :: Array Int, resources :: Array Int, categories :: Array String, filters :: Array Int, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `BucketResponses`

``` purescript
newtype BucketResponses
  = BucketResponses { bucketResponses :: Array BucketResponse }
```

##### Instances
``` purescript
EncodeJson BucketResponses
DecodeJson BucketResponses
Requestable BucketResponses
Respondable BucketResponses
IsForeign BucketResponses
Show BucketResponses
```

#### `BucketResponsesR`

``` purescript
type BucketResponsesR = { bucketResponses :: Array BucketResponse }
```

#### `Card`

``` purescript
newtype Card
  = Card { front :: String, back :: String }
```

##### Instances
``` purescript
EncodeJson Card
DecodeJson Card
Requestable Card
Respondable Card
IsForeign Card
Show Card
```

#### `CardR`

``` purescript
type CardR = { front :: String, back :: String }
```

#### `CountResponse`

``` purescript
newtype CountResponse
  = CountResponse { id :: Int, n :: Int }
```

##### Instances
``` purescript
EncodeJson CountResponse
DecodeJson CountResponse
Requestable CountResponse
Respondable CountResponse
IsForeign CountResponse
Show CountResponse
```

#### `CountResponseR`

``` purescript
type CountResponseR = { id :: Int, n :: Int }
```

#### `CountResponses`

``` purescript
newtype CountResponses
  = CountResponses { countResponses :: Array CountResponse }
```

##### Instances
``` purescript
EncodeJson CountResponses
DecodeJson CountResponses
Requestable CountResponses
Respondable CountResponses
IsForeign CountResponses
Show CountResponses
```

#### `CountResponsesR`

``` purescript
type CountResponsesR = { countResponses :: Array CountResponse }
```

#### `DCard`

``` purescript
newtype DCard
  = DCard { front :: String, back :: String }
```

##### Instances
``` purescript
EncodeJson DCard
DecodeJson DCard
Requestable DCard
Respondable DCard
IsForeign DCard
Show DCard
```

#### `DCardR`

``` purescript
type DCardR = { front :: String, back :: String }
```

#### `DCardX`

``` purescript
newtype DCardX
  = DCardX { front :: Array String, back :: Array String }
```

##### Instances
``` purescript
EncodeJson DCardX
DecodeJson DCardX
Requestable DCardX
Respondable DCardX
IsForeign DCardX
Show DCardX
```

#### `DCardXR`

``` purescript
type DCardXR = { front :: Array String, back :: Array String }
```

#### `DepList`

``` purescript
type DepList a = Array (Array a)
```

#### `EmptyRequest`

``` purescript
newtype EmptyRequest
  = EmptyRequest { value :: Boolean }
```

##### Instances
``` purescript
EncodeJson EmptyRequest
DecodeJson EmptyRequest
Requestable EmptyRequest
Respondable EmptyRequest
IsForeign EmptyRequest
Show EmptyRequest
```

#### `EmptyRequestR`

``` purescript
type EmptyRequestR = { value :: Boolean }
```

#### `EmptyResponse`

``` purescript
newtype EmptyResponse
  = EmptyResponse { id :: Int, userId :: Int, value :: Boolean, createdAt :: Maybe Date, modifiedAt :: Maybe Date }
```

##### Instances
``` purescript
EncodeJson EmptyResponse
DecodeJson EmptyResponse
Requestable EmptyResponse
Respondable EmptyResponse
IsForeign EmptyResponse
Show EmptyResponse
```

#### `EmptyResponseR`

``` purescript
type EmptyResponseR = { id :: Int, userId :: Int, value :: Boolean, createdAt :: Maybe Date, modifiedAt :: Maybe Date }
```

#### `EmptyResponses`

``` purescript
newtype EmptyResponses
  = EmptyResponses { emptyResponses :: Array EmptyResponse }
```

##### Instances
``` purescript
EncodeJson EmptyResponses
DecodeJson EmptyResponses
Requestable EmptyResponses
Respondable EmptyResponses
IsForeign EmptyResponses
Show EmptyResponses
```

#### `EmptyResponsesR`

``` purescript
type EmptyResponsesR = { emptyResponses :: Array EmptyResponse }
```

#### `Ent`

``` purescript
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
```

##### Instances
``` purescript
EncodeJson Ent
DecodeJson Ent
Requestable Ent
Respondable Ent
IsForeign Ent
Show Ent
```

#### `Fact`

``` purescript
newtype Fact
  = Fact { text :: String }
```

##### Instances
``` purescript
EncodeJson Fact
DecodeJson Fact
Requestable Fact
Respondable Fact
IsForeign Fact
Show Fact
```

#### `FactList`

``` purescript
newtype FactList
  = FactList { fact :: String, list :: Array String }
```

##### Instances
``` purescript
EncodeJson FactList
DecodeJson FactList
Requestable FactList
Respondable FactList
IsForeign FactList
Show FactList
```

#### `FactListR`

``` purescript
type FactListR = { fact :: String, list :: Array String }
```

#### `FactR`

``` purescript
type FactR = { text :: String }
```

#### `ForumPackResponse`

``` purescript
newtype ForumPackResponse
  = ForumPackResponse { forum :: ForumResponse, forumId :: Int, stat :: ForumStatResponse, like :: Maybe LikeResponse, star :: Maybe StarResponse, isOwner :: Boolean }
```

##### Instances
``` purescript
EncodeJson ForumPackResponse
DecodeJson ForumPackResponse
Requestable ForumPackResponse
Respondable ForumPackResponse
IsForeign ForumPackResponse
Show ForumPackResponse
```

#### `ForumPackResponseR`

``` purescript
type ForumPackResponseR = { forum :: ForumResponse, forumId :: Int, stat :: ForumStatResponse, like :: Maybe LikeResponse, star :: Maybe StarResponse, isOwner :: Boolean }
```

#### `ForumPackResponses`

``` purescript
newtype ForumPackResponses
  = ForumPackResponses { forumPackResponses :: Array ForumPackResponse }
```

##### Instances
``` purescript
EncodeJson ForumPackResponses
DecodeJson ForumPackResponses
Requestable ForumPackResponses
Respondable ForumPackResponses
IsForeign ForumPackResponses
Show ForumPackResponses
```

#### `ForumPackResponsesR`

``` purescript
type ForumPackResponsesR = { forumPackResponses :: Array ForumPackResponse }
```

#### `ForumRequest`

``` purescript
newtype ForumRequest
  = ForumRequest { displayName :: String, description :: Maybe String, threadsPerBoard :: Int, threadPostsPerThread :: Int, icon :: Maybe String, tags :: Array String, visibility :: Visibility, guard :: Int }
```

##### Instances
``` purescript
EncodeJson ForumRequest
DecodeJson ForumRequest
Requestable ForumRequest
Respondable ForumRequest
IsForeign ForumRequest
Show ForumRequest
```

#### `ForumRequestR`

``` purescript
type ForumRequestR = { displayName :: String, description :: Maybe String, threadsPerBoard :: Int, threadPostsPerThread :: Int, icon :: Maybe String, tags :: Array String, visibility :: Visibility, guard :: Int }
```

#### `ForumResponse`

``` purescript
newtype ForumResponse
  = ForumResponse { id :: Int, userId :: Int, orgId :: Int, name :: String, displayName :: String, description :: Maybe String, threadsPerBoard :: Int, threadPostsPerThread :: Int, icon :: Maybe String, tags :: Array String, visibility :: Visibility, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

##### Instances
``` purescript
EncodeJson ForumResponse
DecodeJson ForumResponse
Requestable ForumResponse
Respondable ForumResponse
IsForeign ForumResponse
Show ForumResponse
```

#### `ForumResponseR`

``` purescript
type ForumResponseR = { id :: Int, userId :: Int, orgId :: Int, name :: String, displayName :: String, description :: Maybe String, threadsPerBoard :: Int, threadPostsPerThread :: Int, icon :: Maybe String, tags :: Array String, visibility :: Visibility, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `ForumResponses`

``` purescript
newtype ForumResponses
  = ForumResponses { forumResponses :: Array ForumResponse }
```

##### Instances
``` purescript
EncodeJson ForumResponses
DecodeJson ForumResponses
Requestable ForumResponses
Respondable ForumResponses
IsForeign ForumResponses
Show ForumResponses
```

#### `ForumResponsesR`

``` purescript
type ForumResponsesR = { forumResponses :: Array ForumResponse }
```

#### `ForumStatResponse`

``` purescript
newtype ForumStatResponse
  = ForumStatResponse { forumId :: Int, boards :: Int, threads :: Int, threadPosts :: Int, views :: Int }
```

##### Instances
``` purescript
EncodeJson ForumStatResponse
DecodeJson ForumStatResponse
Requestable ForumStatResponse
Respondable ForumStatResponse
IsForeign ForumStatResponse
Show ForumStatResponse
```

#### `ForumStatResponseR`

``` purescript
type ForumStatResponseR = { forumId :: Int, boards :: Int, threads :: Int, threadPosts :: Int, views :: Int }
```

#### `ForumStatResponses`

``` purescript
newtype ForumStatResponses
  = ForumStatResponses { forumStatResponses :: Array ForumStatResponse }
```

##### Instances
``` purescript
EncodeJson ForumStatResponses
DecodeJson ForumStatResponses
Requestable ForumStatResponses
Respondable ForumStatResponses
IsForeign ForumStatResponses
Show ForumStatResponses
```

#### `ForumStatResponsesR`

``` purescript
type ForumStatResponsesR = { forumStatResponses :: Array ForumStatResponse }
```

#### `GlobalGroupPackResponse`

``` purescript
newtype GlobalGroupPackResponse
  = GlobalGroupPackResponse { user :: UserSanitizedResponse, userId :: Int, globalGroup :: GlobalGroupResponse, globalGroupId :: Int, stat :: GlobalGroupStatResponse, isOwner :: Boolean }
```

##### Instances
``` purescript
EncodeJson GlobalGroupPackResponse
DecodeJson GlobalGroupPackResponse
Requestable GlobalGroupPackResponse
Respondable GlobalGroupPackResponse
IsForeign GlobalGroupPackResponse
Show GlobalGroupPackResponse
```

#### `GlobalGroupPackResponseR`

``` purescript
type GlobalGroupPackResponseR = { user :: UserSanitizedResponse, userId :: Int, globalGroup :: GlobalGroupResponse, globalGroupId :: Int, stat :: GlobalGroupStatResponse, isOwner :: Boolean }
```

#### `GlobalGroupPackResponses`

``` purescript
newtype GlobalGroupPackResponses
  = GlobalGroupPackResponses { globalGroupPackResponses :: Array GlobalGroupPackResponse }
```

##### Instances
``` purescript
EncodeJson GlobalGroupPackResponses
DecodeJson GlobalGroupPackResponses
Requestable GlobalGroupPackResponses
Respondable GlobalGroupPackResponses
IsForeign GlobalGroupPackResponses
Show GlobalGroupPackResponses
```

#### `GlobalGroupPackResponsesR`

``` purescript
type GlobalGroupPackResponsesR = { globalGroupPackResponses :: Array GlobalGroupPackResponse }
```

#### `GlobalGroupRequest`

``` purescript
newtype GlobalGroupRequest
  = GlobalGroupRequest { displayName :: String, description :: Maybe String, membership :: Membership, icon :: Maybe String, tags :: Array String, visibility :: Visibility, guard :: Int }
```

##### Instances
``` purescript
EncodeJson GlobalGroupRequest
DecodeJson GlobalGroupRequest
Requestable GlobalGroupRequest
Respondable GlobalGroupRequest
IsForeign GlobalGroupRequest
Show GlobalGroupRequest
```

#### `GlobalGroupRequestR`

``` purescript
type GlobalGroupRequestR = { displayName :: String, description :: Maybe String, membership :: Membership, icon :: Maybe String, tags :: Array String, visibility :: Visibility, guard :: Int }
```

#### `GlobalGroupResponse`

``` purescript
newtype GlobalGroupResponse
  = GlobalGroupResponse { id :: Int, userId :: Int, name :: String, displayName :: String, description :: Maybe String, membership :: Membership, icon :: Maybe String, tags :: Array String, visibility :: Visibility, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

##### Instances
``` purescript
EncodeJson GlobalGroupResponse
DecodeJson GlobalGroupResponse
Requestable GlobalGroupResponse
Respondable GlobalGroupResponse
IsForeign GlobalGroupResponse
Show GlobalGroupResponse
```

#### `GlobalGroupResponseR`

``` purescript
type GlobalGroupResponseR = { id :: Int, userId :: Int, name :: String, displayName :: String, description :: Maybe String, membership :: Membership, icon :: Maybe String, tags :: Array String, visibility :: Visibility, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `GlobalGroupResponses`

``` purescript
newtype GlobalGroupResponses
  = GlobalGroupResponses { globalGroupResponses :: Array GlobalGroupResponse }
```

##### Instances
``` purescript
EncodeJson GlobalGroupResponses
DecodeJson GlobalGroupResponses
Requestable GlobalGroupResponses
Respondable GlobalGroupResponses
IsForeign GlobalGroupResponses
Show GlobalGroupResponses
```

#### `GlobalGroupResponsesR`

``` purescript
type GlobalGroupResponsesR = { globalGroupResponses :: Array GlobalGroupResponse }
```

#### `GlobalGroupStatResponse`

``` purescript
newtype GlobalGroupStatResponse
  = GlobalGroupStatResponse { groups :: Int }
```

##### Instances
``` purescript
EncodeJson GlobalGroupStatResponse
DecodeJson GlobalGroupStatResponse
Requestable GlobalGroupStatResponse
Respondable GlobalGroupStatResponse
IsForeign GlobalGroupStatResponse
Show GlobalGroupStatResponse
```

#### `GlobalGroupStatResponseR`

``` purescript
type GlobalGroupStatResponseR = { groups :: Int }
```

#### `GlobalGroupStatResponses`

``` purescript
newtype GlobalGroupStatResponses
  = GlobalGroupStatResponses { globalGroupStatResponses :: Array GlobalGroupStatResponse }
```

##### Instances
``` purescript
EncodeJson GlobalGroupStatResponses
DecodeJson GlobalGroupStatResponses
Requestable GlobalGroupStatResponses
Respondable GlobalGroupStatResponses
IsForeign GlobalGroupStatResponses
Show GlobalGroupStatResponses
```

#### `GlobalGroupStatResponsesR`

``` purescript
type GlobalGroupStatResponsesR = { globalGroupStatResponses :: Array GlobalGroupStatResponse }
```

#### `GroupMemberPackResponse`

``` purescript
newtype GroupMemberPackResponse
  = GroupMemberPackResponse { user :: UserSanitizedResponse, userId :: Int, groupMember :: GroupMemberResponse, groupMemberId :: Int, isOwner :: Boolean }
```

##### Instances
``` purescript
EncodeJson GroupMemberPackResponse
DecodeJson GroupMemberPackResponse
Requestable GroupMemberPackResponse
Respondable GroupMemberPackResponse
IsForeign GroupMemberPackResponse
Show GroupMemberPackResponse
```

#### `GroupMemberPackResponseR`

``` purescript
type GroupMemberPackResponseR = { user :: UserSanitizedResponse, userId :: Int, groupMember :: GroupMemberResponse, groupMemberId :: Int, isOwner :: Boolean }
```

#### `GroupMemberPackResponses`

``` purescript
newtype GroupMemberPackResponses
  = GroupMemberPackResponses { groupMemberPackResponses :: Array GroupMemberPackResponse }
```

##### Instances
``` purescript
EncodeJson GroupMemberPackResponses
DecodeJson GroupMemberPackResponses
Requestable GroupMemberPackResponses
Respondable GroupMemberPackResponses
IsForeign GroupMemberPackResponses
Show GroupMemberPackResponses
```

#### `GroupMemberPackResponsesR`

``` purescript
type GroupMemberPackResponsesR = { groupMemberPackResponses :: Array GroupMemberPackResponse }
```

#### `GroupMemberRequest`

``` purescript
newtype GroupMemberRequest
  = GroupMemberRequest { guard :: Int }
```

##### Instances
``` purescript
EncodeJson GroupMemberRequest
DecodeJson GroupMemberRequest
Requestable GroupMemberRequest
Respondable GroupMemberRequest
IsForeign GroupMemberRequest
Show GroupMemberRequest
```

#### `GroupMemberRequestR`

``` purescript
type GroupMemberRequestR = { guard :: Int }
```

#### `GroupMemberResponse`

``` purescript
newtype GroupMemberResponse
  = GroupMemberResponse { id :: Int, userId :: Int, globalGroupId :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

##### Instances
``` purescript
EncodeJson GroupMemberResponse
DecodeJson GroupMemberResponse
Requestable GroupMemberResponse
Respondable GroupMemberResponse
IsForeign GroupMemberResponse
Show GroupMemberResponse
```

#### `GroupMemberResponseR`

``` purescript
type GroupMemberResponseR = { id :: Int, userId :: Int, globalGroupId :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `GroupMemberResponses`

``` purescript
newtype GroupMemberResponses
  = GroupMemberResponses { groupMemberResponses :: Array GroupMemberResponse }
```

##### Instances
``` purescript
EncodeJson GroupMemberResponses
DecodeJson GroupMemberResponses
Requestable GroupMemberResponses
Respondable GroupMemberResponses
IsForeign GroupMemberResponses
Show GroupMemberResponses
```

#### `GroupMemberResponsesR`

``` purescript
type GroupMemberResponsesR = { groupMemberResponses :: Array GroupMemberResponse }
```

#### `GroupMemberStatResponse`

``` purescript
data GroupMemberStatResponse
  = GroupMemberStatResponse
```

##### Instances
``` purescript
EncodeJson GroupMemberStatResponse
DecodeJson GroupMemberStatResponse
Requestable GroupMemberStatResponse
Respondable GroupMemberStatResponse
IsForeign GroupMemberStatResponse
Show GroupMemberStatResponse
```

#### `GroupMemberStatResponses`

``` purescript
data GroupMemberStatResponses
  = GroupMemberStatResponses
```

##### Instances
``` purescript
EncodeJson GroupMemberStatResponses
DecodeJson GroupMemberStatResponses
Requestable GroupMemberStatResponses
Respondable GroupMemberStatResponses
IsForeign GroupMemberStatResponses
Show GroupMemberStatResponses
```

#### `GroupPackResponse`

``` purescript
newtype GroupPackResponse
  = GroupPackResponse { user :: UserSanitizedResponse, userId :: Int, group :: GroupResponse, groupId :: Int, organization :: OrganizationResponse, organizationId :: Int, stat :: GroupStatResponse, isOwner :: Boolean }
```

##### Instances
``` purescript
EncodeJson GroupPackResponse
DecodeJson GroupPackResponse
Requestable GroupPackResponse
Respondable GroupPackResponse
IsForeign GroupPackResponse
Show GroupPackResponse
```

#### `GroupPackResponseR`

``` purescript
type GroupPackResponseR = { user :: UserSanitizedResponse, userId :: Int, group :: GroupResponse, groupId :: Int, organization :: OrganizationResponse, organizationId :: Int, stat :: GroupStatResponse, isOwner :: Boolean }
```

#### `GroupPackResponses`

``` purescript
newtype GroupPackResponses
  = GroupPackResponses { groupPackResponses :: Array GroupPackResponse }
```

##### Instances
``` purescript
EncodeJson GroupPackResponses
DecodeJson GroupPackResponses
Requestable GroupPackResponses
Respondable GroupPackResponses
IsForeign GroupPackResponses
Show GroupPackResponses
```

#### `GroupPackResponsesR`

``` purescript
type GroupPackResponsesR = { groupPackResponses :: Array GroupPackResponse }
```

#### `GroupRequest`

``` purescript
newtype GroupRequest
  = GroupRequest { guard :: Int }
```

##### Instances
``` purescript
EncodeJson GroupRequest
DecodeJson GroupRequest
Requestable GroupRequest
Respondable GroupRequest
IsForeign GroupRequest
Show GroupRequest
```

#### `GroupRequestR`

``` purescript
type GroupRequestR = { guard :: Int }
```

#### `GroupResponse`

``` purescript
newtype GroupResponse
  = GroupResponse { id :: Int, userId :: Int, globalGroupId :: Int, organizationId :: Int, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

##### Instances
``` purescript
EncodeJson GroupResponse
DecodeJson GroupResponse
Requestable GroupResponse
Respondable GroupResponse
IsForeign GroupResponse
Show GroupResponse
```

#### `GroupResponseR`

``` purescript
type GroupResponseR = { id :: Int, userId :: Int, globalGroupId :: Int, organizationId :: Int, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `GroupResponses`

``` purescript
newtype GroupResponses
  = GroupResponses { groupResponses :: Array GroupResponse }
```

##### Instances
``` purescript
EncodeJson GroupResponses
DecodeJson GroupResponses
Requestable GroupResponses
Respondable GroupResponses
IsForeign GroupResponses
Show GroupResponses
```

#### `GroupResponsesR`

``` purescript
type GroupResponsesR = { groupResponses :: Array GroupResponse }
```

#### `GroupStatResponse`

``` purescript
newtype GroupStatResponse
  = GroupStatResponse { members :: Int }
```

##### Instances
``` purescript
EncodeJson GroupStatResponse
DecodeJson GroupStatResponse
Requestable GroupStatResponse
Respondable GroupStatResponse
IsForeign GroupStatResponse
Show GroupStatResponse
```

#### `GroupStatResponseR`

``` purescript
type GroupStatResponseR = { members :: Int }
```

#### `GroupStatResponses`

``` purescript
newtype GroupStatResponses
  = GroupStatResponses { groupStatResponses :: Array GroupStatResponse }
```

##### Instances
``` purescript
EncodeJson GroupStatResponses
DecodeJson GroupStatResponses
Requestable GroupStatResponses
Respondable GroupStatResponses
IsForeign GroupStatResponses
Show GroupStatResponses
```

#### `GroupStatResponsesR`

``` purescript
type GroupStatResponsesR = { groupStatResponses :: Array GroupStatResponse }
```

#### `ImageAssociation`

``` purescript
newtype ImageAssociation
  = ImageAssociation { imageUrl :: Array String, assocBy :: Array String, assocResult :: Array String }
```

##### Instances
``` purescript
EncodeJson ImageAssociation
DecodeJson ImageAssociation
Requestable ImageAssociation
Respondable ImageAssociation
IsForeign ImageAssociation
Show ImageAssociation
```

#### `ImageAssociationR`

``` purescript
type ImageAssociationR = { imageUrl :: Array String, assocBy :: Array String, assocResult :: Array String }
```

#### `LDContent`

``` purescript
type LDContent = String
```

#### `LDHint`

``` purescript
type LDHint = Maybe String
```

#### `LeuronData`

``` purescript
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
```

##### Instances
``` purescript
EncodeJson LeuronData
DecodeJson LeuronData
Requestable LeuronData
Respondable LeuronData
IsForeign LeuronData
Show LeuronData
```

#### `LeuronPackResponse`

``` purescript
newtype LeuronPackResponse
  = LeuronPackResponse { leuron :: LeuronResponse, leuronId :: Int, user :: UserSanitizedResponse, userId :: Int, training :: LeuronTrainingResponse, stat :: LeuronStatResponse, like :: Maybe LikeResponse, star :: Maybe StarResponse, isOwner :: Boolean }
```

##### Instances
``` purescript
EncodeJson LeuronPackResponse
DecodeJson LeuronPackResponse
Requestable LeuronPackResponse
Respondable LeuronPackResponse
IsForeign LeuronPackResponse
Show LeuronPackResponse
```

#### `LeuronPackResponseR`

``` purescript
type LeuronPackResponseR = { leuron :: LeuronResponse, leuronId :: Int, user :: UserSanitizedResponse, userId :: Int, training :: LeuronTrainingResponse, stat :: LeuronStatResponse, like :: Maybe LikeResponse, star :: Maybe StarResponse, isOwner :: Boolean }
```

#### `LeuronPackResponses`

``` purescript
newtype LeuronPackResponses
  = LeuronPackResponses { leuronPackResponses :: Array LeuronPackResponse }
```

##### Instances
``` purescript
EncodeJson LeuronPackResponses
DecodeJson LeuronPackResponses
Requestable LeuronPackResponses
Respondable LeuronPackResponses
IsForeign LeuronPackResponses
Show LeuronPackResponses
```

#### `LeuronPackResponsesR`

``` purescript
type LeuronPackResponsesR = { leuronPackResponses :: Array LeuronPackResponse }
```

#### `LeuronRequest`

``` purescript
newtype LeuronRequest
  = LeuronRequest { dataP :: LeuronData, title :: Maybe String, description :: Maybe String, section :: Maybe String, page :: Maybe String, examples :: Maybe (Array String), strengths :: Maybe (Array String), categories :: DepList String, splits :: Maybe (Array Splits), substitutions :: Maybe (Array Substitutions), tags :: Array String, style :: Maybe (Array String), guard :: Int }
```

##### Instances
``` purescript
EncodeJson LeuronRequest
DecodeJson LeuronRequest
Requestable LeuronRequest
Respondable LeuronRequest
IsForeign LeuronRequest
Show LeuronRequest
```

#### `LeuronRequestR`

``` purescript
type LeuronRequestR = { dataP :: LeuronData, title :: Maybe String, description :: Maybe String, section :: Maybe String, page :: Maybe String, examples :: Maybe (Array String), strengths :: Maybe (Array String), categories :: DepList String, splits :: Maybe (Array Splits), substitutions :: Maybe (Array Substitutions), tags :: Array String, style :: Maybe (Array String), guard :: Int }
```

#### `LeuronResponse`

``` purescript
newtype LeuronResponse
  = LeuronResponse { id :: Int, userId :: Int, resourceId :: Int, dataP :: LeuronData, title :: Maybe String, description :: Maybe String, section :: Maybe String, page :: Maybe String, examples :: Maybe (Array String), strengths :: Maybe (Array String), categories :: DepList String, splits :: Maybe (Array Splits), substitutions :: Maybe (Array Substitutions), tags :: Array String, style :: Maybe (Array String), active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

##### Instances
``` purescript
EncodeJson LeuronResponse
DecodeJson LeuronResponse
Requestable LeuronResponse
Respondable LeuronResponse
IsForeign LeuronResponse
Show LeuronResponse
```

#### `LeuronResponseR`

``` purescript
type LeuronResponseR = { id :: Int, userId :: Int, resourceId :: Int, dataP :: LeuronData, title :: Maybe String, description :: Maybe String, section :: Maybe String, page :: Maybe String, examples :: Maybe (Array String), strengths :: Maybe (Array String), categories :: DepList String, splits :: Maybe (Array Splits), substitutions :: Maybe (Array Substitutions), tags :: Array String, style :: Maybe (Array String), active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `LeuronResponses`

``` purescript
newtype LeuronResponses
  = LeuronResponses { leuronResponses :: Array LeuronResponse }
```

##### Instances
``` purescript
EncodeJson LeuronResponses
DecodeJson LeuronResponses
Requestable LeuronResponses
Respondable LeuronResponses
IsForeign LeuronResponses
Show LeuronResponses
```

#### `LeuronResponsesR`

``` purescript
type LeuronResponsesR = { leuronResponses :: Array LeuronResponse }
```

#### `LeuronStatResponse`

``` purescript
newtype LeuronStatResponse
  = LeuronStatResponse { leuronId :: Int, likes :: Int, neutral :: Int, dislikes :: Int, stars :: Int, views :: Int }
```

##### Instances
``` purescript
EncodeJson LeuronStatResponse
DecodeJson LeuronStatResponse
Requestable LeuronStatResponse
Respondable LeuronStatResponse
IsForeign LeuronStatResponse
Show LeuronStatResponse
```

#### `LeuronStatResponseR`

``` purescript
type LeuronStatResponseR = { leuronId :: Int, likes :: Int, neutral :: Int, dislikes :: Int, stars :: Int, views :: Int }
```

#### `LeuronStatResponses`

``` purescript
newtype LeuronStatResponses
  = LeuronStatResponses { leuronStatResponses :: Array LeuronStatResponse }
```

##### Instances
``` purescript
EncodeJson LeuronStatResponses
DecodeJson LeuronStatResponses
Requestable LeuronStatResponses
Respondable LeuronStatResponses
IsForeign LeuronStatResponses
Show LeuronStatResponses
```

#### `LeuronStatResponsesR`

``` purescript
type LeuronStatResponsesR = { leuronStatResponses :: Array LeuronStatResponse }
```

#### `LeuronTrainingRequest`

``` purescript
newtype LeuronTrainingRequest
  = LeuronTrainingRequest { summary :: LeuronTrainingSummary, guard :: Int }
```

##### Instances
``` purescript
EncodeJson LeuronTrainingRequest
DecodeJson LeuronTrainingRequest
Requestable LeuronTrainingRequest
Respondable LeuronTrainingRequest
IsForeign LeuronTrainingRequest
Show LeuronTrainingRequest
```

#### `LeuronTrainingRequestR`

``` purescript
type LeuronTrainingRequestR = { summary :: LeuronTrainingSummary, guard :: Int }
```

#### `LeuronTrainingResponse`

``` purescript
newtype LeuronTrainingResponse
  = LeuronTrainingResponse { id :: Int, userId :: Int, leuronId :: Int, summary :: LeuronTrainingSummary, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date }
```

##### Instances
``` purescript
EncodeJson LeuronTrainingResponse
DecodeJson LeuronTrainingResponse
Requestable LeuronTrainingResponse
Respondable LeuronTrainingResponse
IsForeign LeuronTrainingResponse
Show LeuronTrainingResponse
```

#### `LeuronTrainingResponseR`

``` purescript
type LeuronTrainingResponseR = { id :: Int, userId :: Int, leuronId :: Int, summary :: LeuronTrainingSummary, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date }
```

#### `LeuronTrainingResponses`

``` purescript
newtype LeuronTrainingResponses
  = LeuronTrainingResponses { leuronTrainingResponses :: Array LeuronTrainingResponse }
```

##### Instances
``` purescript
EncodeJson LeuronTrainingResponses
DecodeJson LeuronTrainingResponses
Requestable LeuronTrainingResponses
Respondable LeuronTrainingResponses
IsForeign LeuronTrainingResponses
Show LeuronTrainingResponses
```

#### `LeuronTrainingResponsesR`

``` purescript
type LeuronTrainingResponsesR = { leuronTrainingResponses :: Array LeuronTrainingResponse }
```

#### `LeuronTrainingStatResponse`

``` purescript
newtype LeuronTrainingStatResponse
  = LeuronTrainingStatResponse { leuronTrainingId :: Int }
```

##### Instances
``` purescript
EncodeJson LeuronTrainingStatResponse
DecodeJson LeuronTrainingStatResponse
Requestable LeuronTrainingStatResponse
Respondable LeuronTrainingStatResponse
IsForeign LeuronTrainingStatResponse
Show LeuronTrainingStatResponse
```

#### `LeuronTrainingStatResponseR`

``` purescript
type LeuronTrainingStatResponseR = { leuronTrainingId :: Int }
```

#### `LeuronTrainingStatResponses`

``` purescript
newtype LeuronTrainingStatResponses
  = LeuronTrainingStatResponses { leuronTrainingStatResponses :: Array LeuronTrainingStatResponse }
```

##### Instances
``` purescript
EncodeJson LeuronTrainingStatResponses
DecodeJson LeuronTrainingStatResponses
Requestable LeuronTrainingStatResponses
Respondable LeuronTrainingStatResponses
IsForeign LeuronTrainingStatResponses
Show LeuronTrainingStatResponses
```

#### `LeuronTrainingStatResponsesR`

``` purescript
type LeuronTrainingStatResponsesR = { leuronTrainingStatResponses :: Array LeuronTrainingStatResponse }
```

#### `LeuronTrainingSummary`

``` purescript
data LeuronTrainingSummary
  = LTS_View
  | LTS_Skip
  | LTS_Know
  | LTS_DontKnow
  | LTS_DontUnderstand
  | LTS_DontCare
  | LTS_Protest
```

##### Instances
``` purescript
EncodeJson LeuronTrainingSummary
DecodeJson LeuronTrainingSummary
Requestable LeuronTrainingSummary
Respondable LeuronTrainingSummary
IsForeign LeuronTrainingSummary
Show LeuronTrainingSummary
```

#### `LikeOpt`

``` purescript
data LikeOpt
  = Like
  | Neutral
  | Dislike
```

##### Instances
``` purescript
EncodeJson LikeOpt
DecodeJson LikeOpt
Requestable LikeOpt
Respondable LikeOpt
IsForeign LikeOpt
Show LikeOpt
```

#### `LikeRequest`

``` purescript
newtype LikeRequest
  = LikeRequest { opt :: LikeOpt, reason :: Maybe String, guard :: Int }
```

##### Instances
``` purescript
EncodeJson LikeRequest
DecodeJson LikeRequest
Requestable LikeRequest
Respondable LikeRequest
IsForeign LikeRequest
Show LikeRequest
```

#### `LikeRequestR`

``` purescript
type LikeRequestR = { opt :: LikeOpt, reason :: Maybe String, guard :: Int }
```

#### `LikeResponse`

``` purescript
newtype LikeResponse
  = LikeResponse { id :: Int, ent :: Ent, entId :: Int, userId :: Int, opt :: LikeOpt, score :: Int, reason :: Maybe String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date }
```

##### Instances
``` purescript
EncodeJson LikeResponse
DecodeJson LikeResponse
Requestable LikeResponse
Respondable LikeResponse
IsForeign LikeResponse
Show LikeResponse
```

#### `LikeResponseR`

``` purescript
type LikeResponseR = { id :: Int, ent :: Ent, entId :: Int, userId :: Int, opt :: LikeOpt, score :: Int, reason :: Maybe String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date }
```

#### `LikeResponses`

``` purescript
newtype LikeResponses
  = LikeResponses { likeResponses :: Array LikeResponse }
```

##### Instances
``` purescript
EncodeJson LikeResponses
DecodeJson LikeResponses
Requestable LikeResponses
Respondable LikeResponses
IsForeign LikeResponses
Show LikeResponses
```

#### `LikeResponsesR`

``` purescript
type LikeResponsesR = { likeResponses :: Array LikeResponse }
```

#### `LikeStatResponse`

``` purescript
newtype LikeStatResponse
  = LikeStatResponse { ent :: Ent, entId :: Int, score :: Int, like :: Int, neutral :: Int, dislike :: Int }
```

##### Instances
``` purescript
EncodeJson LikeStatResponse
DecodeJson LikeStatResponse
Requestable LikeStatResponse
Respondable LikeStatResponse
IsForeign LikeStatResponse
Show LikeStatResponse
```

#### `LikeStatResponseR`

``` purescript
type LikeStatResponseR = { ent :: Ent, entId :: Int, score :: Int, like :: Int, neutral :: Int, dislike :: Int }
```

#### `LikeStatResponses`

``` purescript
newtype LikeStatResponses
  = LikeStatResponses { likeStatResponses :: Array LikeStatResponse }
```

##### Instances
``` purescript
EncodeJson LikeStatResponses
DecodeJson LikeStatResponses
Requestable LikeStatResponses
Respondable LikeStatResponses
IsForeign LikeStatResponses
Show LikeStatResponses
```

#### `LikeStatResponsesR`

``` purescript
type LikeStatResponsesR = { likeStatResponses :: Array LikeStatResponse }
```

#### `LinearDemo`

``` purescript
newtype LinearDemo
  = LinearDemo { label :: String, content :: Array LinearDemoNode }
```

##### Instances
``` purescript
EncodeJson LinearDemo
DecodeJson LinearDemo
Requestable LinearDemo
Respondable LinearDemo
IsForeign LinearDemo
Show LinearDemo
```

#### `LinearDemoNode`

``` purescript
type LinearDemoNode = (Tuple LDContent) LDHint
```

#### `LinearDemoR`

``` purescript
type LinearDemoR = { label :: String, content :: Array LinearDemoNode }
```

#### `Membership`

``` purescript
data Membership
  = Membership_InviteOnly
  | Membership_RequestInvite
  | Membership_Join
  | Membership_Locked
```

##### Instances
``` purescript
EncodeJson Membership
DecodeJson Membership
Requestable Membership
Respondable Membership
IsForeign Membership
Show Membership
Eq Membership
```

#### `OrderBy`

``` purescript
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
```

##### Instances
``` purescript
EncodeJson OrderBy
DecodeJson OrderBy
Requestable OrderBy
Respondable OrderBy
IsForeign OrderBy
Show OrderBy
```

#### `OrganizationPackResponse`

``` purescript
newtype OrganizationPackResponse
  = OrganizationPackResponse { user :: UserSanitizedResponse, userId :: Int, organization :: OrganizationResponse, organizationId :: Int, stat :: OrganizationStatResponse, like :: Maybe LikeResponse, star :: Maybe StarResponse, isOwner :: Boolean, isMember :: Boolean }
```

##### Instances
``` purescript
EncodeJson OrganizationPackResponse
DecodeJson OrganizationPackResponse
Requestable OrganizationPackResponse
Respondable OrganizationPackResponse
IsForeign OrganizationPackResponse
Show OrganizationPackResponse
```

#### `OrganizationPackResponseR`

``` purescript
type OrganizationPackResponseR = { user :: UserSanitizedResponse, userId :: Int, organization :: OrganizationResponse, organizationId :: Int, stat :: OrganizationStatResponse, like :: Maybe LikeResponse, star :: Maybe StarResponse, isOwner :: Boolean, isMember :: Boolean }
```

#### `OrganizationPackResponses`

``` purescript
newtype OrganizationPackResponses
  = OrganizationPackResponses { organizationPackResponses :: Array OrganizationPackResponse }
```

##### Instances
``` purescript
EncodeJson OrganizationPackResponses
DecodeJson OrganizationPackResponses
Requestable OrganizationPackResponses
Respondable OrganizationPackResponses
IsForeign OrganizationPackResponses
Show OrganizationPackResponses
```

#### `OrganizationPackResponsesR`

``` purescript
type OrganizationPackResponsesR = { organizationPackResponses :: Array OrganizationPackResponse }
```

#### `OrganizationRequest`

``` purescript
newtype OrganizationRequest
  = OrganizationRequest { displayName :: String, description :: Maybe String, company :: String, location :: String, email :: String, membership :: Membership, tags :: Array String, icon :: Maybe String, visibility :: Visibility, guard :: Int }
```

##### Instances
``` purescript
EncodeJson OrganizationRequest
DecodeJson OrganizationRequest
Requestable OrganizationRequest
Respondable OrganizationRequest
IsForeign OrganizationRequest
Show OrganizationRequest
```

#### `OrganizationRequestR`

``` purescript
type OrganizationRequestR = { displayName :: String, description :: Maybe String, company :: String, location :: String, email :: String, membership :: Membership, tags :: Array String, icon :: Maybe String, visibility :: Visibility, guard :: Int }
```

#### `OrganizationResponse`

``` purescript
newtype OrganizationResponse
  = OrganizationResponse { id :: Int, userId :: Int, name :: String, displayName :: String, description :: Maybe String, company :: String, location :: String, email :: String, emailMD5 :: String, membership :: Membership, icon :: Maybe String, tags :: Array String, visibility :: Visibility, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

##### Instances
``` purescript
EncodeJson OrganizationResponse
DecodeJson OrganizationResponse
Requestable OrganizationResponse
Respondable OrganizationResponse
IsForeign OrganizationResponse
Show OrganizationResponse
```

#### `OrganizationResponseR`

``` purescript
type OrganizationResponseR = { id :: Int, userId :: Int, name :: String, displayName :: String, description :: Maybe String, company :: String, location :: String, email :: String, emailMD5 :: String, membership :: Membership, icon :: Maybe String, tags :: Array String, visibility :: Visibility, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `OrganizationResponses`

``` purescript
newtype OrganizationResponses
  = OrganizationResponses { organizationResponses :: Array OrganizationResponse }
```

##### Instances
``` purescript
EncodeJson OrganizationResponses
DecodeJson OrganizationResponses
Requestable OrganizationResponses
Respondable OrganizationResponses
IsForeign OrganizationResponses
Show OrganizationResponses
```

#### `OrganizationResponsesR`

``` purescript
type OrganizationResponsesR = { organizationResponses :: Array OrganizationResponse }
```

#### `OrganizationStatResponse`

``` purescript
newtype OrganizationStatResponse
  = OrganizationStatResponse { organizationId :: Int, teams :: Int, members :: Int, forums :: Int, boards :: Int, threads :: Int, threadPosts :: Int, views :: Int }
```

##### Instances
``` purescript
EncodeJson OrganizationStatResponse
DecodeJson OrganizationStatResponse
Requestable OrganizationStatResponse
Respondable OrganizationStatResponse
IsForeign OrganizationStatResponse
Show OrganizationStatResponse
```

#### `OrganizationStatResponseR`

``` purescript
type OrganizationStatResponseR = { organizationId :: Int, teams :: Int, members :: Int, forums :: Int, boards :: Int, threads :: Int, threadPosts :: Int, views :: Int }
```

#### `OrganizationStatResponses`

``` purescript
newtype OrganizationStatResponses
  = OrganizationStatResponses { organizationStatResponses :: Array OrganizationStatResponse }
```

##### Instances
``` purescript
EncodeJson OrganizationStatResponses
DecodeJson OrganizationStatResponses
Requestable OrganizationStatResponses
Respondable OrganizationStatResponses
IsForeign OrganizationStatResponses
Show OrganizationStatResponses
```

#### `OrganizationStatResponsesR`

``` purescript
type OrganizationStatResponsesR = { organizationStatResponses :: Array OrganizationStatResponse }
```

#### `Param`

``` purescript
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
  | Timestamp Date
  | UnixTimestamp Int
  | CreatedAtTimestamp Date
  | CreatedAtUnixTimestamp Int
  | RealIP String
  | IP String
```

##### Instances
``` purescript
EncodeJson Param
DecodeJson Param
Requestable Param
Respondable Param
IsForeign Param
QueryParam Param
```

#### `ParamTag`

``` purescript
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
  | ParamTag_Timestamp
  | ParamTag_UnixTimestamp
  | ParamTag_CreatedAtTimestamp
  | ParamTag_CreatedAtUnixTimestamp
  | ParamTag_RealIP
  | ParamTag_IP
```

##### Instances
``` purescript
EncodeJson ParamTag
DecodeJson ParamTag
Requestable ParamTag
Respondable ParamTag
IsForeign ParamTag
Show ParamTag
```

#### `PmInRequest`

``` purescript
newtype PmInRequest
  = PmInRequest { label :: Maybe String, isRead :: Boolean, isStarred :: Boolean, guard :: Int }
```

##### Instances
``` purescript
EncodeJson PmInRequest
DecodeJson PmInRequest
Requestable PmInRequest
Respondable PmInRequest
IsForeign PmInRequest
Show PmInRequest
```

#### `PmInRequestR`

``` purescript
type PmInRequestR = { label :: Maybe String, isRead :: Boolean, isStarred :: Boolean, guard :: Int }
```

#### `PmInResponse`

``` purescript
newtype PmInResponse
  = PmInResponse { id :: Int, pmId :: Int, userId :: Int, label :: Maybe String, isRead :: Boolean, isStarred :: Boolean, isNew :: Boolean, isSaved :: Boolean, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date }
```

##### Instances
``` purescript
EncodeJson PmInResponse
DecodeJson PmInResponse
Requestable PmInResponse
Respondable PmInResponse
IsForeign PmInResponse
Show PmInResponse
```

#### `PmInResponseR`

``` purescript
type PmInResponseR = { id :: Int, pmId :: Int, userId :: Int, label :: Maybe String, isRead :: Boolean, isStarred :: Boolean, isNew :: Boolean, isSaved :: Boolean, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date }
```

#### `PmInResponses`

``` purescript
newtype PmInResponses
  = PmInResponses { pmInResponses :: Array PmInResponse }
```

##### Instances
``` purescript
EncodeJson PmInResponses
DecodeJson PmInResponses
Requestable PmInResponses
Respondable PmInResponses
IsForeign PmInResponses
Show PmInResponses
```

#### `PmInResponsesR`

``` purescript
type PmInResponsesR = { pmInResponses :: Array PmInResponse }
```

#### `PmOutRequest`

``` purescript
newtype PmOutRequest
  = PmOutRequest { label :: Maybe String, guard :: Int }
```

##### Instances
``` purescript
EncodeJson PmOutRequest
DecodeJson PmOutRequest
Requestable PmOutRequest
Respondable PmOutRequest
IsForeign PmOutRequest
Show PmOutRequest
```

#### `PmOutRequestR`

``` purescript
type PmOutRequestR = { label :: Maybe String, guard :: Int }
```

#### `PmOutResponse`

``` purescript
newtype PmOutResponse
  = PmOutResponse { id :: Int, pmId :: Int, userId :: Int, label :: Maybe String, isSaved :: Boolean, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date }
```

##### Instances
``` purescript
EncodeJson PmOutResponse
DecodeJson PmOutResponse
Requestable PmOutResponse
Respondable PmOutResponse
IsForeign PmOutResponse
Show PmOutResponse
```

#### `PmOutResponseR`

``` purescript
type PmOutResponseR = { id :: Int, pmId :: Int, userId :: Int, label :: Maybe String, isSaved :: Boolean, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date }
```

#### `PmOutResponses`

``` purescript
newtype PmOutResponses
  = PmOutResponses { pmOutResponses :: Array PmOutResponse }
```

##### Instances
``` purescript
EncodeJson PmOutResponses
DecodeJson PmOutResponses
Requestable PmOutResponses
Respondable PmOutResponses
IsForeign PmOutResponses
Show PmOutResponses
```

#### `PmOutResponsesR`

``` purescript
type PmOutResponsesR = { pmOutResponses :: Array PmOutResponse }
```

#### `PmRequest`

``` purescript
newtype PmRequest
  = PmRequest { subject :: String, body :: String, guard :: Int }
```

##### Instances
``` purescript
EncodeJson PmRequest
DecodeJson PmRequest
Requestable PmRequest
Respondable PmRequest
IsForeign PmRequest
Show PmRequest
```

#### `PmRequestR`

``` purescript
type PmRequestR = { subject :: String, body :: String, guard :: Int }
```

#### `PmResponse`

``` purescript
newtype PmResponse
  = PmResponse { id :: Int, userId :: Int, toUserId :: Int, subject :: String, body :: String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

##### Instances
``` purescript
EncodeJson PmResponse
DecodeJson PmResponse
Requestable PmResponse
Respondable PmResponse
IsForeign PmResponse
Show PmResponse
```

#### `PmResponseR`

``` purescript
type PmResponseR = { id :: Int, userId :: Int, toUserId :: Int, subject :: String, body :: String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `PmResponses`

``` purescript
newtype PmResponses
  = PmResponses { pmResponses :: Array PmResponse }
```

##### Instances
``` purescript
EncodeJson PmResponses
DecodeJson PmResponses
Requestable PmResponses
Respondable PmResponses
IsForeign PmResponses
Show PmResponses
```

#### `PmResponsesR`

``` purescript
type PmResponsesR = { pmResponses :: Array PmResponse }
```

#### `PostData`

``` purescript
data PostData
  = PostDataRaw String
  | PostDataMarkdown String
  | PostDataBBCode String
  | PostDataCode String String
  | PostDataOther String String
  | PostDataEmpty
```

##### Instances
``` purescript
EncodeJson PostData
DecodeJson PostData
Requestable PostData
Respondable PostData
IsForeign PostData
Show PostData
```

#### `ProfileGender`

``` purescript
data ProfileGender
  = GenderMale
  | GenderFemale
  | GenderUnknown
```

##### Instances
``` purescript
EncodeJson ProfileGender
DecodeJson ProfileGender
Requestable ProfileGender
Respondable ProfileGender
IsForeign ProfileGender
Show ProfileGender
Eq ProfileGender
```

#### `ProfileRequest`

``` purescript
newtype ProfileRequest
  = ProfileRequest { gender :: ProfileGender, birthdate :: Date, website :: Maybe String, location :: Maybe String, signature :: Maybe String, guard :: Int }
```

##### Instances
``` purescript
EncodeJson ProfileRequest
DecodeJson ProfileRequest
Requestable ProfileRequest
Respondable ProfileRequest
IsForeign ProfileRequest
Show ProfileRequest
```

#### `ProfileRequestR`

``` purescript
type ProfileRequestR = { gender :: ProfileGender, birthdate :: Date, website :: Maybe String, location :: Maybe String, signature :: Maybe String, guard :: Int }
```

#### `ProfileResponse`

``` purescript
newtype ProfileResponse
  = ProfileResponse { id :: Int, ent :: Ent, entId :: Int, gender :: ProfileGender, birthdate :: Date, website :: Maybe String, location :: Maybe String, signature :: Maybe String, karmaGood :: Int, karmaBad :: Int, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date }
```

##### Instances
``` purescript
EncodeJson ProfileResponse
DecodeJson ProfileResponse
Requestable ProfileResponse
Respondable ProfileResponse
IsForeign ProfileResponse
Show ProfileResponse
```

#### `ProfileResponseR`

``` purescript
type ProfileResponseR = { id :: Int, ent :: Ent, entId :: Int, gender :: ProfileGender, birthdate :: Date, website :: Maybe String, location :: Maybe String, signature :: Maybe String, karmaGood :: Int, karmaBad :: Int, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date }
```

#### `ProfileResponses`

``` purescript
newtype ProfileResponses
  = ProfileResponses { profileResponses :: Array ProfileResponse }
```

##### Instances
``` purescript
EncodeJson ProfileResponses
DecodeJson ProfileResponses
Requestable ProfileResponses
Respondable ProfileResponses
IsForeign ProfileResponses
Show ProfileResponses
```

#### `ProfileResponsesR`

``` purescript
type ProfileResponsesR = { profileResponses :: Array ProfileResponse }
```

#### `ProfileX`

``` purescript
newtype ProfileX
  = ProfileX { profileLogin :: String, profileName :: String, profileEmail :: String }
```

##### Instances
``` purescript
EncodeJson ProfileX
DecodeJson ProfileX
Requestable ProfileX
Respondable ProfileX
IsForeign ProfileX
Show ProfileX
```

#### `ProfileXR`

``` purescript
type ProfileXR = { profileLogin :: String, profileName :: String, profileEmail :: String }
```

#### `QA`

``` purescript
newtype QA
  = QA { question :: String, answer :: String }
```

##### Instances
``` purescript
EncodeJson QA
DecodeJson QA
Requestable QA
Respondable QA
IsForeign QA
Show QA
```

#### `QAR`

``` purescript
type QAR = { question :: String, answer :: String }
```

#### `ReminderFolderRequest`

``` purescript
newtype ReminderFolderRequest
  = ReminderFolderRequest { displayName :: String, description :: Maybe String, visibility :: Visibility, guard :: Int }
```

##### Instances
``` purescript
EncodeJson ReminderFolderRequest
DecodeJson ReminderFolderRequest
Requestable ReminderFolderRequest
Respondable ReminderFolderRequest
IsForeign ReminderFolderRequest
Show ReminderFolderRequest
```

#### `ReminderFolderRequestR`

``` purescript
type ReminderFolderRequestR = { displayName :: String, description :: Maybe String, visibility :: Visibility, guard :: Int }
```

#### `ReminderFolderResponse`

``` purescript
newtype ReminderFolderResponse
  = ReminderFolderResponse { id :: Int, userId :: Int, parentFolderId :: Maybe Int, name :: String, displayName :: String, visibility :: Visibility, description :: Maybe String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

##### Instances
``` purescript
EncodeJson ReminderFolderResponse
DecodeJson ReminderFolderResponse
Requestable ReminderFolderResponse
Respondable ReminderFolderResponse
IsForeign ReminderFolderResponse
Show ReminderFolderResponse
```

#### `ReminderFolderResponseR`

``` purescript
type ReminderFolderResponseR = { id :: Int, userId :: Int, parentFolderId :: Maybe Int, name :: String, displayName :: String, visibility :: Visibility, description :: Maybe String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `ReminderFolderResponses`

``` purescript
newtype ReminderFolderResponses
  = ReminderFolderResponses { reminderFolderResponses :: Array ReminderFolderResponse }
```

##### Instances
``` purescript
EncodeJson ReminderFolderResponses
DecodeJson ReminderFolderResponses
Requestable ReminderFolderResponses
Respondable ReminderFolderResponses
IsForeign ReminderFolderResponses
Show ReminderFolderResponses
```

#### `ReminderFolderResponsesR`

``` purescript
type ReminderFolderResponsesR = { reminderFolderResponses :: Array ReminderFolderResponse }
```

#### `ReminderRequest`

``` purescript
newtype ReminderRequest
  = ReminderRequest { dataP :: String, guard :: Int }
```

##### Instances
``` purescript
EncodeJson ReminderRequest
DecodeJson ReminderRequest
Requestable ReminderRequest
Respondable ReminderRequest
IsForeign ReminderRequest
Show ReminderRequest
```

#### `ReminderRequestR`

``` purescript
type ReminderRequestR = { dataP :: String, guard :: Int }
```

#### `ReminderResponse`

``` purescript
newtype ReminderResponse
  = ReminderResponse { id :: Int, userId :: Int, parentFolderId :: Int, dataP :: String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

##### Instances
``` purescript
EncodeJson ReminderResponse
DecodeJson ReminderResponse
Requestable ReminderResponse
Respondable ReminderResponse
IsForeign ReminderResponse
Show ReminderResponse
```

#### `ReminderResponseR`

``` purescript
type ReminderResponseR = { id :: Int, userId :: Int, parentFolderId :: Int, dataP :: String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `ReminderResponses`

``` purescript
newtype ReminderResponses
  = ReminderResponses { reminderResponses :: Array ReminderResponse }
```

##### Instances
``` purescript
EncodeJson ReminderResponses
DecodeJson ReminderResponses
Requestable ReminderResponses
Respondable ReminderResponses
IsForeign ReminderResponses
Show ReminderResponses
```

#### `ReminderResponsesR`

``` purescript
type ReminderResponsesR = { reminderResponses :: Array ReminderResponse }
```

#### `ResourcePackResponse`

``` purescript
newtype ResourcePackResponse
  = ResourcePackResponse { resource :: ResourceResponse, resourceId :: Int, user :: UserSanitizedResponse, userId :: Int, stat :: ResourceStatResponse, like :: Maybe LikeResponse, star :: Maybe StarResponse, isOwner :: Boolean }
```

##### Instances
``` purescript
EncodeJson ResourcePackResponse
DecodeJson ResourcePackResponse
Requestable ResourcePackResponse
Respondable ResourcePackResponse
IsForeign ResourcePackResponse
Show ResourcePackResponse
```

#### `ResourcePackResponseR`

``` purescript
type ResourcePackResponseR = { resource :: ResourceResponse, resourceId :: Int, user :: UserSanitizedResponse, userId :: Int, stat :: ResourceStatResponse, like :: Maybe LikeResponse, star :: Maybe StarResponse, isOwner :: Boolean }
```

#### `ResourcePackResponses`

``` purescript
newtype ResourcePackResponses
  = ResourcePackResponses { resourcePackResponses :: Array ResourcePackResponse }
```

##### Instances
``` purescript
EncodeJson ResourcePackResponses
DecodeJson ResourcePackResponses
Requestable ResourcePackResponses
Respondable ResourcePackResponses
IsForeign ResourcePackResponses
Show ResourcePackResponses
```

#### `ResourcePackResponsesR`

``` purescript
type ResourcePackResponsesR = { resourcePackResponses :: Array ResourcePackResponse }
```

#### `ResourceRequest`

``` purescript
newtype ResourceRequest
  = ResourceRequest { displayName :: String, description :: String, source :: ResourceType, author :: Maybe (Array String), prerequisites :: DepList String, categories :: DepList String, visibility :: Visibility, counter :: Int, version :: Maybe String, urls :: Maybe (Array String), icon :: Maybe String, tags :: Array String, guard :: Int }
```

##### Instances
``` purescript
EncodeJson ResourceRequest
DecodeJson ResourceRequest
Requestable ResourceRequest
Respondable ResourceRequest
IsForeign ResourceRequest
Show ResourceRequest
```

#### `ResourceRequestR`

``` purescript
type ResourceRequestR = { displayName :: String, description :: String, source :: ResourceType, author :: Maybe (Array String), prerequisites :: DepList String, categories :: DepList String, visibility :: Visibility, counter :: Int, version :: Maybe String, urls :: Maybe (Array String), icon :: Maybe String, tags :: Array String, guard :: Int }
```

#### `ResourceResponse`

``` purescript
newtype ResourceResponse
  = ResourceResponse { id :: Int, userId :: Int, name :: String, displayName :: String, description :: String, source :: ResourceType, author :: Maybe (Array String), prerequisites :: DepList String, categories :: DepList String, visibility :: Visibility, counter :: Int, version :: Maybe String, urls :: Maybe (Array String), icon :: Maybe String, tags :: Array String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

##### Instances
``` purescript
EncodeJson ResourceResponse
DecodeJson ResourceResponse
Requestable ResourceResponse
Respondable ResourceResponse
IsForeign ResourceResponse
Show ResourceResponse
```

#### `ResourceResponseR`

``` purescript
type ResourceResponseR = { id :: Int, userId :: Int, name :: String, displayName :: String, description :: String, source :: ResourceType, author :: Maybe (Array String), prerequisites :: DepList String, categories :: DepList String, visibility :: Visibility, counter :: Int, version :: Maybe String, urls :: Maybe (Array String), icon :: Maybe String, tags :: Array String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `ResourceResponses`

``` purescript
newtype ResourceResponses
  = ResourceResponses { resourceResponses :: Array ResourceResponse }
```

##### Instances
``` purescript
EncodeJson ResourceResponses
DecodeJson ResourceResponses
Requestable ResourceResponses
Respondable ResourceResponses
IsForeign ResourceResponses
Show ResourceResponses
```

#### `ResourceResponsesR`

``` purescript
type ResourceResponsesR = { resourceResponses :: Array ResourceResponse }
```

#### `ResourceStatResponse`

``` purescript
newtype ResourceStatResponse
  = ResourceStatResponse { resourceId :: Int, leurons :: Int, likes :: Int, neutral :: Int, dislikes :: Int, stars :: Int, views :: Int }
```

##### Instances
``` purescript
EncodeJson ResourceStatResponse
DecodeJson ResourceStatResponse
Requestable ResourceStatResponse
Respondable ResourceStatResponse
IsForeign ResourceStatResponse
Show ResourceStatResponse
```

#### `ResourceStatResponseR`

``` purescript
type ResourceStatResponseR = { resourceId :: Int, leurons :: Int, likes :: Int, neutral :: Int, dislikes :: Int, stars :: Int, views :: Int }
```

#### `ResourceStatResponses`

``` purescript
newtype ResourceStatResponses
  = ResourceStatResponses { resourceStatResponses :: Array ResourceStatResponse }
```

##### Instances
``` purescript
EncodeJson ResourceStatResponses
DecodeJson ResourceStatResponses
Requestable ResourceStatResponses
Respondable ResourceStatResponses
IsForeign ResourceStatResponses
Show ResourceStatResponses
```

#### `ResourceStatResponsesR`

``` purescript
type ResourceStatResponsesR = { resourceStatResponses :: Array ResourceStatResponse }
```

#### `ResourceType`

``` purescript
data ResourceType
  = ISBN13 String
  | ISBN10 String
  | ISBN String
  | URL String
  | SourceNone
```

##### Instances
``` purescript
EncodeJson ResourceType
DecodeJson ResourceType
Requestable ResourceType
Respondable ResourceType
IsForeign ResourceType
Show ResourceType
```

#### `Script`

``` purescript
newtype Script
  = Script { title :: String, desc :: String, url :: String }
```

##### Instances
``` purescript
EncodeJson Script
DecodeJson Script
Requestable Script
Respondable Script
IsForeign Script
Show Script
```

#### `ScriptR`

``` purescript
type ScriptR = { title :: String, desc :: String, url :: String }
```

#### `Size`

``` purescript
data Size
  = XSmall
  | Small
  | Medium
  | Large
  | XLarge
```

##### Instances
``` purescript
EncodeJson Size
DecodeJson Size
Requestable Size
Respondable Size
IsForeign Size
Show Size
Eq Size
```

#### `SortOrderBy`

``` purescript
data SortOrderBy
  = SortOrderBy_Asc
  | SortOrderBy_Dsc
  | SortOrderBy_Rnd
  | SortOrderBy_None
```

##### Instances
``` purescript
EncodeJson SortOrderBy
DecodeJson SortOrderBy
Requestable SortOrderBy
Respondable SortOrderBy
IsForeign SortOrderBy
Show SortOrderBy
```

#### `Splits`

``` purescript
data Splits
  = SplitAt Char String String
  | SplitNone
```

##### Instances
``` purescript
EncodeJson Splits
DecodeJson Splits
Requestable Splits
Respondable Splits
IsForeign Splits
Show Splits
```

#### `StarRequest`

``` purescript
newtype StarRequest
  = StarRequest { reason :: Maybe String, guard :: Int }
```

##### Instances
``` purescript
EncodeJson StarRequest
DecodeJson StarRequest
Requestable StarRequest
Respondable StarRequest
IsForeign StarRequest
Show StarRequest
```

#### `StarRequestR`

``` purescript
type StarRequestR = { reason :: Maybe String, guard :: Int }
```

#### `StarResponse`

``` purescript
newtype StarResponse
  = StarResponse { id :: Int, ent :: Ent, entId :: Int, userId :: Int, reason :: Maybe String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date }
```

##### Instances
``` purescript
EncodeJson StarResponse
DecodeJson StarResponse
Requestable StarResponse
Respondable StarResponse
IsForeign StarResponse
Show StarResponse
```

#### `StarResponseR`

``` purescript
type StarResponseR = { id :: Int, ent :: Ent, entId :: Int, userId :: Int, reason :: Maybe String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date }
```

#### `StarResponses`

``` purescript
newtype StarResponses
  = StarResponses { starResponses :: Array StarResponse }
```

##### Instances
``` purescript
EncodeJson StarResponses
DecodeJson StarResponses
Requestable StarResponses
Respondable StarResponses
IsForeign StarResponses
Show StarResponses
```

#### `StarResponsesR`

``` purescript
type StarResponsesR = { starResponses :: Array StarResponse }
```

#### `StarStatResponse`

``` purescript
newtype StarStatResponse
  = StarStatResponse { ent :: Ent, entId :: Int, stars :: Int }
```

##### Instances
``` purescript
EncodeJson StarStatResponse
DecodeJson StarStatResponse
Requestable StarStatResponse
Respondable StarStatResponse
IsForeign StarStatResponse
Show StarStatResponse
```

#### `StarStatResponseR`

``` purescript
type StarStatResponseR = { ent :: Ent, entId :: Int, stars :: Int }
```

#### `StarStatResponses`

``` purescript
newtype StarStatResponses
  = StarStatResponses { starStatResponses :: Array StarStatResponse }
```

##### Instances
``` purescript
EncodeJson StarStatResponses
DecodeJson StarStatResponses
Requestable StarStatResponses
Respondable StarStatResponses
IsForeign StarStatResponses
Show StarStatResponses
```

#### `StarStatResponsesR`

``` purescript
type StarStatResponsesR = { starStatResponses :: Array StarStatResponse }
```

#### `Substitutions`

``` purescript
data Substitutions
  = SubsExpr Substitutions Substitutions
  | SubsOneOf (Array String)
  | SubsAllOf (Array String)
  | SubsBoth Substitutions Substitutions
```

##### Instances
``` purescript
EncodeJson Substitutions
DecodeJson Substitutions
Requestable Substitutions
Respondable Substitutions
IsForeign Substitutions
Show Substitutions
```

#### `Synonym`

``` purescript
newtype Synonym
  = Synonym { a :: String, b :: String }
```

##### Instances
``` purescript
EncodeJson Synonym
DecodeJson Synonym
Requestable Synonym
Respondable Synonym
IsForeign Synonym
Show Synonym
```

#### `SynonymR`

``` purescript
type SynonymR = { a :: String, b :: String }
```

#### `Table`

``` purescript
newtype Table
  = Table { title :: String, columns :: Array String, rows :: Array (Array (Maybe String)) }
```

##### Instances
``` purescript
EncodeJson Table
DecodeJson Table
Requestable Table
Respondable Table
IsForeign Table
Show Table
```

#### `TableR`

``` purescript
type TableR = { title :: String, columns :: Array String, rows :: Array (Array (Maybe String)) }
```

#### `TeamMemberPackResponse`

``` purescript
newtype TeamMemberPackResponse
  = TeamMemberPackResponse { user :: UserSanitizedResponse, userId :: Int, teamMember :: TeamMemberResponse, teamMemberId :: Int, isOwner :: Boolean }
```

##### Instances
``` purescript
EncodeJson TeamMemberPackResponse
DecodeJson TeamMemberPackResponse
Requestable TeamMemberPackResponse
Respondable TeamMemberPackResponse
IsForeign TeamMemberPackResponse
Show TeamMemberPackResponse
```

#### `TeamMemberPackResponseR`

``` purescript
type TeamMemberPackResponseR = { user :: UserSanitizedResponse, userId :: Int, teamMember :: TeamMemberResponse, teamMemberId :: Int, isOwner :: Boolean }
```

#### `TeamMemberPackResponses`

``` purescript
newtype TeamMemberPackResponses
  = TeamMemberPackResponses { teamMemberPackResponses :: Array TeamMemberPackResponse }
```

##### Instances
``` purescript
EncodeJson TeamMemberPackResponses
DecodeJson TeamMemberPackResponses
Requestable TeamMemberPackResponses
Respondable TeamMemberPackResponses
IsForeign TeamMemberPackResponses
Show TeamMemberPackResponses
```

#### `TeamMemberPackResponsesR`

``` purescript
type TeamMemberPackResponsesR = { teamMemberPackResponses :: Array TeamMemberPackResponse }
```

#### `TeamMemberRequest`

``` purescript
newtype TeamMemberRequest
  = TeamMemberRequest { guard :: Int }
```

##### Instances
``` purescript
EncodeJson TeamMemberRequest
DecodeJson TeamMemberRequest
Requestable TeamMemberRequest
Respondable TeamMemberRequest
IsForeign TeamMemberRequest
Show TeamMemberRequest
```

#### `TeamMemberRequestR`

``` purescript
type TeamMemberRequestR = { guard :: Int }
```

#### `TeamMemberResponse`

``` purescript
newtype TeamMemberResponse
  = TeamMemberResponse { id :: Int, userId :: Int, teamId :: Int, isAccepted :: Boolean, acceptedAt :: Maybe Date, isBlocked :: Boolean, blockedAt :: Maybe Date, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

##### Instances
``` purescript
EncodeJson TeamMemberResponse
DecodeJson TeamMemberResponse
Requestable TeamMemberResponse
Respondable TeamMemberResponse
IsForeign TeamMemberResponse
Show TeamMemberResponse
```

#### `TeamMemberResponseR`

``` purescript
type TeamMemberResponseR = { id :: Int, userId :: Int, teamId :: Int, isAccepted :: Boolean, acceptedAt :: Maybe Date, isBlocked :: Boolean, blockedAt :: Maybe Date, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `TeamMemberResponses`

``` purescript
newtype TeamMemberResponses
  = TeamMemberResponses { teamMemberResponses :: Array TeamMemberResponse }
```

##### Instances
``` purescript
EncodeJson TeamMemberResponses
DecodeJson TeamMemberResponses
Requestable TeamMemberResponses
Respondable TeamMemberResponses
IsForeign TeamMemberResponses
Show TeamMemberResponses
```

#### `TeamMemberResponsesR`

``` purescript
type TeamMemberResponsesR = { teamMemberResponses :: Array TeamMemberResponse }
```

#### `TeamMemberStatResponse`

``` purescript
data TeamMemberStatResponse
  = TeamMemberStatResponse
```

##### Instances
``` purescript
EncodeJson TeamMemberStatResponse
DecodeJson TeamMemberStatResponse
Requestable TeamMemberStatResponse
Respondable TeamMemberStatResponse
IsForeign TeamMemberStatResponse
Show TeamMemberStatResponse
```

#### `TeamMemberStatResponses`

``` purescript
newtype TeamMemberStatResponses
  = TeamMemberStatResponses { teamMemberStatResponses :: Array TeamMemberStatResponse }
```

##### Instances
``` purescript
EncodeJson TeamMemberStatResponses
DecodeJson TeamMemberStatResponses
Requestable TeamMemberStatResponses
Respondable TeamMemberStatResponses
IsForeign TeamMemberStatResponses
Show TeamMemberStatResponses
```

#### `TeamMemberStatResponsesR`

``` purescript
type TeamMemberStatResponsesR = { teamMemberStatResponses :: Array TeamMemberStatResponse }
```

#### `TeamPackResponse`

``` purescript
newtype TeamPackResponse
  = TeamPackResponse { user :: UserSanitizedResponse, userId :: Int, team :: TeamResponse, teamId :: Int, stat :: TeamStatResponse, like :: Maybe LikeResponse, star :: Maybe StarResponse, isOwner :: Boolean }
```

##### Instances
``` purescript
EncodeJson TeamPackResponse
DecodeJson TeamPackResponse
Requestable TeamPackResponse
Respondable TeamPackResponse
IsForeign TeamPackResponse
Show TeamPackResponse
```

#### `TeamPackResponseR`

``` purescript
type TeamPackResponseR = { user :: UserSanitizedResponse, userId :: Int, team :: TeamResponse, teamId :: Int, stat :: TeamStatResponse, like :: Maybe LikeResponse, star :: Maybe StarResponse, isOwner :: Boolean }
```

#### `TeamPackResponses`

``` purescript
newtype TeamPackResponses
  = TeamPackResponses { teamPackResponses :: Array TeamPackResponse }
```

##### Instances
``` purescript
EncodeJson TeamPackResponses
DecodeJson TeamPackResponses
Requestable TeamPackResponses
Respondable TeamPackResponses
IsForeign TeamPackResponses
Show TeamPackResponses
```

#### `TeamPackResponsesR`

``` purescript
type TeamPackResponsesR = { teamPackResponses :: Array TeamPackResponse }
```

#### `TeamRequest`

``` purescript
newtype TeamRequest
  = TeamRequest { displayName :: String, description :: Maybe String, membership :: Membership, icon :: Maybe String, tags :: Array String, visibility :: Visibility, guard :: Int }
```

##### Instances
``` purescript
EncodeJson TeamRequest
DecodeJson TeamRequest
Requestable TeamRequest
Respondable TeamRequest
IsForeign TeamRequest
Show TeamRequest
```

#### `TeamRequestR`

``` purescript
type TeamRequestR = { displayName :: String, description :: Maybe String, membership :: Membership, icon :: Maybe String, tags :: Array String, visibility :: Visibility, guard :: Int }
```

#### `TeamResponse`

``` purescript
newtype TeamResponse
  = TeamResponse { id :: Int, userId :: Int, orgId :: Int, name :: String, displayName :: String, description :: Maybe String, membership :: Membership, icon :: Maybe String, tags :: Array String, visibility :: Visibility, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

##### Instances
``` purescript
EncodeJson TeamResponse
DecodeJson TeamResponse
Requestable TeamResponse
Respondable TeamResponse
IsForeign TeamResponse
Show TeamResponse
```

#### `TeamResponseR`

``` purescript
type TeamResponseR = { id :: Int, userId :: Int, orgId :: Int, name :: String, displayName :: String, description :: Maybe String, membership :: Membership, icon :: Maybe String, tags :: Array String, visibility :: Visibility, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `TeamResponses`

``` purescript
newtype TeamResponses
  = TeamResponses { teamResponses :: Array TeamResponse }
```

##### Instances
``` purescript
EncodeJson TeamResponses
DecodeJson TeamResponses
Requestable TeamResponses
Respondable TeamResponses
IsForeign TeamResponses
Show TeamResponses
```

#### `TeamResponsesR`

``` purescript
type TeamResponsesR = { teamResponses :: Array TeamResponse }
```

#### `TeamStatResponse`

``` purescript
newtype TeamStatResponse
  = TeamStatResponse { members :: Int }
```

##### Instances
``` purescript
EncodeJson TeamStatResponse
DecodeJson TeamStatResponse
Requestable TeamStatResponse
Respondable TeamStatResponse
IsForeign TeamStatResponse
Show TeamStatResponse
```

#### `TeamStatResponseR`

``` purescript
type TeamStatResponseR = { members :: Int }
```

#### `TeamStatResponses`

``` purescript
newtype TeamStatResponses
  = TeamStatResponses { teamStatResponses :: Array TeamStatResponse }
```

##### Instances
``` purescript
EncodeJson TeamStatResponses
DecodeJson TeamStatResponses
Requestable TeamStatResponses
Respondable TeamStatResponses
IsForeign TeamStatResponses
Show TeamStatResponses
```

#### `TeamStatResponsesR`

``` purescript
type TeamStatResponsesR = { teamStatResponses :: Array TeamStatResponse }
```

#### `Template`

``` purescript
newtype Template
  = Template { template :: String, values :: Array TemplateValue }
```

##### Instances
``` purescript
EncodeJson Template
DecodeJson Template
Requestable Template
Respondable Template
IsForeign Template
Show Template
```

#### `TemplateR`

``` purescript
type TemplateR = { template :: String, values :: Array TemplateValue }
```

#### `TemplateValue`

``` purescript
type TemplateValue = (Tuple String) (Array String)
```

#### `TestRequest`

``` purescript
newtype TestRequest
  = TestRequest { msg :: String }
```

##### Instances
``` purescript
EncodeJson TestRequest
DecodeJson TestRequest
Requestable TestRequest
Respondable TestRequest
IsForeign TestRequest
Show TestRequest
```

#### `TestRequestR`

``` purescript
type TestRequestR = { msg :: String }
```

#### `TestResponse`

``` purescript
newtype TestResponse
  = TestResponse { id :: Int, userId :: Int, msg :: String, createdAt :: Maybe Date, modifiedAt :: Maybe Date }
```

##### Instances
``` purescript
EncodeJson TestResponse
DecodeJson TestResponse
Requestable TestResponse
Respondable TestResponse
IsForeign TestResponse
Show TestResponse
```

#### `TestResponseR`

``` purescript
type TestResponseR = { id :: Int, userId :: Int, msg :: String, createdAt :: Maybe Date, modifiedAt :: Maybe Date }
```

#### `TestResponses`

``` purescript
newtype TestResponses
  = TestResponses { testResponses :: Array TestResponse }
```

##### Instances
``` purescript
EncodeJson TestResponses
DecodeJson TestResponses
Requestable TestResponses
Respondable TestResponses
IsForeign TestResponses
Show TestResponses
```

#### `TestResponsesR`

``` purescript
type TestResponsesR = { testResponses :: Array TestResponse }
```

#### `ThreadPackResponse`

``` purescript
newtype ThreadPackResponse
  = ThreadPackResponse { thread :: ThreadResponse, threadId :: Int, user :: UserSanitizedResponse, userId :: Int, stat :: ThreadStatResponse, like :: Maybe LikeResponse, star :: Maybe StarResponse, latestThreadPost :: Maybe ThreadPostResponse, latestThreadPostUser :: Maybe UserSanitizedResponse, isOwner :: Boolean }
```

##### Instances
``` purescript
EncodeJson ThreadPackResponse
DecodeJson ThreadPackResponse
Requestable ThreadPackResponse
Respondable ThreadPackResponse
IsForeign ThreadPackResponse
Show ThreadPackResponse
```

#### `ThreadPackResponseR`

``` purescript
type ThreadPackResponseR = { thread :: ThreadResponse, threadId :: Int, user :: UserSanitizedResponse, userId :: Int, stat :: ThreadStatResponse, like :: Maybe LikeResponse, star :: Maybe StarResponse, latestThreadPost :: Maybe ThreadPostResponse, latestThreadPostUser :: Maybe UserSanitizedResponse, isOwner :: Boolean }
```

#### `ThreadPackResponses`

``` purescript
newtype ThreadPackResponses
  = ThreadPackResponses { threadPackResponses :: Array ThreadPackResponse }
```

##### Instances
``` purescript
EncodeJson ThreadPackResponses
DecodeJson ThreadPackResponses
Requestable ThreadPackResponses
Respondable ThreadPackResponses
IsForeign ThreadPackResponses
Show ThreadPackResponses
```

#### `ThreadPackResponsesR`

``` purescript
type ThreadPackResponsesR = { threadPackResponses :: Array ThreadPackResponse }
```

#### `ThreadPostPackResponse`

``` purescript
newtype ThreadPostPackResponse
  = ThreadPostPackResponse { threadPost :: ThreadPostResponse, threadPostId :: Int, user :: UserSanitizedResponse, userId :: Int, stat :: ThreadPostStatResponse, like :: Maybe LikeResponse, star :: Maybe StarResponse, isOwner :: Boolean }
```

##### Instances
``` purescript
EncodeJson ThreadPostPackResponse
DecodeJson ThreadPostPackResponse
Requestable ThreadPostPackResponse
Respondable ThreadPostPackResponse
IsForeign ThreadPostPackResponse
Show ThreadPostPackResponse
```

#### `ThreadPostPackResponseR`

``` purescript
type ThreadPostPackResponseR = { threadPost :: ThreadPostResponse, threadPostId :: Int, user :: UserSanitizedResponse, userId :: Int, stat :: ThreadPostStatResponse, like :: Maybe LikeResponse, star :: Maybe StarResponse, isOwner :: Boolean }
```

#### `ThreadPostPackResponses`

``` purescript
newtype ThreadPostPackResponses
  = ThreadPostPackResponses { threadPostPackResponses :: Array ThreadPostPackResponse }
```

##### Instances
``` purescript
EncodeJson ThreadPostPackResponses
DecodeJson ThreadPostPackResponses
Requestable ThreadPostPackResponses
Respondable ThreadPostPackResponses
IsForeign ThreadPostPackResponses
Show ThreadPostPackResponses
```

#### `ThreadPostPackResponsesR`

``` purescript
type ThreadPostPackResponsesR = { threadPostPackResponses :: Array ThreadPostPackResponse }
```

#### `ThreadPostRequest`

``` purescript
newtype ThreadPostRequest
  = ThreadPostRequest { title :: Maybe String, body :: PostData, tags :: Array String, privateTags :: Array String, guard :: Int }
```

##### Instances
``` purescript
EncodeJson ThreadPostRequest
DecodeJson ThreadPostRequest
Requestable ThreadPostRequest
Respondable ThreadPostRequest
IsForeign ThreadPostRequest
Show ThreadPostRequest
```

#### `ThreadPostRequestR`

``` purescript
type ThreadPostRequestR = { title :: Maybe String, body :: PostData, tags :: Array String, privateTags :: Array String, guard :: Int }
```

#### `ThreadPostResponse`

``` purescript
newtype ThreadPostResponse
  = ThreadPostResponse { id :: Int, userId :: Int, threadId :: Int, parentId :: Maybe Int, title :: Maybe String, body :: PostData, tags :: Array String, privateTags :: Array String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

##### Instances
``` purescript
EncodeJson ThreadPostResponse
DecodeJson ThreadPostResponse
Requestable ThreadPostResponse
Respondable ThreadPostResponse
IsForeign ThreadPostResponse
Show ThreadPostResponse
```

#### `ThreadPostResponseR`

``` purescript
type ThreadPostResponseR = { id :: Int, userId :: Int, threadId :: Int, parentId :: Maybe Int, title :: Maybe String, body :: PostData, tags :: Array String, privateTags :: Array String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `ThreadPostResponses`

``` purescript
newtype ThreadPostResponses
  = ThreadPostResponses { threadPostResponses :: Array ThreadPostResponse }
```

##### Instances
``` purescript
EncodeJson ThreadPostResponses
DecodeJson ThreadPostResponses
Requestable ThreadPostResponses
Respondable ThreadPostResponses
IsForeign ThreadPostResponses
Show ThreadPostResponses
```

#### `ThreadPostResponsesR`

``` purescript
type ThreadPostResponsesR = { threadPostResponses :: Array ThreadPostResponse }
```

#### `ThreadPostStatResponse`

``` purescript
newtype ThreadPostStatResponse
  = ThreadPostStatResponse { threadPostId :: Int, likes :: Int, neutral :: Int, dislikes :: Int, stars :: Int, views :: Int }
```

##### Instances
``` purescript
EncodeJson ThreadPostStatResponse
DecodeJson ThreadPostStatResponse
Requestable ThreadPostStatResponse
Respondable ThreadPostStatResponse
IsForeign ThreadPostStatResponse
Show ThreadPostStatResponse
```

#### `ThreadPostStatResponseR`

``` purescript
type ThreadPostStatResponseR = { threadPostId :: Int, likes :: Int, neutral :: Int, dislikes :: Int, stars :: Int, views :: Int }
```

#### `ThreadPostStatResponses`

``` purescript
newtype ThreadPostStatResponses
  = ThreadPostStatResponses { threadPostStatResponses :: Array ThreadPostStatResponse }
```

##### Instances
``` purescript
EncodeJson ThreadPostStatResponses
DecodeJson ThreadPostStatResponses
Requestable ThreadPostStatResponses
Respondable ThreadPostStatResponses
IsForeign ThreadPostStatResponses
Show ThreadPostStatResponses
```

#### `ThreadPostStatResponsesR`

``` purescript
type ThreadPostStatResponsesR = { threadPostStatResponses :: Array ThreadPostStatResponse }
```

#### `ThreadRequest`

``` purescript
newtype ThreadRequest
  = ThreadRequest { displayName :: String, description :: Maybe String, sticky :: Boolean, locked :: Boolean, poll :: Maybe String, icon :: Maybe String, tags :: Array String, guard :: Int }
```

##### Instances
``` purescript
EncodeJson ThreadRequest
DecodeJson ThreadRequest
Requestable ThreadRequest
Respondable ThreadRequest
IsForeign ThreadRequest
Show ThreadRequest
```

#### `ThreadRequestR`

``` purescript
type ThreadRequestR = { displayName :: String, description :: Maybe String, sticky :: Boolean, locked :: Boolean, poll :: Maybe String, icon :: Maybe String, tags :: Array String, guard :: Int }
```

#### `ThreadResponse`

``` purescript
newtype ThreadResponse
  = ThreadResponse { id :: Int, userId :: Int, boardId :: Int, name :: String, displayName :: String, description :: Maybe String, sticky :: Boolean, locked :: Boolean, poll :: Maybe String, icon :: Maybe String, tags :: Array String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

##### Instances
``` purescript
EncodeJson ThreadResponse
DecodeJson ThreadResponse
Requestable ThreadResponse
Respondable ThreadResponse
IsForeign ThreadResponse
Show ThreadResponse
```

#### `ThreadResponseR`

``` purescript
type ThreadResponseR = { id :: Int, userId :: Int, boardId :: Int, name :: String, displayName :: String, description :: Maybe String, sticky :: Boolean, locked :: Boolean, poll :: Maybe String, icon :: Maybe String, tags :: Array String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `ThreadResponses`

``` purescript
newtype ThreadResponses
  = ThreadResponses { threadResponses :: Array ThreadResponse }
```

##### Instances
``` purescript
EncodeJson ThreadResponses
DecodeJson ThreadResponses
Requestable ThreadResponses
Respondable ThreadResponses
IsForeign ThreadResponses
Show ThreadResponses
```

#### `ThreadResponsesR`

``` purescript
type ThreadResponsesR = { threadResponses :: Array ThreadResponse }
```

#### `ThreadStatResponse`

``` purescript
newtype ThreadStatResponse
  = ThreadStatResponse { threadId :: Int, threadPosts :: Int, views :: Int }
```

##### Instances
``` purescript
EncodeJson ThreadStatResponse
DecodeJson ThreadStatResponse
Requestable ThreadStatResponse
Respondable ThreadStatResponse
IsForeign ThreadStatResponse
Show ThreadStatResponse
```

#### `ThreadStatResponseR`

``` purescript
type ThreadStatResponseR = { threadId :: Int, threadPosts :: Int, views :: Int }
```

#### `ThreadStatResponses`

``` purescript
newtype ThreadStatResponses
  = ThreadStatResponses { threadStatResponses :: Array ThreadStatResponse }
```

##### Instances
``` purescript
EncodeJson ThreadStatResponses
DecodeJson ThreadStatResponses
Requestable ThreadStatResponses
Respondable ThreadStatResponses
IsForeign ThreadStatResponses
Show ThreadStatResponses
```

#### `ThreadStatResponsesR`

``` purescript
type ThreadStatResponsesR = { threadStatResponses :: Array ThreadStatResponse }
```

#### `TyLeuron`

``` purescript
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
```

##### Instances
``` purescript
EncodeJson TyLeuron
DecodeJson TyLeuron
Requestable TyLeuron
Respondable TyLeuron
IsForeign TyLeuron
Show TyLeuron
Eq TyLeuron
```

#### `TyResourceType`

``` purescript
data TyResourceType
  = TyISBN13
  | TyISBN10
  | TyISBN
  | TyURL
  | TySourceNone
```

##### Instances
``` purescript
EncodeJson TyResourceType
DecodeJson TyResourceType
Requestable TyResourceType
Respondable TyResourceType
IsForeign TyResourceType
Show TyResourceType
Eq TyResourceType
```

#### `TySplits`

``` purescript
data TySplits
  = TySplitA
  | TySplitNone
```

##### Instances
``` purescript
EncodeJson TySplits
DecodeJson TySplits
Requestable TySplits
Respondable TySplits
IsForeign TySplits
Show TySplits
Eq TySplits
```

#### `TySubstitutions`

``` purescript
data TySubstitutions
  = TySubsExpr
  | TySubsOneOf
  | TySubsAllOf
  | TySubsBoth
```

##### Instances
``` purescript
EncodeJson TySubstitutions
DecodeJson TySubstitutions
Requestable TySubstitutions
Respondable TySubstitutions
IsForeign TySubstitutions
Show TySubstitutions
Eq TySubstitutions
```

#### `UserPackResponse`

``` purescript
newtype UserPackResponse
  = UserPackResponse { user :: UserResponse, userId :: Int, stat :: UserSanitizedStatResponse, profile :: ProfileResponse, profileId :: Int }
```

##### Instances
``` purescript
EncodeJson UserPackResponse
DecodeJson UserPackResponse
Requestable UserPackResponse
Respondable UserPackResponse
IsForeign UserPackResponse
Show UserPackResponse
```

#### `UserPackResponseR`

``` purescript
type UserPackResponseR = { user :: UserResponse, userId :: Int, stat :: UserSanitizedStatResponse, profile :: ProfileResponse, profileId :: Int }
```

#### `UserPackResponses`

``` purescript
newtype UserPackResponses
  = UserPackResponses { userPackResponses :: Array UserPackResponse }
```

##### Instances
``` purescript
EncodeJson UserPackResponses
DecodeJson UserPackResponses
Requestable UserPackResponses
Respondable UserPackResponses
IsForeign UserPackResponses
Show UserPackResponses
```

#### `UserPackResponsesR`

``` purescript
type UserPackResponsesR = { userPackResponses :: Array UserPackResponse }
```

#### `UserRequest`

``` purescript
newtype UserRequest
  = UserRequest { displayNick :: String, name :: String, email :: String, plugin :: String, ident :: String, acceptTOS :: Maybe Date }
```

##### Instances
``` purescript
EncodeJson UserRequest
DecodeJson UserRequest
Requestable UserRequest
Respondable UserRequest
IsForeign UserRequest
Show UserRequest
```

#### `UserRequestR`

``` purescript
type UserRequestR = { displayNick :: String, name :: String, email :: String, plugin :: String, ident :: String, acceptTOS :: Maybe Date }
```

#### `UserResponse`

``` purescript
newtype UserResponse
  = UserResponse { id :: Int, nick :: String, displayNick :: String, name :: String, email :: String, emailMD5 :: String, plugin :: String, ident :: String, acceptTOS :: Maybe Date, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date, deactivatedAt :: Maybe Date, activityAt :: Maybe Date }
```

##### Instances
``` purescript
EncodeJson UserResponse
DecodeJson UserResponse
Requestable UserResponse
Respondable UserResponse
IsForeign UserResponse
Show UserResponse
```

#### `UserResponseR`

``` purescript
type UserResponseR = { id :: Int, nick :: String, displayNick :: String, name :: String, email :: String, emailMD5 :: String, plugin :: String, ident :: String, acceptTOS :: Maybe Date, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date, deactivatedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `UserResponses`

``` purescript
newtype UserResponses
  = UserResponses { userResponses :: Array UserResponse }
```

##### Instances
``` purescript
EncodeJson UserResponses
DecodeJson UserResponses
Requestable UserResponses
Respondable UserResponses
IsForeign UserResponses
Show UserResponses
```

#### `UserResponsesR`

``` purescript
type UserResponsesR = { userResponses :: Array UserResponse }
```

#### `UserSanitizedPackResponse`

``` purescript
newtype UserSanitizedPackResponse
  = UserSanitizedPackResponse { user :: UserSanitizedResponse, userId :: Int, profile :: ProfileResponse, profileId :: Int, stat :: UserSanitizedStatResponse, like :: Maybe LikeResponse, star :: Maybe StarResponse }
```

##### Instances
``` purescript
EncodeJson UserSanitizedPackResponse
DecodeJson UserSanitizedPackResponse
Requestable UserSanitizedPackResponse
Respondable UserSanitizedPackResponse
IsForeign UserSanitizedPackResponse
Show UserSanitizedPackResponse
```

#### `UserSanitizedPackResponseR`

``` purescript
type UserSanitizedPackResponseR = { user :: UserSanitizedResponse, userId :: Int, profile :: ProfileResponse, profileId :: Int, stat :: UserSanitizedStatResponse, like :: Maybe LikeResponse, star :: Maybe StarResponse }
```

#### `UserSanitizedPackResponses`

``` purescript
newtype UserSanitizedPackResponses
  = UserSanitizedPackResponses { userSanitizedPackResponses :: Array UserSanitizedPackResponse }
```

##### Instances
``` purescript
EncodeJson UserSanitizedPackResponses
DecodeJson UserSanitizedPackResponses
Requestable UserSanitizedPackResponses
Respondable UserSanitizedPackResponses
IsForeign UserSanitizedPackResponses
Show UserSanitizedPackResponses
```

#### `UserSanitizedPackResponsesR`

``` purescript
type UserSanitizedPackResponsesR = { userSanitizedPackResponses :: Array UserSanitizedPackResponse }
```

#### `UserSanitizedResponse`

``` purescript
newtype UserSanitizedResponse
  = UserSanitizedResponse { id :: Int, nick :: String, displayNick :: String, emailMD5 :: String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, activityAt :: Maybe Date }
```

##### Instances
``` purescript
EncodeJson UserSanitizedResponse
DecodeJson UserSanitizedResponse
Requestable UserSanitizedResponse
Respondable UserSanitizedResponse
IsForeign UserSanitizedResponse
Show UserSanitizedResponse
```

#### `UserSanitizedResponseR`

``` purescript
type UserSanitizedResponseR = { id :: Int, nick :: String, displayNick :: String, emailMD5 :: String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `UserSanitizedResponses`

``` purescript
newtype UserSanitizedResponses
  = UserSanitizedResponses { userSanitizedResponses :: Array UserSanitizedResponse }
```

##### Instances
``` purescript
EncodeJson UserSanitizedResponses
DecodeJson UserSanitizedResponses
Requestable UserSanitizedResponses
Respondable UserSanitizedResponses
IsForeign UserSanitizedResponses
Show UserSanitizedResponses
```

#### `UserSanitizedResponsesR`

``` purescript
type UserSanitizedResponsesR = { userSanitizedResponses :: Array UserSanitizedResponse }
```

#### `UserSanitizedStatResponse`

``` purescript
newtype UserSanitizedStatResponse
  = UserSanitizedStatResponse { userId :: Int, threads :: Int, threadPosts :: Int, respect :: Int, resources :: Int, leurons :: Int, workouts :: Int }
```

##### Instances
``` purescript
EncodeJson UserSanitizedStatResponse
DecodeJson UserSanitizedStatResponse
Requestable UserSanitizedStatResponse
Respondable UserSanitizedStatResponse
IsForeign UserSanitizedStatResponse
Show UserSanitizedStatResponse
```

#### `UserSanitizedStatResponseR`

``` purescript
type UserSanitizedStatResponseR = { userId :: Int, threads :: Int, threadPosts :: Int, respect :: Int, resources :: Int, leurons :: Int, workouts :: Int }
```

#### `UserSanitizedStatResponses`

``` purescript
newtype UserSanitizedStatResponses
  = UserSanitizedStatResponses { userSanitizedStatResponses :: Array UserSanitizedStatResponse }
```

##### Instances
``` purescript
EncodeJson UserSanitizedStatResponses
DecodeJson UserSanitizedStatResponses
Requestable UserSanitizedStatResponses
Respondable UserSanitizedStatResponses
IsForeign UserSanitizedStatResponses
Show UserSanitizedStatResponses
```

#### `UserSanitizedStatResponsesR`

``` purescript
type UserSanitizedStatResponsesR = { userSanitizedStatResponses :: Array UserSanitizedStatResponse }
```

#### `Visibility`

``` purescript
data Visibility
  = Public
  | Private
```

##### Instances
``` purescript
EncodeJson Visibility
DecodeJson Visibility
Requestable Visibility
Respondable Visibility
IsForeign Visibility
Show Visibility
Eq Visibility
```

#### `_Acronym`

``` purescript
_Acronym :: LensP Acronym { abbreviation :: String, meaning :: String }
```

#### `_Antonym`

``` purescript
_Antonym :: LensP Antonym { a :: String, b :: String }
```

#### `_ApiRequest`

``` purescript
_ApiRequest :: LensP ApiRequest { comment :: Maybe String, guard :: Int }
```

#### `_ApiResponse`

``` purescript
_ApiResponse :: LensP ApiResponse { id :: Int, userId :: Int, key :: String, comment :: Maybe String, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date }
```

#### `_ApiResponses`

``` purescript
_ApiResponses :: LensP ApiResponses { apiResponses :: Array ApiResponse }
```

#### `_BoardPackResponse`

``` purescript
_BoardPackResponse :: LensP BoardPackResponse { board :: BoardResponse, boardId :: Int, stat :: BoardStatResponse, like :: Maybe LikeResponse, star :: Maybe StarResponse, latestThread :: Maybe ThreadResponse, latestThreadPost :: Maybe ThreadPostResponse, latestThreadPostUser :: Maybe UserSanitizedResponse, isOwner :: Boolean }
```

#### `_BoardPackResponses`

``` purescript
_BoardPackResponses :: LensP BoardPackResponses { boardPackResponses :: Array BoardPackResponse }
```

#### `_BoardRequest`

``` purescript
_BoardRequest :: LensP BoardRequest { displayName :: String, description :: Maybe String, isAnonymous :: Boolean, canCreateSubBoards :: Boolean, canCreateThreads :: Boolean, suggestedTags :: Array String, icon :: Maybe String, tags :: Array String, guard :: Int }
```

#### `_BoardResponse`

``` purescript
_BoardResponse :: LensP BoardResponse { id :: Int, userId :: Int, forumId :: Int, parentId :: Maybe Int, name :: String, displayName :: String, description :: Maybe String, isAnonymous :: Boolean, canCreateSubBoards :: Boolean, canCreateThreads :: Boolean, suggestedTags :: Array String, icon :: Maybe String, tags :: Array String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `_BoardResponses`

``` purescript
_BoardResponses :: LensP BoardResponses { boardResponses :: Array BoardResponse }
```

#### `_BoardStatResponse`

``` purescript
_BoardStatResponse :: LensP BoardStatResponse { boardId :: Int, threads :: Int, threadPosts :: Int, views :: Int }
```

#### `_BoardStatResponses`

``` purescript
_BoardStatResponses :: LensP BoardStatResponses { boardStatResponses :: Array BoardStatResponse }
```

#### `_BucketRequest`

``` purescript
_BucketRequest :: LensP BucketRequest { displayName :: String, description :: Maybe String, scoreLo :: Int, scoreHi :: Int, leurons :: Array Int, resources :: Array Int, categories :: Array String, filters :: Array Int, guard :: Int }
```

#### `_BucketResponse`

``` purescript
_BucketResponse :: LensP BucketResponse { id :: Int, userId :: Int, name :: String, displayName :: String, description :: Maybe String, scoreLo :: Int, scoreHi :: Int, leurons :: Array Int, resources :: Array Int, categories :: Array String, filters :: Array Int, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `_BucketResponses`

``` purescript
_BucketResponses :: LensP BucketResponses { bucketResponses :: Array BucketResponse }
```

#### `_Card`

``` purescript
_Card :: LensP Card { front :: String, back :: String }
```

#### `_CountResponse`

``` purescript
_CountResponse :: LensP CountResponse { id :: Int, n :: Int }
```

#### `_CountResponses`

``` purescript
_CountResponses :: LensP CountResponses { countResponses :: Array CountResponse }
```

#### `_DCard`

``` purescript
_DCard :: LensP DCard { front :: String, back :: String }
```

#### `_DCardX`

``` purescript
_DCardX :: LensP DCardX { front :: Array String, back :: Array String }
```

#### `_EmptyRequest`

``` purescript
_EmptyRequest :: LensP EmptyRequest { value :: Boolean }
```

#### `_EmptyResponse`

``` purescript
_EmptyResponse :: LensP EmptyResponse { id :: Int, userId :: Int, value :: Boolean, createdAt :: Maybe Date, modifiedAt :: Maybe Date }
```

#### `_EmptyResponses`

``` purescript
_EmptyResponses :: LensP EmptyResponses { emptyResponses :: Array EmptyResponse }
```

#### `_Fact`

``` purescript
_Fact :: LensP Fact { text :: String }
```

#### `_FactList`

``` purescript
_FactList :: LensP FactList { fact :: String, list :: Array String }
```

#### `_ForumPackResponse`

``` purescript
_ForumPackResponse :: LensP ForumPackResponse { forum :: ForumResponse, forumId :: Int, stat :: ForumStatResponse, like :: Maybe LikeResponse, star :: Maybe StarResponse, isOwner :: Boolean }
```

#### `_ForumPackResponses`

``` purescript
_ForumPackResponses :: LensP ForumPackResponses { forumPackResponses :: Array ForumPackResponse }
```

#### `_ForumRequest`

``` purescript
_ForumRequest :: LensP ForumRequest { displayName :: String, description :: Maybe String, threadsPerBoard :: Int, threadPostsPerThread :: Int, icon :: Maybe String, tags :: Array String, visibility :: Visibility, guard :: Int }
```

#### `_ForumResponse`

``` purescript
_ForumResponse :: LensP ForumResponse { id :: Int, userId :: Int, orgId :: Int, name :: String, displayName :: String, description :: Maybe String, threadsPerBoard :: Int, threadPostsPerThread :: Int, icon :: Maybe String, tags :: Array String, visibility :: Visibility, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `_ForumResponses`

``` purescript
_ForumResponses :: LensP ForumResponses { forumResponses :: Array ForumResponse }
```

#### `_ForumStatResponse`

``` purescript
_ForumStatResponse :: LensP ForumStatResponse { forumId :: Int, boards :: Int, threads :: Int, threadPosts :: Int, views :: Int }
```

#### `_ForumStatResponses`

``` purescript
_ForumStatResponses :: LensP ForumStatResponses { forumStatResponses :: Array ForumStatResponse }
```

#### `_GlobalGroupPackResponse`

``` purescript
_GlobalGroupPackResponse :: LensP GlobalGroupPackResponse { user :: UserSanitizedResponse, userId :: Int, globalGroup :: GlobalGroupResponse, globalGroupId :: Int, stat :: GlobalGroupStatResponse, isOwner :: Boolean }
```

#### `_GlobalGroupPackResponses`

``` purescript
_GlobalGroupPackResponses :: LensP GlobalGroupPackResponses { globalGroupPackResponses :: Array GlobalGroupPackResponse }
```

#### `_GlobalGroupRequest`

``` purescript
_GlobalGroupRequest :: LensP GlobalGroupRequest { displayName :: String, description :: Maybe String, membership :: Membership, icon :: Maybe String, tags :: Array String, visibility :: Visibility, guard :: Int }
```

#### `_GlobalGroupResponse`

``` purescript
_GlobalGroupResponse :: LensP GlobalGroupResponse { id :: Int, userId :: Int, name :: String, displayName :: String, description :: Maybe String, membership :: Membership, icon :: Maybe String, tags :: Array String, visibility :: Visibility, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `_GlobalGroupResponses`

``` purescript
_GlobalGroupResponses :: LensP GlobalGroupResponses { globalGroupResponses :: Array GlobalGroupResponse }
```

#### `_GlobalGroupStatResponse`

``` purescript
_GlobalGroupStatResponse :: LensP GlobalGroupStatResponse { groups :: Int }
```

#### `_GlobalGroupStatResponses`

``` purescript
_GlobalGroupStatResponses :: LensP GlobalGroupStatResponses { globalGroupStatResponses :: Array GlobalGroupStatResponse }
```

#### `_GroupMemberPackResponse`

``` purescript
_GroupMemberPackResponse :: LensP GroupMemberPackResponse { user :: UserSanitizedResponse, userId :: Int, groupMember :: GroupMemberResponse, groupMemberId :: Int, isOwner :: Boolean }
```

#### `_GroupMemberPackResponses`

``` purescript
_GroupMemberPackResponses :: LensP GroupMemberPackResponses { groupMemberPackResponses :: Array GroupMemberPackResponse }
```

#### `_GroupMemberRequest`

``` purescript
_GroupMemberRequest :: LensP GroupMemberRequest { guard :: Int }
```

#### `_GroupMemberResponse`

``` purescript
_GroupMemberResponse :: LensP GroupMemberResponse { id :: Int, userId :: Int, globalGroupId :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `_GroupMemberResponses`

``` purescript
_GroupMemberResponses :: LensP GroupMemberResponses { groupMemberResponses :: Array GroupMemberResponse }
```

#### `_GroupPackResponse`

``` purescript
_GroupPackResponse :: LensP GroupPackResponse { user :: UserSanitizedResponse, userId :: Int, group :: GroupResponse, groupId :: Int, organization :: OrganizationResponse, organizationId :: Int, stat :: GroupStatResponse, isOwner :: Boolean }
```

#### `_GroupPackResponses`

``` purescript
_GroupPackResponses :: LensP GroupPackResponses { groupPackResponses :: Array GroupPackResponse }
```

#### `_GroupRequest`

``` purescript
_GroupRequest :: LensP GroupRequest { guard :: Int }
```

#### `_GroupResponse`

``` purescript
_GroupResponse :: LensP GroupResponse { id :: Int, userId :: Int, globalGroupId :: Int, organizationId :: Int, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `_GroupResponses`

``` purescript
_GroupResponses :: LensP GroupResponses { groupResponses :: Array GroupResponse }
```

#### `_GroupStatResponse`

``` purescript
_GroupStatResponse :: LensP GroupStatResponse { members :: Int }
```

#### `_GroupStatResponses`

``` purescript
_GroupStatResponses :: LensP GroupStatResponses { groupStatResponses :: Array GroupStatResponse }
```

#### `_ImageAssociation`

``` purescript
_ImageAssociation :: LensP ImageAssociation { imageUrl :: Array String, assocBy :: Array String, assocResult :: Array String }
```

#### `_LeuronPackResponse`

``` purescript
_LeuronPackResponse :: LensP LeuronPackResponse { leuron :: LeuronResponse, leuronId :: Int, user :: UserSanitizedResponse, userId :: Int, training :: LeuronTrainingResponse, stat :: LeuronStatResponse, like :: Maybe LikeResponse, star :: Maybe StarResponse, isOwner :: Boolean }
```

#### `_LeuronPackResponses`

``` purescript
_LeuronPackResponses :: LensP LeuronPackResponses { leuronPackResponses :: Array LeuronPackResponse }
```

#### `_LeuronRequest`

``` purescript
_LeuronRequest :: LensP LeuronRequest { dataP :: LeuronData, title :: Maybe String, description :: Maybe String, section :: Maybe String, page :: Maybe String, examples :: Maybe (Array String), strengths :: Maybe (Array String), categories :: DepList String, splits :: Maybe (Array Splits), substitutions :: Maybe (Array Substitutions), tags :: Array String, style :: Maybe (Array String), guard :: Int }
```

#### `_LeuronResponse`

``` purescript
_LeuronResponse :: LensP LeuronResponse { id :: Int, userId :: Int, resourceId :: Int, dataP :: LeuronData, title :: Maybe String, description :: Maybe String, section :: Maybe String, page :: Maybe String, examples :: Maybe (Array String), strengths :: Maybe (Array String), categories :: DepList String, splits :: Maybe (Array Splits), substitutions :: Maybe (Array Substitutions), tags :: Array String, style :: Maybe (Array String), active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `_LeuronResponses`

``` purescript
_LeuronResponses :: LensP LeuronResponses { leuronResponses :: Array LeuronResponse }
```

#### `_LeuronStatResponse`

``` purescript
_LeuronStatResponse :: LensP LeuronStatResponse { leuronId :: Int, likes :: Int, neutral :: Int, dislikes :: Int, stars :: Int, views :: Int }
```

#### `_LeuronStatResponses`

``` purescript
_LeuronStatResponses :: LensP LeuronStatResponses { leuronStatResponses :: Array LeuronStatResponse }
```

#### `_LeuronTrainingRequest`

``` purescript
_LeuronTrainingRequest :: LensP LeuronTrainingRequest { summary :: LeuronTrainingSummary, guard :: Int }
```

#### `_LeuronTrainingResponse`

``` purescript
_LeuronTrainingResponse :: LensP LeuronTrainingResponse { id :: Int, userId :: Int, leuronId :: Int, summary :: LeuronTrainingSummary, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date }
```

#### `_LeuronTrainingResponses`

``` purescript
_LeuronTrainingResponses :: LensP LeuronTrainingResponses { leuronTrainingResponses :: Array LeuronTrainingResponse }
```

#### `_LeuronTrainingStatResponse`

``` purescript
_LeuronTrainingStatResponse :: LensP LeuronTrainingStatResponse { leuronTrainingId :: Int }
```

#### `_LeuronTrainingStatResponses`

``` purescript
_LeuronTrainingStatResponses :: LensP LeuronTrainingStatResponses { leuronTrainingStatResponses :: Array LeuronTrainingStatResponse }
```

#### `_LikeRequest`

``` purescript
_LikeRequest :: LensP LikeRequest { opt :: LikeOpt, reason :: Maybe String, guard :: Int }
```

#### `_LikeResponse`

``` purescript
_LikeResponse :: LensP LikeResponse { id :: Int, ent :: Ent, entId :: Int, userId :: Int, opt :: LikeOpt, score :: Int, reason :: Maybe String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date }
```

#### `_LikeResponses`

``` purescript
_LikeResponses :: LensP LikeResponses { likeResponses :: Array LikeResponse }
```

#### `_LikeStatResponse`

``` purescript
_LikeStatResponse :: LensP LikeStatResponse { ent :: Ent, entId :: Int, score :: Int, like :: Int, neutral :: Int, dislike :: Int }
```

#### `_LikeStatResponses`

``` purescript
_LikeStatResponses :: LensP LikeStatResponses { likeStatResponses :: Array LikeStatResponse }
```

#### `_LinearDemo`

``` purescript
_LinearDemo :: LensP LinearDemo { label :: String, content :: Array LinearDemoNode }
```

#### `_OrganizationPackResponse`

``` purescript
_OrganizationPackResponse :: LensP OrganizationPackResponse { user :: UserSanitizedResponse, userId :: Int, organization :: OrganizationResponse, organizationId :: Int, stat :: OrganizationStatResponse, like :: Maybe LikeResponse, star :: Maybe StarResponse, isOwner :: Boolean, isMember :: Boolean }
```

#### `_OrganizationPackResponses`

``` purescript
_OrganizationPackResponses :: LensP OrganizationPackResponses { organizationPackResponses :: Array OrganizationPackResponse }
```

#### `_OrganizationRequest`

``` purescript
_OrganizationRequest :: LensP OrganizationRequest { displayName :: String, description :: Maybe String, company :: String, location :: String, email :: String, membership :: Membership, tags :: Array String, icon :: Maybe String, visibility :: Visibility, guard :: Int }
```

#### `_OrganizationResponse`

``` purescript
_OrganizationResponse :: LensP OrganizationResponse { id :: Int, userId :: Int, name :: String, displayName :: String, description :: Maybe String, company :: String, location :: String, email :: String, emailMD5 :: String, membership :: Membership, icon :: Maybe String, tags :: Array String, visibility :: Visibility, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `_OrganizationResponses`

``` purescript
_OrganizationResponses :: LensP OrganizationResponses { organizationResponses :: Array OrganizationResponse }
```

#### `_OrganizationStatResponse`

``` purescript
_OrganizationStatResponse :: LensP OrganizationStatResponse { organizationId :: Int, teams :: Int, members :: Int, forums :: Int, boards :: Int, threads :: Int, threadPosts :: Int, views :: Int }
```

#### `_OrganizationStatResponses`

``` purescript
_OrganizationStatResponses :: LensP OrganizationStatResponses { organizationStatResponses :: Array OrganizationStatResponse }
```

#### `_PmInRequest`

``` purescript
_PmInRequest :: LensP PmInRequest { label :: Maybe String, isRead :: Boolean, isStarred :: Boolean, guard :: Int }
```

#### `_PmInResponse`

``` purescript
_PmInResponse :: LensP PmInResponse { id :: Int, pmId :: Int, userId :: Int, label :: Maybe String, isRead :: Boolean, isStarred :: Boolean, isNew :: Boolean, isSaved :: Boolean, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date }
```

#### `_PmInResponses`

``` purescript
_PmInResponses :: LensP PmInResponses { pmInResponses :: Array PmInResponse }
```

#### `_PmOutRequest`

``` purescript
_PmOutRequest :: LensP PmOutRequest { label :: Maybe String, guard :: Int }
```

#### `_PmOutResponse`

``` purescript
_PmOutResponse :: LensP PmOutResponse { id :: Int, pmId :: Int, userId :: Int, label :: Maybe String, isSaved :: Boolean, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date }
```

#### `_PmOutResponses`

``` purescript
_PmOutResponses :: LensP PmOutResponses { pmOutResponses :: Array PmOutResponse }
```

#### `_PmRequest`

``` purescript
_PmRequest :: LensP PmRequest { subject :: String, body :: String, guard :: Int }
```

#### `_PmResponse`

``` purescript
_PmResponse :: LensP PmResponse { id :: Int, userId :: Int, toUserId :: Int, subject :: String, body :: String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `_PmResponses`

``` purescript
_PmResponses :: LensP PmResponses { pmResponses :: Array PmResponse }
```

#### `_ProfileRequest`

``` purescript
_ProfileRequest :: LensP ProfileRequest { gender :: ProfileGender, birthdate :: Date, website :: Maybe String, location :: Maybe String, signature :: Maybe String, guard :: Int }
```

#### `_ProfileResponse`

``` purescript
_ProfileResponse :: LensP ProfileResponse { id :: Int, ent :: Ent, entId :: Int, gender :: ProfileGender, birthdate :: Date, website :: Maybe String, location :: Maybe String, signature :: Maybe String, karmaGood :: Int, karmaBad :: Int, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date }
```

#### `_ProfileResponses`

``` purescript
_ProfileResponses :: LensP ProfileResponses { profileResponses :: Array ProfileResponse }
```

#### `_ProfileX`

``` purescript
_ProfileX :: LensP ProfileX { profileLogin :: String, profileName :: String, profileEmail :: String }
```

#### `_QA`

``` purescript
_QA :: LensP QA { question :: String, answer :: String }
```

#### `_ReminderFolderRequest`

``` purescript
_ReminderFolderRequest :: LensP ReminderFolderRequest { displayName :: String, description :: Maybe String, visibility :: Visibility, guard :: Int }
```

#### `_ReminderFolderResponse`

``` purescript
_ReminderFolderResponse :: LensP ReminderFolderResponse { id :: Int, userId :: Int, parentFolderId :: Maybe Int, name :: String, displayName :: String, visibility :: Visibility, description :: Maybe String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `_ReminderFolderResponses`

``` purescript
_ReminderFolderResponses :: LensP ReminderFolderResponses { reminderFolderResponses :: Array ReminderFolderResponse }
```

#### `_ReminderRequest`

``` purescript
_ReminderRequest :: LensP ReminderRequest { dataP :: String, guard :: Int }
```

#### `_ReminderResponse`

``` purescript
_ReminderResponse :: LensP ReminderResponse { id :: Int, userId :: Int, parentFolderId :: Int, dataP :: String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `_ReminderResponses`

``` purescript
_ReminderResponses :: LensP ReminderResponses { reminderResponses :: Array ReminderResponse }
```

#### `_ResourcePackResponse`

``` purescript
_ResourcePackResponse :: LensP ResourcePackResponse { resource :: ResourceResponse, resourceId :: Int, user :: UserSanitizedResponse, userId :: Int, stat :: ResourceStatResponse, like :: Maybe LikeResponse, star :: Maybe StarResponse, isOwner :: Boolean }
```

#### `_ResourcePackResponses`

``` purescript
_ResourcePackResponses :: LensP ResourcePackResponses { resourcePackResponses :: Array ResourcePackResponse }
```

#### `_ResourceRequest`

``` purescript
_ResourceRequest :: LensP ResourceRequest { displayName :: String, description :: String, source :: ResourceType, author :: Maybe (Array String), prerequisites :: DepList String, categories :: DepList String, visibility :: Visibility, counter :: Int, version :: Maybe String, urls :: Maybe (Array String), icon :: Maybe String, tags :: Array String, guard :: Int }
```

#### `_ResourceResponse`

``` purescript
_ResourceResponse :: LensP ResourceResponse { id :: Int, userId :: Int, name :: String, displayName :: String, description :: String, source :: ResourceType, author :: Maybe (Array String), prerequisites :: DepList String, categories :: DepList String, visibility :: Visibility, counter :: Int, version :: Maybe String, urls :: Maybe (Array String), icon :: Maybe String, tags :: Array String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `_ResourceResponses`

``` purescript
_ResourceResponses :: LensP ResourceResponses { resourceResponses :: Array ResourceResponse }
```

#### `_ResourceStatResponse`

``` purescript
_ResourceStatResponse :: LensP ResourceStatResponse { resourceId :: Int, leurons :: Int, likes :: Int, neutral :: Int, dislikes :: Int, stars :: Int, views :: Int }
```

#### `_ResourceStatResponses`

``` purescript
_ResourceStatResponses :: LensP ResourceStatResponses { resourceStatResponses :: Array ResourceStatResponse }
```

#### `_Script`

``` purescript
_Script :: LensP Script { title :: String, desc :: String, url :: String }
```

#### `_StarRequest`

``` purescript
_StarRequest :: LensP StarRequest { reason :: Maybe String, guard :: Int }
```

#### `_StarResponse`

``` purescript
_StarResponse :: LensP StarResponse { id :: Int, ent :: Ent, entId :: Int, userId :: Int, reason :: Maybe String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date }
```

#### `_StarResponses`

``` purescript
_StarResponses :: LensP StarResponses { starResponses :: Array StarResponse }
```

#### `_StarStatResponse`

``` purescript
_StarStatResponse :: LensP StarStatResponse { ent :: Ent, entId :: Int, stars :: Int }
```

#### `_StarStatResponses`

``` purescript
_StarStatResponses :: LensP StarStatResponses { starStatResponses :: Array StarStatResponse }
```

#### `_Synonym`

``` purescript
_Synonym :: LensP Synonym { a :: String, b :: String }
```

#### `_Table`

``` purescript
_Table :: LensP Table { title :: String, columns :: Array String, rows :: Array (Array (Maybe String)) }
```

#### `_TeamMemberPackResponse`

``` purescript
_TeamMemberPackResponse :: LensP TeamMemberPackResponse { user :: UserSanitizedResponse, userId :: Int, teamMember :: TeamMemberResponse, teamMemberId :: Int, isOwner :: Boolean }
```

#### `_TeamMemberPackResponses`

``` purescript
_TeamMemberPackResponses :: LensP TeamMemberPackResponses { teamMemberPackResponses :: Array TeamMemberPackResponse }
```

#### `_TeamMemberRequest`

``` purescript
_TeamMemberRequest :: LensP TeamMemberRequest { guard :: Int }
```

#### `_TeamMemberResponse`

``` purescript
_TeamMemberResponse :: LensP TeamMemberResponse { id :: Int, userId :: Int, teamId :: Int, isAccepted :: Boolean, acceptedAt :: Maybe Date, isBlocked :: Boolean, blockedAt :: Maybe Date, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `_TeamMemberResponses`

``` purescript
_TeamMemberResponses :: LensP TeamMemberResponses { teamMemberResponses :: Array TeamMemberResponse }
```

#### `_TeamMemberStatResponses`

``` purescript
_TeamMemberStatResponses :: LensP TeamMemberStatResponses { teamMemberStatResponses :: Array TeamMemberStatResponse }
```

#### `_TeamPackResponse`

``` purescript
_TeamPackResponse :: LensP TeamPackResponse { user :: UserSanitizedResponse, userId :: Int, team :: TeamResponse, teamId :: Int, stat :: TeamStatResponse, like :: Maybe LikeResponse, star :: Maybe StarResponse, isOwner :: Boolean }
```

#### `_TeamPackResponses`

``` purescript
_TeamPackResponses :: LensP TeamPackResponses { teamPackResponses :: Array TeamPackResponse }
```

#### `_TeamRequest`

``` purescript
_TeamRequest :: LensP TeamRequest { displayName :: String, description :: Maybe String, membership :: Membership, icon :: Maybe String, tags :: Array String, visibility :: Visibility, guard :: Int }
```

#### `_TeamResponse`

``` purescript
_TeamResponse :: LensP TeamResponse { id :: Int, userId :: Int, orgId :: Int, name :: String, displayName :: String, description :: Maybe String, membership :: Membership, icon :: Maybe String, tags :: Array String, visibility :: Visibility, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `_TeamResponses`

``` purescript
_TeamResponses :: LensP TeamResponses { teamResponses :: Array TeamResponse }
```

#### `_TeamStatResponse`

``` purescript
_TeamStatResponse :: LensP TeamStatResponse { members :: Int }
```

#### `_TeamStatResponses`

``` purescript
_TeamStatResponses :: LensP TeamStatResponses { teamStatResponses :: Array TeamStatResponse }
```

#### `_Template`

``` purescript
_Template :: LensP Template { template :: String, values :: Array TemplateValue }
```

#### `_TestRequest`

``` purescript
_TestRequest :: LensP TestRequest { msg :: String }
```

#### `_TestResponse`

``` purescript
_TestResponse :: LensP TestResponse { id :: Int, userId :: Int, msg :: String, createdAt :: Maybe Date, modifiedAt :: Maybe Date }
```

#### `_TestResponses`

``` purescript
_TestResponses :: LensP TestResponses { testResponses :: Array TestResponse }
```

#### `_ThreadPackResponse`

``` purescript
_ThreadPackResponse :: LensP ThreadPackResponse { thread :: ThreadResponse, threadId :: Int, user :: UserSanitizedResponse, userId :: Int, stat :: ThreadStatResponse, like :: Maybe LikeResponse, star :: Maybe StarResponse, latestThreadPost :: Maybe ThreadPostResponse, latestThreadPostUser :: Maybe UserSanitizedResponse, isOwner :: Boolean }
```

#### `_ThreadPackResponses`

``` purescript
_ThreadPackResponses :: LensP ThreadPackResponses { threadPackResponses :: Array ThreadPackResponse }
```

#### `_ThreadPostPackResponse`

``` purescript
_ThreadPostPackResponse :: LensP ThreadPostPackResponse { threadPost :: ThreadPostResponse, threadPostId :: Int, user :: UserSanitizedResponse, userId :: Int, stat :: ThreadPostStatResponse, like :: Maybe LikeResponse, star :: Maybe StarResponse, isOwner :: Boolean }
```

#### `_ThreadPostPackResponses`

``` purescript
_ThreadPostPackResponses :: LensP ThreadPostPackResponses { threadPostPackResponses :: Array ThreadPostPackResponse }
```

#### `_ThreadPostRequest`

``` purescript
_ThreadPostRequest :: LensP ThreadPostRequest { title :: Maybe String, body :: PostData, tags :: Array String, privateTags :: Array String, guard :: Int }
```

#### `_ThreadPostResponse`

``` purescript
_ThreadPostResponse :: LensP ThreadPostResponse { id :: Int, userId :: Int, threadId :: Int, parentId :: Maybe Int, title :: Maybe String, body :: PostData, tags :: Array String, privateTags :: Array String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `_ThreadPostResponses`

``` purescript
_ThreadPostResponses :: LensP ThreadPostResponses { threadPostResponses :: Array ThreadPostResponse }
```

#### `_ThreadPostStatResponse`

``` purescript
_ThreadPostStatResponse :: LensP ThreadPostStatResponse { threadPostId :: Int, likes :: Int, neutral :: Int, dislikes :: Int, stars :: Int, views :: Int }
```

#### `_ThreadPostStatResponses`

``` purescript
_ThreadPostStatResponses :: LensP ThreadPostStatResponses { threadPostStatResponses :: Array ThreadPostStatResponse }
```

#### `_ThreadRequest`

``` purescript
_ThreadRequest :: LensP ThreadRequest { displayName :: String, description :: Maybe String, sticky :: Boolean, locked :: Boolean, poll :: Maybe String, icon :: Maybe String, tags :: Array String, guard :: Int }
```

#### `_ThreadResponse`

``` purescript
_ThreadResponse :: LensP ThreadResponse { id :: Int, userId :: Int, boardId :: Int, name :: String, displayName :: String, description :: Maybe String, sticky :: Boolean, locked :: Boolean, poll :: Maybe String, icon :: Maybe String, tags :: Array String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `_ThreadResponses`

``` purescript
_ThreadResponses :: LensP ThreadResponses { threadResponses :: Array ThreadResponse }
```

#### `_ThreadStatResponse`

``` purescript
_ThreadStatResponse :: LensP ThreadStatResponse { threadId :: Int, threadPosts :: Int, views :: Int }
```

#### `_ThreadStatResponses`

``` purescript
_ThreadStatResponses :: LensP ThreadStatResponses { threadStatResponses :: Array ThreadStatResponse }
```

#### `_UserPackResponse`

``` purescript
_UserPackResponse :: LensP UserPackResponse { user :: UserResponse, userId :: Int, stat :: UserSanitizedStatResponse, profile :: ProfileResponse, profileId :: Int }
```

#### `_UserPackResponses`

``` purescript
_UserPackResponses :: LensP UserPackResponses { userPackResponses :: Array UserPackResponse }
```

#### `_UserRequest`

``` purescript
_UserRequest :: LensP UserRequest { displayNick :: String, name :: String, email :: String, plugin :: String, ident :: String, acceptTOS :: Maybe Date }
```

#### `_UserResponse`

``` purescript
_UserResponse :: LensP UserResponse { id :: Int, nick :: String, displayNick :: String, name :: String, email :: String, emailMD5 :: String, plugin :: String, ident :: String, acceptTOS :: Maybe Date, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date, deactivatedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `_UserResponses`

``` purescript
_UserResponses :: LensP UserResponses { userResponses :: Array UserResponse }
```

#### `_UserSanitizedPackResponse`

``` purescript
_UserSanitizedPackResponse :: LensP UserSanitizedPackResponse { user :: UserSanitizedResponse, userId :: Int, profile :: ProfileResponse, profileId :: Int, stat :: UserSanitizedStatResponse, like :: Maybe LikeResponse, star :: Maybe StarResponse }
```

#### `_UserSanitizedPackResponses`

``` purescript
_UserSanitizedPackResponses :: LensP UserSanitizedPackResponses { userSanitizedPackResponses :: Array UserSanitizedPackResponse }
```

#### `_UserSanitizedResponse`

``` purescript
_UserSanitizedResponse :: LensP UserSanitizedResponse { id :: Int, nick :: String, displayNick :: String, emailMD5 :: String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `_UserSanitizedResponses`

``` purescript
_UserSanitizedResponses :: LensP UserSanitizedResponses { userSanitizedResponses :: Array UserSanitizedResponse }
```

#### `_UserSanitizedStatResponse`

``` purescript
_UserSanitizedStatResponse :: LensP UserSanitizedStatResponse { userId :: Int, threads :: Int, threadPosts :: Int, respect :: Int, resources :: Int, leurons :: Int, workouts :: Int }
```

#### `_UserSanitizedStatResponses`

``` purescript
_UserSanitizedStatResponses :: LensP UserSanitizedStatResponses { userSanitizedStatResponses :: Array UserSanitizedStatResponse }
```

#### `a_`

``` purescript
a_ :: forall b a r. Lens { a :: a | r } { a :: b | r } a b
```

#### `abbreviation_`

``` purescript
abbreviation_ :: forall b a r. Lens { abbreviation :: a | r } { abbreviation :: b | r } a b
```

#### `acceptTOS_`

``` purescript
acceptTOS_ :: forall b a r. Lens { acceptTOS :: a | r } { acceptTOS :: b | r } a b
```

#### `acceptedAt_`

``` purescript
acceptedAt_ :: forall b a r. Lens { acceptedAt :: a | r } { acceptedAt :: b | r } a b
```

#### `active_`

``` purescript
active_ :: forall b a r. Lens { active :: a | r } { active :: b | r } a b
```

#### `activityAt_`

``` purescript
activityAt_ :: forall b a r. Lens { activityAt :: a | r } { activityAt :: b | r } a b
```

#### `answer_`

``` purescript
answer_ :: forall b a r. Lens { answer :: a | r } { answer :: b | r } a b
```

#### `apiResponses_`

``` purescript
apiResponses_ :: forall b a r. Lens { apiResponses :: a | r } { apiResponses :: b | r } a b
```

#### `assocBy_`

``` purescript
assocBy_ :: forall b a r. Lens { assocBy :: a | r } { assocBy :: b | r } a b
```

#### `assocResult_`

``` purescript
assocResult_ :: forall b a r. Lens { assocResult :: a | r } { assocResult :: b | r } a b
```

#### `author_`

``` purescript
author_ :: forall b a r. Lens { author :: a | r } { author :: b | r } a b
```

#### `b_`

``` purescript
b_ :: forall b a r. Lens { b :: a | r } { b :: b | r } a b
```

#### `back_`

``` purescript
back_ :: forall b a r. Lens { back :: a | r } { back :: b | r } a b
```

#### `birthdate_`

``` purescript
birthdate_ :: forall b a r. Lens { birthdate :: a | r } { birthdate :: b | r } a b
```

#### `blockedAt_`

``` purescript
blockedAt_ :: forall b a r. Lens { blockedAt :: a | r } { blockedAt :: b | r } a b
```

#### `boardId_`

``` purescript
boardId_ :: forall b a r. Lens { boardId :: a | r } { boardId :: b | r } a b
```

#### `boardPackResponses_`

``` purescript
boardPackResponses_ :: forall b a r. Lens { boardPackResponses :: a | r } { boardPackResponses :: b | r } a b
```

#### `boardResponses_`

``` purescript
boardResponses_ :: forall b a r. Lens { boardResponses :: a | r } { boardResponses :: b | r } a b
```

#### `boardStatResponses_`

``` purescript
boardStatResponses_ :: forall b a r. Lens { boardStatResponses :: a | r } { boardStatResponses :: b | r } a b
```

#### `board_`

``` purescript
board_ :: forall b a r. Lens { board :: a | r } { board :: b | r } a b
```

#### `boards_`

``` purescript
boards_ :: forall b a r. Lens { boards :: a | r } { boards :: b | r } a b
```

#### `body_`

``` purescript
body_ :: forall b a r. Lens { body :: a | r } { body :: b | r } a b
```

#### `bucketResponses_`

``` purescript
bucketResponses_ :: forall b a r. Lens { bucketResponses :: a | r } { bucketResponses :: b | r } a b
```

#### `canCreateSubBoards_`

``` purescript
canCreateSubBoards_ :: forall b a r. Lens { canCreateSubBoards :: a | r } { canCreateSubBoards :: b | r } a b
```

#### `canCreateThreads_`

``` purescript
canCreateThreads_ :: forall b a r. Lens { canCreateThreads :: a | r } { canCreateThreads :: b | r } a b
```

#### `categories_`

``` purescript
categories_ :: forall b a r. Lens { categories :: a | r } { categories :: b | r } a b
```

#### `columns_`

``` purescript
columns_ :: forall b a r. Lens { columns :: a | r } { columns :: b | r } a b
```

#### `comment_`

``` purescript
comment_ :: forall b a r. Lens { comment :: a | r } { comment :: b | r } a b
```

#### `company_`

``` purescript
company_ :: forall b a r. Lens { company :: a | r } { company :: b | r } a b
```

#### `content_`

``` purescript
content_ :: forall b a r. Lens { content :: a | r } { content :: b | r } a b
```

#### `countResponses_`

``` purescript
countResponses_ :: forall b a r. Lens { countResponses :: a | r } { countResponses :: b | r } a b
```

#### `counter_`

``` purescript
counter_ :: forall b a r. Lens { counter :: a | r } { counter :: b | r } a b
```

#### `createdAt_`

``` purescript
createdAt_ :: forall b a r. Lens { createdAt :: a | r } { createdAt :: b | r } a b
```

#### `dataP_`

``` purescript
dataP_ :: forall b a r. Lens { dataP :: a | r } { dataP :: b | r } a b
```

#### `deactivatedAt_`

``` purescript
deactivatedAt_ :: forall b a r. Lens { deactivatedAt :: a | r } { deactivatedAt :: b | r } a b
```

#### `desc_`

``` purescript
desc_ :: forall b a r. Lens { desc :: a | r } { desc :: b | r } a b
```

#### `description_`

``` purescript
description_ :: forall b a r. Lens { description :: a | r } { description :: b | r } a b
```

#### `dislike_`

``` purescript
dislike_ :: forall b a r. Lens { dislike :: a | r } { dislike :: b | r } a b
```

#### `dislikes_`

``` purescript
dislikes_ :: forall b a r. Lens { dislikes :: a | r } { dislikes :: b | r } a b
```

#### `displayName_`

``` purescript
displayName_ :: forall b a r. Lens { displayName :: a | r } { displayName :: b | r } a b
```

#### `displayNick_`

``` purescript
displayNick_ :: forall b a r. Lens { displayNick :: a | r } { displayNick :: b | r } a b
```

#### `emailMD5_`

``` purescript
emailMD5_ :: forall b a r. Lens { emailMD5 :: a | r } { emailMD5 :: b | r } a b
```

#### `email_`

``` purescript
email_ :: forall b a r. Lens { email :: a | r } { email :: b | r } a b
```

#### `emptyResponses_`

``` purescript
emptyResponses_ :: forall b a r. Lens { emptyResponses :: a | r } { emptyResponses :: b | r } a b
```

#### `entId_`

``` purescript
entId_ :: forall b a r. Lens { entId :: a | r } { entId :: b | r } a b
```

#### `ent_`

``` purescript
ent_ :: forall b a r. Lens { ent :: a | r } { ent :: b | r } a b
```

#### `examples_`

``` purescript
examples_ :: forall b a r. Lens { examples :: a | r } { examples :: b | r } a b
```

#### `fact_`

``` purescript
fact_ :: forall b a r. Lens { fact :: a | r } { fact :: b | r } a b
```

#### `filters_`

``` purescript
filters_ :: forall b a r. Lens { filters :: a | r } { filters :: b | r } a b
```

#### `forumId_`

``` purescript
forumId_ :: forall b a r. Lens { forumId :: a | r } { forumId :: b | r } a b
```

#### `forumPackResponses_`

``` purescript
forumPackResponses_ :: forall b a r. Lens { forumPackResponses :: a | r } { forumPackResponses :: b | r } a b
```

#### `forumResponses_`

``` purescript
forumResponses_ :: forall b a r. Lens { forumResponses :: a | r } { forumResponses :: b | r } a b
```

#### `forumStatResponses_`

``` purescript
forumStatResponses_ :: forall b a r. Lens { forumStatResponses :: a | r } { forumStatResponses :: b | r } a b
```

#### `forum_`

``` purescript
forum_ :: forall b a r. Lens { forum :: a | r } { forum :: b | r } a b
```

#### `forums_`

``` purescript
forums_ :: forall b a r. Lens { forums :: a | r } { forums :: b | r } a b
```

#### `front_`

``` purescript
front_ :: forall b a r. Lens { front :: a | r } { front :: b | r } a b
```

#### `gender_`

``` purescript
gender_ :: forall b a r. Lens { gender :: a | r } { gender :: b | r } a b
```

#### `globalGroupId_`

``` purescript
globalGroupId_ :: forall b a r. Lens { globalGroupId :: a | r } { globalGroupId :: b | r } a b
```

#### `globalGroupPackResponses_`

``` purescript
globalGroupPackResponses_ :: forall b a r. Lens { globalGroupPackResponses :: a | r } { globalGroupPackResponses :: b | r } a b
```

#### `globalGroupResponses_`

``` purescript
globalGroupResponses_ :: forall b a r. Lens { globalGroupResponses :: a | r } { globalGroupResponses :: b | r } a b
```

#### `globalGroupStatResponses_`

``` purescript
globalGroupStatResponses_ :: forall b a r. Lens { globalGroupStatResponses :: a | r } { globalGroupStatResponses :: b | r } a b
```

#### `globalGroup_`

``` purescript
globalGroup_ :: forall b a r. Lens { globalGroup :: a | r } { globalGroup :: b | r } a b
```

#### `groupId_`

``` purescript
groupId_ :: forall b a r. Lens { groupId :: a | r } { groupId :: b | r } a b
```

#### `groupMemberId_`

``` purescript
groupMemberId_ :: forall b a r. Lens { groupMemberId :: a | r } { groupMemberId :: b | r } a b
```

#### `groupMemberPackResponses_`

``` purescript
groupMemberPackResponses_ :: forall b a r. Lens { groupMemberPackResponses :: a | r } { groupMemberPackResponses :: b | r } a b
```

#### `groupMemberResponses_`

``` purescript
groupMemberResponses_ :: forall b a r. Lens { groupMemberResponses :: a | r } { groupMemberResponses :: b | r } a b
```

#### `groupMember_`

``` purescript
groupMember_ :: forall b a r. Lens { groupMember :: a | r } { groupMember :: b | r } a b
```

#### `groupPackResponses_`

``` purescript
groupPackResponses_ :: forall b a r. Lens { groupPackResponses :: a | r } { groupPackResponses :: b | r } a b
```

#### `groupResponses_`

``` purescript
groupResponses_ :: forall b a r. Lens { groupResponses :: a | r } { groupResponses :: b | r } a b
```

#### `groupStatResponses_`

``` purescript
groupStatResponses_ :: forall b a r. Lens { groupStatResponses :: a | r } { groupStatResponses :: b | r } a b
```

#### `group_`

``` purescript
group_ :: forall b a r. Lens { group :: a | r } { group :: b | r } a b
```

#### `groups_`

``` purescript
groups_ :: forall b a r. Lens { groups :: a | r } { groups :: b | r } a b
```

#### `guard_`

``` purescript
guard_ :: forall b a r. Lens { guard :: a | r } { guard :: b | r } a b
```

#### `icon_`

``` purescript
icon_ :: forall b a r. Lens { icon :: a | r } { icon :: b | r } a b
```

#### `id_`

``` purescript
id_ :: forall b a r. Lens { id :: a | r } { id :: b | r } a b
```

#### `ident_`

``` purescript
ident_ :: forall b a r. Lens { ident :: a | r } { ident :: b | r } a b
```

#### `imageUrl_`

``` purescript
imageUrl_ :: forall b a r. Lens { imageUrl :: a | r } { imageUrl :: b | r } a b
```

#### `isAccepted_`

``` purescript
isAccepted_ :: forall b a r. Lens { isAccepted :: a | r } { isAccepted :: b | r } a b
```

#### `isAnonymous_`

``` purescript
isAnonymous_ :: forall b a r. Lens { isAnonymous :: a | r } { isAnonymous :: b | r } a b
```

#### `isBlocked_`

``` purescript
isBlocked_ :: forall b a r. Lens { isBlocked :: a | r } { isBlocked :: b | r } a b
```

#### `isMember_`

``` purescript
isMember_ :: forall b a r. Lens { isMember :: a | r } { isMember :: b | r } a b
```

#### `isNew_`

``` purescript
isNew_ :: forall b a r. Lens { isNew :: a | r } { isNew :: b | r } a b
```

#### `isOwner_`

``` purescript
isOwner_ :: forall b a r. Lens { isOwner :: a | r } { isOwner :: b | r } a b
```

#### `isRead_`

``` purescript
isRead_ :: forall b a r. Lens { isRead :: a | r } { isRead :: b | r } a b
```

#### `isSaved_`

``` purescript
isSaved_ :: forall b a r. Lens { isSaved :: a | r } { isSaved :: b | r } a b
```

#### `isStarred_`

``` purescript
isStarred_ :: forall b a r. Lens { isStarred :: a | r } { isStarred :: b | r } a b
```

#### `karmaBad_`

``` purescript
karmaBad_ :: forall b a r. Lens { karmaBad :: a | r } { karmaBad :: b | r } a b
```

#### `karmaGood_`

``` purescript
karmaGood_ :: forall b a r. Lens { karmaGood :: a | r } { karmaGood :: b | r } a b
```

#### `key_`

``` purescript
key_ :: forall b a r. Lens { key :: a | r } { key :: b | r } a b
```

#### `label_`

``` purescript
label_ :: forall b a r. Lens { label :: a | r } { label :: b | r } a b
```

#### `latestThreadPostUser_`

``` purescript
latestThreadPostUser_ :: forall b a r. Lens { latestThreadPostUser :: a | r } { latestThreadPostUser :: b | r } a b
```

#### `latestThreadPost_`

``` purescript
latestThreadPost_ :: forall b a r. Lens { latestThreadPost :: a | r } { latestThreadPost :: b | r } a b
```

#### `latestThread_`

``` purescript
latestThread_ :: forall b a r. Lens { latestThread :: a | r } { latestThread :: b | r } a b
```

#### `leuronId_`

``` purescript
leuronId_ :: forall b a r. Lens { leuronId :: a | r } { leuronId :: b | r } a b
```

#### `leuronPackResponses_`

``` purescript
leuronPackResponses_ :: forall b a r. Lens { leuronPackResponses :: a | r } { leuronPackResponses :: b | r } a b
```

#### `leuronResponses_`

``` purescript
leuronResponses_ :: forall b a r. Lens { leuronResponses :: a | r } { leuronResponses :: b | r } a b
```

#### `leuronStatResponses_`

``` purescript
leuronStatResponses_ :: forall b a r. Lens { leuronStatResponses :: a | r } { leuronStatResponses :: b | r } a b
```

#### `leuronTrainingId_`

``` purescript
leuronTrainingId_ :: forall b a r. Lens { leuronTrainingId :: a | r } { leuronTrainingId :: b | r } a b
```

#### `leuronTrainingResponses_`

``` purescript
leuronTrainingResponses_ :: forall b a r. Lens { leuronTrainingResponses :: a | r } { leuronTrainingResponses :: b | r } a b
```

#### `leuronTrainingStatResponses_`

``` purescript
leuronTrainingStatResponses_ :: forall b a r. Lens { leuronTrainingStatResponses :: a | r } { leuronTrainingStatResponses :: b | r } a b
```

#### `leuron_`

``` purescript
leuron_ :: forall b a r. Lens { leuron :: a | r } { leuron :: b | r } a b
```

#### `leurons_`

``` purescript
leurons_ :: forall b a r. Lens { leurons :: a | r } { leurons :: b | r } a b
```

#### `likeResponses_`

``` purescript
likeResponses_ :: forall b a r. Lens { likeResponses :: a | r } { likeResponses :: b | r } a b
```

#### `likeStatResponses_`

``` purescript
likeStatResponses_ :: forall b a r. Lens { likeStatResponses :: a | r } { likeStatResponses :: b | r } a b
```

#### `like_`

``` purescript
like_ :: forall b a r. Lens { like :: a | r } { like :: b | r } a b
```

#### `likes_`

``` purescript
likes_ :: forall b a r. Lens { likes :: a | r } { likes :: b | r } a b
```

#### `list_`

``` purescript
list_ :: forall b a r. Lens { list :: a | r } { list :: b | r } a b
```

#### `location_`

``` purescript
location_ :: forall b a r. Lens { location :: a | r } { location :: b | r } a b
```

#### `locked_`

``` purescript
locked_ :: forall b a r. Lens { locked :: a | r } { locked :: b | r } a b
```

#### `meaning_`

``` purescript
meaning_ :: forall b a r. Lens { meaning :: a | r } { meaning :: b | r } a b
```

#### `members_`

``` purescript
members_ :: forall b a r. Lens { members :: a | r } { members :: b | r } a b
```

#### `membership_`

``` purescript
membership_ :: forall b a r. Lens { membership :: a | r } { membership :: b | r } a b
```

#### `mkAcronym`

``` purescript
mkAcronym :: String -> String -> Acronym
```

#### `mkAntonym`

``` purescript
mkAntonym :: String -> String -> Antonym
```

#### `mkApiRequest`

``` purescript
mkApiRequest :: (Maybe String) -> Int -> ApiRequest
```

#### `mkApiResponse`

``` purescript
mkApiResponse :: Int -> Int -> String -> (Maybe String) -> Int -> (Maybe Date) -> (Maybe Date) -> ApiResponse
```

#### `mkApiResponses`

``` purescript
mkApiResponses :: (Array ApiResponse) -> ApiResponses
```

#### `mkBoardPackResponse`

``` purescript
mkBoardPackResponse :: BoardResponse -> Int -> BoardStatResponse -> (Maybe LikeResponse) -> (Maybe StarResponse) -> (Maybe ThreadResponse) -> (Maybe ThreadPostResponse) -> (Maybe UserSanitizedResponse) -> Boolean -> BoardPackResponse
```

#### `mkBoardPackResponses`

``` purescript
mkBoardPackResponses :: (Array BoardPackResponse) -> BoardPackResponses
```

#### `mkBoardRequest`

``` purescript
mkBoardRequest :: String -> (Maybe String) -> Boolean -> Boolean -> Boolean -> (Array String) -> (Maybe String) -> (Array String) -> Int -> BoardRequest
```

#### `mkBoardResponse`

``` purescript
mkBoardResponse :: Int -> Int -> Int -> (Maybe Int) -> String -> String -> (Maybe String) -> Boolean -> Boolean -> Boolean -> (Array String) -> (Maybe String) -> (Array String) -> Boolean -> Int -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> BoardResponse
```

#### `mkBoardResponses`

``` purescript
mkBoardResponses :: (Array BoardResponse) -> BoardResponses
```

#### `mkBoardStatResponse`

``` purescript
mkBoardStatResponse :: Int -> Int -> Int -> Int -> BoardStatResponse
```

#### `mkBoardStatResponses`

``` purescript
mkBoardStatResponses :: (Array BoardStatResponse) -> BoardStatResponses
```

#### `mkBucketRequest`

``` purescript
mkBucketRequest :: String -> (Maybe String) -> Int -> Int -> (Array Int) -> (Array Int) -> (Array String) -> (Array Int) -> Int -> BucketRequest
```

#### `mkBucketResponse`

``` purescript
mkBucketResponse :: Int -> Int -> String -> String -> (Maybe String) -> Int -> Int -> (Array Int) -> (Array Int) -> (Array String) -> (Array Int) -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> BucketResponse
```

#### `mkBucketResponses`

``` purescript
mkBucketResponses :: (Array BucketResponse) -> BucketResponses
```

#### `mkCard`

``` purescript
mkCard :: String -> String -> Card
```

#### `mkCountResponse`

``` purescript
mkCountResponse :: Int -> Int -> CountResponse
```

#### `mkCountResponses`

``` purescript
mkCountResponses :: (Array CountResponse) -> CountResponses
```

#### `mkDCard`

``` purescript
mkDCard :: String -> String -> DCard
```

#### `mkDCardX`

``` purescript
mkDCardX :: (Array String) -> (Array String) -> DCardX
```

#### `mkEmptyRequest`

``` purescript
mkEmptyRequest :: Boolean -> EmptyRequest
```

#### `mkEmptyResponse`

``` purescript
mkEmptyResponse :: Int -> Int -> Boolean -> (Maybe Date) -> (Maybe Date) -> EmptyResponse
```

#### `mkEmptyResponses`

``` purescript
mkEmptyResponses :: (Array EmptyResponse) -> EmptyResponses
```

#### `mkFact`

``` purescript
mkFact :: String -> Fact
```

#### `mkFactList`

``` purescript
mkFactList :: String -> (Array String) -> FactList
```

#### `mkForumPackResponse`

``` purescript
mkForumPackResponse :: ForumResponse -> Int -> ForumStatResponse -> (Maybe LikeResponse) -> (Maybe StarResponse) -> Boolean -> ForumPackResponse
```

#### `mkForumPackResponses`

``` purescript
mkForumPackResponses :: (Array ForumPackResponse) -> ForumPackResponses
```

#### `mkForumRequest`

``` purescript
mkForumRequest :: String -> (Maybe String) -> Int -> Int -> (Maybe String) -> (Array String) -> Visibility -> Int -> ForumRequest
```

#### `mkForumResponse`

``` purescript
mkForumResponse :: Int -> Int -> Int -> String -> String -> (Maybe String) -> Int -> Int -> (Maybe String) -> (Array String) -> Visibility -> Boolean -> Int -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> ForumResponse
```

#### `mkForumResponses`

``` purescript
mkForumResponses :: (Array ForumResponse) -> ForumResponses
```

#### `mkForumStatResponse`

``` purescript
mkForumStatResponse :: Int -> Int -> Int -> Int -> Int -> ForumStatResponse
```

#### `mkForumStatResponses`

``` purescript
mkForumStatResponses :: (Array ForumStatResponse) -> ForumStatResponses
```

#### `mkGlobalGroupPackResponse`

``` purescript
mkGlobalGroupPackResponse :: UserSanitizedResponse -> Int -> GlobalGroupResponse -> Int -> GlobalGroupStatResponse -> Boolean -> GlobalGroupPackResponse
```

#### `mkGlobalGroupPackResponses`

``` purescript
mkGlobalGroupPackResponses :: (Array GlobalGroupPackResponse) -> GlobalGroupPackResponses
```

#### `mkGlobalGroupRequest`

``` purescript
mkGlobalGroupRequest :: String -> (Maybe String) -> Membership -> (Maybe String) -> (Array String) -> Visibility -> Int -> GlobalGroupRequest
```

#### `mkGlobalGroupResponse`

``` purescript
mkGlobalGroupResponse :: Int -> Int -> String -> String -> (Maybe String) -> Membership -> (Maybe String) -> (Array String) -> Visibility -> Boolean -> Int -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> GlobalGroupResponse
```

#### `mkGlobalGroupResponses`

``` purescript
mkGlobalGroupResponses :: (Array GlobalGroupResponse) -> GlobalGroupResponses
```

#### `mkGlobalGroupStatResponse`

``` purescript
mkGlobalGroupStatResponse :: Int -> GlobalGroupStatResponse
```

#### `mkGlobalGroupStatResponses`

``` purescript
mkGlobalGroupStatResponses :: (Array GlobalGroupStatResponse) -> GlobalGroupStatResponses
```

#### `mkGroupMemberPackResponse`

``` purescript
mkGroupMemberPackResponse :: UserSanitizedResponse -> Int -> GroupMemberResponse -> Int -> Boolean -> GroupMemberPackResponse
```

#### `mkGroupMemberPackResponses`

``` purescript
mkGroupMemberPackResponses :: (Array GroupMemberPackResponse) -> GroupMemberPackResponses
```

#### `mkGroupMemberRequest`

``` purescript
mkGroupMemberRequest :: Int -> GroupMemberRequest
```

#### `mkGroupMemberResponse`

``` purescript
mkGroupMemberResponse :: Int -> Int -> Int -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> GroupMemberResponse
```

#### `mkGroupMemberResponses`

``` purescript
mkGroupMemberResponses :: (Array GroupMemberResponse) -> GroupMemberResponses
```

#### `mkGroupPackResponse`

``` purescript
mkGroupPackResponse :: UserSanitizedResponse -> Int -> GroupResponse -> Int -> OrganizationResponse -> Int -> GroupStatResponse -> Boolean -> GroupPackResponse
```

#### `mkGroupPackResponses`

``` purescript
mkGroupPackResponses :: (Array GroupPackResponse) -> GroupPackResponses
```

#### `mkGroupRequest`

``` purescript
mkGroupRequest :: Int -> GroupRequest
```

#### `mkGroupResponse`

``` purescript
mkGroupResponse :: Int -> Int -> Int -> Int -> Boolean -> Int -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> GroupResponse
```

#### `mkGroupResponses`

``` purescript
mkGroupResponses :: (Array GroupResponse) -> GroupResponses
```

#### `mkGroupStatResponse`

``` purescript
mkGroupStatResponse :: Int -> GroupStatResponse
```

#### `mkGroupStatResponses`

``` purescript
mkGroupStatResponses :: (Array GroupStatResponse) -> GroupStatResponses
```

#### `mkImageAssociation`

``` purescript
mkImageAssociation :: (Array String) -> (Array String) -> (Array String) -> ImageAssociation
```

#### `mkLeuronPackResponse`

``` purescript
mkLeuronPackResponse :: LeuronResponse -> Int -> UserSanitizedResponse -> Int -> LeuronTrainingResponse -> LeuronStatResponse -> (Maybe LikeResponse) -> (Maybe StarResponse) -> Boolean -> LeuronPackResponse
```

#### `mkLeuronPackResponses`

``` purescript
mkLeuronPackResponses :: (Array LeuronPackResponse) -> LeuronPackResponses
```

#### `mkLeuronRequest`

``` purescript
mkLeuronRequest :: LeuronData -> (Maybe String) -> (Maybe String) -> (Maybe String) -> (Maybe String) -> (Maybe (Array String)) -> (Maybe (Array String)) -> (DepList String) -> (Maybe (Array Splits)) -> (Maybe (Array Substitutions)) -> (Array String) -> (Maybe (Array String)) -> Int -> LeuronRequest
```

#### `mkLeuronResponse`

``` purescript
mkLeuronResponse :: Int -> Int -> Int -> LeuronData -> (Maybe String) -> (Maybe String) -> (Maybe String) -> (Maybe String) -> (Maybe (Array String)) -> (Maybe (Array String)) -> (DepList String) -> (Maybe (Array Splits)) -> (Maybe (Array Substitutions)) -> (Array String) -> (Maybe (Array String)) -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> LeuronResponse
```

#### `mkLeuronResponses`

``` purescript
mkLeuronResponses :: (Array LeuronResponse) -> LeuronResponses
```

#### `mkLeuronStatResponse`

``` purescript
mkLeuronStatResponse :: Int -> Int -> Int -> Int -> Int -> Int -> LeuronStatResponse
```

#### `mkLeuronStatResponses`

``` purescript
mkLeuronStatResponses :: (Array LeuronStatResponse) -> LeuronStatResponses
```

#### `mkLeuronTrainingRequest`

``` purescript
mkLeuronTrainingRequest :: LeuronTrainingSummary -> Int -> LeuronTrainingRequest
```

#### `mkLeuronTrainingResponse`

``` purescript
mkLeuronTrainingResponse :: Int -> Int -> Int -> LeuronTrainingSummary -> Int -> (Maybe Date) -> (Maybe Date) -> LeuronTrainingResponse
```

#### `mkLeuronTrainingResponses`

``` purescript
mkLeuronTrainingResponses :: (Array LeuronTrainingResponse) -> LeuronTrainingResponses
```

#### `mkLeuronTrainingStatResponse`

``` purescript
mkLeuronTrainingStatResponse :: Int -> LeuronTrainingStatResponse
```

#### `mkLeuronTrainingStatResponses`

``` purescript
mkLeuronTrainingStatResponses :: (Array LeuronTrainingStatResponse) -> LeuronTrainingStatResponses
```

#### `mkLikeRequest`

``` purescript
mkLikeRequest :: LikeOpt -> (Maybe String) -> Int -> LikeRequest
```

#### `mkLikeResponse`

``` purescript
mkLikeResponse :: Int -> Ent -> Int -> Int -> LikeOpt -> Int -> (Maybe String) -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> LikeResponse
```

#### `mkLikeResponses`

``` purescript
mkLikeResponses :: (Array LikeResponse) -> LikeResponses
```

#### `mkLikeStatResponse`

``` purescript
mkLikeStatResponse :: Ent -> Int -> Int -> Int -> Int -> Int -> LikeStatResponse
```

#### `mkLikeStatResponses`

``` purescript
mkLikeStatResponses :: (Array LikeStatResponse) -> LikeStatResponses
```

#### `mkLinearDemo`

``` purescript
mkLinearDemo :: String -> (Array LinearDemoNode) -> LinearDemo
```

#### `mkOrganizationPackResponse`

``` purescript
mkOrganizationPackResponse :: UserSanitizedResponse -> Int -> OrganizationResponse -> Int -> OrganizationStatResponse -> (Maybe LikeResponse) -> (Maybe StarResponse) -> Boolean -> Boolean -> OrganizationPackResponse
```

#### `mkOrganizationPackResponses`

``` purescript
mkOrganizationPackResponses :: (Array OrganizationPackResponse) -> OrganizationPackResponses
```

#### `mkOrganizationRequest`

``` purescript
mkOrganizationRequest :: String -> (Maybe String) -> String -> String -> String -> Membership -> (Array String) -> (Maybe String) -> Visibility -> Int -> OrganizationRequest
```

#### `mkOrganizationResponse`

``` purescript
mkOrganizationResponse :: Int -> Int -> String -> String -> (Maybe String) -> String -> String -> String -> String -> Membership -> (Maybe String) -> (Array String) -> Visibility -> Boolean -> Int -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> OrganizationResponse
```

#### `mkOrganizationResponses`

``` purescript
mkOrganizationResponses :: (Array OrganizationResponse) -> OrganizationResponses
```

#### `mkOrganizationStatResponse`

``` purescript
mkOrganizationStatResponse :: Int -> Int -> Int -> Int -> Int -> Int -> Int -> Int -> OrganizationStatResponse
```

#### `mkOrganizationStatResponses`

``` purescript
mkOrganizationStatResponses :: (Array OrganizationStatResponse) -> OrganizationStatResponses
```

#### `mkPmInRequest`

``` purescript
mkPmInRequest :: (Maybe String) -> Boolean -> Boolean -> Int -> PmInRequest
```

#### `mkPmInResponse`

``` purescript
mkPmInResponse :: Int -> Int -> Int -> (Maybe String) -> Boolean -> Boolean -> Boolean -> Boolean -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> PmInResponse
```

#### `mkPmInResponses`

``` purescript
mkPmInResponses :: (Array PmInResponse) -> PmInResponses
```

#### `mkPmOutRequest`

``` purescript
mkPmOutRequest :: (Maybe String) -> Int -> PmOutRequest
```

#### `mkPmOutResponse`

``` purescript
mkPmOutResponse :: Int -> Int -> Int -> (Maybe String) -> Boolean -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> PmOutResponse
```

#### `mkPmOutResponses`

``` purescript
mkPmOutResponses :: (Array PmOutResponse) -> PmOutResponses
```

#### `mkPmRequest`

``` purescript
mkPmRequest :: String -> String -> Int -> PmRequest
```

#### `mkPmResponse`

``` purescript
mkPmResponse :: Int -> Int -> Int -> String -> String -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> PmResponse
```

#### `mkPmResponses`

``` purescript
mkPmResponses :: (Array PmResponse) -> PmResponses
```

#### `mkProfileRequest`

``` purescript
mkProfileRequest :: ProfileGender -> Date -> (Maybe String) -> (Maybe String) -> (Maybe String) -> Int -> ProfileRequest
```

#### `mkProfileResponse`

``` purescript
mkProfileResponse :: Int -> Ent -> Int -> ProfileGender -> Date -> (Maybe String) -> (Maybe String) -> (Maybe String) -> Int -> Int -> Int -> (Maybe Date) -> (Maybe Date) -> ProfileResponse
```

#### `mkProfileResponses`

``` purescript
mkProfileResponses :: (Array ProfileResponse) -> ProfileResponses
```

#### `mkProfileX`

``` purescript
mkProfileX :: String -> String -> String -> ProfileX
```

#### `mkQA`

``` purescript
mkQA :: String -> String -> QA
```

#### `mkReminderFolderRequest`

``` purescript
mkReminderFolderRequest :: String -> (Maybe String) -> Visibility -> Int -> ReminderFolderRequest
```

#### `mkReminderFolderResponse`

``` purescript
mkReminderFolderResponse :: Int -> Int -> (Maybe Int) -> String -> String -> Visibility -> (Maybe String) -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> ReminderFolderResponse
```

#### `mkReminderFolderResponses`

``` purescript
mkReminderFolderResponses :: (Array ReminderFolderResponse) -> ReminderFolderResponses
```

#### `mkReminderRequest`

``` purescript
mkReminderRequest :: String -> Int -> ReminderRequest
```

#### `mkReminderResponse`

``` purescript
mkReminderResponse :: Int -> Int -> Int -> String -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> ReminderResponse
```

#### `mkReminderResponses`

``` purescript
mkReminderResponses :: (Array ReminderResponse) -> ReminderResponses
```

#### `mkResourcePackResponse`

``` purescript
mkResourcePackResponse :: ResourceResponse -> Int -> UserSanitizedResponse -> Int -> ResourceStatResponse -> (Maybe LikeResponse) -> (Maybe StarResponse) -> Boolean -> ResourcePackResponse
```

#### `mkResourcePackResponses`

``` purescript
mkResourcePackResponses :: (Array ResourcePackResponse) -> ResourcePackResponses
```

#### `mkResourceRequest`

``` purescript
mkResourceRequest :: String -> String -> ResourceType -> (Maybe (Array String)) -> (DepList String) -> (DepList String) -> Visibility -> Int -> (Maybe String) -> (Maybe (Array String)) -> (Maybe String) -> (Array String) -> Int -> ResourceRequest
```

#### `mkResourceResponse`

``` purescript
mkResourceResponse :: Int -> Int -> String -> String -> String -> ResourceType -> (Maybe (Array String)) -> (DepList String) -> (DepList String) -> Visibility -> Int -> (Maybe String) -> (Maybe (Array String)) -> (Maybe String) -> (Array String) -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> ResourceResponse
```

#### `mkResourceResponses`

``` purescript
mkResourceResponses :: (Array ResourceResponse) -> ResourceResponses
```

#### `mkResourceStatResponse`

``` purescript
mkResourceStatResponse :: Int -> Int -> Int -> Int -> Int -> Int -> Int -> ResourceStatResponse
```

#### `mkResourceStatResponses`

``` purescript
mkResourceStatResponses :: (Array ResourceStatResponse) -> ResourceStatResponses
```

#### `mkScript`

``` purescript
mkScript :: String -> String -> String -> Script
```

#### `mkStarRequest`

``` purescript
mkStarRequest :: (Maybe String) -> Int -> StarRequest
```

#### `mkStarResponse`

``` purescript
mkStarResponse :: Int -> Ent -> Int -> Int -> (Maybe String) -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> StarResponse
```

#### `mkStarResponses`

``` purescript
mkStarResponses :: (Array StarResponse) -> StarResponses
```

#### `mkStarStatResponse`

``` purescript
mkStarStatResponse :: Ent -> Int -> Int -> StarStatResponse
```

#### `mkStarStatResponses`

``` purescript
mkStarStatResponses :: (Array StarStatResponse) -> StarStatResponses
```

#### `mkSynonym`

``` purescript
mkSynonym :: String -> String -> Synonym
```

#### `mkTable`

``` purescript
mkTable :: String -> (Array String) -> (Array (Array (Maybe String))) -> Table
```

#### `mkTeamMemberPackResponse`

``` purescript
mkTeamMemberPackResponse :: UserSanitizedResponse -> Int -> TeamMemberResponse -> Int -> Boolean -> TeamMemberPackResponse
```

#### `mkTeamMemberPackResponses`

``` purescript
mkTeamMemberPackResponses :: (Array TeamMemberPackResponse) -> TeamMemberPackResponses
```

#### `mkTeamMemberRequest`

``` purescript
mkTeamMemberRequest :: Int -> TeamMemberRequest
```

#### `mkTeamMemberResponse`

``` purescript
mkTeamMemberResponse :: Int -> Int -> Int -> Boolean -> (Maybe Date) -> Boolean -> (Maybe Date) -> Boolean -> Int -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> TeamMemberResponse
```

#### `mkTeamMemberResponses`

``` purescript
mkTeamMemberResponses :: (Array TeamMemberResponse) -> TeamMemberResponses
```

#### `mkTeamMemberStatResponses`

``` purescript
mkTeamMemberStatResponses :: (Array TeamMemberStatResponse) -> TeamMemberStatResponses
```

#### `mkTeamPackResponse`

``` purescript
mkTeamPackResponse :: UserSanitizedResponse -> Int -> TeamResponse -> Int -> TeamStatResponse -> (Maybe LikeResponse) -> (Maybe StarResponse) -> Boolean -> TeamPackResponse
```

#### `mkTeamPackResponses`

``` purescript
mkTeamPackResponses :: (Array TeamPackResponse) -> TeamPackResponses
```

#### `mkTeamRequest`

``` purescript
mkTeamRequest :: String -> (Maybe String) -> Membership -> (Maybe String) -> (Array String) -> Visibility -> Int -> TeamRequest
```

#### `mkTeamResponse`

``` purescript
mkTeamResponse :: Int -> Int -> Int -> String -> String -> (Maybe String) -> Membership -> (Maybe String) -> (Array String) -> Visibility -> Boolean -> Int -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> TeamResponse
```

#### `mkTeamResponses`

``` purescript
mkTeamResponses :: (Array TeamResponse) -> TeamResponses
```

#### `mkTeamStatResponse`

``` purescript
mkTeamStatResponse :: Int -> TeamStatResponse
```

#### `mkTeamStatResponses`

``` purescript
mkTeamStatResponses :: (Array TeamStatResponse) -> TeamStatResponses
```

#### `mkTemplate`

``` purescript
mkTemplate :: String -> (Array TemplateValue) -> Template
```

#### `mkTestRequest`

``` purescript
mkTestRequest :: String -> TestRequest
```

#### `mkTestResponse`

``` purescript
mkTestResponse :: Int -> Int -> String -> (Maybe Date) -> (Maybe Date) -> TestResponse
```

#### `mkTestResponses`

``` purescript
mkTestResponses :: (Array TestResponse) -> TestResponses
```

#### `mkThreadPackResponse`

``` purescript
mkThreadPackResponse :: ThreadResponse -> Int -> UserSanitizedResponse -> Int -> ThreadStatResponse -> (Maybe LikeResponse) -> (Maybe StarResponse) -> (Maybe ThreadPostResponse) -> (Maybe UserSanitizedResponse) -> Boolean -> ThreadPackResponse
```

#### `mkThreadPackResponses`

``` purescript
mkThreadPackResponses :: (Array ThreadPackResponse) -> ThreadPackResponses
```

#### `mkThreadPostPackResponse`

``` purescript
mkThreadPostPackResponse :: ThreadPostResponse -> Int -> UserSanitizedResponse -> Int -> ThreadPostStatResponse -> (Maybe LikeResponse) -> (Maybe StarResponse) -> Boolean -> ThreadPostPackResponse
```

#### `mkThreadPostPackResponses`

``` purescript
mkThreadPostPackResponses :: (Array ThreadPostPackResponse) -> ThreadPostPackResponses
```

#### `mkThreadPostRequest`

``` purescript
mkThreadPostRequest :: (Maybe String) -> PostData -> (Array String) -> (Array String) -> Int -> ThreadPostRequest
```

#### `mkThreadPostResponse`

``` purescript
mkThreadPostResponse :: Int -> Int -> Int -> (Maybe Int) -> (Maybe String) -> PostData -> (Array String) -> (Array String) -> Boolean -> Int -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> ThreadPostResponse
```

#### `mkThreadPostResponses`

``` purescript
mkThreadPostResponses :: (Array ThreadPostResponse) -> ThreadPostResponses
```

#### `mkThreadPostStatResponse`

``` purescript
mkThreadPostStatResponse :: Int -> Int -> Int -> Int -> Int -> Int -> ThreadPostStatResponse
```

#### `mkThreadPostStatResponses`

``` purescript
mkThreadPostStatResponses :: (Array ThreadPostStatResponse) -> ThreadPostStatResponses
```

#### `mkThreadRequest`

``` purescript
mkThreadRequest :: String -> (Maybe String) -> Boolean -> Boolean -> (Maybe String) -> (Maybe String) -> (Array String) -> Int -> ThreadRequest
```

#### `mkThreadResponse`

``` purescript
mkThreadResponse :: Int -> Int -> Int -> String -> String -> (Maybe String) -> Boolean -> Boolean -> (Maybe String) -> (Maybe String) -> (Array String) -> Boolean -> Int -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> ThreadResponse
```

#### `mkThreadResponses`

``` purescript
mkThreadResponses :: (Array ThreadResponse) -> ThreadResponses
```

#### `mkThreadStatResponse`

``` purescript
mkThreadStatResponse :: Int -> Int -> Int -> ThreadStatResponse
```

#### `mkThreadStatResponses`

``` purescript
mkThreadStatResponses :: (Array ThreadStatResponse) -> ThreadStatResponses
```

#### `mkUserPackResponse`

``` purescript
mkUserPackResponse :: UserResponse -> Int -> UserSanitizedStatResponse -> ProfileResponse -> Int -> UserPackResponse
```

#### `mkUserPackResponses`

``` purescript
mkUserPackResponses :: (Array UserPackResponse) -> UserPackResponses
```

#### `mkUserRequest`

``` purescript
mkUserRequest :: String -> String -> String -> String -> String -> (Maybe Date) -> UserRequest
```

#### `mkUserResponse`

``` purescript
mkUserResponse :: Int -> String -> String -> String -> String -> String -> String -> String -> (Maybe Date) -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> UserResponse
```

#### `mkUserResponses`

``` purescript
mkUserResponses :: (Array UserResponse) -> UserResponses
```

#### `mkUserSanitizedPackResponse`

``` purescript
mkUserSanitizedPackResponse :: UserSanitizedResponse -> Int -> ProfileResponse -> Int -> UserSanitizedStatResponse -> (Maybe LikeResponse) -> (Maybe StarResponse) -> UserSanitizedPackResponse
```

#### `mkUserSanitizedPackResponses`

``` purescript
mkUserSanitizedPackResponses :: (Array UserSanitizedPackResponse) -> UserSanitizedPackResponses
```

#### `mkUserSanitizedResponse`

``` purescript
mkUserSanitizedResponse :: Int -> String -> String -> String -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> UserSanitizedResponse
```

#### `mkUserSanitizedResponses`

``` purescript
mkUserSanitizedResponses :: (Array UserSanitizedResponse) -> UserSanitizedResponses
```

#### `mkUserSanitizedStatResponse`

``` purescript
mkUserSanitizedStatResponse :: Int -> Int -> Int -> Int -> Int -> Int -> Int -> UserSanitizedStatResponse
```

#### `mkUserSanitizedStatResponses`

``` purescript
mkUserSanitizedStatResponses :: (Array UserSanitizedStatResponse) -> UserSanitizedStatResponses
```

#### `modifiedAt_`

``` purescript
modifiedAt_ :: forall b a r. Lens { modifiedAt :: a | r } { modifiedAt :: b | r } a b
```

#### `modifiedBy_`

``` purescript
modifiedBy_ :: forall b a r. Lens { modifiedBy :: a | r } { modifiedBy :: b | r } a b
```

#### `msg_`

``` purescript
msg_ :: forall b a r. Lens { msg :: a | r } { msg :: b | r } a b
```

#### `n_`

``` purescript
n_ :: forall b a r. Lens { n :: a | r } { n :: b | r } a b
```

#### `name_`

``` purescript
name_ :: forall b a r. Lens { name :: a | r } { name :: b | r } a b
```

#### `neutral_`

``` purescript
neutral_ :: forall b a r. Lens { neutral :: a | r } { neutral :: b | r } a b
```

#### `nick_`

``` purescript
nick_ :: forall b a r. Lens { nick :: a | r } { nick :: b | r } a b
```

#### `opt_`

``` purescript
opt_ :: forall b a r. Lens { opt :: a | r } { opt :: b | r } a b
```

#### `orgId_`

``` purescript
orgId_ :: forall b a r. Lens { orgId :: a | r } { orgId :: b | r } a b
```

#### `organizationId_`

``` purescript
organizationId_ :: forall b a r. Lens { organizationId :: a | r } { organizationId :: b | r } a b
```

#### `organizationPackResponses_`

``` purescript
organizationPackResponses_ :: forall b a r. Lens { organizationPackResponses :: a | r } { organizationPackResponses :: b | r } a b
```

#### `organizationResponses_`

``` purescript
organizationResponses_ :: forall b a r. Lens { organizationResponses :: a | r } { organizationResponses :: b | r } a b
```

#### `organizationStatResponses_`

``` purescript
organizationStatResponses_ :: forall b a r. Lens { organizationStatResponses :: a | r } { organizationStatResponses :: b | r } a b
```

#### `organization_`

``` purescript
organization_ :: forall b a r. Lens { organization :: a | r } { organization :: b | r } a b
```

#### `page_`

``` purescript
page_ :: forall b a r. Lens { page :: a | r } { page :: b | r } a b
```

#### `parentFolderId_`

``` purescript
parentFolderId_ :: forall b a r. Lens { parentFolderId :: a | r } { parentFolderId :: b | r } a b
```

#### `parentId_`

``` purescript
parentId_ :: forall b a r. Lens { parentId :: a | r } { parentId :: b | r } a b
```

#### `plugin_`

``` purescript
plugin_ :: forall b a r. Lens { plugin :: a | r } { plugin :: b | r } a b
```

#### `pmId_`

``` purescript
pmId_ :: forall b a r. Lens { pmId :: a | r } { pmId :: b | r } a b
```

#### `pmInResponses_`

``` purescript
pmInResponses_ :: forall b a r. Lens { pmInResponses :: a | r } { pmInResponses :: b | r } a b
```

#### `pmOutResponses_`

``` purescript
pmOutResponses_ :: forall b a r. Lens { pmOutResponses :: a | r } { pmOutResponses :: b | r } a b
```

#### `pmResponses_`

``` purescript
pmResponses_ :: forall b a r. Lens { pmResponses :: a | r } { pmResponses :: b | r } a b
```

#### `poll_`

``` purescript
poll_ :: forall b a r. Lens { poll :: a | r } { poll :: b | r } a b
```

#### `prerequisites_`

``` purescript
prerequisites_ :: forall b a r. Lens { prerequisites :: a | r } { prerequisites :: b | r } a b
```

#### `privateTags_`

``` purescript
privateTags_ :: forall b a r. Lens { privateTags :: a | r } { privateTags :: b | r } a b
```

#### `profileEmail_`

``` purescript
profileEmail_ :: forall b a r. Lens { profileEmail :: a | r } { profileEmail :: b | r } a b
```

#### `profileId_`

``` purescript
profileId_ :: forall b a r. Lens { profileId :: a | r } { profileId :: b | r } a b
```

#### `profileLogin_`

``` purescript
profileLogin_ :: forall b a r. Lens { profileLogin :: a | r } { profileLogin :: b | r } a b
```

#### `profileName_`

``` purescript
profileName_ :: forall b a r. Lens { profileName :: a | r } { profileName :: b | r } a b
```

#### `profileResponses_`

``` purescript
profileResponses_ :: forall b a r. Lens { profileResponses :: a | r } { profileResponses :: b | r } a b
```

#### `profile_`

``` purescript
profile_ :: forall b a r. Lens { profile :: a | r } { profile :: b | r } a b
```

#### `question_`

``` purescript
question_ :: forall b a r. Lens { question :: a | r } { question :: b | r } a b
```

#### `reason_`

``` purescript
reason_ :: forall b a r. Lens { reason :: a | r } { reason :: b | r } a b
```

#### `reminderFolderResponses_`

``` purescript
reminderFolderResponses_ :: forall b a r. Lens { reminderFolderResponses :: a | r } { reminderFolderResponses :: b | r } a b
```

#### `reminderResponses_`

``` purescript
reminderResponses_ :: forall b a r. Lens { reminderResponses :: a | r } { reminderResponses :: b | r } a b
```

#### `resourceId_`

``` purescript
resourceId_ :: forall b a r. Lens { resourceId :: a | r } { resourceId :: b | r } a b
```

#### `resourcePackResponses_`

``` purescript
resourcePackResponses_ :: forall b a r. Lens { resourcePackResponses :: a | r } { resourcePackResponses :: b | r } a b
```

#### `resourceResponses_`

``` purescript
resourceResponses_ :: forall b a r. Lens { resourceResponses :: a | r } { resourceResponses :: b | r } a b
```

#### `resourceStatResponses_`

``` purescript
resourceStatResponses_ :: forall b a r. Lens { resourceStatResponses :: a | r } { resourceStatResponses :: b | r } a b
```

#### `resource_`

``` purescript
resource_ :: forall b a r. Lens { resource :: a | r } { resource :: b | r } a b
```

#### `resources_`

``` purescript
resources_ :: forall b a r. Lens { resources :: a | r } { resources :: b | r } a b
```

#### `respect_`

``` purescript
respect_ :: forall b a r. Lens { respect :: a | r } { respect :: b | r } a b
```

#### `rows_`

``` purescript
rows_ :: forall b a r. Lens { rows :: a | r } { rows :: b | r } a b
```

#### `scoreHi_`

``` purescript
scoreHi_ :: forall b a r. Lens { scoreHi :: a | r } { scoreHi :: b | r } a b
```

#### `scoreLo_`

``` purescript
scoreLo_ :: forall b a r. Lens { scoreLo :: a | r } { scoreLo :: b | r } a b
```

#### `score_`

``` purescript
score_ :: forall b a r. Lens { score :: a | r } { score :: b | r } a b
```

#### `section_`

``` purescript
section_ :: forall b a r. Lens { section :: a | r } { section :: b | r } a b
```

#### `signature_`

``` purescript
signature_ :: forall b a r. Lens { signature :: a | r } { signature :: b | r } a b
```

#### `source_`

``` purescript
source_ :: forall b a r. Lens { source :: a | r } { source :: b | r } a b
```

#### `splits_`

``` purescript
splits_ :: forall b a r. Lens { splits :: a | r } { splits :: b | r } a b
```

#### `starResponses_`

``` purescript
starResponses_ :: forall b a r. Lens { starResponses :: a | r } { starResponses :: b | r } a b
```

#### `starStatResponses_`

``` purescript
starStatResponses_ :: forall b a r. Lens { starStatResponses :: a | r } { starStatResponses :: b | r } a b
```

#### `star_`

``` purescript
star_ :: forall b a r. Lens { star :: a | r } { star :: b | r } a b
```

#### `stars_`

``` purescript
stars_ :: forall b a r. Lens { stars :: a | r } { stars :: b | r } a b
```

#### `stat_`

``` purescript
stat_ :: forall b a r. Lens { stat :: a | r } { stat :: b | r } a b
```

#### `sticky_`

``` purescript
sticky_ :: forall b a r. Lens { sticky :: a | r } { sticky :: b | r } a b
```

#### `strengths_`

``` purescript
strengths_ :: forall b a r. Lens { strengths :: a | r } { strengths :: b | r } a b
```

#### `style_`

``` purescript
style_ :: forall b a r. Lens { style :: a | r } { style :: b | r } a b
```

#### `subject_`

``` purescript
subject_ :: forall b a r. Lens { subject :: a | r } { subject :: b | r } a b
```

#### `substitutions_`

``` purescript
substitutions_ :: forall b a r. Lens { substitutions :: a | r } { substitutions :: b | r } a b
```

#### `suggestedTags_`

``` purescript
suggestedTags_ :: forall b a r. Lens { suggestedTags :: a | r } { suggestedTags :: b | r } a b
```

#### `summary_`

``` purescript
summary_ :: forall b a r. Lens { summary :: a | r } { summary :: b | r } a b
```

#### `tags_`

``` purescript
tags_ :: forall b a r. Lens { tags :: a | r } { tags :: b | r } a b
```

#### `teamId_`

``` purescript
teamId_ :: forall b a r. Lens { teamId :: a | r } { teamId :: b | r } a b
```

#### `teamMemberId_`

``` purescript
teamMemberId_ :: forall b a r. Lens { teamMemberId :: a | r } { teamMemberId :: b | r } a b
```

#### `teamMemberPackResponses_`

``` purescript
teamMemberPackResponses_ :: forall b a r. Lens { teamMemberPackResponses :: a | r } { teamMemberPackResponses :: b | r } a b
```

#### `teamMemberResponses_`

``` purescript
teamMemberResponses_ :: forall b a r. Lens { teamMemberResponses :: a | r } { teamMemberResponses :: b | r } a b
```

#### `teamMemberStatResponses_`

``` purescript
teamMemberStatResponses_ :: forall b a r. Lens { teamMemberStatResponses :: a | r } { teamMemberStatResponses :: b | r } a b
```

#### `teamMember_`

``` purescript
teamMember_ :: forall b a r. Lens { teamMember :: a | r } { teamMember :: b | r } a b
```

#### `teamPackResponses_`

``` purescript
teamPackResponses_ :: forall b a r. Lens { teamPackResponses :: a | r } { teamPackResponses :: b | r } a b
```

#### `teamResponses_`

``` purescript
teamResponses_ :: forall b a r. Lens { teamResponses :: a | r } { teamResponses :: b | r } a b
```

#### `teamStatResponses_`

``` purescript
teamStatResponses_ :: forall b a r. Lens { teamStatResponses :: a | r } { teamStatResponses :: b | r } a b
```

#### `team_`

``` purescript
team_ :: forall b a r. Lens { team :: a | r } { team :: b | r } a b
```

#### `teams_`

``` purescript
teams_ :: forall b a r. Lens { teams :: a | r } { teams :: b | r } a b
```

#### `template_`

``` purescript
template_ :: forall b a r. Lens { template :: a | r } { template :: b | r } a b
```

#### `testResponses_`

``` purescript
testResponses_ :: forall b a r. Lens { testResponses :: a | r } { testResponses :: b | r } a b
```

#### `text_`

``` purescript
text_ :: forall b a r. Lens { text :: a | r } { text :: b | r } a b
```

#### `threadId_`

``` purescript
threadId_ :: forall b a r. Lens { threadId :: a | r } { threadId :: b | r } a b
```

#### `threadPackResponses_`

``` purescript
threadPackResponses_ :: forall b a r. Lens { threadPackResponses :: a | r } { threadPackResponses :: b | r } a b
```

#### `threadPostId_`

``` purescript
threadPostId_ :: forall b a r. Lens { threadPostId :: a | r } { threadPostId :: b | r } a b
```

#### `threadPostPackResponses_`

``` purescript
threadPostPackResponses_ :: forall b a r. Lens { threadPostPackResponses :: a | r } { threadPostPackResponses :: b | r } a b
```

#### `threadPostResponses_`

``` purescript
threadPostResponses_ :: forall b a r. Lens { threadPostResponses :: a | r } { threadPostResponses :: b | r } a b
```

#### `threadPostStatResponses_`

``` purescript
threadPostStatResponses_ :: forall b a r. Lens { threadPostStatResponses :: a | r } { threadPostStatResponses :: b | r } a b
```

#### `threadPost_`

``` purescript
threadPost_ :: forall b a r. Lens { threadPost :: a | r } { threadPost :: b | r } a b
```

#### `threadPostsPerThread_`

``` purescript
threadPostsPerThread_ :: forall b a r. Lens { threadPostsPerThread :: a | r } { threadPostsPerThread :: b | r } a b
```

#### `threadPosts_`

``` purescript
threadPosts_ :: forall b a r. Lens { threadPosts :: a | r } { threadPosts :: b | r } a b
```

#### `threadResponses_`

``` purescript
threadResponses_ :: forall b a r. Lens { threadResponses :: a | r } { threadResponses :: b | r } a b
```

#### `threadStatResponses_`

``` purescript
threadStatResponses_ :: forall b a r. Lens { threadStatResponses :: a | r } { threadStatResponses :: b | r } a b
```

#### `thread_`

``` purescript
thread_ :: forall b a r. Lens { thread :: a | r } { thread :: b | r } a b
```

#### `threadsPerBoard_`

``` purescript
threadsPerBoard_ :: forall b a r. Lens { threadsPerBoard :: a | r } { threadsPerBoard :: b | r } a b
```

#### `threads_`

``` purescript
threads_ :: forall b a r. Lens { threads :: a | r } { threads :: b | r } a b
```

#### `title_`

``` purescript
title_ :: forall b a r. Lens { title :: a | r } { title :: b | r } a b
```

#### `toUserId_`

``` purescript
toUserId_ :: forall b a r. Lens { toUserId :: a | r } { toUserId :: b | r } a b
```

#### `training_`

``` purescript
training_ :: forall b a r. Lens { training :: a | r } { training :: b | r } a b
```

#### `unwrapAcronym`

``` purescript
unwrapAcronym :: Acronym -> { abbreviation :: String, meaning :: String }
```

#### `unwrapAntonym`

``` purescript
unwrapAntonym :: Antonym -> { a :: String, b :: String }
```

#### `unwrapApiRequest`

``` purescript
unwrapApiRequest :: ApiRequest -> { comment :: Maybe String, guard :: Int }
```

#### `unwrapApiResponse`

``` purescript
unwrapApiResponse :: ApiResponse -> { id :: Int, userId :: Int, key :: String, comment :: Maybe String, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date }
```

#### `unwrapApiResponses`

``` purescript
unwrapApiResponses :: ApiResponses -> { apiResponses :: Array ApiResponse }
```

#### `unwrapBoardPackResponse`

``` purescript
unwrapBoardPackResponse :: BoardPackResponse -> { board :: BoardResponse, boardId :: Int, stat :: BoardStatResponse, like :: Maybe LikeResponse, star :: Maybe StarResponse, latestThread :: Maybe ThreadResponse, latestThreadPost :: Maybe ThreadPostResponse, latestThreadPostUser :: Maybe UserSanitizedResponse, isOwner :: Boolean }
```

#### `unwrapBoardPackResponses`

``` purescript
unwrapBoardPackResponses :: BoardPackResponses -> { boardPackResponses :: Array BoardPackResponse }
```

#### `unwrapBoardRequest`

``` purescript
unwrapBoardRequest :: BoardRequest -> { displayName :: String, description :: Maybe String, isAnonymous :: Boolean, canCreateSubBoards :: Boolean, canCreateThreads :: Boolean, suggestedTags :: Array String, icon :: Maybe String, tags :: Array String, guard :: Int }
```

#### `unwrapBoardResponse`

``` purescript
unwrapBoardResponse :: BoardResponse -> { id :: Int, userId :: Int, forumId :: Int, parentId :: Maybe Int, name :: String, displayName :: String, description :: Maybe String, isAnonymous :: Boolean, canCreateSubBoards :: Boolean, canCreateThreads :: Boolean, suggestedTags :: Array String, icon :: Maybe String, tags :: Array String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `unwrapBoardResponses`

``` purescript
unwrapBoardResponses :: BoardResponses -> { boardResponses :: Array BoardResponse }
```

#### `unwrapBoardStatResponse`

``` purescript
unwrapBoardStatResponse :: BoardStatResponse -> { boardId :: Int, threads :: Int, threadPosts :: Int, views :: Int }
```

#### `unwrapBoardStatResponses`

``` purescript
unwrapBoardStatResponses :: BoardStatResponses -> { boardStatResponses :: Array BoardStatResponse }
```

#### `unwrapBucketRequest`

``` purescript
unwrapBucketRequest :: BucketRequest -> { displayName :: String, description :: Maybe String, scoreLo :: Int, scoreHi :: Int, leurons :: Array Int, resources :: Array Int, categories :: Array String, filters :: Array Int, guard :: Int }
```

#### `unwrapBucketResponse`

``` purescript
unwrapBucketResponse :: BucketResponse -> { id :: Int, userId :: Int, name :: String, displayName :: String, description :: Maybe String, scoreLo :: Int, scoreHi :: Int, leurons :: Array Int, resources :: Array Int, categories :: Array String, filters :: Array Int, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `unwrapBucketResponses`

``` purescript
unwrapBucketResponses :: BucketResponses -> { bucketResponses :: Array BucketResponse }
```

#### `unwrapCard`

``` purescript
unwrapCard :: Card -> { front :: String, back :: String }
```

#### `unwrapCountResponse`

``` purescript
unwrapCountResponse :: CountResponse -> { id :: Int, n :: Int }
```

#### `unwrapCountResponses`

``` purescript
unwrapCountResponses :: CountResponses -> { countResponses :: Array CountResponse }
```

#### `unwrapDCard`

``` purescript
unwrapDCard :: DCard -> { front :: String, back :: String }
```

#### `unwrapDCardX`

``` purescript
unwrapDCardX :: DCardX -> { front :: Array String, back :: Array String }
```

#### `unwrapEmptyRequest`

``` purescript
unwrapEmptyRequest :: EmptyRequest -> { value :: Boolean }
```

#### `unwrapEmptyResponse`

``` purescript
unwrapEmptyResponse :: EmptyResponse -> { id :: Int, userId :: Int, value :: Boolean, createdAt :: Maybe Date, modifiedAt :: Maybe Date }
```

#### `unwrapEmptyResponses`

``` purescript
unwrapEmptyResponses :: EmptyResponses -> { emptyResponses :: Array EmptyResponse }
```

#### `unwrapFact`

``` purescript
unwrapFact :: Fact -> { text :: String }
```

#### `unwrapFactList`

``` purescript
unwrapFactList :: FactList -> { fact :: String, list :: Array String }
```

#### `unwrapForumPackResponse`

``` purescript
unwrapForumPackResponse :: ForumPackResponse -> { forum :: ForumResponse, forumId :: Int, stat :: ForumStatResponse, like :: Maybe LikeResponse, star :: Maybe StarResponse, isOwner :: Boolean }
```

#### `unwrapForumPackResponses`

``` purescript
unwrapForumPackResponses :: ForumPackResponses -> { forumPackResponses :: Array ForumPackResponse }
```

#### `unwrapForumRequest`

``` purescript
unwrapForumRequest :: ForumRequest -> { displayName :: String, description :: Maybe String, threadsPerBoard :: Int, threadPostsPerThread :: Int, icon :: Maybe String, tags :: Array String, visibility :: Visibility, guard :: Int }
```

#### `unwrapForumResponse`

``` purescript
unwrapForumResponse :: ForumResponse -> { id :: Int, userId :: Int, orgId :: Int, name :: String, displayName :: String, description :: Maybe String, threadsPerBoard :: Int, threadPostsPerThread :: Int, icon :: Maybe String, tags :: Array String, visibility :: Visibility, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `unwrapForumResponses`

``` purescript
unwrapForumResponses :: ForumResponses -> { forumResponses :: Array ForumResponse }
```

#### `unwrapForumStatResponse`

``` purescript
unwrapForumStatResponse :: ForumStatResponse -> { forumId :: Int, boards :: Int, threads :: Int, threadPosts :: Int, views :: Int }
```

#### `unwrapForumStatResponses`

``` purescript
unwrapForumStatResponses :: ForumStatResponses -> { forumStatResponses :: Array ForumStatResponse }
```

#### `unwrapGlobalGroupPackResponse`

``` purescript
unwrapGlobalGroupPackResponse :: GlobalGroupPackResponse -> { user :: UserSanitizedResponse, userId :: Int, globalGroup :: GlobalGroupResponse, globalGroupId :: Int, stat :: GlobalGroupStatResponse, isOwner :: Boolean }
```

#### `unwrapGlobalGroupPackResponses`

``` purescript
unwrapGlobalGroupPackResponses :: GlobalGroupPackResponses -> { globalGroupPackResponses :: Array GlobalGroupPackResponse }
```

#### `unwrapGlobalGroupRequest`

``` purescript
unwrapGlobalGroupRequest :: GlobalGroupRequest -> { displayName :: String, description :: Maybe String, membership :: Membership, icon :: Maybe String, tags :: Array String, visibility :: Visibility, guard :: Int }
```

#### `unwrapGlobalGroupResponse`

``` purescript
unwrapGlobalGroupResponse :: GlobalGroupResponse -> { id :: Int, userId :: Int, name :: String, displayName :: String, description :: Maybe String, membership :: Membership, icon :: Maybe String, tags :: Array String, visibility :: Visibility, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `unwrapGlobalGroupResponses`

``` purescript
unwrapGlobalGroupResponses :: GlobalGroupResponses -> { globalGroupResponses :: Array GlobalGroupResponse }
```

#### `unwrapGlobalGroupStatResponse`

``` purescript
unwrapGlobalGroupStatResponse :: GlobalGroupStatResponse -> { groups :: Int }
```

#### `unwrapGlobalGroupStatResponses`

``` purescript
unwrapGlobalGroupStatResponses :: GlobalGroupStatResponses -> { globalGroupStatResponses :: Array GlobalGroupStatResponse }
```

#### `unwrapGroupMemberPackResponse`

``` purescript
unwrapGroupMemberPackResponse :: GroupMemberPackResponse -> { user :: UserSanitizedResponse, userId :: Int, groupMember :: GroupMemberResponse, groupMemberId :: Int, isOwner :: Boolean }
```

#### `unwrapGroupMemberPackResponses`

``` purescript
unwrapGroupMemberPackResponses :: GroupMemberPackResponses -> { groupMemberPackResponses :: Array GroupMemberPackResponse }
```

#### `unwrapGroupMemberRequest`

``` purescript
unwrapGroupMemberRequest :: GroupMemberRequest -> { guard :: Int }
```

#### `unwrapGroupMemberResponse`

``` purescript
unwrapGroupMemberResponse :: GroupMemberResponse -> { id :: Int, userId :: Int, globalGroupId :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `unwrapGroupMemberResponses`

``` purescript
unwrapGroupMemberResponses :: GroupMemberResponses -> { groupMemberResponses :: Array GroupMemberResponse }
```

#### `unwrapGroupPackResponse`

``` purescript
unwrapGroupPackResponse :: GroupPackResponse -> { user :: UserSanitizedResponse, userId :: Int, group :: GroupResponse, groupId :: Int, organization :: OrganizationResponse, organizationId :: Int, stat :: GroupStatResponse, isOwner :: Boolean }
```

#### `unwrapGroupPackResponses`

``` purescript
unwrapGroupPackResponses :: GroupPackResponses -> { groupPackResponses :: Array GroupPackResponse }
```

#### `unwrapGroupRequest`

``` purescript
unwrapGroupRequest :: GroupRequest -> { guard :: Int }
```

#### `unwrapGroupResponse`

``` purescript
unwrapGroupResponse :: GroupResponse -> { id :: Int, userId :: Int, globalGroupId :: Int, organizationId :: Int, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `unwrapGroupResponses`

``` purescript
unwrapGroupResponses :: GroupResponses -> { groupResponses :: Array GroupResponse }
```

#### `unwrapGroupStatResponse`

``` purescript
unwrapGroupStatResponse :: GroupStatResponse -> { members :: Int }
```

#### `unwrapGroupStatResponses`

``` purescript
unwrapGroupStatResponses :: GroupStatResponses -> { groupStatResponses :: Array GroupStatResponse }
```

#### `unwrapImageAssociation`

``` purescript
unwrapImageAssociation :: ImageAssociation -> { imageUrl :: Array String, assocBy :: Array String, assocResult :: Array String }
```

#### `unwrapLeuronPackResponse`

``` purescript
unwrapLeuronPackResponse :: LeuronPackResponse -> { leuron :: LeuronResponse, leuronId :: Int, user :: UserSanitizedResponse, userId :: Int, training :: LeuronTrainingResponse, stat :: LeuronStatResponse, like :: Maybe LikeResponse, star :: Maybe StarResponse, isOwner :: Boolean }
```

#### `unwrapLeuronPackResponses`

``` purescript
unwrapLeuronPackResponses :: LeuronPackResponses -> { leuronPackResponses :: Array LeuronPackResponse }
```

#### `unwrapLeuronRequest`

``` purescript
unwrapLeuronRequest :: LeuronRequest -> { dataP :: LeuronData, title :: Maybe String, description :: Maybe String, section :: Maybe String, page :: Maybe String, examples :: Maybe (Array String), strengths :: Maybe (Array String), categories :: Array (Array String), splits :: Maybe (Array Splits), substitutions :: Maybe (Array Substitutions), tags :: Array String, style :: Maybe (Array String), guard :: Int }
```

#### `unwrapLeuronResponse`

``` purescript
unwrapLeuronResponse :: LeuronResponse -> { id :: Int, userId :: Int, resourceId :: Int, dataP :: LeuronData, title :: Maybe String, description :: Maybe String, section :: Maybe String, page :: Maybe String, examples :: Maybe (Array String), strengths :: Maybe (Array String), categories :: Array (Array String), splits :: Maybe (Array Splits), substitutions :: Maybe (Array Substitutions), tags :: Array String, style :: Maybe (Array String), active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `unwrapLeuronResponses`

``` purescript
unwrapLeuronResponses :: LeuronResponses -> { leuronResponses :: Array LeuronResponse }
```

#### `unwrapLeuronStatResponse`

``` purescript
unwrapLeuronStatResponse :: LeuronStatResponse -> { leuronId :: Int, likes :: Int, neutral :: Int, dislikes :: Int, stars :: Int, views :: Int }
```

#### `unwrapLeuronStatResponses`

``` purescript
unwrapLeuronStatResponses :: LeuronStatResponses -> { leuronStatResponses :: Array LeuronStatResponse }
```

#### `unwrapLeuronTrainingRequest`

``` purescript
unwrapLeuronTrainingRequest :: LeuronTrainingRequest -> { summary :: LeuronTrainingSummary, guard :: Int }
```

#### `unwrapLeuronTrainingResponse`

``` purescript
unwrapLeuronTrainingResponse :: LeuronTrainingResponse -> { id :: Int, userId :: Int, leuronId :: Int, summary :: LeuronTrainingSummary, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date }
```

#### `unwrapLeuronTrainingResponses`

``` purescript
unwrapLeuronTrainingResponses :: LeuronTrainingResponses -> { leuronTrainingResponses :: Array LeuronTrainingResponse }
```

#### `unwrapLeuronTrainingStatResponse`

``` purescript
unwrapLeuronTrainingStatResponse :: LeuronTrainingStatResponse -> { leuronTrainingId :: Int }
```

#### `unwrapLeuronTrainingStatResponses`

``` purescript
unwrapLeuronTrainingStatResponses :: LeuronTrainingStatResponses -> { leuronTrainingStatResponses :: Array LeuronTrainingStatResponse }
```

#### `unwrapLikeRequest`

``` purescript
unwrapLikeRequest :: LikeRequest -> { opt :: LikeOpt, reason :: Maybe String, guard :: Int }
```

#### `unwrapLikeResponse`

``` purescript
unwrapLikeResponse :: LikeResponse -> { id :: Int, ent :: Ent, entId :: Int, userId :: Int, opt :: LikeOpt, score :: Int, reason :: Maybe String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date }
```

#### `unwrapLikeResponses`

``` purescript
unwrapLikeResponses :: LikeResponses -> { likeResponses :: Array LikeResponse }
```

#### `unwrapLikeStatResponse`

``` purescript
unwrapLikeStatResponse :: LikeStatResponse -> { ent :: Ent, entId :: Int, score :: Int, like :: Int, neutral :: Int, dislike :: Int }
```

#### `unwrapLikeStatResponses`

``` purescript
unwrapLikeStatResponses :: LikeStatResponses -> { likeStatResponses :: Array LikeStatResponse }
```

#### `unwrapLinearDemo`

``` purescript
unwrapLinearDemo :: LinearDemo -> { label :: String, content :: Array (Tuple String (Maybe String)) }
```

#### `unwrapOrganizationPackResponse`

``` purescript
unwrapOrganizationPackResponse :: OrganizationPackResponse -> { user :: UserSanitizedResponse, userId :: Int, organization :: OrganizationResponse, organizationId :: Int, stat :: OrganizationStatResponse, like :: Maybe LikeResponse, star :: Maybe StarResponse, isOwner :: Boolean, isMember :: Boolean }
```

#### `unwrapOrganizationPackResponses`

``` purescript
unwrapOrganizationPackResponses :: OrganizationPackResponses -> { organizationPackResponses :: Array OrganizationPackResponse }
```

#### `unwrapOrganizationRequest`

``` purescript
unwrapOrganizationRequest :: OrganizationRequest -> { displayName :: String, description :: Maybe String, company :: String, location :: String, email :: String, membership :: Membership, tags :: Array String, icon :: Maybe String, visibility :: Visibility, guard :: Int }
```

#### `unwrapOrganizationResponse`

``` purescript
unwrapOrganizationResponse :: OrganizationResponse -> { id :: Int, userId :: Int, name :: String, displayName :: String, description :: Maybe String, company :: String, location :: String, email :: String, emailMD5 :: String, membership :: Membership, icon :: Maybe String, tags :: Array String, visibility :: Visibility, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `unwrapOrganizationResponses`

``` purescript
unwrapOrganizationResponses :: OrganizationResponses -> { organizationResponses :: Array OrganizationResponse }
```

#### `unwrapOrganizationStatResponse`

``` purescript
unwrapOrganizationStatResponse :: OrganizationStatResponse -> { organizationId :: Int, teams :: Int, members :: Int, forums :: Int, boards :: Int, threads :: Int, threadPosts :: Int, views :: Int }
```

#### `unwrapOrganizationStatResponses`

``` purescript
unwrapOrganizationStatResponses :: OrganizationStatResponses -> { organizationStatResponses :: Array OrganizationStatResponse }
```

#### `unwrapPmInRequest`

``` purescript
unwrapPmInRequest :: PmInRequest -> { label :: Maybe String, isRead :: Boolean, isStarred :: Boolean, guard :: Int }
```

#### `unwrapPmInResponse`

``` purescript
unwrapPmInResponse :: PmInResponse -> { id :: Int, pmId :: Int, userId :: Int, label :: Maybe String, isRead :: Boolean, isStarred :: Boolean, isNew :: Boolean, isSaved :: Boolean, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date }
```

#### `unwrapPmInResponses`

``` purescript
unwrapPmInResponses :: PmInResponses -> { pmInResponses :: Array PmInResponse }
```

#### `unwrapPmOutRequest`

``` purescript
unwrapPmOutRequest :: PmOutRequest -> { label :: Maybe String, guard :: Int }
```

#### `unwrapPmOutResponse`

``` purescript
unwrapPmOutResponse :: PmOutResponse -> { id :: Int, pmId :: Int, userId :: Int, label :: Maybe String, isSaved :: Boolean, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date }
```

#### `unwrapPmOutResponses`

``` purescript
unwrapPmOutResponses :: PmOutResponses -> { pmOutResponses :: Array PmOutResponse }
```

#### `unwrapPmRequest`

``` purescript
unwrapPmRequest :: PmRequest -> { subject :: String, body :: String, guard :: Int }
```

#### `unwrapPmResponse`

``` purescript
unwrapPmResponse :: PmResponse -> { id :: Int, userId :: Int, toUserId :: Int, subject :: String, body :: String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `unwrapPmResponses`

``` purescript
unwrapPmResponses :: PmResponses -> { pmResponses :: Array PmResponse }
```

#### `unwrapProfileRequest`

``` purescript
unwrapProfileRequest :: ProfileRequest -> { gender :: ProfileGender, birthdate :: Date, website :: Maybe String, location :: Maybe String, signature :: Maybe String, guard :: Int }
```

#### `unwrapProfileResponse`

``` purescript
unwrapProfileResponse :: ProfileResponse -> { id :: Int, ent :: Ent, entId :: Int, gender :: ProfileGender, birthdate :: Date, website :: Maybe String, location :: Maybe String, signature :: Maybe String, karmaGood :: Int, karmaBad :: Int, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date }
```

#### `unwrapProfileResponses`

``` purescript
unwrapProfileResponses :: ProfileResponses -> { profileResponses :: Array ProfileResponse }
```

#### `unwrapProfileX`

``` purescript
unwrapProfileX :: ProfileX -> { profileLogin :: String, profileName :: String, profileEmail :: String }
```

#### `unwrapQA`

``` purescript
unwrapQA :: QA -> { question :: String, answer :: String }
```

#### `unwrapReminderFolderRequest`

``` purescript
unwrapReminderFolderRequest :: ReminderFolderRequest -> { displayName :: String, description :: Maybe String, visibility :: Visibility, guard :: Int }
```

#### `unwrapReminderFolderResponse`

``` purescript
unwrapReminderFolderResponse :: ReminderFolderResponse -> { id :: Int, userId :: Int, parentFolderId :: Maybe Int, name :: String, displayName :: String, visibility :: Visibility, description :: Maybe String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `unwrapReminderFolderResponses`

``` purescript
unwrapReminderFolderResponses :: ReminderFolderResponses -> { reminderFolderResponses :: Array ReminderFolderResponse }
```

#### `unwrapReminderRequest`

``` purescript
unwrapReminderRequest :: ReminderRequest -> { dataP :: String, guard :: Int }
```

#### `unwrapReminderResponse`

``` purescript
unwrapReminderResponse :: ReminderResponse -> { id :: Int, userId :: Int, parentFolderId :: Int, dataP :: String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `unwrapReminderResponses`

``` purescript
unwrapReminderResponses :: ReminderResponses -> { reminderResponses :: Array ReminderResponse }
```

#### `unwrapResourcePackResponse`

``` purescript
unwrapResourcePackResponse :: ResourcePackResponse -> { resource :: ResourceResponse, resourceId :: Int, user :: UserSanitizedResponse, userId :: Int, stat :: ResourceStatResponse, like :: Maybe LikeResponse, star :: Maybe StarResponse, isOwner :: Boolean }
```

#### `unwrapResourcePackResponses`

``` purescript
unwrapResourcePackResponses :: ResourcePackResponses -> { resourcePackResponses :: Array ResourcePackResponse }
```

#### `unwrapResourceRequest`

``` purescript
unwrapResourceRequest :: ResourceRequest -> { displayName :: String, description :: String, source :: ResourceType, author :: Maybe (Array String), prerequisites :: Array (Array String), categories :: Array (Array String), visibility :: Visibility, counter :: Int, version :: Maybe String, urls :: Maybe (Array String), icon :: Maybe String, tags :: Array String, guard :: Int }
```

#### `unwrapResourceResponse`

``` purescript
unwrapResourceResponse :: ResourceResponse -> { id :: Int, userId :: Int, name :: String, displayName :: String, description :: String, source :: ResourceType, author :: Maybe (Array String), prerequisites :: Array (Array String), categories :: Array (Array String), visibility :: Visibility, counter :: Int, version :: Maybe String, urls :: Maybe (Array String), icon :: Maybe String, tags :: Array String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `unwrapResourceResponses`

``` purescript
unwrapResourceResponses :: ResourceResponses -> { resourceResponses :: Array ResourceResponse }
```

#### `unwrapResourceStatResponse`

``` purescript
unwrapResourceStatResponse :: ResourceStatResponse -> { resourceId :: Int, leurons :: Int, likes :: Int, neutral :: Int, dislikes :: Int, stars :: Int, views :: Int }
```

#### `unwrapResourceStatResponses`

``` purescript
unwrapResourceStatResponses :: ResourceStatResponses -> { resourceStatResponses :: Array ResourceStatResponse }
```

#### `unwrapScript`

``` purescript
unwrapScript :: Script -> { title :: String, desc :: String, url :: String }
```

#### `unwrapStarRequest`

``` purescript
unwrapStarRequest :: StarRequest -> { reason :: Maybe String, guard :: Int }
```

#### `unwrapStarResponse`

``` purescript
unwrapStarResponse :: StarResponse -> { id :: Int, ent :: Ent, entId :: Int, userId :: Int, reason :: Maybe String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date }
```

#### `unwrapStarResponses`

``` purescript
unwrapStarResponses :: StarResponses -> { starResponses :: Array StarResponse }
```

#### `unwrapStarStatResponse`

``` purescript
unwrapStarStatResponse :: StarStatResponse -> { ent :: Ent, entId :: Int, stars :: Int }
```

#### `unwrapStarStatResponses`

``` purescript
unwrapStarStatResponses :: StarStatResponses -> { starStatResponses :: Array StarStatResponse }
```

#### `unwrapSynonym`

``` purescript
unwrapSynonym :: Synonym -> { a :: String, b :: String }
```

#### `unwrapTable`

``` purescript
unwrapTable :: Table -> { title :: String, columns :: Array String, rows :: Array (Array (Maybe String)) }
```

#### `unwrapTeamMemberPackResponse`

``` purescript
unwrapTeamMemberPackResponse :: TeamMemberPackResponse -> { user :: UserSanitizedResponse, userId :: Int, teamMember :: TeamMemberResponse, teamMemberId :: Int, isOwner :: Boolean }
```

#### `unwrapTeamMemberPackResponses`

``` purescript
unwrapTeamMemberPackResponses :: TeamMemberPackResponses -> { teamMemberPackResponses :: Array TeamMemberPackResponse }
```

#### `unwrapTeamMemberRequest`

``` purescript
unwrapTeamMemberRequest :: TeamMemberRequest -> { guard :: Int }
```

#### `unwrapTeamMemberResponse`

``` purescript
unwrapTeamMemberResponse :: TeamMemberResponse -> { id :: Int, userId :: Int, teamId :: Int, isAccepted :: Boolean, acceptedAt :: Maybe Date, isBlocked :: Boolean, blockedAt :: Maybe Date, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `unwrapTeamMemberResponses`

``` purescript
unwrapTeamMemberResponses :: TeamMemberResponses -> { teamMemberResponses :: Array TeamMemberResponse }
```

#### `unwrapTeamMemberStatResponses`

``` purescript
unwrapTeamMemberStatResponses :: TeamMemberStatResponses -> { teamMemberStatResponses :: Array TeamMemberStatResponse }
```

#### `unwrapTeamPackResponse`

``` purescript
unwrapTeamPackResponse :: TeamPackResponse -> { user :: UserSanitizedResponse, userId :: Int, team :: TeamResponse, teamId :: Int, stat :: TeamStatResponse, like :: Maybe LikeResponse, star :: Maybe StarResponse, isOwner :: Boolean }
```

#### `unwrapTeamPackResponses`

``` purescript
unwrapTeamPackResponses :: TeamPackResponses -> { teamPackResponses :: Array TeamPackResponse }
```

#### `unwrapTeamRequest`

``` purescript
unwrapTeamRequest :: TeamRequest -> { displayName :: String, description :: Maybe String, membership :: Membership, icon :: Maybe String, tags :: Array String, visibility :: Visibility, guard :: Int }
```

#### `unwrapTeamResponse`

``` purescript
unwrapTeamResponse :: TeamResponse -> { id :: Int, userId :: Int, orgId :: Int, name :: String, displayName :: String, description :: Maybe String, membership :: Membership, icon :: Maybe String, tags :: Array String, visibility :: Visibility, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `unwrapTeamResponses`

``` purescript
unwrapTeamResponses :: TeamResponses -> { teamResponses :: Array TeamResponse }
```

#### `unwrapTeamStatResponse`

``` purescript
unwrapTeamStatResponse :: TeamStatResponse -> { members :: Int }
```

#### `unwrapTeamStatResponses`

``` purescript
unwrapTeamStatResponses :: TeamStatResponses -> { teamStatResponses :: Array TeamStatResponse }
```

#### `unwrapTemplate`

``` purescript
unwrapTemplate :: Template -> { template :: String, values :: Array (Tuple String (Array String)) }
```

#### `unwrapTestRequest`

``` purescript
unwrapTestRequest :: TestRequest -> { msg :: String }
```

#### `unwrapTestResponse`

``` purescript
unwrapTestResponse :: TestResponse -> { id :: Int, userId :: Int, msg :: String, createdAt :: Maybe Date, modifiedAt :: Maybe Date }
```

#### `unwrapTestResponses`

``` purescript
unwrapTestResponses :: TestResponses -> { testResponses :: Array TestResponse }
```

#### `unwrapThreadPackResponse`

``` purescript
unwrapThreadPackResponse :: ThreadPackResponse -> { thread :: ThreadResponse, threadId :: Int, user :: UserSanitizedResponse, userId :: Int, stat :: ThreadStatResponse, like :: Maybe LikeResponse, star :: Maybe StarResponse, latestThreadPost :: Maybe ThreadPostResponse, latestThreadPostUser :: Maybe UserSanitizedResponse, isOwner :: Boolean }
```

#### `unwrapThreadPackResponses`

``` purescript
unwrapThreadPackResponses :: ThreadPackResponses -> { threadPackResponses :: Array ThreadPackResponse }
```

#### `unwrapThreadPostPackResponse`

``` purescript
unwrapThreadPostPackResponse :: ThreadPostPackResponse -> { threadPost :: ThreadPostResponse, threadPostId :: Int, user :: UserSanitizedResponse, userId :: Int, stat :: ThreadPostStatResponse, like :: Maybe LikeResponse, star :: Maybe StarResponse, isOwner :: Boolean }
```

#### `unwrapThreadPostPackResponses`

``` purescript
unwrapThreadPostPackResponses :: ThreadPostPackResponses -> { threadPostPackResponses :: Array ThreadPostPackResponse }
```

#### `unwrapThreadPostRequest`

``` purescript
unwrapThreadPostRequest :: ThreadPostRequest -> { title :: Maybe String, body :: PostData, tags :: Array String, privateTags :: Array String, guard :: Int }
```

#### `unwrapThreadPostResponse`

``` purescript
unwrapThreadPostResponse :: ThreadPostResponse -> { id :: Int, userId :: Int, threadId :: Int, parentId :: Maybe Int, title :: Maybe String, body :: PostData, tags :: Array String, privateTags :: Array String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `unwrapThreadPostResponses`

``` purescript
unwrapThreadPostResponses :: ThreadPostResponses -> { threadPostResponses :: Array ThreadPostResponse }
```

#### `unwrapThreadPostStatResponse`

``` purescript
unwrapThreadPostStatResponse :: ThreadPostStatResponse -> { threadPostId :: Int, likes :: Int, neutral :: Int, dislikes :: Int, stars :: Int, views :: Int }
```

#### `unwrapThreadPostStatResponses`

``` purescript
unwrapThreadPostStatResponses :: ThreadPostStatResponses -> { threadPostStatResponses :: Array ThreadPostStatResponse }
```

#### `unwrapThreadRequest`

``` purescript
unwrapThreadRequest :: ThreadRequest -> { displayName :: String, description :: Maybe String, sticky :: Boolean, locked :: Boolean, poll :: Maybe String, icon :: Maybe String, tags :: Array String, guard :: Int }
```

#### `unwrapThreadResponse`

``` purescript
unwrapThreadResponse :: ThreadResponse -> { id :: Int, userId :: Int, boardId :: Int, name :: String, displayName :: String, description :: Maybe String, sticky :: Boolean, locked :: Boolean, poll :: Maybe String, icon :: Maybe String, tags :: Array String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedBy :: Maybe Int, modifiedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `unwrapThreadResponses`

``` purescript
unwrapThreadResponses :: ThreadResponses -> { threadResponses :: Array ThreadResponse }
```

#### `unwrapThreadStatResponse`

``` purescript
unwrapThreadStatResponse :: ThreadStatResponse -> { threadId :: Int, threadPosts :: Int, views :: Int }
```

#### `unwrapThreadStatResponses`

``` purescript
unwrapThreadStatResponses :: ThreadStatResponses -> { threadStatResponses :: Array ThreadStatResponse }
```

#### `unwrapUserPackResponse`

``` purescript
unwrapUserPackResponse :: UserPackResponse -> { user :: UserResponse, userId :: Int, stat :: UserSanitizedStatResponse, profile :: ProfileResponse, profileId :: Int }
```

#### `unwrapUserPackResponses`

``` purescript
unwrapUserPackResponses :: UserPackResponses -> { userPackResponses :: Array UserPackResponse }
```

#### `unwrapUserRequest`

``` purescript
unwrapUserRequest :: UserRequest -> { displayNick :: String, name :: String, email :: String, plugin :: String, ident :: String, acceptTOS :: Maybe Date }
```

#### `unwrapUserResponse`

``` purescript
unwrapUserResponse :: UserResponse -> { id :: Int, nick :: String, displayNick :: String, name :: String, email :: String, emailMD5 :: String, plugin :: String, ident :: String, acceptTOS :: Maybe Date, active :: Boolean, guard :: Int, createdAt :: Maybe Date, modifiedAt :: Maybe Date, deactivatedAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `unwrapUserResponses`

``` purescript
unwrapUserResponses :: UserResponses -> { userResponses :: Array UserResponse }
```

#### `unwrapUserSanitizedPackResponse`

``` purescript
unwrapUserSanitizedPackResponse :: UserSanitizedPackResponse -> { user :: UserSanitizedResponse, userId :: Int, profile :: ProfileResponse, profileId :: Int, stat :: UserSanitizedStatResponse, like :: Maybe LikeResponse, star :: Maybe StarResponse }
```

#### `unwrapUserSanitizedPackResponses`

``` purescript
unwrapUserSanitizedPackResponses :: UserSanitizedPackResponses -> { userSanitizedPackResponses :: Array UserSanitizedPackResponse }
```

#### `unwrapUserSanitizedResponse`

``` purescript
unwrapUserSanitizedResponse :: UserSanitizedResponse -> { id :: Int, nick :: String, displayNick :: String, emailMD5 :: String, active :: Boolean, guard :: Int, createdAt :: Maybe Date, activityAt :: Maybe Date }
```

#### `unwrapUserSanitizedResponses`

``` purescript
unwrapUserSanitizedResponses :: UserSanitizedResponses -> { userSanitizedResponses :: Array UserSanitizedResponse }
```

#### `unwrapUserSanitizedStatResponse`

``` purescript
unwrapUserSanitizedStatResponse :: UserSanitizedStatResponse -> { userId :: Int, threads :: Int, threadPosts :: Int, respect :: Int, resources :: Int, leurons :: Int, workouts :: Int }
```

#### `unwrapUserSanitizedStatResponses`

``` purescript
unwrapUserSanitizedStatResponses :: UserSanitizedStatResponses -> { userSanitizedStatResponses :: Array UserSanitizedStatResponse }
```

#### `url_`

``` purescript
url_ :: forall b a r. Lens { url :: a | r } { url :: b | r } a b
```

#### `urls_`

``` purescript
urls_ :: forall b a r. Lens { urls :: a | r } { urls :: b | r } a b
```

#### `userId_`

``` purescript
userId_ :: forall b a r. Lens { userId :: a | r } { userId :: b | r } a b
```

#### `userPackResponses_`

``` purescript
userPackResponses_ :: forall b a r. Lens { userPackResponses :: a | r } { userPackResponses :: b | r } a b
```

#### `userResponses_`

``` purescript
userResponses_ :: forall b a r. Lens { userResponses :: a | r } { userResponses :: b | r } a b
```

#### `userSanitizedPackResponses_`

``` purescript
userSanitizedPackResponses_ :: forall b a r. Lens { userSanitizedPackResponses :: a | r } { userSanitizedPackResponses :: b | r } a b
```

#### `userSanitizedResponses_`

``` purescript
userSanitizedResponses_ :: forall b a r. Lens { userSanitizedResponses :: a | r } { userSanitizedResponses :: b | r } a b
```

#### `userSanitizedStatResponses_`

``` purescript
userSanitizedStatResponses_ :: forall b a r. Lens { userSanitizedStatResponses :: a | r } { userSanitizedStatResponses :: b | r } a b
```

#### `user_`

``` purescript
user_ :: forall b a r. Lens { user :: a | r } { user :: b | r } a b
```

#### `value_`

``` purescript
value_ :: forall b a r. Lens { value :: a | r } { value :: b | r } a b
```

#### `values_`

``` purescript
values_ :: forall b a r. Lens { values :: a | r } { values :: b | r } a b
```

#### `version_`

``` purescript
version_ :: forall b a r. Lens { version :: a | r } { version :: b | r } a b
```

#### `views_`

``` purescript
views_ :: forall b a r. Lens { views :: a | r } { views :: b | r } a b
```

#### `visibility_`

``` purescript
visibility_ :: forall b a r. Lens { visibility :: a | r } { visibility :: b | r } a b
```

#### `website_`

``` purescript
website_ :: forall b a r. Lens { website :: a | r } { website :: b | r } a b
```

#### `workouts_`

``` purescript
workouts_ :: forall b a r. Lens { workouts :: a | r } { workouts :: b | r } a b
```

