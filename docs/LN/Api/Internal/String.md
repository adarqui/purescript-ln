## Module LN.Api.Internal.String

#### `getUserSanitizedPack`

``` purescript
getUserSanitizedPack :: forall qp. QueryParam qp => Array qp -> String -> ApiEff (Either ApiError UserSanitizedPackResponse)
```

#### `getUserSanitizedPack'`

``` purescript
getUserSanitizedPack' :: String -> ApiEff (Either ApiError UserSanitizedPackResponse)
```

#### `getOrganization`

``` purescript
getOrganization :: forall qp. QueryParam qp => Array qp -> String -> ApiEff (Either ApiError OrganizationResponse)
```

#### `getOrganization'`

``` purescript
getOrganization' :: String -> ApiEff (Either ApiError OrganizationResponse)
```

#### `getOrganizationPack`

``` purescript
getOrganizationPack :: forall qp. QueryParam qp => Array qp -> String -> ApiEff (Either ApiError OrganizationPackResponse)
```

#### `getOrganizationPack'`

``` purescript
getOrganizationPack' :: String -> ApiEff (Either ApiError OrganizationPackResponse)
```

#### `getTeam_ByOrganizationId`

``` purescript
getTeam_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> String -> Int -> ApiEff (Either ApiError TeamResponse)
```

#### `getTeam_ByOrganizationId'`

``` purescript
getTeam_ByOrganizationId' :: String -> Int -> ApiEff (Either ApiError TeamResponse)
```

#### `getTeamPack_ByOrganizationId`

``` purescript
getTeamPack_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> String -> Int -> ApiEff (Either ApiError TeamPackResponse)
```

#### `getTeamPack_ByOrganizationId'`

``` purescript
getTeamPack_ByOrganizationId' :: String -> Int -> ApiEff (Either ApiError TeamPackResponse)
```

#### `getGlobalGroup_ByOrganizationId`

``` purescript
getGlobalGroup_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> String -> Int -> ApiEff (Either ApiError GlobalGroupResponse)
```

#### `getGlobalGroup_ByOrganizationId'`

``` purescript
getGlobalGroup_ByOrganizationId' :: String -> Int -> ApiEff (Either ApiError GlobalGroupResponse)
```

#### `getGlobalGroupPack_ByOrganizationId`

``` purescript
getGlobalGroupPack_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> String -> Int -> ApiEff (Either ApiError GlobalGroupPackResponse)
```

#### `getGlobalGroupPack_ByOrganizationId'`

``` purescript
getGlobalGroupPack_ByOrganizationId' :: String -> Int -> ApiEff (Either ApiError GlobalGroupPackResponse)
```

#### `getGroup_ByOrganizationId`

``` purescript
getGroup_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> String -> Int -> ApiEff (Either ApiError GroupResponse)
```

#### `getGroup_ByOrganizationId'`

``` purescript
getGroup_ByOrganizationId' :: String -> Int -> ApiEff (Either ApiError GroupResponse)
```

#### `getGroupPack_ByOrganizationId`

``` purescript
getGroupPack_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> String -> Int -> ApiEff (Either ApiError GroupPackResponse)
```

#### `getGroupPack_ByOrganizationId'`

``` purescript
getGroupPack_ByOrganizationId' :: String -> Int -> ApiEff (Either ApiError GroupPackResponse)
```

#### `getForum_ByOrganizationId`

``` purescript
getForum_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> String -> Int -> ApiEff (Either ApiError ForumResponse)
```

#### `getForum_ByOrganizationId'`

``` purescript
getForum_ByOrganizationId' :: String -> Int -> ApiEff (Either ApiError ForumResponse)
```

#### `getForumPack_ByOrganizationId`

``` purescript
getForumPack_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> String -> Int -> ApiEff (Either ApiError ForumPackResponse)
```

#### `getForumPack_ByOrganizationId'`

``` purescript
getForumPack_ByOrganizationId' :: String -> Int -> ApiEff (Either ApiError ForumPackResponse)
```

#### `getBoard_ByForumId`

``` purescript
getBoard_ByForumId :: forall qp. QueryParam qp => Array qp -> String -> Int -> ApiEff (Either ApiError BoardResponse)
```

#### `getBoard_ByForumId'`

``` purescript
getBoard_ByForumId' :: String -> Int -> ApiEff (Either ApiError BoardResponse)
```

#### `getBoardPack_ByForumId`

``` purescript
getBoardPack_ByForumId :: forall qp. QueryParam qp => Array qp -> String -> Int -> ApiEff (Either ApiError BoardPackResponse)
```

#### `getBoardPack_ByForumId'`

``` purescript
getBoardPack_ByForumId' :: String -> Int -> ApiEff (Either ApiError BoardPackResponse)
```

#### `getThread_ByBoardId`

``` purescript
getThread_ByBoardId :: forall qp. QueryParam qp => Array qp -> String -> Int -> ApiEff (Either ApiError ThreadResponse)
```

#### `getThread_ByBoardId'`

``` purescript
getThread_ByBoardId' :: String -> Int -> ApiEff (Either ApiError ThreadResponse)
```

#### `getThreadPack_ByBoardId`

``` purescript
getThreadPack_ByBoardId :: forall qp. QueryParam qp => Array qp -> String -> Int -> ApiEff (Either ApiError ThreadPackResponse)
```

#### `getThreadPack_ByBoardId'`

``` purescript
getThreadPack_ByBoardId' :: String -> Int -> ApiEff (Either ApiError ThreadPackResponse)
```


