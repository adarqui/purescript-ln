## Module LN.Api.Internal

#### `getEmptys`

``` purescript
getEmptys :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError EmptyResponses)
```

#### `getEmptys'`

``` purescript
getEmptys' :: ApiEff (Either ApiError EmptyResponses)
```

#### `postEmpty`

``` purescript
postEmpty :: forall qp. QueryParam qp => Array qp -> EmptyRequest -> ApiEff (Either ApiError EmptyResponse)
```

#### `postEmpty'`

``` purescript
postEmpty' :: EmptyRequest -> ApiEff (Either ApiError EmptyResponse)
```

#### `getEmpty`

``` purescript
getEmpty :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError EmptyResponse)
```

#### `getEmpty'`

``` purescript
getEmpty' :: Int -> ApiEff (Either ApiError EmptyResponse)
```

#### `putEmpty`

``` purescript
putEmpty :: forall qp. QueryParam qp => Array qp -> Int -> EmptyRequest -> ApiEff (Either ApiError EmptyResponse)
```

#### `putEmpty'`

``` purescript
putEmpty' :: Int -> EmptyRequest -> ApiEff (Either ApiError EmptyResponse)
```

#### `deleteEmpty`

``` purescript
deleteEmpty :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
```

#### `deleteEmpty'`

``` purescript
deleteEmpty' :: Int -> ApiEff (Either ApiError Unit)
```

#### `getApis`

``` purescript
getApis :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError ApiResponses)
```

#### `getApis'`

``` purescript
getApis' :: ApiEff (Either ApiError ApiResponses)
```

#### `postApi`

``` purescript
postApi :: forall qp. QueryParam qp => Array qp -> ApiRequest -> ApiEff (Either ApiError ApiResponse)
```

#### `postApi'`

``` purescript
postApi' :: ApiRequest -> ApiEff (Either ApiError ApiResponse)
```

#### `getApi`

``` purescript
getApi :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ApiResponse)
```

#### `getApi'`

``` purescript
getApi' :: Int -> ApiEff (Either ApiError ApiResponse)
```

#### `putApi`

``` purescript
putApi :: forall qp. QueryParam qp => Array qp -> Int -> ApiRequest -> ApiEff (Either ApiError ApiResponse)
```

#### `putApi'`

``` purescript
putApi' :: Int -> ApiRequest -> ApiEff (Either ApiError ApiResponse)
```

#### `deleteApi`

``` purescript
deleteApi :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
```

#### `deleteApi'`

``` purescript
deleteApi' :: Int -> ApiEff (Either ApiError Unit)
```

#### `getBoards`

``` purescript
getBoards :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError BoardResponses)
```

#### `getBoards'`

``` purescript
getBoards' :: ApiEff (Either ApiError BoardResponses)
```

#### `getBoards_ByBoardsIds`

``` purescript
getBoards_ByBoardsIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError BoardResponses)
```

#### `getBoards_ByBoardsIds'`

``` purescript
getBoards_ByBoardsIds' :: (Array Int) -> ApiEff (Either ApiError BoardResponses)
```

#### `getBoards_ByForumId`

``` purescript
getBoards_ByForumId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError BoardResponses)
```

#### `getBoards_ByForumId'`

``` purescript
getBoards_ByForumId' :: Int -> ApiEff (Either ApiError BoardResponses)
```

#### `postBoard_ByForumId`

``` purescript
postBoard_ByForumId :: forall qp. QueryParam qp => Array qp -> Int -> BoardRequest -> ApiEff (Either ApiError BoardResponse)
```

#### `postBoard_ByForumId'`

``` purescript
postBoard_ByForumId' :: Int -> BoardRequest -> ApiEff (Either ApiError BoardResponse)
```

#### `postBoard_ByBoardId`

``` purescript
postBoard_ByBoardId :: forall qp. QueryParam qp => Array qp -> Int -> BoardRequest -> ApiEff (Either ApiError BoardResponse)
```

#### `postBoard_ByBoardId'`

``` purescript
postBoard_ByBoardId' :: Int -> BoardRequest -> ApiEff (Either ApiError BoardResponse)
```

#### `getBoard`

``` purescript
getBoard :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError BoardResponse)
```

#### `getBoard'`

``` purescript
getBoard' :: Int -> ApiEff (Either ApiError BoardResponse)
```

#### `putBoard`

``` purescript
putBoard :: forall qp. QueryParam qp => Array qp -> Int -> BoardRequest -> ApiEff (Either ApiError BoardResponse)
```

#### `putBoard'`

``` purescript
putBoard' :: Int -> BoardRequest -> ApiEff (Either ApiError BoardResponse)
```

#### `deleteBoard`

``` purescript
deleteBoard :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
```

#### `deleteBoard'`

``` purescript
deleteBoard' :: Int -> ApiEff (Either ApiError Unit)
```

#### `getBoardStats`

``` purescript
getBoardStats :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError BoardStatResponses)
```

#### `getBoardStats'`

``` purescript
getBoardStats' :: ApiEff (Either ApiError BoardStatResponses)
```

#### `getBoardStat`

``` purescript
getBoardStat :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError BoardStatResponse)
```

#### `getBoardStat'`

``` purescript
getBoardStat' :: Int -> ApiEff (Either ApiError BoardStatResponse)
```

#### `getUsersCount`

``` purescript
getUsersCount :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError CountResponses)
```

#### `getUsersCount'`

``` purescript
getUsersCount' :: ApiEff (Either ApiError CountResponses)
```

#### `getOrganizationsCount`

``` purescript
getOrganizationsCount :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError CountResponses)
```

#### `getOrganizationsCount'`

``` purescript
getOrganizationsCount' :: ApiEff (Either ApiError CountResponses)
```

#### `getTeamsCount`

``` purescript
getTeamsCount :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError CountResponses)
```

#### `getTeamsCount'`

``` purescript
getTeamsCount' :: ApiEff (Either ApiError CountResponses)
```

#### `getTeamsCount_ByOrganizationId`

``` purescript
getTeamsCount_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError CountResponses)
```

#### `getTeamsCount_ByOrganizationId'`

``` purescript
getTeamsCount_ByOrganizationId' :: Int -> ApiEff (Either ApiError CountResponses)
```

#### `getTeamMembersCount`

``` purescript
getTeamMembersCount :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError CountResponses)
```

#### `getTeamMembersCount'`

``` purescript
getTeamMembersCount' :: ApiEff (Either ApiError CountResponses)
```

#### `getTeamMembersCount_ByOrganizationId`

``` purescript
getTeamMembersCount_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError CountResponses)
```

#### `getTeamMembersCount_ByOrganizationId'`

``` purescript
getTeamMembersCount_ByOrganizationId' :: Int -> ApiEff (Either ApiError CountResponses)
```

#### `getTeamMembersCount_ByTeamId`

``` purescript
getTeamMembersCount_ByTeamId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError CountResponses)
```

#### `getTeamMembersCount_ByTeamId'`

``` purescript
getTeamMembersCount_ByTeamId' :: Int -> ApiEff (Either ApiError CountResponses)
```

#### `getGlobalGroupsCount`

``` purescript
getGlobalGroupsCount :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError CountResponses)
```

#### `getGlobalGroupsCount'`

``` purescript
getGlobalGroupsCount' :: ApiEff (Either ApiError CountResponses)
```

#### `getGlobalGroupsCount_ByUserId`

``` purescript
getGlobalGroupsCount_ByUserId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError CountResponses)
```

#### `getGlobalGroupsCount_ByUserId'`

``` purescript
getGlobalGroupsCount_ByUserId' :: Int -> ApiEff (Either ApiError CountResponses)
```

#### `getGroupsCount`

``` purescript
getGroupsCount :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError CountResponses)
```

#### `getGroupsCount'`

``` purescript
getGroupsCount' :: ApiEff (Either ApiError CountResponses)
```

#### `getGroupsCount_ByOrganizationId`

``` purescript
getGroupsCount_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError CountResponses)
```

#### `getGroupsCount_ByOrganizationId'`

``` purescript
getGroupsCount_ByOrganizationId' :: Int -> ApiEff (Either ApiError CountResponses)
```

#### `getGroupMembersCount`

``` purescript
getGroupMembersCount :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError CountResponses)
```

#### `getGroupMembersCount'`

``` purescript
getGroupMembersCount' :: ApiEff (Either ApiError CountResponses)
```

#### `getGroupMembersCount_ByOrganizationId`

``` purescript
getGroupMembersCount_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError CountResponses)
```

#### `getGroupMembersCount_ByOrganizationId'`

``` purescript
getGroupMembersCount_ByOrganizationId' :: Int -> ApiEff (Either ApiError CountResponses)
```

#### `getGroupMembersCount_ByGroupId`

``` purescript
getGroupMembersCount_ByGroupId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError CountResponses)
```

#### `getGroupMembersCount_ByGroupId'`

``` purescript
getGroupMembersCount_ByGroupId' :: Int -> ApiEff (Either ApiError CountResponses)
```

#### `getForumsCount`

``` purescript
getForumsCount :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError CountResponses)
```

#### `getForumsCount'`

``` purescript
getForumsCount' :: ApiEff (Either ApiError CountResponses)
```

#### `getBoardsCount`

``` purescript
getBoardsCount :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError CountResponses)
```

#### `getBoardsCount'`

``` purescript
getBoardsCount' :: ApiEff (Either ApiError CountResponses)
```

#### `getThreadsCount`

``` purescript
getThreadsCount :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError CountResponses)
```

#### `getThreadsCount'`

``` purescript
getThreadsCount' :: ApiEff (Either ApiError CountResponses)
```

#### `getThreadsCount_ByBoardId`

``` purescript
getThreadsCount_ByBoardId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError CountResponses)
```

#### `getThreadsCount_ByBoardId'`

``` purescript
getThreadsCount_ByBoardId' :: Int -> ApiEff (Either ApiError CountResponses)
```

#### `getThreadPostsCount`

``` purescript
getThreadPostsCount :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError CountResponses)
```

#### `getThreadPostsCount'`

``` purescript
getThreadPostsCount' :: ApiEff (Either ApiError CountResponses)
```

#### `getThreadPostsCount_ByThreadId`

``` purescript
getThreadPostsCount_ByThreadId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError CountResponses)
```

#### `getThreadPostsCount_ByThreadId'`

``` purescript
getThreadPostsCount_ByThreadId' :: Int -> ApiEff (Either ApiError CountResponses)
```

#### `getResourcesCount`

``` purescript
getResourcesCount :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError CountResponses)
```

#### `getResourcesCount'`

``` purescript
getResourcesCount' :: ApiEff (Either ApiError CountResponses)
```

#### `getLeuronsCount`

``` purescript
getLeuronsCount :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError CountResponses)
```

#### `getLeuronsCount'`

``` purescript
getLeuronsCount' :: ApiEff (Either ApiError CountResponses)
```

#### `getForums`

``` purescript
getForums :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError ForumResponses)
```

#### `getForums'`

``` purescript
getForums' :: ApiEff (Either ApiError ForumResponses)
```

#### `getForums_ByOrganizationName`

``` purescript
getForums_ByOrganizationName :: forall qp. QueryParam qp => Array qp -> String -> ApiEff (Either ApiError ForumResponses)
```

#### `getForums_ByOrganizationName'`

``` purescript
getForums_ByOrganizationName' :: String -> ApiEff (Either ApiError ForumResponses)
```

#### `getForums_ByForumsIds`

``` purescript
getForums_ByForumsIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError ForumResponses)
```

#### `getForums_ByForumsIds'`

``` purescript
getForums_ByForumsIds' :: (Array Int) -> ApiEff (Either ApiError ForumResponses)
```

#### `getForums_ByOrganizationId`

``` purescript
getForums_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ForumResponses)
```

#### `getForums_ByOrganizationId'`

``` purescript
getForums_ByOrganizationId' :: Int -> ApiEff (Either ApiError ForumResponses)
```

#### `postForum_ByOrganizationId`

``` purescript
postForum_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ForumRequest -> ApiEff (Either ApiError ForumResponse)
```

#### `postForum_ByOrganizationId'`

``` purescript
postForum_ByOrganizationId' :: Int -> ForumRequest -> ApiEff (Either ApiError ForumResponse)
```

#### `getForum`

``` purescript
getForum :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ForumResponse)
```

#### `getForum'`

``` purescript
getForum' :: Int -> ApiEff (Either ApiError ForumResponse)
```

#### `putForum`

``` purescript
putForum :: forall qp. QueryParam qp => Array qp -> Int -> ForumRequest -> ApiEff (Either ApiError ForumResponse)
```

#### `putForum'`

``` purescript
putForum' :: Int -> ForumRequest -> ApiEff (Either ApiError ForumResponse)
```

#### `deleteForum`

``` purescript
deleteForum :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
```

#### `deleteForum'`

``` purescript
deleteForum' :: Int -> ApiEff (Either ApiError Unit)
```

#### `getForumStats`

``` purescript
getForumStats :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError ForumStatResponses)
```

#### `getForumStats'`

``` purescript
getForumStats' :: ApiEff (Either ApiError ForumStatResponses)
```

#### `getForumStat`

``` purescript
getForumStat :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ForumStatResponse)
```

#### `getForumStat'`

``` purescript
getForumStat' :: Int -> ApiEff (Either ApiError ForumStatResponse)
```

#### `getGlobalGroups`

``` purescript
getGlobalGroups :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError GlobalGroupResponses)
```

#### `getGlobalGroups'`

``` purescript
getGlobalGroups' :: ApiEff (Either ApiError GlobalGroupResponses)
```

#### `getGlobalGroups_ByOrganizationId`

``` purescript
getGlobalGroups_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError GlobalGroupResponses)
```

#### `getGlobalGroups_ByOrganizationId'`

``` purescript
getGlobalGroups_ByOrganizationId' :: Int -> ApiEff (Either ApiError GlobalGroupResponses)
```

#### `postGlobalGroup`

``` purescript
postGlobalGroup :: forall qp. QueryParam qp => Array qp -> GlobalGroupRequest -> ApiEff (Either ApiError GlobalGroupResponse)
```

#### `postGlobalGroup'`

``` purescript
postGlobalGroup' :: GlobalGroupRequest -> ApiEff (Either ApiError GlobalGroupResponse)
```

#### `getGlobalGroup`

``` purescript
getGlobalGroup :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError GlobalGroupResponse)
```

#### `getGlobalGroup'`

``` purescript
getGlobalGroup' :: Int -> ApiEff (Either ApiError GlobalGroupResponse)
```

#### `putGlobalGroup`

``` purescript
putGlobalGroup :: forall qp. QueryParam qp => Array qp -> Int -> GlobalGroupRequest -> ApiEff (Either ApiError GlobalGroupResponse)
```

#### `putGlobalGroup'`

``` purescript
putGlobalGroup' :: Int -> GlobalGroupRequest -> ApiEff (Either ApiError GlobalGroupResponse)
```

#### `deleteGlobalGroup`

``` purescript
deleteGlobalGroup :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
```

#### `deleteGlobalGroup'`

``` purescript
deleteGlobalGroup' :: Int -> ApiEff (Either ApiError Unit)
```

#### `getGroups`

``` purescript
getGroups :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError GroupResponses)
```

#### `getGroups'`

``` purescript
getGroups' :: ApiEff (Either ApiError GroupResponses)
```

#### `getGroups_ByOrganizationId`

``` purescript
getGroups_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError GroupResponses)
```

#### `getGroups_ByOrganizationId'`

``` purescript
getGroups_ByOrganizationId' :: Int -> ApiEff (Either ApiError GroupResponses)
```

#### `postGroup_ByOrganizationId`

``` purescript
postGroup_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> GroupRequest -> ApiEff (Either ApiError GroupResponse)
```

#### `postGroup_ByOrganizationId'`

``` purescript
postGroup_ByOrganizationId' :: Int -> GroupRequest -> ApiEff (Either ApiError GroupResponse)
```

#### `getGroup`

``` purescript
getGroup :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError GroupResponse)
```

#### `getGroup'`

``` purescript
getGroup' :: Int -> ApiEff (Either ApiError GroupResponse)
```

#### `putGroup`

``` purescript
putGroup :: forall qp. QueryParam qp => Array qp -> Int -> GroupRequest -> ApiEff (Either ApiError GroupResponse)
```

#### `putGroup'`

``` purescript
putGroup' :: Int -> GroupRequest -> ApiEff (Either ApiError GroupResponse)
```

#### `deleteGroup`

``` purescript
deleteGroup :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
```

#### `deleteGroup'`

``` purescript
deleteGroup' :: Int -> ApiEff (Either ApiError Unit)
```

#### `getGroupMembers`

``` purescript
getGroupMembers :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError GroupMemberResponses)
```

#### `getGroupMembers'`

``` purescript
getGroupMembers' :: ApiEff (Either ApiError GroupMemberResponses)
```

#### `getGroupMembers_ByOrganizationId`

``` purescript
getGroupMembers_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError GroupMemberResponses)
```

#### `getGroupMembers_ByOrganizationId'`

``` purescript
getGroupMembers_ByOrganizationId' :: Int -> ApiEff (Either ApiError GroupMemberResponses)
```

#### `getGroupMembers_ByGlobalGroupId`

``` purescript
getGroupMembers_ByGlobalGroupId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError GroupMemberResponses)
```

#### `getGroupMembers_ByGlobalGroupId'`

``` purescript
getGroupMembers_ByGlobalGroupId' :: Int -> ApiEff (Either ApiError GroupMemberResponses)
```

#### `getGroupMembers_ByGroupId`

``` purescript
getGroupMembers_ByGroupId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError GroupMemberResponses)
```

#### `getGroupMembers_ByGroupId'`

``` purescript
getGroupMembers_ByGroupId' :: Int -> ApiEff (Either ApiError GroupMemberResponses)
```

#### `postGroupMember_ByGlobalGroupId`

``` purescript
postGroupMember_ByGlobalGroupId :: forall qp. QueryParam qp => Array qp -> Int -> GroupMemberRequest -> ApiEff (Either ApiError GroupMemberResponse)
```

#### `postGroupMember_ByGlobalGroupId'`

``` purescript
postGroupMember_ByGlobalGroupId' :: Int -> GroupMemberRequest -> ApiEff (Either ApiError GroupMemberResponse)
```

#### `getGroupMember`

``` purescript
getGroupMember :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError GroupMemberResponse)
```

#### `getGroupMember'`

``` purescript
getGroupMember' :: Int -> ApiEff (Either ApiError GroupMemberResponse)
```

#### `putGroupMember`

``` purescript
putGroupMember :: forall qp. QueryParam qp => Array qp -> Int -> GroupMemberRequest -> ApiEff (Either ApiError GroupMemberResponse)
```

#### `putGroupMember'`

``` purescript
putGroupMember' :: Int -> GroupMemberRequest -> ApiEff (Either ApiError GroupMemberResponse)
```

#### `deleteGroupMember`

``` purescript
deleteGroupMember :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
```

#### `deleteGroupMember'`

``` purescript
deleteGroupMember' :: Int -> ApiEff (Either ApiError Unit)
```

#### `getLeurons`

``` purescript
getLeurons :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError LeuronResponses)
```

#### `getLeurons'`

``` purescript
getLeurons' :: ApiEff (Either ApiError LeuronResponses)
```

#### `postLeuron_ByResourceId`

``` purescript
postLeuron_ByResourceId :: forall qp. QueryParam qp => Array qp -> Int -> LeuronRequest -> ApiEff (Either ApiError LeuronResponse)
```

#### `postLeuron_ByResourceId'`

``` purescript
postLeuron_ByResourceId' :: Int -> LeuronRequest -> ApiEff (Either ApiError LeuronResponse)
```

#### `getLeuron`

``` purescript
getLeuron :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError LeuronResponse)
```

#### `getLeuron'`

``` purescript
getLeuron' :: Int -> ApiEff (Either ApiError LeuronResponse)
```

#### `putLeuron`

``` purescript
putLeuron :: forall qp. QueryParam qp => Array qp -> Int -> LeuronRequest -> ApiEff (Either ApiError LeuronResponse)
```

#### `putLeuron'`

``` purescript
putLeuron' :: Int -> LeuronRequest -> ApiEff (Either ApiError LeuronResponse)
```

#### `deleteLeuron`

``` purescript
deleteLeuron :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
```

#### `deleteLeuron'`

``` purescript
deleteLeuron' :: Int -> ApiEff (Either ApiError Unit)
```

#### `getLikes`

``` purescript
getLikes :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError LikeResponses)
```

#### `getLikes'`

``` purescript
getLikes' :: ApiEff (Either ApiError LikeResponses)
```

#### `getLikes_ByThreadPostsIds`

``` purescript
getLikes_ByThreadPostsIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError LikeResponses)
```

#### `getLikes_ByThreadPostsIds'`

``` purescript
getLikes_ByThreadPostsIds' :: (Array Int) -> ApiEff (Either ApiError LikeResponses)
```

#### `getLikes_ByThreadPostId`

``` purescript
getLikes_ByThreadPostId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError LikeResponses)
```

#### `getLikes_ByThreadPostId'`

``` purescript
getLikes_ByThreadPostId' :: Int -> ApiEff (Either ApiError LikeResponses)
```

#### `getLikes_ByResourceId`

``` purescript
getLikes_ByResourceId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError LikeResponses)
```

#### `getLikes_ByResourceId'`

``` purescript
getLikes_ByResourceId' :: Int -> ApiEff (Either ApiError LikeResponses)
```

#### `postLike_ByThreadPostId`

``` purescript
postLike_ByThreadPostId :: forall qp. QueryParam qp => Array qp -> Int -> LikeRequest -> ApiEff (Either ApiError LikeResponse)
```

#### `postLike_ByThreadPostId'`

``` purescript
postLike_ByThreadPostId' :: Int -> LikeRequest -> ApiEff (Either ApiError LikeResponse)
```

#### `postLike_ByLeuronId`

``` purescript
postLike_ByLeuronId :: forall qp. QueryParam qp => Array qp -> Int -> LikeRequest -> ApiEff (Either ApiError LikeResponse)
```

#### `postLike_ByLeuronId'`

``` purescript
postLike_ByLeuronId' :: Int -> LikeRequest -> ApiEff (Either ApiError LikeResponse)
```

#### `getLike`

``` purescript
getLike :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError LikeResponse)
```

#### `getLike'`

``` purescript
getLike' :: Int -> ApiEff (Either ApiError LikeResponse)
```

#### `putLike`

``` purescript
putLike :: forall qp. QueryParam qp => Array qp -> Int -> LikeRequest -> ApiEff (Either ApiError LikeResponse)
```

#### `putLike'`

``` purescript
putLike' :: Int -> LikeRequest -> ApiEff (Either ApiError LikeResponse)
```

#### `deleteLike`

``` purescript
deleteLike :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
```

#### `deleteLike'`

``` purescript
deleteLike' :: Int -> ApiEff (Either ApiError Unit)
```

#### `getLikeStats_ByThreadPostsIds`

``` purescript
getLikeStats_ByThreadPostsIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError LikeStatResponses)
```

#### `getLikeStats_ByThreadPostsIds'`

``` purescript
getLikeStats_ByThreadPostsIds' :: (Array Int) -> ApiEff (Either ApiError LikeStatResponses)
```

#### `getLikeStat`

``` purescript
getLikeStat :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError LikeStatResponse)
```

#### `getLikeStat'`

``` purescript
getLikeStat' :: Int -> ApiEff (Either ApiError LikeStatResponse)
```

#### `getStars`

``` purescript
getStars :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError StarResponses)
```

#### `getStars'`

``` purescript
getStars' :: ApiEff (Either ApiError StarResponses)
```

#### `getStars_ByOrganizationId`

``` purescript
getStars_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarResponses)
```

#### `getStars_ByOrganizationId'`

``` purescript
getStars_ByOrganizationId' :: Int -> ApiEff (Either ApiError StarResponses)
```

#### `getStars_ByUserId`

``` purescript
getStars_ByUserId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarResponses)
```

#### `getStars_ByUserId'`

``` purescript
getStars_ByUserId' :: Int -> ApiEff (Either ApiError StarResponses)
```

#### `getStars_ByBoardId`

``` purescript
getStars_ByBoardId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarResponses)
```

#### `getStars_ByBoardId'`

``` purescript
getStars_ByBoardId' :: Int -> ApiEff (Either ApiError StarResponses)
```

#### `getStars_ByThreadId`

``` purescript
getStars_ByThreadId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarResponses)
```

#### `getStars_ByThreadId'`

``` purescript
getStars_ByThreadId' :: Int -> ApiEff (Either ApiError StarResponses)
```

#### `getStars_ByThreadPostsIds`

``` purescript
getStars_ByThreadPostsIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError StarResponses)
```

#### `getStars_ByThreadPostsIds'`

``` purescript
getStars_ByThreadPostsIds' :: (Array Int) -> ApiEff (Either ApiError StarResponses)
```

#### `getStars_ByThreadPostId`

``` purescript
getStars_ByThreadPostId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarResponses)
```

#### `getStars_ByThreadPostId'`

``` purescript
getStars_ByThreadPostId' :: Int -> ApiEff (Either ApiError StarResponses)
```

#### `getStars_ByResourceId`

``` purescript
getStars_ByResourceId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarResponses)
```

#### `getStars_ByResourceId'`

``` purescript
getStars_ByResourceId' :: Int -> ApiEff (Either ApiError StarResponses)
```

#### `getStars_ByLeuronId`

``` purescript
getStars_ByLeuronId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarResponses)
```

#### `getStars_ByLeuronId'`

``` purescript
getStars_ByLeuronId' :: Int -> ApiEff (Either ApiError StarResponses)
```

#### `postStar_ByOrganizationId`

``` purescript
postStar_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
```

#### `postStar_ByOrganizationId'`

``` purescript
postStar_ByOrganizationId' :: Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
```

#### `postStar_ByUserId`

``` purescript
postStar_ByUserId :: forall qp. QueryParam qp => Array qp -> Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
```

#### `postStar_ByUserId'`

``` purescript
postStar_ByUserId' :: Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
```

#### `postStar_ByBoardId`

``` purescript
postStar_ByBoardId :: forall qp. QueryParam qp => Array qp -> Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
```

#### `postStar_ByBoardId'`

``` purescript
postStar_ByBoardId' :: Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
```

#### `postStar_ByThreadId`

``` purescript
postStar_ByThreadId :: forall qp. QueryParam qp => Array qp -> Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
```

#### `postStar_ByThreadId'`

``` purescript
postStar_ByThreadId' :: Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
```

#### `postStar_ByThreadPostId`

``` purescript
postStar_ByThreadPostId :: forall qp. QueryParam qp => Array qp -> Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
```

#### `postStar_ByThreadPostId'`

``` purescript
postStar_ByThreadPostId' :: Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
```

#### `postStar_ByResourceId`

``` purescript
postStar_ByResourceId :: forall qp. QueryParam qp => Array qp -> Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
```

#### `postStar_ByResourceId'`

``` purescript
postStar_ByResourceId' :: Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
```

#### `postStar_ByLeuronId`

``` purescript
postStar_ByLeuronId :: forall qp. QueryParam qp => Array qp -> Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
```

#### `postStar_ByLeuronId'`

``` purescript
postStar_ByLeuronId' :: Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
```

#### `getStar`

``` purescript
getStar :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarResponse)
```

#### `getStar'`

``` purescript
getStar' :: Int -> ApiEff (Either ApiError StarResponse)
```

#### `putStar`

``` purescript
putStar :: forall qp. QueryParam qp => Array qp -> Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
```

#### `putStar'`

``` purescript
putStar' :: Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
```

#### `deleteStar`

``` purescript
deleteStar :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
```

#### `deleteStar'`

``` purescript
deleteStar' :: Int -> ApiEff (Either ApiError Unit)
```

#### `getStarStats_ByOrganizationId`

``` purescript
getStarStats_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarStatResponses)
```

#### `getStarStats_ByOrganizationId'`

``` purescript
getStarStats_ByOrganizationId' :: Int -> ApiEff (Either ApiError StarStatResponses)
```

#### `getStarStats_ByUserId`

``` purescript
getStarStats_ByUserId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarStatResponses)
```

#### `getStarStats_ByUserId'`

``` purescript
getStarStats_ByUserId' :: Int -> ApiEff (Either ApiError StarStatResponses)
```

#### `getStarStats_ByBoardId`

``` purescript
getStarStats_ByBoardId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarStatResponses)
```

#### `getStarStats_ByBoardId'`

``` purescript
getStarStats_ByBoardId' :: Int -> ApiEff (Either ApiError StarStatResponses)
```

#### `getStarStats_ByThreadId`

``` purescript
getStarStats_ByThreadId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarStatResponses)
```

#### `getStarStats_ByThreadId'`

``` purescript
getStarStats_ByThreadId' :: Int -> ApiEff (Either ApiError StarStatResponses)
```

#### `getStarStats_ByThreadPostsIds`

``` purescript
getStarStats_ByThreadPostsIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError StarStatResponses)
```

#### `getStarStats_ByThreadPostsIds'`

``` purescript
getStarStats_ByThreadPostsIds' :: (Array Int) -> ApiEff (Either ApiError StarStatResponses)
```

#### `getStarStats_ByThreadPostId`

``` purescript
getStarStats_ByThreadPostId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarStatResponses)
```

#### `getStarStats_ByThreadPostId'`

``` purescript
getStarStats_ByThreadPostId' :: Int -> ApiEff (Either ApiError StarStatResponses)
```

#### `getStarStats_ByResourceId`

``` purescript
getStarStats_ByResourceId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarStatResponses)
```

#### `getStarStats_ByResourceId'`

``` purescript
getStarStats_ByResourceId' :: Int -> ApiEff (Either ApiError StarStatResponses)
```

#### `getStarStats_ByLeuronId`

``` purescript
getStarStats_ByLeuronId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarStatResponses)
```

#### `getStarStats_ByLeuronId'`

``` purescript
getStarStats_ByLeuronId' :: Int -> ApiEff (Either ApiError StarStatResponses)
```

#### `getStarStat`

``` purescript
getStarStat :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarStatResponse)
```

#### `getStarStat'`

``` purescript
getStarStat' :: Int -> ApiEff (Either ApiError StarStatResponse)
```

#### `getMe`

``` purescript
getMe :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError UserResponse)
```

#### `getMe'`

``` purescript
getMe' :: ApiEff (Either ApiError UserResponse)
```

#### `getMePack`

``` purescript
getMePack :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError UserPackResponse)
```

#### `getMePack'`

``` purescript
getMePack' :: ApiEff (Either ApiError UserPackResponse)
```

#### `getOrganizations`

``` purescript
getOrganizations :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError OrganizationResponses)
```

#### `getOrganizations'`

``` purescript
getOrganizations' :: ApiEff (Either ApiError OrganizationResponses)
```

#### `postOrganization`

``` purescript
postOrganization :: forall qp. QueryParam qp => Array qp -> OrganizationRequest -> ApiEff (Either ApiError OrganizationResponse)
```

#### `postOrganization'`

``` purescript
postOrganization' :: OrganizationRequest -> ApiEff (Either ApiError OrganizationResponse)
```

#### `getOrganization`

``` purescript
getOrganization :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError OrganizationResponse)
```

#### `getOrganization'`

``` purescript
getOrganization' :: Int -> ApiEff (Either ApiError OrganizationResponse)
```

#### `putOrganization`

``` purescript
putOrganization :: forall qp. QueryParam qp => Array qp -> Int -> OrganizationRequest -> ApiEff (Either ApiError OrganizationResponse)
```

#### `putOrganization'`

``` purescript
putOrganization' :: Int -> OrganizationRequest -> ApiEff (Either ApiError OrganizationResponse)
```

#### `deleteOrganization`

``` purescript
deleteOrganization :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
```

#### `deleteOrganization'`

``` purescript
deleteOrganization' :: Int -> ApiEff (Either ApiError Unit)
```

#### `getOrganizationStats`

``` purescript
getOrganizationStats :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError OrganizationStatResponses)
```

#### `getOrganizationStats'`

``` purescript
getOrganizationStats' :: ApiEff (Either ApiError OrganizationStatResponses)
```

#### `getOrganizationStat`

``` purescript
getOrganizationStat :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError OrganizationStatResponse)
```

#### `getOrganizationStat'`

``` purescript
getOrganizationStat' :: Int -> ApiEff (Either ApiError OrganizationStatResponse)
```

#### `getPms`

``` purescript
getPms :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError PmResponses)
```

#### `getPms'`

``` purescript
getPms' :: ApiEff (Either ApiError PmResponses)
```

#### `postPm_ByUsersIds`

``` purescript
postPm_ByUsersIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> PmRequest -> ApiEff (Either ApiError PmResponse)
```

#### `postPm_ByUsersIds'`

``` purescript
postPm_ByUsersIds' :: (Array Int) -> PmRequest -> ApiEff (Either ApiError PmResponse)
```

#### `postPm_ByUserId`

``` purescript
postPm_ByUserId :: forall qp. QueryParam qp => Array qp -> Int -> PmRequest -> ApiEff (Either ApiError PmResponse)
```

#### `postPm_ByUserId'`

``` purescript
postPm_ByUserId' :: Int -> PmRequest -> ApiEff (Either ApiError PmResponse)
```

#### `getPm`

``` purescript
getPm :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError PmResponse)
```

#### `getPm'`

``` purescript
getPm' :: Int -> ApiEff (Either ApiError PmResponse)
```

#### `putPm`

``` purescript
putPm :: forall qp. QueryParam qp => Array qp -> Int -> PmRequest -> ApiEff (Either ApiError PmResponse)
```

#### `putPm'`

``` purescript
putPm' :: Int -> PmRequest -> ApiEff (Either ApiError PmResponse)
```

#### `deletePm`

``` purescript
deletePm :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
```

#### `deletePm'`

``` purescript
deletePm' :: Int -> ApiEff (Either ApiError Unit)
```

#### `getPmIns`

``` purescript
getPmIns :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError PmInResponses)
```

#### `getPmIns'`

``` purescript
getPmIns' :: ApiEff (Either ApiError PmInResponses)
```

#### `postPmIn`

``` purescript
postPmIn :: forall qp. QueryParam qp => Array qp -> PmInRequest -> ApiEff (Either ApiError PmInResponse)
```

#### `postPmIn'`

``` purescript
postPmIn' :: PmInRequest -> ApiEff (Either ApiError PmInResponse)
```

#### `getPmIn`

``` purescript
getPmIn :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError PmInResponse)
```

#### `getPmIn'`

``` purescript
getPmIn' :: Int -> ApiEff (Either ApiError PmInResponse)
```

#### `putPmIn`

``` purescript
putPmIn :: forall qp. QueryParam qp => Array qp -> Int -> PmInRequest -> ApiEff (Either ApiError PmInResponse)
```

#### `putPmIn'`

``` purescript
putPmIn' :: Int -> PmInRequest -> ApiEff (Either ApiError PmInResponse)
```

#### `deletePmIn`

``` purescript
deletePmIn :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
```

#### `deletePmIn'`

``` purescript
deletePmIn' :: Int -> ApiEff (Either ApiError Unit)
```

#### `getPmOuts`

``` purescript
getPmOuts :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError PmOutResponses)
```

#### `getPmOuts'`

``` purescript
getPmOuts' :: ApiEff (Either ApiError PmOutResponses)
```

#### `postPmOut`

``` purescript
postPmOut :: forall qp. QueryParam qp => Array qp -> PmOutRequest -> ApiEff (Either ApiError PmOutResponse)
```

#### `postPmOut'`

``` purescript
postPmOut' :: PmOutRequest -> ApiEff (Either ApiError PmOutResponse)
```

#### `getPmOut`

``` purescript
getPmOut :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError PmOutResponse)
```

#### `getPmOut'`

``` purescript
getPmOut' :: Int -> ApiEff (Either ApiError PmOutResponse)
```

#### `putPmOut`

``` purescript
putPmOut :: forall qp. QueryParam qp => Array qp -> Int -> PmOutRequest -> ApiEff (Either ApiError PmOutResponse)
```

#### `putPmOut'`

``` purescript
putPmOut' :: Int -> PmOutRequest -> ApiEff (Either ApiError PmOutResponse)
```

#### `deletePmOut`

``` purescript
deletePmOut :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
```

#### `deletePmOut'`

``` purescript
deletePmOut' :: Int -> ApiEff (Either ApiError Unit)
```

#### `getResources`

``` purescript
getResources :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError ResourceResponses)
```

#### `getResources'`

``` purescript
getResources' :: ApiEff (Either ApiError ResourceResponses)
```

#### `postResource`

``` purescript
postResource :: forall qp. QueryParam qp => Array qp -> ResourceRequest -> ApiEff (Either ApiError ResourceResponse)
```

#### `postResource'`

``` purescript
postResource' :: ResourceRequest -> ApiEff (Either ApiError ResourceResponse)
```

#### `getResource`

``` purescript
getResource :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ResourceResponse)
```

#### `getResource'`

``` purescript
getResource' :: Int -> ApiEff (Either ApiError ResourceResponse)
```

#### `putResource`

``` purescript
putResource :: forall qp. QueryParam qp => Array qp -> Int -> ResourceRequest -> ApiEff (Either ApiError ResourceResponse)
```

#### `putResource'`

``` purescript
putResource' :: Int -> ResourceRequest -> ApiEff (Either ApiError ResourceResponse)
```

#### `deleteResource`

``` purescript
deleteResource :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
```

#### `deleteResource'`

``` purescript
deleteResource' :: Int -> ApiEff (Either ApiError Unit)
```

#### `getResourceStats_ByResourcesIds`

``` purescript
getResourceStats_ByResourcesIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError ResourceStatResponses)
```

#### `getResourceStats_ByResourcesIds'`

``` purescript
getResourceStats_ByResourcesIds' :: (Array Int) -> ApiEff (Either ApiError ResourceStatResponses)
```

#### `getResourceStat`

``` purescript
getResourceStat :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ResourceStatResponse)
```

#### `getResourceStat'`

``` purescript
getResourceStat' :: Int -> ApiEff (Either ApiError ResourceStatResponse)
```

#### `getTeams`

``` purescript
getTeams :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError TeamResponses)
```

#### `getTeams'`

``` purescript
getTeams' :: ApiEff (Either ApiError TeamResponses)
```

#### `getTeams_ByOrganizationId`

``` purescript
getTeams_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError TeamResponses)
```

#### `getTeams_ByOrganizationId'`

``` purescript
getTeams_ByOrganizationId' :: Int -> ApiEff (Either ApiError TeamResponses)
```

#### `postTeam_ByOrganizationId`

``` purescript
postTeam_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> TeamRequest -> ApiEff (Either ApiError TeamResponse)
```

#### `postTeam_ByOrganizationId'`

``` purescript
postTeam_ByOrganizationId' :: Int -> TeamRequest -> ApiEff (Either ApiError TeamResponse)
```

#### `getTeam`

``` purescript
getTeam :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError TeamResponse)
```

#### `getTeam'`

``` purescript
getTeam' :: Int -> ApiEff (Either ApiError TeamResponse)
```

#### `putTeam`

``` purescript
putTeam :: forall qp. QueryParam qp => Array qp -> Int -> TeamRequest -> ApiEff (Either ApiError TeamResponse)
```

#### `putTeam'`

``` purescript
putTeam' :: Int -> TeamRequest -> ApiEff (Either ApiError TeamResponse)
```

#### `deleteTeam`

``` purescript
deleteTeam :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
```

#### `deleteTeam'`

``` purescript
deleteTeam' :: Int -> ApiEff (Either ApiError Unit)
```

#### `getTeamMembers`

``` purescript
getTeamMembers :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError TeamMemberResponses)
```

#### `getTeamMembers'`

``` purescript
getTeamMembers' :: ApiEff (Either ApiError TeamMemberResponses)
```

#### `getTeamMembers_ByOrganizationId`

``` purescript
getTeamMembers_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError TeamMemberResponses)
```

#### `getTeamMembers_ByOrganizationId'`

``` purescript
getTeamMembers_ByOrganizationId' :: Int -> ApiEff (Either ApiError TeamMemberResponses)
```

#### `getTeamMembers_ByTeamId`

``` purescript
getTeamMembers_ByTeamId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError TeamMemberResponses)
```

#### `getTeamMembers_ByTeamId'`

``` purescript
getTeamMembers_ByTeamId' :: Int -> ApiEff (Either ApiError TeamMemberResponses)
```

#### `postTeamMember_ByTeamId`

``` purescript
postTeamMember_ByTeamId :: forall qp. QueryParam qp => Array qp -> Int -> TeamMemberRequest -> ApiEff (Either ApiError TeamMemberResponse)
```

#### `postTeamMember_ByTeamId'`

``` purescript
postTeamMember_ByTeamId' :: Int -> TeamMemberRequest -> ApiEff (Either ApiError TeamMemberResponse)
```

#### `getTeamMember`

``` purescript
getTeamMember :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError TeamMemberResponse)
```

#### `getTeamMember'`

``` purescript
getTeamMember' :: Int -> ApiEff (Either ApiError TeamMemberResponse)
```

#### `putTeamMember`

``` purescript
putTeamMember :: forall qp. QueryParam qp => Array qp -> Int -> TeamMemberRequest -> ApiEff (Either ApiError TeamMemberResponse)
```

#### `putTeamMember'`

``` purescript
putTeamMember' :: Int -> TeamMemberRequest -> ApiEff (Either ApiError TeamMemberResponse)
```

#### `deleteTeamMember`

``` purescript
deleteTeamMember :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
```

#### `deleteTeamMember'`

``` purescript
deleteTeamMember' :: Int -> ApiEff (Either ApiError Unit)
```

#### `getThreads`

``` purescript
getThreads :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError ThreadResponses)
```

#### `getThreads'`

``` purescript
getThreads' :: ApiEff (Either ApiError ThreadResponses)
```

#### `postThread_ByBoardId`

``` purescript
postThread_ByBoardId :: forall qp. QueryParam qp => Array qp -> Int -> ThreadRequest -> ApiEff (Either ApiError ThreadResponse)
```

#### `postThread_ByBoardId'`

``` purescript
postThread_ByBoardId' :: Int -> ThreadRequest -> ApiEff (Either ApiError ThreadResponse)
```

#### `getThread`

``` purescript
getThread :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ThreadResponse)
```

#### `getThread'`

``` purescript
getThread' :: Int -> ApiEff (Either ApiError ThreadResponse)
```

#### `putThread`

``` purescript
putThread :: forall qp. QueryParam qp => Array qp -> Int -> ThreadRequest -> ApiEff (Either ApiError ThreadResponse)
```

#### `putThread'`

``` purescript
putThread' :: Int -> ThreadRequest -> ApiEff (Either ApiError ThreadResponse)
```

#### `deleteThread`

``` purescript
deleteThread :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
```

#### `deleteThread'`

``` purescript
deleteThread' :: Int -> ApiEff (Either ApiError Unit)
```

#### `getThreadStats`

``` purescript
getThreadStats :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError ThreadStatResponses)
```

#### `getThreadStats'`

``` purescript
getThreadStats' :: ApiEff (Either ApiError ThreadStatResponses)
```

#### `getThreadStat`

``` purescript
getThreadStat :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ThreadStatResponse)
```

#### `getThreadStat'`

``` purescript
getThreadStat' :: Int -> ApiEff (Either ApiError ThreadStatResponse)
```

#### `getThreadPosts`

``` purescript
getThreadPosts :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError ThreadPostResponses)
```

#### `getThreadPosts'`

``` purescript
getThreadPosts' :: ApiEff (Either ApiError ThreadPostResponses)
```

#### `getThreadPosts_ByThreadId`

``` purescript
getThreadPosts_ByThreadId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ThreadPostResponses)
```

#### `getThreadPosts_ByThreadId'`

``` purescript
getThreadPosts_ByThreadId' :: Int -> ApiEff (Either ApiError ThreadPostResponses)
```

#### `postThreadPost_ByThreadId`

``` purescript
postThreadPost_ByThreadId :: forall qp. QueryParam qp => Array qp -> Int -> ThreadPostRequest -> ApiEff (Either ApiError ThreadPostResponse)
```

#### `postThreadPost_ByThreadId'`

``` purescript
postThreadPost_ByThreadId' :: Int -> ThreadPostRequest -> ApiEff (Either ApiError ThreadPostResponse)
```

#### `getThreadPost`

``` purescript
getThreadPost :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ThreadPostResponse)
```

#### `getThreadPost'`

``` purescript
getThreadPost' :: Int -> ApiEff (Either ApiError ThreadPostResponse)
```

#### `putThreadPost`

``` purescript
putThreadPost :: forall qp. QueryParam qp => Array qp -> Int -> ThreadPostRequest -> ApiEff (Either ApiError ThreadPostResponse)
```

#### `putThreadPost'`

``` purescript
putThreadPost' :: Int -> ThreadPostRequest -> ApiEff (Either ApiError ThreadPostResponse)
```

#### `deleteThreadPost`

``` purescript
deleteThreadPost :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
```

#### `deleteThreadPost'`

``` purescript
deleteThreadPost' :: Int -> ApiEff (Either ApiError Unit)
```

#### `getThreadPostStats_ByThreadPostsIds`

``` purescript
getThreadPostStats_ByThreadPostsIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError ThreadPostStatResponses)
```

#### `getThreadPostStats_ByThreadPostsIds'`

``` purescript
getThreadPostStats_ByThreadPostsIds' :: (Array Int) -> ApiEff (Either ApiError ThreadPostStatResponses)
```

#### `getThreadPostStat`

``` purescript
getThreadPostStat :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ThreadPostStatResponse)
```

#### `getThreadPostStat'`

``` purescript
getThreadPostStat' :: Int -> ApiEff (Either ApiError ThreadPostStatResponse)
```

#### `getUsers`

``` purescript
getUsers :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError UserResponses)
```

#### `getUsers'`

``` purescript
getUsers' :: ApiEff (Either ApiError UserResponses)
```

#### `getUsers_ByUsersIds`

``` purescript
getUsers_ByUsersIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError UserResponses)
```

#### `getUsers_ByUsersIds'`

``` purescript
getUsers_ByUsersIds' :: (Array Int) -> ApiEff (Either ApiError UserResponses)
```

#### `getUsers_ByUsersNicks`

``` purescript
getUsers_ByUsersNicks :: forall qp. QueryParam qp => Array qp -> (Array String) -> ApiEff (Either ApiError UserResponses)
```

#### `getUsers_ByUsersNicks'`

``` purescript
getUsers_ByUsersNicks' :: (Array String) -> ApiEff (Either ApiError UserResponses)
```

#### `postUser`

``` purescript
postUser :: forall qp. QueryParam qp => Array qp -> UserRequest -> ApiEff (Either ApiError UserResponse)
```

#### `postUser'`

``` purescript
postUser' :: UserRequest -> ApiEff (Either ApiError UserResponse)
```

#### `getUser`

``` purescript
getUser :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError UserResponse)
```

#### `getUser'`

``` purescript
getUser' :: Int -> ApiEff (Either ApiError UserResponse)
```

#### `putUser`

``` purescript
putUser :: forall qp. QueryParam qp => Array qp -> Int -> UserRequest -> ApiEff (Either ApiError UserResponse)
```

#### `putUser'`

``` purescript
putUser' :: Int -> UserRequest -> ApiEff (Either ApiError UserResponse)
```

#### `deleteUser`

``` purescript
deleteUser :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
```

#### `deleteUser'`

``` purescript
deleteUser' :: Int -> ApiEff (Either ApiError Unit)
```

#### `getUserProfiles`

``` purescript
getUserProfiles :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError ProfileResponses)
```

#### `getUserProfiles'`

``` purescript
getUserProfiles' :: ApiEff (Either ApiError ProfileResponses)
```

#### `getUserProfiles_ByUsersIds`

``` purescript
getUserProfiles_ByUsersIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError ProfileResponses)
```

#### `getUserProfiles_ByUsersIds'`

``` purescript
getUserProfiles_ByUsersIds' :: (Array Int) -> ApiEff (Either ApiError ProfileResponses)
```

#### `getUserProfile`

``` purescript
getUserProfile :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ProfileResponse)
```

#### `getUserProfile'`

``` purescript
getUserProfile' :: Int -> ApiEff (Either ApiError ProfileResponse)
```

#### `putUserProfile`

``` purescript
putUserProfile :: forall qp. QueryParam qp => Array qp -> Int -> ProfileRequest -> ApiEff (Either ApiError ProfileResponse)
```

#### `putUserProfile'`

``` purescript
putUserProfile' :: Int -> ProfileRequest -> ApiEff (Either ApiError ProfileResponse)
```

#### `deleteUserProfile`

``` purescript
deleteUserProfile :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
```

#### `deleteUserProfile'`

``` purescript
deleteUserProfile' :: Int -> ApiEff (Either ApiError Unit)
```

#### `getUsersSanitized`

``` purescript
getUsersSanitized :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError UserSanitizedResponses)
```

#### `getUsersSanitized'`

``` purescript
getUsersSanitized' :: ApiEff (Either ApiError UserSanitizedResponses)
```

#### `getUsersSanitized_ByUsersIds`

``` purescript
getUsersSanitized_ByUsersIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError UserSanitizedResponses)
```

#### `getUsersSanitized_ByUsersIds'`

``` purescript
getUsersSanitized_ByUsersIds' :: (Array Int) -> ApiEff (Either ApiError UserSanitizedResponses)
```

#### `getUsersSanitized_ByUsersNicks`

``` purescript
getUsersSanitized_ByUsersNicks :: forall qp. QueryParam qp => Array qp -> (Array String) -> ApiEff (Either ApiError UserSanitizedResponses)
```

#### `getUsersSanitized_ByUsersNicks'`

``` purescript
getUsersSanitized_ByUsersNicks' :: (Array String) -> ApiEff (Either ApiError UserSanitizedResponses)
```

#### `getUserSanitized`

``` purescript
getUserSanitized :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError UserSanitizedResponse)
```

#### `getUserSanitized'`

``` purescript
getUserSanitized' :: Int -> ApiEff (Either ApiError UserSanitizedResponse)
```

#### `getUserSanitizedStats`

``` purescript
getUserSanitizedStats :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError UserSanitizedStatResponse)
```

#### `getUserSanitizedStats'`

``` purescript
getUserSanitizedStats' :: ApiEff (Either ApiError UserSanitizedStatResponse)
```

#### `getUserSanitizedStats_ByUsersIds`

``` purescript
getUserSanitizedStats_ByUsersIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError UserSanitizedStatResponse)
```

#### `getUserSanitizedStats_ByUsersIds'`

``` purescript
getUserSanitizedStats_ByUsersIds' :: (Array Int) -> ApiEff (Either ApiError UserSanitizedStatResponse)
```

#### `getUserSanitizedStat`

``` purescript
getUserSanitizedStat :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError UserSanitizedStatResponse)
```

#### `getUserSanitizedStat'`

``` purescript
getUserSanitizedStat' :: Int -> ApiEff (Either ApiError UserSanitizedStatResponse)
```

#### `getOrganizationPacks`

``` purescript
getOrganizationPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError OrganizationPackResponses)
```

#### `getOrganizationPacks'`

``` purescript
getOrganizationPacks' :: ApiEff (Either ApiError OrganizationPackResponses)
```

#### `getOrganizationPacks_ByOrganizationsIds`

``` purescript
getOrganizationPacks_ByOrganizationsIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError OrganizationPackResponses)
```

#### `getOrganizationPacks_ByOrganizationsIds'`

``` purescript
getOrganizationPacks_ByOrganizationsIds' :: (Array Int) -> ApiEff (Either ApiError OrganizationPackResponses)
```

#### `getOrganizationPack`

``` purescript
getOrganizationPack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError OrganizationPackResponse)
```

#### `getOrganizationPack'`

``` purescript
getOrganizationPack' :: Int -> ApiEff (Either ApiError OrganizationPackResponse)
```

#### `getTeamPacks`

``` purescript
getTeamPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError TeamPackResponses)
```

#### `getTeamPacks'`

``` purescript
getTeamPacks' :: ApiEff (Either ApiError TeamPackResponses)
```

#### `getTeamPacks_ByOrganizationId`

``` purescript
getTeamPacks_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError TeamPackResponses)
```

#### `getTeamPacks_ByOrganizationId'`

``` purescript
getTeamPacks_ByOrganizationId' :: Int -> ApiEff (Either ApiError TeamPackResponses)
```

#### `getTeamPack`

``` purescript
getTeamPack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError TeamPackResponse)
```

#### `getTeamPack'`

``` purescript
getTeamPack' :: Int -> ApiEff (Either ApiError TeamPackResponse)
```

#### `getTeamMemberPacks`

``` purescript
getTeamMemberPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError TeamMemberPackResponses)
```

#### `getTeamMemberPacks'`

``` purescript
getTeamMemberPacks' :: ApiEff (Either ApiError TeamMemberPackResponses)
```

#### `getTeamMemberPacks_ByOrganizationId`

``` purescript
getTeamMemberPacks_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError TeamMemberPackResponses)
```

#### `getTeamMemberPacks_ByOrganizationId'`

``` purescript
getTeamMemberPacks_ByOrganizationId' :: Int -> ApiEff (Either ApiError TeamMemberPackResponses)
```

#### `getTeamMemberPack`

``` purescript
getTeamMemberPack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError TeamMemberPackResponse)
```

#### `getTeamMemberPack'`

``` purescript
getTeamMemberPack' :: Int -> ApiEff (Either ApiError TeamMemberPackResponse)
```

#### `getUserPacks`

``` purescript
getUserPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError UserPackResponses)
```

#### `getUserPacks'`

``` purescript
getUserPacks' :: ApiEff (Either ApiError UserPackResponses)
```

#### `getUserPacks_ByUsersIds`

``` purescript
getUserPacks_ByUsersIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError UserPackResponses)
```

#### `getUserPacks_ByUsersIds'`

``` purescript
getUserPacks_ByUsersIds' :: (Array Int) -> ApiEff (Either ApiError UserPackResponses)
```

#### `getUserPack`

``` purescript
getUserPack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError UserPackResponse)
```

#### `getUserPack'`

``` purescript
getUserPack' :: Int -> ApiEff (Either ApiError UserPackResponse)
```

#### `getUserSanitizedPacks`

``` purescript
getUserSanitizedPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError UserSanitizedPackResponses)
```

#### `getUserSanitizedPacks'`

``` purescript
getUserSanitizedPacks' :: ApiEff (Either ApiError UserSanitizedPackResponses)
```

#### `getUserSanitizedPacks_ByUsersIds`

``` purescript
getUserSanitizedPacks_ByUsersIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError UserSanitizedPackResponses)
```

#### `getUserSanitizedPacks_ByUsersIds'`

``` purescript
getUserSanitizedPacks_ByUsersIds' :: (Array Int) -> ApiEff (Either ApiError UserSanitizedPackResponses)
```

#### `getUserSanitizedPack`

``` purescript
getUserSanitizedPack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError UserSanitizedPackResponse)
```

#### `getUserSanitizedPack'`

``` purescript
getUserSanitizedPack' :: Int -> ApiEff (Either ApiError UserSanitizedPackResponse)
```

#### `getGlobalGroupPacks`

``` purescript
getGlobalGroupPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError GlobalGroupPackResponses)
```

#### `getGlobalGroupPacks'`

``` purescript
getGlobalGroupPacks' :: ApiEff (Either ApiError GlobalGroupPackResponses)
```

#### `getGlobalGroupPacks_ByOrganizationId`

``` purescript
getGlobalGroupPacks_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError GlobalGroupPackResponses)
```

#### `getGlobalGroupPacks_ByOrganizationId'`

``` purescript
getGlobalGroupPacks_ByOrganizationId' :: Int -> ApiEff (Either ApiError GlobalGroupPackResponses)
```

#### `getGlobalGroupPack`

``` purescript
getGlobalGroupPack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError GlobalGroupPackResponse)
```

#### `getGlobalGroupPack'`

``` purescript
getGlobalGroupPack' :: Int -> ApiEff (Either ApiError GlobalGroupPackResponse)
```

#### `getGroupPacks`

``` purescript
getGroupPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError GroupPackResponses)
```

#### `getGroupPacks'`

``` purescript
getGroupPacks' :: ApiEff (Either ApiError GroupPackResponses)
```

#### `getGroupPacks_ByOrganizationId`

``` purescript
getGroupPacks_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError GroupPackResponses)
```

#### `getGroupPacks_ByOrganizationId'`

``` purescript
getGroupPacks_ByOrganizationId' :: Int -> ApiEff (Either ApiError GroupPackResponses)
```

#### `getGroupPack`

``` purescript
getGroupPack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError GroupPackResponse)
```

#### `getGroupPack'`

``` purescript
getGroupPack' :: Int -> ApiEff (Either ApiError GroupPackResponse)
```

#### `getGroupMemberPacks`

``` purescript
getGroupMemberPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError GroupMemberPackResponses)
```

#### `getGroupMemberPacks'`

``` purescript
getGroupMemberPacks' :: ApiEff (Either ApiError GroupMemberPackResponses)
```

#### `getGroupMemberPacks_ByOrganizationId`

``` purescript
getGroupMemberPacks_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError GroupMemberPackResponses)
```

#### `getGroupMemberPacks_ByOrganizationId'`

``` purescript
getGroupMemberPacks_ByOrganizationId' :: Int -> ApiEff (Either ApiError GroupMemberPackResponses)
```

#### `getGroupMemberPacks_ByGlobalGroupId`

``` purescript
getGroupMemberPacks_ByGlobalGroupId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError GroupMemberPackResponses)
```

#### `getGroupMemberPacks_ByGlobalGroupId'`

``` purescript
getGroupMemberPacks_ByGlobalGroupId' :: Int -> ApiEff (Either ApiError GroupMemberPackResponses)
```

#### `getGroupMemberPacks_ByGroupId`

``` purescript
getGroupMemberPacks_ByGroupId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError GroupMemberPackResponses)
```

#### `getGroupMemberPacks_ByGroupId'`

``` purescript
getGroupMemberPacks_ByGroupId' :: Int -> ApiEff (Either ApiError GroupMemberPackResponses)
```

#### `getGroupMemberPack`

``` purescript
getGroupMemberPack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError GroupMemberPackResponse)
```

#### `getGroupMemberPack'`

``` purescript
getGroupMemberPack' :: Int -> ApiEff (Either ApiError GroupMemberPackResponse)
```

#### `getForumPacks`

``` purescript
getForumPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError ForumPackResponses)
```

#### `getForumPacks'`

``` purescript
getForumPacks' :: ApiEff (Either ApiError ForumPackResponses)
```

#### `getForumPacks_ByForumId`

``` purescript
getForumPacks_ByForumId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ForumPackResponses)
```

#### `getForumPacks_ByForumId'`

``` purescript
getForumPacks_ByForumId' :: Int -> ApiEff (Either ApiError ForumPackResponses)
```

#### `getForumPacks_ByForumsIds`

``` purescript
getForumPacks_ByForumsIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError ForumPackResponses)
```

#### `getForumPacks_ByForumsIds'`

``` purescript
getForumPacks_ByForumsIds' :: (Array Int) -> ApiEff (Either ApiError ForumPackResponses)
```

#### `getForumPacks_ByOrganizationId`

``` purescript
getForumPacks_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ForumPackResponses)
```

#### `getForumPacks_ByOrganizationId'`

``` purescript
getForumPacks_ByOrganizationId' :: Int -> ApiEff (Either ApiError ForumPackResponses)
```

#### `getForumPacks_ByOrganizationName`

``` purescript
getForumPacks_ByOrganizationName :: forall qp. QueryParam qp => Array qp -> String -> ApiEff (Either ApiError ForumPackResponses)
```

#### `getForumPacks_ByOrganizationName'`

``` purescript
getForumPacks_ByOrganizationName' :: String -> ApiEff (Either ApiError ForumPackResponses)
```

#### `getForumPack`

``` purescript
getForumPack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ForumPackResponse)
```

#### `getForumPack'`

``` purescript
getForumPack' :: Int -> ApiEff (Either ApiError ForumPackResponse)
```

#### `getBoardPacks`

``` purescript
getBoardPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError BoardPackResponses)
```

#### `getBoardPacks'`

``` purescript
getBoardPacks' :: ApiEff (Either ApiError BoardPackResponses)
```

#### `getBoardPacks_ByForumId`

``` purescript
getBoardPacks_ByForumId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError BoardPackResponses)
```

#### `getBoardPacks_ByForumId'`

``` purescript
getBoardPacks_ByForumId' :: Int -> ApiEff (Either ApiError BoardPackResponses)
```

#### `getBoardPacks_ByBoardsIds`

``` purescript
getBoardPacks_ByBoardsIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError BoardPackResponses)
```

#### `getBoardPacks_ByBoardsIds'`

``` purescript
getBoardPacks_ByBoardsIds' :: (Array Int) -> ApiEff (Either ApiError BoardPackResponses)
```

#### `getBoardPacks_ByBoardId`

``` purescript
getBoardPacks_ByBoardId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError BoardPackResponses)
```

#### `getBoardPacks_ByBoardId'`

``` purescript
getBoardPacks_ByBoardId' :: Int -> ApiEff (Either ApiError BoardPackResponses)
```

#### `getBoardPack`

``` purescript
getBoardPack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError BoardPackResponse)
```

#### `getBoardPack'`

``` purescript
getBoardPack' :: Int -> ApiEff (Either ApiError BoardPackResponse)
```

#### `getThreadPacks`

``` purescript
getThreadPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError ThreadPackResponses)
```

#### `getThreadPacks'`

``` purescript
getThreadPacks' :: ApiEff (Either ApiError ThreadPackResponses)
```

#### `getThreadPacks_ByThreadsIds`

``` purescript
getThreadPacks_ByThreadsIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError ThreadPackResponses)
```

#### `getThreadPacks_ByThreadsIds'`

``` purescript
getThreadPacks_ByThreadsIds' :: (Array Int) -> ApiEff (Either ApiError ThreadPackResponses)
```

#### `getThreadPacks_ByBoardId`

``` purescript
getThreadPacks_ByBoardId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ThreadPackResponses)
```

#### `getThreadPacks_ByBoardId'`

``` purescript
getThreadPacks_ByBoardId' :: Int -> ApiEff (Either ApiError ThreadPackResponses)
```

#### `getThreadPack`

``` purescript
getThreadPack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ThreadPackResponse)
```

#### `getThreadPack'`

``` purescript
getThreadPack' :: Int -> ApiEff (Either ApiError ThreadPackResponse)
```

#### `getThreadPostPacks`

``` purescript
getThreadPostPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError ThreadPostPackResponses)
```

#### `getThreadPostPacks'`

``` purescript
getThreadPostPacks' :: ApiEff (Either ApiError ThreadPostPackResponses)
```

#### `getThreadPostPacks_ByThreadPostsIds`

``` purescript
getThreadPostPacks_ByThreadPostsIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError ThreadPostPackResponses)
```

#### `getThreadPostPacks_ByThreadPostsIds'`

``` purescript
getThreadPostPacks_ByThreadPostsIds' :: (Array Int) -> ApiEff (Either ApiError ThreadPostPackResponses)
```

#### `getThreadPostPacks_ByThreadId`

``` purescript
getThreadPostPacks_ByThreadId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ThreadPostPackResponses)
```

#### `getThreadPostPacks_ByThreadId'`

``` purescript
getThreadPostPacks_ByThreadId' :: Int -> ApiEff (Either ApiError ThreadPostPackResponses)
```

#### `getThreadPostPack`

``` purescript
getThreadPostPack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ThreadPostPackResponse)
```

#### `getThreadPostPack'`

``` purescript
getThreadPostPack' :: Int -> ApiEff (Either ApiError ThreadPostPackResponse)
```

#### `getResourcePacks`

``` purescript
getResourcePacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError ResourcePackResponses)
```

#### `getResourcePacks'`

``` purescript
getResourcePacks' :: ApiEff (Either ApiError ResourcePackResponses)
```

#### `getResourcePacks_ByResourcesIds`

``` purescript
getResourcePacks_ByResourcesIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError ResourcePackResponses)
```

#### `getResourcePacks_ByResourcesIds'`

``` purescript
getResourcePacks_ByResourcesIds' :: (Array Int) -> ApiEff (Either ApiError ResourcePackResponses)
```

#### `getResourcePack`

``` purescript
getResourcePack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ResourcePackResponse)
```

#### `getResourcePack'`

``` purescript
getResourcePack' :: Int -> ApiEff (Either ApiError ResourcePackResponse)
```

#### `getLeuronPacks`

``` purescript
getLeuronPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError LeuronPackResponses)
```

#### `getLeuronPacks'`

``` purescript
getLeuronPacks' :: ApiEff (Either ApiError LeuronPackResponses)
```

#### `getLeuronPacks_ByLeuronsIds`

``` purescript
getLeuronPacks_ByLeuronsIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError LeuronPackResponses)
```

#### `getLeuronPacks_ByLeuronsIds'`

``` purescript
getLeuronPacks_ByLeuronsIds' :: (Array Int) -> ApiEff (Either ApiError LeuronPackResponses)
```

#### `getLeuronPacks_ByResourceId`

``` purescript
getLeuronPacks_ByResourceId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError LeuronPackResponses)
```

#### `getLeuronPacks_ByResourceId'`

``` purescript
getLeuronPacks_ByResourceId' :: Int -> ApiEff (Either ApiError LeuronPackResponses)
```

#### `getLeuronPack`

``` purescript
getLeuronPack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError LeuronPackResponse)
```

#### `getLeuronPack'`

``` purescript
getLeuronPack' :: Int -> ApiEff (Either ApiError LeuronPackResponse)
```


