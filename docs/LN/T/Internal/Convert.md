## Module LN.T.Internal.Convert

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

#### `pmRequestToPmResponse`

``` purescript
pmRequestToPmResponse :: Int -> Int -> Int -> Boolean -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> PmRequest -> PmResponse
```

#### `pmResponseToPmRequest`

``` purescript
pmResponseToPmRequest :: PmResponse -> PmRequest
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

#### `profileRequestToProfileResponse`

``` purescript
profileRequestToProfileResponse :: Int -> Ent -> Int -> Int -> Int -> (Maybe Date) -> (Maybe Date) -> ProfileRequest -> ProfileResponse
```

#### `profileResponseToProfileRequest`

``` purescript
profileResponseToProfileRequest :: ProfileResponse -> ProfileRequest
```

#### `reminderRequestToReminderResponse`

``` purescript
reminderRequestToReminderResponse :: Int -> Int -> Int -> Boolean -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> ReminderRequest -> ReminderResponse
```

#### `reminderResponseToReminderRequest`

``` purescript
reminderResponseToReminderRequest :: ReminderResponse -> ReminderRequest
```

#### `reminderFolderRequestToReminderFolderResponse`

``` purescript
reminderFolderRequestToReminderFolderResponse :: Int -> Int -> (Maybe Int) -> String -> Boolean -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> ReminderFolderRequest -> ReminderFolderResponse
```

#### `reminderFolderResponseToReminderFolderRequest`

``` purescript
reminderFolderResponseToReminderFolderRequest :: ReminderFolderResponse -> ReminderFolderRequest
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

#### `threadRequestToThreadResponse`

``` purescript
threadRequestToThreadResponse :: Int -> Int -> Int -> String -> Boolean -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> ThreadRequest -> ThreadResponse
```

#### `threadResponseToThreadRequest`

``` purescript
threadResponseToThreadRequest :: ThreadResponse -> ThreadRequest
```

#### `threadPostRequestToThreadPostResponse`

``` purescript
threadPostRequestToThreadPostResponse :: Int -> Int -> Int -> (Maybe Int) -> Boolean -> (Maybe Date) -> (Maybe Int) -> (Maybe Date) -> (Maybe Date) -> ThreadPostRequest -> ThreadPostResponse
```

#### `threadPostResponseToThreadPostRequest`

``` purescript
threadPostResponseToThreadPostRequest :: ThreadPostResponse -> ThreadPostRequest
```

#### `userRequestToUserResponse`

``` purescript
userRequestToUserResponse :: Int -> String -> String -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> UserRequest -> UserResponse
```

#### `userResponseToUserRequest`

``` purescript
userResponseToUserRequest :: UserResponse -> UserRequest
```

#### `userRequestToUserSanitizedResponse`

``` purescript
userRequestToUserSanitizedResponse :: Int -> String -> String -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> UserRequest -> UserSanitizedResponse
```

#### `userSanitizedResponseToUserRequest`

``` purescript
userSanitizedResponseToUserRequest :: String -> String -> String -> String -> (Maybe Date) -> UserSanitizedResponse -> UserRequest
```


