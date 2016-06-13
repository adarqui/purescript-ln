module LN.Api.Internal where


import Purescript.Api.Helpers
import Prelude
import Data.Either
import Data.Tuple

import Prelude
import Data.Either
import LN.T.Internal.Types

getEmptys :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError EmptyResponses)
getEmptys params = handleError <$> getAt params ["emptys"]

getEmptys' :: ApiEff (Either ApiError EmptyResponses)
getEmptys'  = handleError <$> getAt ([] :: Array Boolean) ["emptys"]

postEmpty :: forall qp. QueryParam qp => Array qp -> EmptyRequest -> ApiEff (Either ApiError EmptyResponse)
postEmpty params empty_request = handleError <$> postAt params ["empty"] empty_request

postEmpty' :: EmptyRequest -> ApiEff (Either ApiError EmptyResponse)
postEmpty' empty_request = handleError <$> postAt ([] :: Array Boolean) ["empty"] empty_request

getEmpty :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError EmptyResponse)
getEmpty params empty_id = handleError <$> getAt params ["empty", show empty_id]

getEmpty' :: Int -> ApiEff (Either ApiError EmptyResponse)
getEmpty' empty_id = handleError <$> getAt ([] :: Array Boolean) ["empty", show empty_id]

putEmpty :: forall qp. QueryParam qp => Array qp -> Int -> EmptyRequest -> ApiEff (Either ApiError EmptyResponse)
putEmpty params empty_id empty_request = handleError <$> putAt params ["empty", show empty_id] empty_request

putEmpty' :: Int -> EmptyRequest -> ApiEff (Either ApiError EmptyResponse)
putEmpty' empty_id empty_request = handleError <$> putAt ([] :: Array Boolean) ["empty", show empty_id] empty_request

deleteEmpty :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deleteEmpty params empty_id = handleError <$> deleteAt params ["empty", show empty_id]

deleteEmpty' :: Int -> ApiEff (Either ApiError Unit)
deleteEmpty' empty_id = handleError <$> deleteAt ([] :: Array Boolean) ["empty", show empty_id]

getApis :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError ApiResponses)
getApis params = handleError <$> getAt params ["apis"]

getApis' :: ApiEff (Either ApiError ApiResponses)
getApis'  = handleError <$> getAt ([] :: Array Boolean) ["apis"]

postApi :: forall qp. QueryParam qp => Array qp -> ApiRequest -> ApiEff (Either ApiError ApiResponse)
postApi params api_request = handleError <$> postAt params ["api"] api_request

postApi' :: ApiRequest -> ApiEff (Either ApiError ApiResponse)
postApi' api_request = handleError <$> postAt ([] :: Array Boolean) ["api"] api_request

getApi :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ApiResponse)
getApi params api_id = handleError <$> getAt params ["api", show api_id]

getApi' :: Int -> ApiEff (Either ApiError ApiResponse)
getApi' api_id = handleError <$> getAt ([] :: Array Boolean) ["api", show api_id]

putApi :: forall qp. QueryParam qp => Array qp -> Int -> ApiRequest -> ApiEff (Either ApiError ApiResponse)
putApi params api_id api_request = handleError <$> putAt params ["api", show api_id] api_request

putApi' :: Int -> ApiRequest -> ApiEff (Either ApiError ApiResponse)
putApi' api_id api_request = handleError <$> putAt ([] :: Array Boolean) ["api", show api_id] api_request

deleteApi :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deleteApi params api_id = handleError <$> deleteAt params ["api", show api_id]

deleteApi' :: Int -> ApiEff (Either ApiError Unit)
deleteApi' api_id = handleError <$> deleteAt ([] :: Array Boolean) ["api", show api_id]

getBoards :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError BoardResponses)
getBoards params = handleError <$> getAt params ["boards"]

getBoards' :: ApiEff (Either ApiError BoardResponses)
getBoards'  = handleError <$> getAt ([] :: Array Boolean) ["boards"]

getBoards_ByBoardsIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError BoardResponses)
getBoards_ByBoardsIds params _ByBoardsIds = handleError <$> getAt (map qp params ++ map qp [ByBoardsIds _ByBoardsIds]) ["boards"]

getBoards_ByBoardsIds' :: (Array Int) -> ApiEff (Either ApiError BoardResponses)
getBoards_ByBoardsIds' _ByBoardsIds = handleError <$> getAt [ByBoardsIds _ByBoardsIds] ["boards"]

getBoards_ByForumId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError BoardResponses)
getBoards_ByForumId params _ByForumId = handleError <$> getAt (map qp params ++ map qp [ByForumId _ByForumId]) ["boards"]

getBoards_ByForumId' :: Int -> ApiEff (Either ApiError BoardResponses)
getBoards_ByForumId' _ByForumId = handleError <$> getAt [ByForumId _ByForumId] ["boards"]

postBoard_ByForumId :: forall qp. QueryParam qp => Array qp -> Int -> BoardRequest -> ApiEff (Either ApiError BoardResponse)
postBoard_ByForumId params _ByForumId board_request = handleError <$> postAt (map qp params ++ map qp [ByForumId _ByForumId]) ["board"] board_request

postBoard_ByForumId' :: Int -> BoardRequest -> ApiEff (Either ApiError BoardResponse)
postBoard_ByForumId' _ByForumId board_request = handleError <$> postAt [ByForumId _ByForumId] ["board"] board_request

postBoard_ByBoardId :: forall qp. QueryParam qp => Array qp -> Int -> BoardRequest -> ApiEff (Either ApiError BoardResponse)
postBoard_ByBoardId params _ByBoardId board_request = handleError <$> postAt (map qp params ++ map qp [ByBoardId _ByBoardId]) ["board"] board_request

postBoard_ByBoardId' :: Int -> BoardRequest -> ApiEff (Either ApiError BoardResponse)
postBoard_ByBoardId' _ByBoardId board_request = handleError <$> postAt [ByBoardId _ByBoardId] ["board"] board_request

getBoard :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError BoardResponse)
getBoard params board_id = handleError <$> getAt params ["board", show board_id]

getBoard' :: Int -> ApiEff (Either ApiError BoardResponse)
getBoard' board_id = handleError <$> getAt ([] :: Array Boolean) ["board", show board_id]

putBoard :: forall qp. QueryParam qp => Array qp -> Int -> BoardRequest -> ApiEff (Either ApiError BoardResponse)
putBoard params board_id board_request = handleError <$> putAt params ["board", show board_id] board_request

putBoard' :: Int -> BoardRequest -> ApiEff (Either ApiError BoardResponse)
putBoard' board_id board_request = handleError <$> putAt ([] :: Array Boolean) ["board", show board_id] board_request

deleteBoard :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deleteBoard params board_id = handleError <$> deleteAt params ["board", show board_id]

deleteBoard' :: Int -> ApiEff (Either ApiError Unit)
deleteBoard' board_id = handleError <$> deleteAt ([] :: Array Boolean) ["board", show board_id]

getBoardStats :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError BoardStatResponses)
getBoardStats params = handleError <$> getAt params ["board_stats"]

getBoardStats' :: ApiEff (Either ApiError BoardStatResponses)
getBoardStats'  = handleError <$> getAt ([] :: Array Boolean) ["board_stats"]

getBoardStat :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError BoardStatResponse)
getBoardStat params board_id = handleError <$> getAt params ["board_stat", show board_id]

getBoardStat' :: Int -> ApiEff (Either ApiError BoardStatResponse)
getBoardStat' board_id = handleError <$> getAt ([] :: Array Boolean) ["board_stat", show board_id]

getUsersCount :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError CountResponses)
getUsersCount params = handleError <$> getAt params ["users_count"]

getUsersCount' :: ApiEff (Either ApiError CountResponses)
getUsersCount'  = handleError <$> getAt ([] :: Array Boolean) ["users_count"]

getOrganizationsCount :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError CountResponses)
getOrganizationsCount params = handleError <$> getAt params ["organizations_count"]

getOrganizationsCount' :: ApiEff (Either ApiError CountResponses)
getOrganizationsCount'  = handleError <$> getAt ([] :: Array Boolean) ["organizations_count"]

getTeamsCount :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError CountResponses)
getTeamsCount params = handleError <$> getAt params ["teams_count"]

getTeamsCount' :: ApiEff (Either ApiError CountResponses)
getTeamsCount'  = handleError <$> getAt ([] :: Array Boolean) ["teams_count"]

getTeamsCount_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError CountResponses)
getTeamsCount_ByOrganizationId params _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["teams_count"]

getTeamsCount_ByOrganizationId' :: Int -> ApiEff (Either ApiError CountResponses)
getTeamsCount_ByOrganizationId' _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["teams_count"]

getTeamMembersCount :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError CountResponses)
getTeamMembersCount params = handleError <$> getAt params ["team_members_count"]

getTeamMembersCount' :: ApiEff (Either ApiError CountResponses)
getTeamMembersCount'  = handleError <$> getAt ([] :: Array Boolean) ["team_members_count"]

getTeamMembersCount_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError CountResponses)
getTeamMembersCount_ByOrganizationId params _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["team_members_count"]

getTeamMembersCount_ByOrganizationId' :: Int -> ApiEff (Either ApiError CountResponses)
getTeamMembersCount_ByOrganizationId' _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["team_members_count"]

getTeamMembersCount_ByTeamId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError CountResponses)
getTeamMembersCount_ByTeamId params _ByTeamId = handleError <$> getAt (map qp params ++ map qp [ByTeamId _ByTeamId]) ["team_members_count"]

getTeamMembersCount_ByTeamId' :: Int -> ApiEff (Either ApiError CountResponses)
getTeamMembersCount_ByTeamId' _ByTeamId = handleError <$> getAt [ByTeamId _ByTeamId] ["team_members_count"]

getGlobalGroupsCount :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError CountResponses)
getGlobalGroupsCount params = handleError <$> getAt params ["global_groups_count"]

getGlobalGroupsCount' :: ApiEff (Either ApiError CountResponses)
getGlobalGroupsCount'  = handleError <$> getAt ([] :: Array Boolean) ["global_groups_count"]

getGlobalGroupsCount_ByUserId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError CountResponses)
getGlobalGroupsCount_ByUserId params _ByUserId = handleError <$> getAt (map qp params ++ map qp [ByUserId _ByUserId]) ["global_groups_count"]

getGlobalGroupsCount_ByUserId' :: Int -> ApiEff (Either ApiError CountResponses)
getGlobalGroupsCount_ByUserId' _ByUserId = handleError <$> getAt [ByUserId _ByUserId] ["global_groups_count"]

getGroupsCount :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError CountResponses)
getGroupsCount params = handleError <$> getAt params ["groups_count"]

getGroupsCount' :: ApiEff (Either ApiError CountResponses)
getGroupsCount'  = handleError <$> getAt ([] :: Array Boolean) ["groups_count"]

getGroupsCount_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError CountResponses)
getGroupsCount_ByOrganizationId params _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["groups_count"]

getGroupsCount_ByOrganizationId' :: Int -> ApiEff (Either ApiError CountResponses)
getGroupsCount_ByOrganizationId' _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["groups_count"]

getGroupMembersCount :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError CountResponses)
getGroupMembersCount params = handleError <$> getAt params ["group_members_count"]

getGroupMembersCount' :: ApiEff (Either ApiError CountResponses)
getGroupMembersCount'  = handleError <$> getAt ([] :: Array Boolean) ["group_members_count"]

getGroupMembersCount_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError CountResponses)
getGroupMembersCount_ByOrganizationId params _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["group_members_count"]

getGroupMembersCount_ByOrganizationId' :: Int -> ApiEff (Either ApiError CountResponses)
getGroupMembersCount_ByOrganizationId' _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["group_members_count"]

getGroupMembersCount_ByGroupId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError CountResponses)
getGroupMembersCount_ByGroupId params _ByGroupId = handleError <$> getAt (map qp params ++ map qp [ByGroupId _ByGroupId]) ["group_members_count"]

getGroupMembersCount_ByGroupId' :: Int -> ApiEff (Either ApiError CountResponses)
getGroupMembersCount_ByGroupId' _ByGroupId = handleError <$> getAt [ByGroupId _ByGroupId] ["group_members_count"]

getForumsCount :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError CountResponses)
getForumsCount params = handleError <$> getAt params ["forums_count"]

getForumsCount' :: ApiEff (Either ApiError CountResponses)
getForumsCount'  = handleError <$> getAt ([] :: Array Boolean) ["forums_count"]

getBoardsCount :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError CountResponses)
getBoardsCount params = handleError <$> getAt params ["boards_count"]

getBoardsCount' :: ApiEff (Either ApiError CountResponses)
getBoardsCount'  = handleError <$> getAt ([] :: Array Boolean) ["boards_count"]

getThreadsCount :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError CountResponses)
getThreadsCount params = handleError <$> getAt params ["threads_count"]

getThreadsCount' :: ApiEff (Either ApiError CountResponses)
getThreadsCount'  = handleError <$> getAt ([] :: Array Boolean) ["threads_count"]

getThreadsCount_ByBoardId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError CountResponses)
getThreadsCount_ByBoardId params _ByBoardId = handleError <$> getAt (map qp params ++ map qp [ByBoardId _ByBoardId]) ["threads_count"]

getThreadsCount_ByBoardId' :: Int -> ApiEff (Either ApiError CountResponses)
getThreadsCount_ByBoardId' _ByBoardId = handleError <$> getAt [ByBoardId _ByBoardId] ["threads_count"]

getThreadPostsCount :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError CountResponses)
getThreadPostsCount params = handleError <$> getAt params ["thread_posts_count"]

getThreadPostsCount' :: ApiEff (Either ApiError CountResponses)
getThreadPostsCount'  = handleError <$> getAt ([] :: Array Boolean) ["thread_posts_count"]

getThreadPostsCount_ByThreadId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError CountResponses)
getThreadPostsCount_ByThreadId params _ByThreadId = handleError <$> getAt (map qp params ++ map qp [ByThreadId _ByThreadId]) ["thread_posts_count"]

getThreadPostsCount_ByThreadId' :: Int -> ApiEff (Either ApiError CountResponses)
getThreadPostsCount_ByThreadId' _ByThreadId = handleError <$> getAt [ByThreadId _ByThreadId] ["thread_posts_count"]

getResourcesCount :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError CountResponses)
getResourcesCount params = handleError <$> getAt params ["resources_count"]

getResourcesCount' :: ApiEff (Either ApiError CountResponses)
getResourcesCount'  = handleError <$> getAt ([] :: Array Boolean) ["resources_count"]

getLeuronsCount :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError CountResponses)
getLeuronsCount params = handleError <$> getAt params ["leurons_count"]

getLeuronsCount' :: ApiEff (Either ApiError CountResponses)
getLeuronsCount'  = handleError <$> getAt ([] :: Array Boolean) ["leurons_count"]

getForums :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError ForumResponses)
getForums params = handleError <$> getAt params ["forums"]

getForums' :: ApiEff (Either ApiError ForumResponses)
getForums'  = handleError <$> getAt ([] :: Array Boolean) ["forums"]

getForums_ByOrganizationName :: forall qp. QueryParam qp => Array qp -> String -> ApiEff (Either ApiError ForumResponses)
getForums_ByOrganizationName params _ByOrganizationName = handleError <$> getAt (map qp params ++ map qp [ByOrganizationName _ByOrganizationName]) ["forums"]

getForums_ByOrganizationName' :: String -> ApiEff (Either ApiError ForumResponses)
getForums_ByOrganizationName' _ByOrganizationName = handleError <$> getAt [ByOrganizationName _ByOrganizationName] ["forums"]

getForums_ByForumsIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError ForumResponses)
getForums_ByForumsIds params _ByForumsIds = handleError <$> getAt (map qp params ++ map qp [ByForumsIds _ByForumsIds]) ["forums"]

getForums_ByForumsIds' :: (Array Int) -> ApiEff (Either ApiError ForumResponses)
getForums_ByForumsIds' _ByForumsIds = handleError <$> getAt [ByForumsIds _ByForumsIds] ["forums"]

getForums_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ForumResponses)
getForums_ByOrganizationId params _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["forums"]

getForums_ByOrganizationId' :: Int -> ApiEff (Either ApiError ForumResponses)
getForums_ByOrganizationId' _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["forums"]

postForum_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ForumRequest -> ApiEff (Either ApiError ForumResponse)
postForum_ByOrganizationId params _ByOrganizationId forum_request = handleError <$> postAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["forum"] forum_request

postForum_ByOrganizationId' :: Int -> ForumRequest -> ApiEff (Either ApiError ForumResponse)
postForum_ByOrganizationId' _ByOrganizationId forum_request = handleError <$> postAt [ByOrganizationId _ByOrganizationId] ["forum"] forum_request

getForum :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ForumResponse)
getForum params forum_id = handleError <$> getAt params ["forum", show forum_id]

getForum' :: Int -> ApiEff (Either ApiError ForumResponse)
getForum' forum_id = handleError <$> getAt ([] :: Array Boolean) ["forum", show forum_id]

putForum :: forall qp. QueryParam qp => Array qp -> Int -> ForumRequest -> ApiEff (Either ApiError ForumResponse)
putForum params forum_id forum_request = handleError <$> putAt params ["forum", show forum_id] forum_request

putForum' :: Int -> ForumRequest -> ApiEff (Either ApiError ForumResponse)
putForum' forum_id forum_request = handleError <$> putAt ([] :: Array Boolean) ["forum", show forum_id] forum_request

deleteForum :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deleteForum params forum_id = handleError <$> deleteAt params ["forum", show forum_id]

deleteForum' :: Int -> ApiEff (Either ApiError Unit)
deleteForum' forum_id = handleError <$> deleteAt ([] :: Array Boolean) ["forum", show forum_id]

getForumStats :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError ForumStatResponses)
getForumStats params = handleError <$> getAt params ["forum_stats"]

getForumStats' :: ApiEff (Either ApiError ForumStatResponses)
getForumStats'  = handleError <$> getAt ([] :: Array Boolean) ["forum_stats"]

getForumStat :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ForumStatResponse)
getForumStat params forum_id = handleError <$> getAt params ["forum_stat", show forum_id]

getForumStat' :: Int -> ApiEff (Either ApiError ForumStatResponse)
getForumStat' forum_id = handleError <$> getAt ([] :: Array Boolean) ["forum_stat", show forum_id]

getGlobalGroups :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError GlobalGroupResponses)
getGlobalGroups params = handleError <$> getAt params ["global_groups"]

getGlobalGroups' :: ApiEff (Either ApiError GlobalGroupResponses)
getGlobalGroups'  = handleError <$> getAt ([] :: Array Boolean) ["global_groups"]

getGlobalGroups_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError GlobalGroupResponses)
getGlobalGroups_ByOrganizationId params _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["global_groups"]

getGlobalGroups_ByOrganizationId' :: Int -> ApiEff (Either ApiError GlobalGroupResponses)
getGlobalGroups_ByOrganizationId' _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["global_groups"]

postGlobalGroup :: forall qp. QueryParam qp => Array qp -> GlobalGroupRequest -> ApiEff (Either ApiError GlobalGroupResponse)
postGlobalGroup params global_group_request = handleError <$> postAt params ["global_group"] global_group_request

postGlobalGroup' :: GlobalGroupRequest -> ApiEff (Either ApiError GlobalGroupResponse)
postGlobalGroup' global_group_request = handleError <$> postAt ([] :: Array Boolean) ["global_group"] global_group_request

getGlobalGroup :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError GlobalGroupResponse)
getGlobalGroup params global_group_id = handleError <$> getAt params ["global_group", show global_group_id]

getGlobalGroup' :: Int -> ApiEff (Either ApiError GlobalGroupResponse)
getGlobalGroup' global_group_id = handleError <$> getAt ([] :: Array Boolean) ["global_group", show global_group_id]

putGlobalGroup :: forall qp. QueryParam qp => Array qp -> Int -> GlobalGroupRequest -> ApiEff (Either ApiError GlobalGroupResponse)
putGlobalGroup params global_group_id global_group_request = handleError <$> putAt params ["global_group", show global_group_id] global_group_request

putGlobalGroup' :: Int -> GlobalGroupRequest -> ApiEff (Either ApiError GlobalGroupResponse)
putGlobalGroup' global_group_id global_group_request = handleError <$> putAt ([] :: Array Boolean) ["global_group", show global_group_id] global_group_request

deleteGlobalGroup :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deleteGlobalGroup params global_group_id = handleError <$> deleteAt params ["global_group", show global_group_id]

deleteGlobalGroup' :: Int -> ApiEff (Either ApiError Unit)
deleteGlobalGroup' global_group_id = handleError <$> deleteAt ([] :: Array Boolean) ["global_group", show global_group_id]

getGroups :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError GroupResponses)
getGroups params = handleError <$> getAt params ["groups"]

getGroups' :: ApiEff (Either ApiError GroupResponses)
getGroups'  = handleError <$> getAt ([] :: Array Boolean) ["groups"]

getGroups_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError GroupResponses)
getGroups_ByOrganizationId params _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["groups"]

getGroups_ByOrganizationId' :: Int -> ApiEff (Either ApiError GroupResponses)
getGroups_ByOrganizationId' _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["groups"]

postGroup_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> GroupRequest -> ApiEff (Either ApiError GroupResponse)
postGroup_ByOrganizationId params _ByOrganizationId group_request = handleError <$> postAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["group"] group_request

postGroup_ByOrganizationId' :: Int -> GroupRequest -> ApiEff (Either ApiError GroupResponse)
postGroup_ByOrganizationId' _ByOrganizationId group_request = handleError <$> postAt [ByOrganizationId _ByOrganizationId] ["group"] group_request

getGroup :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError GroupResponse)
getGroup params group_id = handleError <$> getAt params ["group", show group_id]

getGroup' :: Int -> ApiEff (Either ApiError GroupResponse)
getGroup' group_id = handleError <$> getAt ([] :: Array Boolean) ["group", show group_id]

putGroup :: forall qp. QueryParam qp => Array qp -> Int -> GroupRequest -> ApiEff (Either ApiError GroupResponse)
putGroup params group_id group_request = handleError <$> putAt params ["group", show group_id] group_request

putGroup' :: Int -> GroupRequest -> ApiEff (Either ApiError GroupResponse)
putGroup' group_id group_request = handleError <$> putAt ([] :: Array Boolean) ["group", show group_id] group_request

deleteGroup :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deleteGroup params group_id = handleError <$> deleteAt params ["group", show group_id]

deleteGroup' :: Int -> ApiEff (Either ApiError Unit)
deleteGroup' group_id = handleError <$> deleteAt ([] :: Array Boolean) ["group", show group_id]

getGroupMembers :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError GroupMemberResponses)
getGroupMembers params = handleError <$> getAt params ["group_members"]

getGroupMembers' :: ApiEff (Either ApiError GroupMemberResponses)
getGroupMembers'  = handleError <$> getAt ([] :: Array Boolean) ["group_members"]

getGroupMembers_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError GroupMemberResponses)
getGroupMembers_ByOrganizationId params _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["group_members"]

getGroupMembers_ByOrganizationId' :: Int -> ApiEff (Either ApiError GroupMemberResponses)
getGroupMembers_ByOrganizationId' _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["group_members"]

getGroupMembers_ByGlobalGroupId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError GroupMemberResponses)
getGroupMembers_ByGlobalGroupId params _ByGlobalGroupId = handleError <$> getAt (map qp params ++ map qp [ByGlobalGroupId _ByGlobalGroupId]) ["group_members"]

getGroupMembers_ByGlobalGroupId' :: Int -> ApiEff (Either ApiError GroupMemberResponses)
getGroupMembers_ByGlobalGroupId' _ByGlobalGroupId = handleError <$> getAt [ByGlobalGroupId _ByGlobalGroupId] ["group_members"]

getGroupMembers_ByGroupId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError GroupMemberResponses)
getGroupMembers_ByGroupId params _ByGroupId = handleError <$> getAt (map qp params ++ map qp [ByGroupId _ByGroupId]) ["group_members"]

getGroupMembers_ByGroupId' :: Int -> ApiEff (Either ApiError GroupMemberResponses)
getGroupMembers_ByGroupId' _ByGroupId = handleError <$> getAt [ByGroupId _ByGroupId] ["group_members"]

postGroupMember_ByGlobalGroupId :: forall qp. QueryParam qp => Array qp -> Int -> GroupMemberRequest -> ApiEff (Either ApiError GroupMemberResponse)
postGroupMember_ByGlobalGroupId params _ByGlobalGroupId group_member_request = handleError <$> postAt (map qp params ++ map qp [ByGlobalGroupId _ByGlobalGroupId]) ["group_member"] group_member_request

postGroupMember_ByGlobalGroupId' :: Int -> GroupMemberRequest -> ApiEff (Either ApiError GroupMemberResponse)
postGroupMember_ByGlobalGroupId' _ByGlobalGroupId group_member_request = handleError <$> postAt [ByGlobalGroupId _ByGlobalGroupId] ["group_member"] group_member_request

getGroupMember :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError GroupMemberResponse)
getGroupMember params group_member_id = handleError <$> getAt params ["group_member", show group_member_id]

getGroupMember' :: Int -> ApiEff (Either ApiError GroupMemberResponse)
getGroupMember' group_member_id = handleError <$> getAt ([] :: Array Boolean) ["group_member", show group_member_id]

putGroupMember :: forall qp. QueryParam qp => Array qp -> Int -> GroupMemberRequest -> ApiEff (Either ApiError GroupMemberResponse)
putGroupMember params group_member_id group_member_request = handleError <$> putAt params ["group_member", show group_member_id] group_member_request

putGroupMember' :: Int -> GroupMemberRequest -> ApiEff (Either ApiError GroupMemberResponse)
putGroupMember' group_member_id group_member_request = handleError <$> putAt ([] :: Array Boolean) ["group_member", show group_member_id] group_member_request

deleteGroupMember :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deleteGroupMember params group_member_id = handleError <$> deleteAt params ["group_member", show group_member_id]

deleteGroupMember' :: Int -> ApiEff (Either ApiError Unit)
deleteGroupMember' group_member_id = handleError <$> deleteAt ([] :: Array Boolean) ["group_member", show group_member_id]

getLeurons :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError LeuronResponses)
getLeurons params = handleError <$> getAt params ["leurons"]

getLeurons' :: ApiEff (Either ApiError LeuronResponses)
getLeurons'  = handleError <$> getAt ([] :: Array Boolean) ["leurons"]

postLeuron_ByResourceId :: forall qp. QueryParam qp => Array qp -> Int -> LeuronRequest -> ApiEff (Either ApiError LeuronResponse)
postLeuron_ByResourceId params _ByResourceId leuron_request = handleError <$> postAt (map qp params ++ map qp [ByResourceId _ByResourceId]) ["leuron"] leuron_request

postLeuron_ByResourceId' :: Int -> LeuronRequest -> ApiEff (Either ApiError LeuronResponse)
postLeuron_ByResourceId' _ByResourceId leuron_request = handleError <$> postAt [ByResourceId _ByResourceId] ["leuron"] leuron_request

getLeuron :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError LeuronResponse)
getLeuron params leuron_id = handleError <$> getAt params ["leuron", show leuron_id]

getLeuron' :: Int -> ApiEff (Either ApiError LeuronResponse)
getLeuron' leuron_id = handleError <$> getAt ([] :: Array Boolean) ["leuron", show leuron_id]

putLeuron :: forall qp. QueryParam qp => Array qp -> Int -> LeuronRequest -> ApiEff (Either ApiError LeuronResponse)
putLeuron params leuron_id leuron_request = handleError <$> putAt params ["leuron", show leuron_id] leuron_request

putLeuron' :: Int -> LeuronRequest -> ApiEff (Either ApiError LeuronResponse)
putLeuron' leuron_id leuron_request = handleError <$> putAt ([] :: Array Boolean) ["leuron", show leuron_id] leuron_request

deleteLeuron :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deleteLeuron params leuron_id = handleError <$> deleteAt params ["leuron", show leuron_id]

deleteLeuron' :: Int -> ApiEff (Either ApiError Unit)
deleteLeuron' leuron_id = handleError <$> deleteAt ([] :: Array Boolean) ["leuron", show leuron_id]

getLikes :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError LikeResponses)
getLikes params = handleError <$> getAt params ["likes"]

getLikes' :: ApiEff (Either ApiError LikeResponses)
getLikes'  = handleError <$> getAt ([] :: Array Boolean) ["likes"]

getLikes_ByThreadPostsIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError LikeResponses)
getLikes_ByThreadPostsIds params _ByThreadPostsIds = handleError <$> getAt (map qp params ++ map qp [ByThreadPostsIds _ByThreadPostsIds]) ["likes"]

getLikes_ByThreadPostsIds' :: (Array Int) -> ApiEff (Either ApiError LikeResponses)
getLikes_ByThreadPostsIds' _ByThreadPostsIds = handleError <$> getAt [ByThreadPostsIds _ByThreadPostsIds] ["likes"]

getLikes_ByThreadPostId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError LikeResponses)
getLikes_ByThreadPostId params _ByThreadPostId = handleError <$> getAt (map qp params ++ map qp [ByThreadPostId _ByThreadPostId]) ["likes"]

getLikes_ByThreadPostId' :: Int -> ApiEff (Either ApiError LikeResponses)
getLikes_ByThreadPostId' _ByThreadPostId = handleError <$> getAt [ByThreadPostId _ByThreadPostId] ["likes"]

getLikes_ByResourceId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError LikeResponses)
getLikes_ByResourceId params _ByResourceId = handleError <$> getAt (map qp params ++ map qp [ByResourceId _ByResourceId]) ["likes"]

getLikes_ByResourceId' :: Int -> ApiEff (Either ApiError LikeResponses)
getLikes_ByResourceId' _ByResourceId = handleError <$> getAt [ByResourceId _ByResourceId] ["likes"]

postLike_ByThreadPostId :: forall qp. QueryParam qp => Array qp -> Int -> LikeRequest -> ApiEff (Either ApiError LikeResponse)
postLike_ByThreadPostId params _ByThreadPostId like_request = handleError <$> postAt (map qp params ++ map qp [ByThreadPostId _ByThreadPostId]) ["like"] like_request

postLike_ByThreadPostId' :: Int -> LikeRequest -> ApiEff (Either ApiError LikeResponse)
postLike_ByThreadPostId' _ByThreadPostId like_request = handleError <$> postAt [ByThreadPostId _ByThreadPostId] ["like"] like_request

postLike_ByLeuronId :: forall qp. QueryParam qp => Array qp -> Int -> LikeRequest -> ApiEff (Either ApiError LikeResponse)
postLike_ByLeuronId params _ByLeuronId like_request = handleError <$> postAt (map qp params ++ map qp [ByLeuronId _ByLeuronId]) ["like"] like_request

postLike_ByLeuronId' :: Int -> LikeRequest -> ApiEff (Either ApiError LikeResponse)
postLike_ByLeuronId' _ByLeuronId like_request = handleError <$> postAt [ByLeuronId _ByLeuronId] ["like"] like_request

getLike :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError LikeResponse)
getLike params like_id = handleError <$> getAt params ["like", show like_id]

getLike' :: Int -> ApiEff (Either ApiError LikeResponse)
getLike' like_id = handleError <$> getAt ([] :: Array Boolean) ["like", show like_id]

putLike :: forall qp. QueryParam qp => Array qp -> Int -> LikeRequest -> ApiEff (Either ApiError LikeResponse)
putLike params like_id like_request = handleError <$> putAt params ["like", show like_id] like_request

putLike' :: Int -> LikeRequest -> ApiEff (Either ApiError LikeResponse)
putLike' like_id like_request = handleError <$> putAt ([] :: Array Boolean) ["like", show like_id] like_request

deleteLike :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deleteLike params like_id = handleError <$> deleteAt params ["like", show like_id]

deleteLike' :: Int -> ApiEff (Either ApiError Unit)
deleteLike' like_id = handleError <$> deleteAt ([] :: Array Boolean) ["like", show like_id]

getLikeStats_ByThreadPostsIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError LikeStatResponses)
getLikeStats_ByThreadPostsIds params _ByThreadPostsIds = handleError <$> getAt (map qp params ++ map qp [ByThreadPostsIds _ByThreadPostsIds]) ["like_stats"]

getLikeStats_ByThreadPostsIds' :: (Array Int) -> ApiEff (Either ApiError LikeStatResponses)
getLikeStats_ByThreadPostsIds' _ByThreadPostsIds = handleError <$> getAt [ByThreadPostsIds _ByThreadPostsIds] ["like_stats"]

getLikeStat :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError LikeStatResponse)
getLikeStat params like_id = handleError <$> getAt params ["like_stat", show like_id]

getLikeStat' :: Int -> ApiEff (Either ApiError LikeStatResponse)
getLikeStat' like_id = handleError <$> getAt ([] :: Array Boolean) ["like_stat", show like_id]

getStars :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError StarResponses)
getStars params = handleError <$> getAt params ["stars"]

getStars' :: ApiEff (Either ApiError StarResponses)
getStars'  = handleError <$> getAt ([] :: Array Boolean) ["stars"]

getStars_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarResponses)
getStars_ByOrganizationId params _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["stars"]

getStars_ByOrganizationId' :: Int -> ApiEff (Either ApiError StarResponses)
getStars_ByOrganizationId' _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["stars"]

getStars_ByUserId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarResponses)
getStars_ByUserId params _ByUserId = handleError <$> getAt (map qp params ++ map qp [ByUserId _ByUserId]) ["stars"]

getStars_ByUserId' :: Int -> ApiEff (Either ApiError StarResponses)
getStars_ByUserId' _ByUserId = handleError <$> getAt [ByUserId _ByUserId] ["stars"]

getStars_ByBoardId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarResponses)
getStars_ByBoardId params _ByBoardId = handleError <$> getAt (map qp params ++ map qp [ByBoardId _ByBoardId]) ["stars"]

getStars_ByBoardId' :: Int -> ApiEff (Either ApiError StarResponses)
getStars_ByBoardId' _ByBoardId = handleError <$> getAt [ByBoardId _ByBoardId] ["stars"]

getStars_ByThreadId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarResponses)
getStars_ByThreadId params _ByThreadId = handleError <$> getAt (map qp params ++ map qp [ByThreadId _ByThreadId]) ["stars"]

getStars_ByThreadId' :: Int -> ApiEff (Either ApiError StarResponses)
getStars_ByThreadId' _ByThreadId = handleError <$> getAt [ByThreadId _ByThreadId] ["stars"]

getStars_ByThreadPostsIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError StarResponses)
getStars_ByThreadPostsIds params _ByThreadPostsIds = handleError <$> getAt (map qp params ++ map qp [ByThreadPostsIds _ByThreadPostsIds]) ["stars"]

getStars_ByThreadPostsIds' :: (Array Int) -> ApiEff (Either ApiError StarResponses)
getStars_ByThreadPostsIds' _ByThreadPostsIds = handleError <$> getAt [ByThreadPostsIds _ByThreadPostsIds] ["stars"]

getStars_ByThreadPostId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarResponses)
getStars_ByThreadPostId params _ByThreadPostId = handleError <$> getAt (map qp params ++ map qp [ByThreadPostId _ByThreadPostId]) ["stars"]

getStars_ByThreadPostId' :: Int -> ApiEff (Either ApiError StarResponses)
getStars_ByThreadPostId' _ByThreadPostId = handleError <$> getAt [ByThreadPostId _ByThreadPostId] ["stars"]

getStars_ByResourceId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarResponses)
getStars_ByResourceId params _ByResourceId = handleError <$> getAt (map qp params ++ map qp [ByResourceId _ByResourceId]) ["stars"]

getStars_ByResourceId' :: Int -> ApiEff (Either ApiError StarResponses)
getStars_ByResourceId' _ByResourceId = handleError <$> getAt [ByResourceId _ByResourceId] ["stars"]

getStars_ByLeuronId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarResponses)
getStars_ByLeuronId params _ByLeuronId = handleError <$> getAt (map qp params ++ map qp [ByLeuronId _ByLeuronId]) ["stars"]

getStars_ByLeuronId' :: Int -> ApiEff (Either ApiError StarResponses)
getStars_ByLeuronId' _ByLeuronId = handleError <$> getAt [ByLeuronId _ByLeuronId] ["stars"]

postStar_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
postStar_ByOrganizationId params _ByOrganizationId star_request = handleError <$> postAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["star"] star_request

postStar_ByOrganizationId' :: Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
postStar_ByOrganizationId' _ByOrganizationId star_request = handleError <$> postAt [ByOrganizationId _ByOrganizationId] ["star"] star_request

postStar_ByUserId :: forall qp. QueryParam qp => Array qp -> Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
postStar_ByUserId params _ByUserId star_request = handleError <$> postAt (map qp params ++ map qp [ByUserId _ByUserId]) ["star"] star_request

postStar_ByUserId' :: Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
postStar_ByUserId' _ByUserId star_request = handleError <$> postAt [ByUserId _ByUserId] ["star"] star_request

postStar_ByBoardId :: forall qp. QueryParam qp => Array qp -> Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
postStar_ByBoardId params _ByBoardId star_request = handleError <$> postAt (map qp params ++ map qp [ByBoardId _ByBoardId]) ["star"] star_request

postStar_ByBoardId' :: Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
postStar_ByBoardId' _ByBoardId star_request = handleError <$> postAt [ByBoardId _ByBoardId] ["star"] star_request

postStar_ByThreadId :: forall qp. QueryParam qp => Array qp -> Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
postStar_ByThreadId params _ByThreadId star_request = handleError <$> postAt (map qp params ++ map qp [ByThreadId _ByThreadId]) ["star"] star_request

postStar_ByThreadId' :: Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
postStar_ByThreadId' _ByThreadId star_request = handleError <$> postAt [ByThreadId _ByThreadId] ["star"] star_request

postStar_ByThreadPostId :: forall qp. QueryParam qp => Array qp -> Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
postStar_ByThreadPostId params _ByThreadPostId star_request = handleError <$> postAt (map qp params ++ map qp [ByThreadPostId _ByThreadPostId]) ["star"] star_request

postStar_ByThreadPostId' :: Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
postStar_ByThreadPostId' _ByThreadPostId star_request = handleError <$> postAt [ByThreadPostId _ByThreadPostId] ["star"] star_request

postStar_ByResourceId :: forall qp. QueryParam qp => Array qp -> Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
postStar_ByResourceId params _ByResourceId star_request = handleError <$> postAt (map qp params ++ map qp [ByResourceId _ByResourceId]) ["star"] star_request

postStar_ByResourceId' :: Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
postStar_ByResourceId' _ByResourceId star_request = handleError <$> postAt [ByResourceId _ByResourceId] ["star"] star_request

postStar_ByLeuronId :: forall qp. QueryParam qp => Array qp -> Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
postStar_ByLeuronId params _ByLeuronId star_request = handleError <$> postAt (map qp params ++ map qp [ByLeuronId _ByLeuronId]) ["star"] star_request

postStar_ByLeuronId' :: Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
postStar_ByLeuronId' _ByLeuronId star_request = handleError <$> postAt [ByLeuronId _ByLeuronId] ["star"] star_request

getStar :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarResponse)
getStar params star_id = handleError <$> getAt params ["star", show star_id]

getStar' :: Int -> ApiEff (Either ApiError StarResponse)
getStar' star_id = handleError <$> getAt ([] :: Array Boolean) ["star", show star_id]

putStar :: forall qp. QueryParam qp => Array qp -> Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
putStar params star_id star_request = handleError <$> putAt params ["star", show star_id] star_request

putStar' :: Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
putStar' star_id star_request = handleError <$> putAt ([] :: Array Boolean) ["star", show star_id] star_request

deleteStar :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deleteStar params star_id = handleError <$> deleteAt params ["star", show star_id]

deleteStar' :: Int -> ApiEff (Either ApiError Unit)
deleteStar' star_id = handleError <$> deleteAt ([] :: Array Boolean) ["star", show star_id]

getStarStats_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarStatResponses)
getStarStats_ByOrganizationId params _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["star_stats"]

getStarStats_ByOrganizationId' :: Int -> ApiEff (Either ApiError StarStatResponses)
getStarStats_ByOrganizationId' _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["star_stats"]

getStarStats_ByUserId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarStatResponses)
getStarStats_ByUserId params _ByUserId = handleError <$> getAt (map qp params ++ map qp [ByUserId _ByUserId]) ["star_stats"]

getStarStats_ByUserId' :: Int -> ApiEff (Either ApiError StarStatResponses)
getStarStats_ByUserId' _ByUserId = handleError <$> getAt [ByUserId _ByUserId] ["star_stats"]

getStarStats_ByBoardId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarStatResponses)
getStarStats_ByBoardId params _ByBoardId = handleError <$> getAt (map qp params ++ map qp [ByBoardId _ByBoardId]) ["star_stats"]

getStarStats_ByBoardId' :: Int -> ApiEff (Either ApiError StarStatResponses)
getStarStats_ByBoardId' _ByBoardId = handleError <$> getAt [ByBoardId _ByBoardId] ["star_stats"]

getStarStats_ByThreadId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarStatResponses)
getStarStats_ByThreadId params _ByThreadId = handleError <$> getAt (map qp params ++ map qp [ByThreadId _ByThreadId]) ["star_stats"]

getStarStats_ByThreadId' :: Int -> ApiEff (Either ApiError StarStatResponses)
getStarStats_ByThreadId' _ByThreadId = handleError <$> getAt [ByThreadId _ByThreadId] ["star_stats"]

getStarStats_ByThreadPostsIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError StarStatResponses)
getStarStats_ByThreadPostsIds params _ByThreadPostsIds = handleError <$> getAt (map qp params ++ map qp [ByThreadPostsIds _ByThreadPostsIds]) ["star_stats"]

getStarStats_ByThreadPostsIds' :: (Array Int) -> ApiEff (Either ApiError StarStatResponses)
getStarStats_ByThreadPostsIds' _ByThreadPostsIds = handleError <$> getAt [ByThreadPostsIds _ByThreadPostsIds] ["star_stats"]

getStarStats_ByThreadPostId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarStatResponses)
getStarStats_ByThreadPostId params _ByThreadPostId = handleError <$> getAt (map qp params ++ map qp [ByThreadPostId _ByThreadPostId]) ["star_stats"]

getStarStats_ByThreadPostId' :: Int -> ApiEff (Either ApiError StarStatResponses)
getStarStats_ByThreadPostId' _ByThreadPostId = handleError <$> getAt [ByThreadPostId _ByThreadPostId] ["star_stats"]

getStarStats_ByResourceId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarStatResponses)
getStarStats_ByResourceId params _ByResourceId = handleError <$> getAt (map qp params ++ map qp [ByResourceId _ByResourceId]) ["star_stats"]

getStarStats_ByResourceId' :: Int -> ApiEff (Either ApiError StarStatResponses)
getStarStats_ByResourceId' _ByResourceId = handleError <$> getAt [ByResourceId _ByResourceId] ["star_stats"]

getStarStats_ByLeuronId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarStatResponses)
getStarStats_ByLeuronId params _ByLeuronId = handleError <$> getAt (map qp params ++ map qp [ByLeuronId _ByLeuronId]) ["star_stats"]

getStarStats_ByLeuronId' :: Int -> ApiEff (Either ApiError StarStatResponses)
getStarStats_ByLeuronId' _ByLeuronId = handleError <$> getAt [ByLeuronId _ByLeuronId] ["star_stats"]

getStarStat :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarStatResponse)
getStarStat params star_id = handleError <$> getAt params ["star_stat", show star_id]

getStarStat' :: Int -> ApiEff (Either ApiError StarStatResponse)
getStarStat' star_id = handleError <$> getAt ([] :: Array Boolean) ["star_stat", show star_id]

getMe :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError UserResponse)
getMe params = handleError <$> getAt params ["me"]

getMe' :: ApiEff (Either ApiError UserResponse)
getMe'  = handleError <$> getAt ([] :: Array Boolean) ["me"]

getMePack :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError UserPackResponse)
getMePack params = handleError <$> getAt params ["me_pack"]

getMePack' :: ApiEff (Either ApiError UserPackResponse)
getMePack'  = handleError <$> getAt ([] :: Array Boolean) ["me_pack"]

getOrganizations :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError OrganizationResponses)
getOrganizations params = handleError <$> getAt params ["organizations"]

getOrganizations' :: ApiEff (Either ApiError OrganizationResponses)
getOrganizations'  = handleError <$> getAt ([] :: Array Boolean) ["organizations"]

postOrganization :: forall qp. QueryParam qp => Array qp -> OrganizationRequest -> ApiEff (Either ApiError OrganizationResponse)
postOrganization params organization_request = handleError <$> postAt params ["organization"] organization_request

postOrganization' :: OrganizationRequest -> ApiEff (Either ApiError OrganizationResponse)
postOrganization' organization_request = handleError <$> postAt ([] :: Array Boolean) ["organization"] organization_request

getOrganization :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError OrganizationResponse)
getOrganization params organization_id = handleError <$> getAt params ["organization", show organization_id]

getOrganization' :: Int -> ApiEff (Either ApiError OrganizationResponse)
getOrganization' organization_id = handleError <$> getAt ([] :: Array Boolean) ["organization", show organization_id]

putOrganization :: forall qp. QueryParam qp => Array qp -> Int -> OrganizationRequest -> ApiEff (Either ApiError OrganizationResponse)
putOrganization params organization_id organization_request = handleError <$> putAt params ["organization", show organization_id] organization_request

putOrganization' :: Int -> OrganizationRequest -> ApiEff (Either ApiError OrganizationResponse)
putOrganization' organization_id organization_request = handleError <$> putAt ([] :: Array Boolean) ["organization", show organization_id] organization_request

deleteOrganization :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deleteOrganization params organization_id = handleError <$> deleteAt params ["organization", show organization_id]

deleteOrganization' :: Int -> ApiEff (Either ApiError Unit)
deleteOrganization' organization_id = handleError <$> deleteAt ([] :: Array Boolean) ["organization", show organization_id]

getOrganizationStats :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError OrganizationStatResponses)
getOrganizationStats params = handleError <$> getAt params ["organization_stats"]

getOrganizationStats' :: ApiEff (Either ApiError OrganizationStatResponses)
getOrganizationStats'  = handleError <$> getAt ([] :: Array Boolean) ["organization_stats"]

getOrganizationStat :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError OrganizationStatResponse)
getOrganizationStat params organization_id = handleError <$> getAt params ["organization_stat", show organization_id]

getOrganizationStat' :: Int -> ApiEff (Either ApiError OrganizationStatResponse)
getOrganizationStat' organization_id = handleError <$> getAt ([] :: Array Boolean) ["organization_stat", show organization_id]

getPms :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError PmResponses)
getPms params = handleError <$> getAt params ["pms"]

getPms' :: ApiEff (Either ApiError PmResponses)
getPms'  = handleError <$> getAt ([] :: Array Boolean) ["pms"]

postPm_ByUsersIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> PmRequest -> ApiEff (Either ApiError PmResponse)
postPm_ByUsersIds params _ByUsersIds pm_request = handleError <$> postAt (map qp params ++ map qp [ByUsersIds _ByUsersIds]) ["pm"] pm_request

postPm_ByUsersIds' :: (Array Int) -> PmRequest -> ApiEff (Either ApiError PmResponse)
postPm_ByUsersIds' _ByUsersIds pm_request = handleError <$> postAt [ByUsersIds _ByUsersIds] ["pm"] pm_request

postPm_ByUserId :: forall qp. QueryParam qp => Array qp -> Int -> PmRequest -> ApiEff (Either ApiError PmResponse)
postPm_ByUserId params _ByUserId pm_request = handleError <$> postAt (map qp params ++ map qp [ByUserId _ByUserId]) ["pm"] pm_request

postPm_ByUserId' :: Int -> PmRequest -> ApiEff (Either ApiError PmResponse)
postPm_ByUserId' _ByUserId pm_request = handleError <$> postAt [ByUserId _ByUserId] ["pm"] pm_request

getPm :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError PmResponse)
getPm params pm_id = handleError <$> getAt params ["pm", show pm_id]

getPm' :: Int -> ApiEff (Either ApiError PmResponse)
getPm' pm_id = handleError <$> getAt ([] :: Array Boolean) ["pm", show pm_id]

putPm :: forall qp. QueryParam qp => Array qp -> Int -> PmRequest -> ApiEff (Either ApiError PmResponse)
putPm params pm_id pm_request = handleError <$> putAt params ["pm", show pm_id] pm_request

putPm' :: Int -> PmRequest -> ApiEff (Either ApiError PmResponse)
putPm' pm_id pm_request = handleError <$> putAt ([] :: Array Boolean) ["pm", show pm_id] pm_request

deletePm :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deletePm params pm_id = handleError <$> deleteAt params ["pm", show pm_id]

deletePm' :: Int -> ApiEff (Either ApiError Unit)
deletePm' pm_id = handleError <$> deleteAt ([] :: Array Boolean) ["pm", show pm_id]

getPmIns :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError PmInResponses)
getPmIns params = handleError <$> getAt params ["pm_ins"]

getPmIns' :: ApiEff (Either ApiError PmInResponses)
getPmIns'  = handleError <$> getAt ([] :: Array Boolean) ["pm_ins"]

postPmIn :: forall qp. QueryParam qp => Array qp -> PmInRequest -> ApiEff (Either ApiError PmInResponse)
postPmIn params pm_in_request = handleError <$> postAt params ["pm_in"] pm_in_request

postPmIn' :: PmInRequest -> ApiEff (Either ApiError PmInResponse)
postPmIn' pm_in_request = handleError <$> postAt ([] :: Array Boolean) ["pm_in"] pm_in_request

getPmIn :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError PmInResponse)
getPmIn params pm_in_id = handleError <$> getAt params ["pm_in", show pm_in_id]

getPmIn' :: Int -> ApiEff (Either ApiError PmInResponse)
getPmIn' pm_in_id = handleError <$> getAt ([] :: Array Boolean) ["pm_in", show pm_in_id]

putPmIn :: forall qp. QueryParam qp => Array qp -> Int -> PmInRequest -> ApiEff (Either ApiError PmInResponse)
putPmIn params pm_in_id pm_in_request = handleError <$> putAt params ["pm_in", show pm_in_id] pm_in_request

putPmIn' :: Int -> PmInRequest -> ApiEff (Either ApiError PmInResponse)
putPmIn' pm_in_id pm_in_request = handleError <$> putAt ([] :: Array Boolean) ["pm_in", show pm_in_id] pm_in_request

deletePmIn :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deletePmIn params pm_in_id = handleError <$> deleteAt params ["pm_in", show pm_in_id]

deletePmIn' :: Int -> ApiEff (Either ApiError Unit)
deletePmIn' pm_in_id = handleError <$> deleteAt ([] :: Array Boolean) ["pm_in", show pm_in_id]

getPmOuts :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError PmOutResponses)
getPmOuts params = handleError <$> getAt params ["pm_outs"]

getPmOuts' :: ApiEff (Either ApiError PmOutResponses)
getPmOuts'  = handleError <$> getAt ([] :: Array Boolean) ["pm_outs"]

postPmOut :: forall qp. QueryParam qp => Array qp -> PmOutRequest -> ApiEff (Either ApiError PmOutResponse)
postPmOut params pm_out_request = handleError <$> postAt params ["pm_out"] pm_out_request

postPmOut' :: PmOutRequest -> ApiEff (Either ApiError PmOutResponse)
postPmOut' pm_out_request = handleError <$> postAt ([] :: Array Boolean) ["pm_out"] pm_out_request

getPmOut :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError PmOutResponse)
getPmOut params pm_out_id = handleError <$> getAt params ["pm_out", show pm_out_id]

getPmOut' :: Int -> ApiEff (Either ApiError PmOutResponse)
getPmOut' pm_out_id = handleError <$> getAt ([] :: Array Boolean) ["pm_out", show pm_out_id]

putPmOut :: forall qp. QueryParam qp => Array qp -> Int -> PmOutRequest -> ApiEff (Either ApiError PmOutResponse)
putPmOut params pm_out_id pm_out_request = handleError <$> putAt params ["pm_out", show pm_out_id] pm_out_request

putPmOut' :: Int -> PmOutRequest -> ApiEff (Either ApiError PmOutResponse)
putPmOut' pm_out_id pm_out_request = handleError <$> putAt ([] :: Array Boolean) ["pm_out", show pm_out_id] pm_out_request

deletePmOut :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deletePmOut params pm_out_id = handleError <$> deleteAt params ["pm_out", show pm_out_id]

deletePmOut' :: Int -> ApiEff (Either ApiError Unit)
deletePmOut' pm_out_id = handleError <$> deleteAt ([] :: Array Boolean) ["pm_out", show pm_out_id]

getResources :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError ResourceResponses)
getResources params = handleError <$> getAt params ["resources"]

getResources' :: ApiEff (Either ApiError ResourceResponses)
getResources'  = handleError <$> getAt ([] :: Array Boolean) ["resources"]

postResource :: forall qp. QueryParam qp => Array qp -> ResourceRequest -> ApiEff (Either ApiError ResourceResponse)
postResource params resource_request = handleError <$> postAt params ["resource"] resource_request

postResource' :: ResourceRequest -> ApiEff (Either ApiError ResourceResponse)
postResource' resource_request = handleError <$> postAt ([] :: Array Boolean) ["resource"] resource_request

getResource :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ResourceResponse)
getResource params resource_id = handleError <$> getAt params ["resource", show resource_id]

getResource' :: Int -> ApiEff (Either ApiError ResourceResponse)
getResource' resource_id = handleError <$> getAt ([] :: Array Boolean) ["resource", show resource_id]

putResource :: forall qp. QueryParam qp => Array qp -> Int -> ResourceRequest -> ApiEff (Either ApiError ResourceResponse)
putResource params resource_id resource_request = handleError <$> putAt params ["resource", show resource_id] resource_request

putResource' :: Int -> ResourceRequest -> ApiEff (Either ApiError ResourceResponse)
putResource' resource_id resource_request = handleError <$> putAt ([] :: Array Boolean) ["resource", show resource_id] resource_request

deleteResource :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deleteResource params resource_id = handleError <$> deleteAt params ["resource", show resource_id]

deleteResource' :: Int -> ApiEff (Either ApiError Unit)
deleteResource' resource_id = handleError <$> deleteAt ([] :: Array Boolean) ["resource", show resource_id]

getResourceStats_ByResourcesIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError ResourceStatResponses)
getResourceStats_ByResourcesIds params _ByResourcesIds = handleError <$> getAt (map qp params ++ map qp [ByResourcesIds _ByResourcesIds]) ["resource_stats"]

getResourceStats_ByResourcesIds' :: (Array Int) -> ApiEff (Either ApiError ResourceStatResponses)
getResourceStats_ByResourcesIds' _ByResourcesIds = handleError <$> getAt [ByResourcesIds _ByResourcesIds] ["resource_stats"]

getResourceStat :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ResourceStatResponse)
getResourceStat params resource_id = handleError <$> getAt params ["resource_stat", show resource_id]

getResourceStat' :: Int -> ApiEff (Either ApiError ResourceStatResponse)
getResourceStat' resource_id = handleError <$> getAt ([] :: Array Boolean) ["resource_stat", show resource_id]

getTeams :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError TeamResponses)
getTeams params = handleError <$> getAt params ["teams"]

getTeams' :: ApiEff (Either ApiError TeamResponses)
getTeams'  = handleError <$> getAt ([] :: Array Boolean) ["teams"]

getTeams_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError TeamResponses)
getTeams_ByOrganizationId params _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["teams"]

getTeams_ByOrganizationId' :: Int -> ApiEff (Either ApiError TeamResponses)
getTeams_ByOrganizationId' _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["teams"]

postTeam_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> TeamRequest -> ApiEff (Either ApiError TeamResponse)
postTeam_ByOrganizationId params _ByOrganizationId team_request = handleError <$> postAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["team"] team_request

postTeam_ByOrganizationId' :: Int -> TeamRequest -> ApiEff (Either ApiError TeamResponse)
postTeam_ByOrganizationId' _ByOrganizationId team_request = handleError <$> postAt [ByOrganizationId _ByOrganizationId] ["team"] team_request

getTeam :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError TeamResponse)
getTeam params team_id = handleError <$> getAt params ["team", show team_id]

getTeam' :: Int -> ApiEff (Either ApiError TeamResponse)
getTeam' team_id = handleError <$> getAt ([] :: Array Boolean) ["team", show team_id]

putTeam :: forall qp. QueryParam qp => Array qp -> Int -> TeamRequest -> ApiEff (Either ApiError TeamResponse)
putTeam params team_id team_request = handleError <$> putAt params ["team", show team_id] team_request

putTeam' :: Int -> TeamRequest -> ApiEff (Either ApiError TeamResponse)
putTeam' team_id team_request = handleError <$> putAt ([] :: Array Boolean) ["team", show team_id] team_request

deleteTeam :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deleteTeam params team_id = handleError <$> deleteAt params ["team", show team_id]

deleteTeam' :: Int -> ApiEff (Either ApiError Unit)
deleteTeam' team_id = handleError <$> deleteAt ([] :: Array Boolean) ["team", show team_id]

getTeamMembers :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError TeamMemberResponses)
getTeamMembers params = handleError <$> getAt params ["team_members"]

getTeamMembers' :: ApiEff (Either ApiError TeamMemberResponses)
getTeamMembers'  = handleError <$> getAt ([] :: Array Boolean) ["team_members"]

getTeamMembers_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError TeamMemberResponses)
getTeamMembers_ByOrganizationId params _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["team_members"]

getTeamMembers_ByOrganizationId' :: Int -> ApiEff (Either ApiError TeamMemberResponses)
getTeamMembers_ByOrganizationId' _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["team_members"]

getTeamMembers_ByTeamId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError TeamMemberResponses)
getTeamMembers_ByTeamId params _ByTeamId = handleError <$> getAt (map qp params ++ map qp [ByTeamId _ByTeamId]) ["team_members"]

getTeamMembers_ByTeamId' :: Int -> ApiEff (Either ApiError TeamMemberResponses)
getTeamMembers_ByTeamId' _ByTeamId = handleError <$> getAt [ByTeamId _ByTeamId] ["team_members"]

postTeamMember_ByTeamId :: forall qp. QueryParam qp => Array qp -> Int -> TeamMemberRequest -> ApiEff (Either ApiError TeamMemberResponse)
postTeamMember_ByTeamId params _ByTeamId team_member_request = handleError <$> postAt (map qp params ++ map qp [ByTeamId _ByTeamId]) ["team_member"] team_member_request

postTeamMember_ByTeamId' :: Int -> TeamMemberRequest -> ApiEff (Either ApiError TeamMemberResponse)
postTeamMember_ByTeamId' _ByTeamId team_member_request = handleError <$> postAt [ByTeamId _ByTeamId] ["team_member"] team_member_request

getTeamMember :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError TeamMemberResponse)
getTeamMember params team_id = handleError <$> getAt params ["team_member", show team_id]

getTeamMember' :: Int -> ApiEff (Either ApiError TeamMemberResponse)
getTeamMember' team_id = handleError <$> getAt ([] :: Array Boolean) ["team_member", show team_id]

putTeamMember :: forall qp. QueryParam qp => Array qp -> Int -> TeamMemberRequest -> ApiEff (Either ApiError TeamMemberResponse)
putTeamMember params team_id team_member_request = handleError <$> putAt params ["team_member", show team_id] team_member_request

putTeamMember' :: Int -> TeamMemberRequest -> ApiEff (Either ApiError TeamMemberResponse)
putTeamMember' team_id team_member_request = handleError <$> putAt ([] :: Array Boolean) ["team_member", show team_id] team_member_request

deleteTeamMember :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deleteTeamMember params team_id = handleError <$> deleteAt params ["team_member", show team_id]

deleteTeamMember' :: Int -> ApiEff (Either ApiError Unit)
deleteTeamMember' team_id = handleError <$> deleteAt ([] :: Array Boolean) ["team_member", show team_id]

getThreads :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError ThreadResponses)
getThreads params = handleError <$> getAt params ["threads"]

getThreads' :: ApiEff (Either ApiError ThreadResponses)
getThreads'  = handleError <$> getAt ([] :: Array Boolean) ["threads"]

postThread_ByBoardId :: forall qp. QueryParam qp => Array qp -> Int -> ThreadRequest -> ApiEff (Either ApiError ThreadResponse)
postThread_ByBoardId params _ByBoardId thread_request = handleError <$> postAt (map qp params ++ map qp [ByBoardId _ByBoardId]) ["thread"] thread_request

postThread_ByBoardId' :: Int -> ThreadRequest -> ApiEff (Either ApiError ThreadResponse)
postThread_ByBoardId' _ByBoardId thread_request = handleError <$> postAt [ByBoardId _ByBoardId] ["thread"] thread_request

getThread :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ThreadResponse)
getThread params thread_id = handleError <$> getAt params ["thread", show thread_id]

getThread' :: Int -> ApiEff (Either ApiError ThreadResponse)
getThread' thread_id = handleError <$> getAt ([] :: Array Boolean) ["thread", show thread_id]

putThread :: forall qp. QueryParam qp => Array qp -> Int -> ThreadRequest -> ApiEff (Either ApiError ThreadResponse)
putThread params thread_id thread_request = handleError <$> putAt params ["thread", show thread_id] thread_request

putThread' :: Int -> ThreadRequest -> ApiEff (Either ApiError ThreadResponse)
putThread' thread_id thread_request = handleError <$> putAt ([] :: Array Boolean) ["thread", show thread_id] thread_request

deleteThread :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deleteThread params thread_id = handleError <$> deleteAt params ["thread", show thread_id]

deleteThread' :: Int -> ApiEff (Either ApiError Unit)
deleteThread' thread_id = handleError <$> deleteAt ([] :: Array Boolean) ["thread", show thread_id]

getThreadStats :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError ThreadStatResponses)
getThreadStats params = handleError <$> getAt params ["thread_stats"]

getThreadStats' :: ApiEff (Either ApiError ThreadStatResponses)
getThreadStats'  = handleError <$> getAt ([] :: Array Boolean) ["thread_stats"]

getThreadStat :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ThreadStatResponse)
getThreadStat params thread_id = handleError <$> getAt params ["thread_stat", show thread_id]

getThreadStat' :: Int -> ApiEff (Either ApiError ThreadStatResponse)
getThreadStat' thread_id = handleError <$> getAt ([] :: Array Boolean) ["thread_stat", show thread_id]

getThreadPosts :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError ThreadPostResponses)
getThreadPosts params = handleError <$> getAt params ["thread_posts"]

getThreadPosts' :: ApiEff (Either ApiError ThreadPostResponses)
getThreadPosts'  = handleError <$> getAt ([] :: Array Boolean) ["thread_posts"]

getThreadPosts_ByThreadId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ThreadPostResponses)
getThreadPosts_ByThreadId params _ByThreadId = handleError <$> getAt (map qp params ++ map qp [ByThreadId _ByThreadId]) ["thread_posts"]

getThreadPosts_ByThreadId' :: Int -> ApiEff (Either ApiError ThreadPostResponses)
getThreadPosts_ByThreadId' _ByThreadId = handleError <$> getAt [ByThreadId _ByThreadId] ["thread_posts"]

postThreadPost_ByThreadId :: forall qp. QueryParam qp => Array qp -> Int -> ThreadPostRequest -> ApiEff (Either ApiError ThreadPostResponse)
postThreadPost_ByThreadId params _ByThreadId thread_post_request = handleError <$> postAt (map qp params ++ map qp [ByThreadId _ByThreadId]) ["thread_post"] thread_post_request

postThreadPost_ByThreadId' :: Int -> ThreadPostRequest -> ApiEff (Either ApiError ThreadPostResponse)
postThreadPost_ByThreadId' _ByThreadId thread_post_request = handleError <$> postAt [ByThreadId _ByThreadId] ["thread_post"] thread_post_request

getThreadPost :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ThreadPostResponse)
getThreadPost params thread_post_id = handleError <$> getAt params ["thread_post", show thread_post_id]

getThreadPost' :: Int -> ApiEff (Either ApiError ThreadPostResponse)
getThreadPost' thread_post_id = handleError <$> getAt ([] :: Array Boolean) ["thread_post", show thread_post_id]

putThreadPost :: forall qp. QueryParam qp => Array qp -> Int -> ThreadPostRequest -> ApiEff (Either ApiError ThreadPostResponse)
putThreadPost params thread_post_id thread_post_request = handleError <$> putAt params ["thread_post", show thread_post_id] thread_post_request

putThreadPost' :: Int -> ThreadPostRequest -> ApiEff (Either ApiError ThreadPostResponse)
putThreadPost' thread_post_id thread_post_request = handleError <$> putAt ([] :: Array Boolean) ["thread_post", show thread_post_id] thread_post_request

deleteThreadPost :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deleteThreadPost params thread_post_id = handleError <$> deleteAt params ["thread_post", show thread_post_id]

deleteThreadPost' :: Int -> ApiEff (Either ApiError Unit)
deleteThreadPost' thread_post_id = handleError <$> deleteAt ([] :: Array Boolean) ["thread_post", show thread_post_id]

getThreadPostStats_ByThreadPostsIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError ThreadPostStatResponses)
getThreadPostStats_ByThreadPostsIds params _ByThreadPostsIds = handleError <$> getAt (map qp params ++ map qp [ByThreadPostsIds _ByThreadPostsIds]) ["thread_post_stats"]

getThreadPostStats_ByThreadPostsIds' :: (Array Int) -> ApiEff (Either ApiError ThreadPostStatResponses)
getThreadPostStats_ByThreadPostsIds' _ByThreadPostsIds = handleError <$> getAt [ByThreadPostsIds _ByThreadPostsIds] ["thread_post_stats"]

getThreadPostStat :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ThreadPostStatResponse)
getThreadPostStat params thread_post_id = handleError <$> getAt params ["thread_post_stat", show thread_post_id]

getThreadPostStat' :: Int -> ApiEff (Either ApiError ThreadPostStatResponse)
getThreadPostStat' thread_post_id = handleError <$> getAt ([] :: Array Boolean) ["thread_post_stat", show thread_post_id]

getUsers :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError UserResponses)
getUsers params = handleError <$> getAt params ["users"]

getUsers' :: ApiEff (Either ApiError UserResponses)
getUsers'  = handleError <$> getAt ([] :: Array Boolean) ["users"]

getUsers_ByUsersIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError UserResponses)
getUsers_ByUsersIds params _ByUsersIds = handleError <$> getAt (map qp params ++ map qp [ByUsersIds _ByUsersIds]) ["users"]

getUsers_ByUsersIds' :: (Array Int) -> ApiEff (Either ApiError UserResponses)
getUsers_ByUsersIds' _ByUsersIds = handleError <$> getAt [ByUsersIds _ByUsersIds] ["users"]

getUsers_ByUsersNicks :: forall qp. QueryParam qp => Array qp -> (Array String) -> ApiEff (Either ApiError UserResponses)
getUsers_ByUsersNicks params _ByUsersNicks = handleError <$> getAt (map qp params ++ map qp [ByUsersNicks _ByUsersNicks]) ["users"]

getUsers_ByUsersNicks' :: (Array String) -> ApiEff (Either ApiError UserResponses)
getUsers_ByUsersNicks' _ByUsersNicks = handleError <$> getAt [ByUsersNicks _ByUsersNicks] ["users"]

postUser :: forall qp. QueryParam qp => Array qp -> UserRequest -> ApiEff (Either ApiError UserResponse)
postUser params user_request = handleError <$> postAt params ["user"] user_request

postUser' :: UserRequest -> ApiEff (Either ApiError UserResponse)
postUser' user_request = handleError <$> postAt ([] :: Array Boolean) ["user"] user_request

getUser :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError UserResponse)
getUser params user_id = handleError <$> getAt params ["user", show user_id]

getUser' :: Int -> ApiEff (Either ApiError UserResponse)
getUser' user_id = handleError <$> getAt ([] :: Array Boolean) ["user", show user_id]

putUser :: forall qp. QueryParam qp => Array qp -> Int -> UserRequest -> ApiEff (Either ApiError UserResponse)
putUser params user_id user_request = handleError <$> putAt params ["user", show user_id] user_request

putUser' :: Int -> UserRequest -> ApiEff (Either ApiError UserResponse)
putUser' user_id user_request = handleError <$> putAt ([] :: Array Boolean) ["user", show user_id] user_request

deleteUser :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deleteUser params user_id = handleError <$> deleteAt params ["user", show user_id]

deleteUser' :: Int -> ApiEff (Either ApiError Unit)
deleteUser' user_id = handleError <$> deleteAt ([] :: Array Boolean) ["user", show user_id]

getUserProfiles :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError ProfileResponses)
getUserProfiles params = handleError <$> getAt params ["user_profiles"]

getUserProfiles' :: ApiEff (Either ApiError ProfileResponses)
getUserProfiles'  = handleError <$> getAt ([] :: Array Boolean) ["user_profiles"]

getUserProfiles_ByUsersIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError ProfileResponses)
getUserProfiles_ByUsersIds params _ByUsersIds = handleError <$> getAt (map qp params ++ map qp [ByUsersIds _ByUsersIds]) ["user_profiles"]

getUserProfiles_ByUsersIds' :: (Array Int) -> ApiEff (Either ApiError ProfileResponses)
getUserProfiles_ByUsersIds' _ByUsersIds = handleError <$> getAt [ByUsersIds _ByUsersIds] ["user_profiles"]

getUserProfile :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ProfileResponse)
getUserProfile params profile_id = handleError <$> getAt params ["user_profile", show profile_id]

getUserProfile' :: Int -> ApiEff (Either ApiError ProfileResponse)
getUserProfile' profile_id = handleError <$> getAt ([] :: Array Boolean) ["user_profile", show profile_id]

putUserProfile :: forall qp. QueryParam qp => Array qp -> Int -> ProfileRequest -> ApiEff (Either ApiError ProfileResponse)
putUserProfile params profile_id profile_request = handleError <$> putAt params ["user_profile", show profile_id] profile_request

putUserProfile' :: Int -> ProfileRequest -> ApiEff (Either ApiError ProfileResponse)
putUserProfile' profile_id profile_request = handleError <$> putAt ([] :: Array Boolean) ["user_profile", show profile_id] profile_request

deleteUserProfile :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deleteUserProfile params profile_id = handleError <$> deleteAt params ["user_profile", show profile_id]

deleteUserProfile' :: Int -> ApiEff (Either ApiError Unit)
deleteUserProfile' profile_id = handleError <$> deleteAt ([] :: Array Boolean) ["user_profile", show profile_id]

getUsersSanitized :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError UserSanitizedResponses)
getUsersSanitized params = handleError <$> getAt params ["users_sanitized"]

getUsersSanitized' :: ApiEff (Either ApiError UserSanitizedResponses)
getUsersSanitized'  = handleError <$> getAt ([] :: Array Boolean) ["users_sanitized"]

getUsersSanitized_ByUsersIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError UserSanitizedResponses)
getUsersSanitized_ByUsersIds params _ByUsersIds = handleError <$> getAt (map qp params ++ map qp [ByUsersIds _ByUsersIds]) ["users_sanitized"]

getUsersSanitized_ByUsersIds' :: (Array Int) -> ApiEff (Either ApiError UserSanitizedResponses)
getUsersSanitized_ByUsersIds' _ByUsersIds = handleError <$> getAt [ByUsersIds _ByUsersIds] ["users_sanitized"]

getUsersSanitized_ByUsersNicks :: forall qp. QueryParam qp => Array qp -> (Array String) -> ApiEff (Either ApiError UserSanitizedResponses)
getUsersSanitized_ByUsersNicks params _ByUsersNicks = handleError <$> getAt (map qp params ++ map qp [ByUsersNicks _ByUsersNicks]) ["users_sanitized"]

getUsersSanitized_ByUsersNicks' :: (Array String) -> ApiEff (Either ApiError UserSanitizedResponses)
getUsersSanitized_ByUsersNicks' _ByUsersNicks = handleError <$> getAt [ByUsersNicks _ByUsersNicks] ["users_sanitized"]

getUserSanitized :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError UserSanitizedResponse)
getUserSanitized params user_id = handleError <$> getAt params ["user_sanitized", show user_id]

getUserSanitized' :: Int -> ApiEff (Either ApiError UserSanitizedResponse)
getUserSanitized' user_id = handleError <$> getAt ([] :: Array Boolean) ["user_sanitized", show user_id]

getUserSanitizedStats :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError UserSanitizedStatResponse)
getUserSanitizedStats params = handleError <$> getAt params ["user_sanitized_stats"]

getUserSanitizedStats' :: ApiEff (Either ApiError UserSanitizedStatResponse)
getUserSanitizedStats'  = handleError <$> getAt ([] :: Array Boolean) ["user_sanitized_stats"]

getUserSanitizedStats_ByUsersIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError UserSanitizedStatResponse)
getUserSanitizedStats_ByUsersIds params _ByUsersIds = handleError <$> getAt (map qp params ++ map qp [ByUsersIds _ByUsersIds]) ["user_sanitized_stats"]

getUserSanitizedStats_ByUsersIds' :: (Array Int) -> ApiEff (Either ApiError UserSanitizedStatResponse)
getUserSanitizedStats_ByUsersIds' _ByUsersIds = handleError <$> getAt [ByUsersIds _ByUsersIds] ["user_sanitized_stats"]

getUserSanitizedStat :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError UserSanitizedStatResponse)
getUserSanitizedStat params user_id = handleError <$> getAt params ["user_sanitized_stat", show user_id]

getUserSanitizedStat' :: Int -> ApiEff (Either ApiError UserSanitizedStatResponse)
getUserSanitizedStat' user_id = handleError <$> getAt ([] :: Array Boolean) ["user_sanitized_stat", show user_id]

getOrganizationPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError OrganizationPackResponses)
getOrganizationPacks params = handleError <$> getAt params ["organization_packs"]

getOrganizationPacks' :: ApiEff (Either ApiError OrganizationPackResponses)
getOrganizationPacks'  = handleError <$> getAt ([] :: Array Boolean) ["organization_packs"]

getOrganizationPacks_ByOrganizationsIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError OrganizationPackResponses)
getOrganizationPacks_ByOrganizationsIds params _ByOrganizationsIds = handleError <$> getAt (map qp params ++ map qp [ByOrganizationsIds _ByOrganizationsIds]) ["organization_packs"]

getOrganizationPacks_ByOrganizationsIds' :: (Array Int) -> ApiEff (Either ApiError OrganizationPackResponses)
getOrganizationPacks_ByOrganizationsIds' _ByOrganizationsIds = handleError <$> getAt [ByOrganizationsIds _ByOrganizationsIds] ["organization_packs"]

getOrganizationPack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError OrganizationPackResponse)
getOrganizationPack params organization_id = handleError <$> getAt params ["organization_pack", show organization_id]

getOrganizationPack' :: Int -> ApiEff (Either ApiError OrganizationPackResponse)
getOrganizationPack' organization_id = handleError <$> getAt ([] :: Array Boolean) ["organization_pack", show organization_id]

getTeamPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError TeamPackResponses)
getTeamPacks params = handleError <$> getAt params ["team_packs"]

getTeamPacks' :: ApiEff (Either ApiError TeamPackResponses)
getTeamPacks'  = handleError <$> getAt ([] :: Array Boolean) ["team_packs"]

getTeamPacks_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError TeamPackResponses)
getTeamPacks_ByOrganizationId params _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["team_packs"]

getTeamPacks_ByOrganizationId' :: Int -> ApiEff (Either ApiError TeamPackResponses)
getTeamPacks_ByOrganizationId' _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["team_packs"]

getTeamPack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError TeamPackResponse)
getTeamPack params team_id = handleError <$> getAt params ["team_pack", show team_id]

getTeamPack' :: Int -> ApiEff (Either ApiError TeamPackResponse)
getTeamPack' team_id = handleError <$> getAt ([] :: Array Boolean) ["team_pack", show team_id]

getTeamMemberPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError TeamMemberPackResponses)
getTeamMemberPacks params = handleError <$> getAt params ["team_member_packs"]

getTeamMemberPacks' :: ApiEff (Either ApiError TeamMemberPackResponses)
getTeamMemberPacks'  = handleError <$> getAt ([] :: Array Boolean) ["team_member_packs"]

getTeamMemberPacks_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError TeamMemberPackResponses)
getTeamMemberPacks_ByOrganizationId params _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["team_member_packs"]

getTeamMemberPacks_ByOrganizationId' :: Int -> ApiEff (Either ApiError TeamMemberPackResponses)
getTeamMemberPacks_ByOrganizationId' _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["team_member_packs"]

getTeamMemberPack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError TeamMemberPackResponse)
getTeamMemberPack params team_member_id = handleError <$> getAt params ["team_member_pack", show team_member_id]

getTeamMemberPack' :: Int -> ApiEff (Either ApiError TeamMemberPackResponse)
getTeamMemberPack' team_member_id = handleError <$> getAt ([] :: Array Boolean) ["team_member_pack", show team_member_id]

getUserPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError UserPackResponses)
getUserPacks params = handleError <$> getAt params ["user_packs"]

getUserPacks' :: ApiEff (Either ApiError UserPackResponses)
getUserPacks'  = handleError <$> getAt ([] :: Array Boolean) ["user_packs"]

getUserPacks_ByUsersIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError UserPackResponses)
getUserPacks_ByUsersIds params _ByUsersIds = handleError <$> getAt (map qp params ++ map qp [ByUsersIds _ByUsersIds]) ["user_packs"]

getUserPacks_ByUsersIds' :: (Array Int) -> ApiEff (Either ApiError UserPackResponses)
getUserPacks_ByUsersIds' _ByUsersIds = handleError <$> getAt [ByUsersIds _ByUsersIds] ["user_packs"]

getUserPack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError UserPackResponse)
getUserPack params user_id = handleError <$> getAt params ["user_pack", show user_id]

getUserPack' :: Int -> ApiEff (Either ApiError UserPackResponse)
getUserPack' user_id = handleError <$> getAt ([] :: Array Boolean) ["user_pack", show user_id]

getUserSanitizedPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError UserSanitizedPackResponses)
getUserSanitizedPacks params = handleError <$> getAt params ["user_sanitized_packs"]

getUserSanitizedPacks' :: ApiEff (Either ApiError UserSanitizedPackResponses)
getUserSanitizedPacks'  = handleError <$> getAt ([] :: Array Boolean) ["user_sanitized_packs"]

getUserSanitizedPacks_ByUsersIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError UserSanitizedPackResponses)
getUserSanitizedPacks_ByUsersIds params _ByUsersIds = handleError <$> getAt (map qp params ++ map qp [ByUsersIds _ByUsersIds]) ["user_sanitized_packs"]

getUserSanitizedPacks_ByUsersIds' :: (Array Int) -> ApiEff (Either ApiError UserSanitizedPackResponses)
getUserSanitizedPacks_ByUsersIds' _ByUsersIds = handleError <$> getAt [ByUsersIds _ByUsersIds] ["user_sanitized_packs"]

getUserSanitizedPack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError UserSanitizedPackResponse)
getUserSanitizedPack params user_id = handleError <$> getAt params ["user_sanitized_pack", show user_id]

getUserSanitizedPack' :: Int -> ApiEff (Either ApiError UserSanitizedPackResponse)
getUserSanitizedPack' user_id = handleError <$> getAt ([] :: Array Boolean) ["user_sanitized_pack", show user_id]

getGlobalGroupPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError GlobalGroupPackResponses)
getGlobalGroupPacks params = handleError <$> getAt params ["global_group_packs"]

getGlobalGroupPacks' :: ApiEff (Either ApiError GlobalGroupPackResponses)
getGlobalGroupPacks'  = handleError <$> getAt ([] :: Array Boolean) ["global_group_packs"]

getGlobalGroupPacks_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError GlobalGroupPackResponses)
getGlobalGroupPacks_ByOrganizationId params _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["global_group_packs"]

getGlobalGroupPacks_ByOrganizationId' :: Int -> ApiEff (Either ApiError GlobalGroupPackResponses)
getGlobalGroupPacks_ByOrganizationId' _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["global_group_packs"]

getGlobalGroupPack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError GlobalGroupPackResponse)
getGlobalGroupPack params global_group_id = handleError <$> getAt params ["global_group_pack", show global_group_id]

getGlobalGroupPack' :: Int -> ApiEff (Either ApiError GlobalGroupPackResponse)
getGlobalGroupPack' global_group_id = handleError <$> getAt ([] :: Array Boolean) ["global_group_pack", show global_group_id]

getGroupPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError GroupPackResponses)
getGroupPacks params = handleError <$> getAt params ["group_packs"]

getGroupPacks' :: ApiEff (Either ApiError GroupPackResponses)
getGroupPacks'  = handleError <$> getAt ([] :: Array Boolean) ["group_packs"]

getGroupPacks_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError GroupPackResponses)
getGroupPacks_ByOrganizationId params _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["group_packs"]

getGroupPacks_ByOrganizationId' :: Int -> ApiEff (Either ApiError GroupPackResponses)
getGroupPacks_ByOrganizationId' _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["group_packs"]

getGroupPack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError GroupPackResponse)
getGroupPack params group_id = handleError <$> getAt params ["group_pack", show group_id]

getGroupPack' :: Int -> ApiEff (Either ApiError GroupPackResponse)
getGroupPack' group_id = handleError <$> getAt ([] :: Array Boolean) ["group_pack", show group_id]

getGroupMemberPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError GroupMemberPackResponses)
getGroupMemberPacks params = handleError <$> getAt params ["group_member_packs"]

getGroupMemberPacks' :: ApiEff (Either ApiError GroupMemberPackResponses)
getGroupMemberPacks'  = handleError <$> getAt ([] :: Array Boolean) ["group_member_packs"]

getGroupMemberPacks_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError GroupMemberPackResponses)
getGroupMemberPacks_ByOrganizationId params _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["group_member_packs"]

getGroupMemberPacks_ByOrganizationId' :: Int -> ApiEff (Either ApiError GroupMemberPackResponses)
getGroupMemberPacks_ByOrganizationId' _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["group_member_packs"]

getGroupMemberPacks_ByGlobalGroupId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError GroupMemberPackResponses)
getGroupMemberPacks_ByGlobalGroupId params _ByGlobalGroupId = handleError <$> getAt (map qp params ++ map qp [ByGlobalGroupId _ByGlobalGroupId]) ["group_member_packs"]

getGroupMemberPacks_ByGlobalGroupId' :: Int -> ApiEff (Either ApiError GroupMemberPackResponses)
getGroupMemberPacks_ByGlobalGroupId' _ByGlobalGroupId = handleError <$> getAt [ByGlobalGroupId _ByGlobalGroupId] ["group_member_packs"]

getGroupMemberPacks_ByroupId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError GroupMemberPackResponses)
getGroupMemberPacks_ByroupId params _ByroupId = handleError <$> getAt (map qp params ++ map qp [ByroupId _ByroupId]) ["group_member_packs"]

getGroupMemberPacks_ByroupId' :: Int -> ApiEff (Either ApiError GroupMemberPackResponses)
getGroupMemberPacks_ByroupId' _ByroupId = handleError <$> getAt [ByroupId _ByroupId] ["group_member_packs"]

getGroupMemberPack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError GroupMemberPackResponse)
getGroupMemberPack params group_member_id = handleError <$> getAt params ["group_member_pack", show group_member_id]

getGroupMemberPack' :: Int -> ApiEff (Either ApiError GroupMemberPackResponse)
getGroupMemberPack' group_member_id = handleError <$> getAt ([] :: Array Boolean) ["group_member_pack", show group_member_id]

getForumPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError ForumPackResponses)
getForumPacks params = handleError <$> getAt params ["forum_packs"]

getForumPacks' :: ApiEff (Either ApiError ForumPackResponses)
getForumPacks'  = handleError <$> getAt ([] :: Array Boolean) ["forum_packs"]

getForumPacks_ByForumId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ForumPackResponses)
getForumPacks_ByForumId params _ByForumId = handleError <$> getAt (map qp params ++ map qp [ByForumId _ByForumId]) ["forum_packs"]

getForumPacks_ByForumId' :: Int -> ApiEff (Either ApiError ForumPackResponses)
getForumPacks_ByForumId' _ByForumId = handleError <$> getAt [ByForumId _ByForumId] ["forum_packs"]

getForumPacks_ByForumsIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError ForumPackResponses)
getForumPacks_ByForumsIds params _ByForumsIds = handleError <$> getAt (map qp params ++ map qp [ByForumsIds _ByForumsIds]) ["forum_packs"]

getForumPacks_ByForumsIds' :: (Array Int) -> ApiEff (Either ApiError ForumPackResponses)
getForumPacks_ByForumsIds' _ByForumsIds = handleError <$> getAt [ByForumsIds _ByForumsIds] ["forum_packs"]

getForumPacks_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ForumPackResponses)
getForumPacks_ByOrganizationId params _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["forum_packs"]

getForumPacks_ByOrganizationId' :: Int -> ApiEff (Either ApiError ForumPackResponses)
getForumPacks_ByOrganizationId' _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["forum_packs"]

getForumPacks_ByOrganizationName :: forall qp. QueryParam qp => Array qp -> String -> ApiEff (Either ApiError ForumPackResponses)
getForumPacks_ByOrganizationName params _ByOrganizationName = handleError <$> getAt (map qp params ++ map qp [ByOrganizationName _ByOrganizationName]) ["forum_packs"]

getForumPacks_ByOrganizationName' :: String -> ApiEff (Either ApiError ForumPackResponses)
getForumPacks_ByOrganizationName' _ByOrganizationName = handleError <$> getAt [ByOrganizationName _ByOrganizationName] ["forum_packs"]

getForumPack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ForumPackResponse)
getForumPack params forum_id = handleError <$> getAt params ["forum_pack", show forum_id]

getForumPack' :: Int -> ApiEff (Either ApiError ForumPackResponse)
getForumPack' forum_id = handleError <$> getAt ([] :: Array Boolean) ["forum_pack", show forum_id]

getBoardPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError BoardPackResponses)
getBoardPacks params = handleError <$> getAt params ["board_packs"]

getBoardPacks' :: ApiEff (Either ApiError BoardPackResponses)
getBoardPacks'  = handleError <$> getAt ([] :: Array Boolean) ["board_packs"]

getBoardPacks_ByForumId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError BoardPackResponses)
getBoardPacks_ByForumId params _ByForumId = handleError <$> getAt (map qp params ++ map qp [ByForumId _ByForumId]) ["board_packs"]

getBoardPacks_ByForumId' :: Int -> ApiEff (Either ApiError BoardPackResponses)
getBoardPacks_ByForumId' _ByForumId = handleError <$> getAt [ByForumId _ByForumId] ["board_packs"]

getBoardPacks_ByBoardsIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError BoardPackResponses)
getBoardPacks_ByBoardsIds params _ByBoardsIds = handleError <$> getAt (map qp params ++ map qp [ByBoardsIds _ByBoardsIds]) ["board_packs"]

getBoardPacks_ByBoardsIds' :: (Array Int) -> ApiEff (Either ApiError BoardPackResponses)
getBoardPacks_ByBoardsIds' _ByBoardsIds = handleError <$> getAt [ByBoardsIds _ByBoardsIds] ["board_packs"]

getBoardPacks_ByBoardId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError BoardPackResponses)
getBoardPacks_ByBoardId params _ByBoardId = handleError <$> getAt (map qp params ++ map qp [ByBoardId _ByBoardId]) ["board_packs"]

getBoardPacks_ByBoardId' :: Int -> ApiEff (Either ApiError BoardPackResponses)
getBoardPacks_ByBoardId' _ByBoardId = handleError <$> getAt [ByBoardId _ByBoardId] ["board_packs"]

getBoardPack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError BoardPackResponse)
getBoardPack params board_id = handleError <$> getAt params ["board_pack", show board_id]

getBoardPack' :: Int -> ApiEff (Either ApiError BoardPackResponse)
getBoardPack' board_id = handleError <$> getAt ([] :: Array Boolean) ["board_pack", show board_id]

getThreadPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError ThreadPackResponses)
getThreadPacks params = handleError <$> getAt params ["thread_packs"]

getThreadPacks' :: ApiEff (Either ApiError ThreadPackResponses)
getThreadPacks'  = handleError <$> getAt ([] :: Array Boolean) ["thread_packs"]

getThreadPacks_ByThreadsIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError ThreadPackResponses)
getThreadPacks_ByThreadsIds params _ByThreadsIds = handleError <$> getAt (map qp params ++ map qp [ByThreadsIds _ByThreadsIds]) ["thread_packs"]

getThreadPacks_ByThreadsIds' :: (Array Int) -> ApiEff (Either ApiError ThreadPackResponses)
getThreadPacks_ByThreadsIds' _ByThreadsIds = handleError <$> getAt [ByThreadsIds _ByThreadsIds] ["thread_packs"]

getThreadPacks_ByBoardId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ThreadPackResponses)
getThreadPacks_ByBoardId params _ByBoardId = handleError <$> getAt (map qp params ++ map qp [ByBoardId _ByBoardId]) ["thread_packs"]

getThreadPacks_ByBoardId' :: Int -> ApiEff (Either ApiError ThreadPackResponses)
getThreadPacks_ByBoardId' _ByBoardId = handleError <$> getAt [ByBoardId _ByBoardId] ["thread_packs"]

getThreadPack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ThreadPackResponse)
getThreadPack params thread_id = handleError <$> getAt params ["thread_pack", show thread_id]

getThreadPack' :: Int -> ApiEff (Either ApiError ThreadPackResponse)
getThreadPack' thread_id = handleError <$> getAt ([] :: Array Boolean) ["thread_pack", show thread_id]

getThreadPostPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError ThreadPostPackResponses)
getThreadPostPacks params = handleError <$> getAt params ["thread_post_packs"]

getThreadPostPacks' :: ApiEff (Either ApiError ThreadPostPackResponses)
getThreadPostPacks'  = handleError <$> getAt ([] :: Array Boolean) ["thread_post_packs"]

getThreadPostPacks_ByThreadPostsIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError ThreadPostPackResponses)
getThreadPostPacks_ByThreadPostsIds params _ByThreadPostsIds = handleError <$> getAt (map qp params ++ map qp [ByThreadPostsIds _ByThreadPostsIds]) ["thread_post_packs"]

getThreadPostPacks_ByThreadPostsIds' :: (Array Int) -> ApiEff (Either ApiError ThreadPostPackResponses)
getThreadPostPacks_ByThreadPostsIds' _ByThreadPostsIds = handleError <$> getAt [ByThreadPostsIds _ByThreadPostsIds] ["thread_post_packs"]

getThreadPostPacks_ByThreadId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ThreadPostPackResponses)
getThreadPostPacks_ByThreadId params _ByThreadId = handleError <$> getAt (map qp params ++ map qp [ByThreadId _ByThreadId]) ["thread_post_packs"]

getThreadPostPacks_ByThreadId' :: Int -> ApiEff (Either ApiError ThreadPostPackResponses)
getThreadPostPacks_ByThreadId' _ByThreadId = handleError <$> getAt [ByThreadId _ByThreadId] ["thread_post_packs"]

getThreadPostPack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ThreadPostPackResponse)
getThreadPostPack params thread_post_id = handleError <$> getAt params ["thread_post_pack", show thread_post_id]

getThreadPostPack' :: Int -> ApiEff (Either ApiError ThreadPostPackResponse)
getThreadPostPack' thread_post_id = handleError <$> getAt ([] :: Array Boolean) ["thread_post_pack", show thread_post_id]

getResourcePacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError ResourcePackResponses)
getResourcePacks params = handleError <$> getAt params ["resource_packs"]

getResourcePacks' :: ApiEff (Either ApiError ResourcePackResponses)
getResourcePacks'  = handleError <$> getAt ([] :: Array Boolean) ["resource_packs"]

getResourcePacks_ByResourcesIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError ResourcePackResponses)
getResourcePacks_ByResourcesIds params _ByResourcesIds = handleError <$> getAt (map qp params ++ map qp [ByResourcesIds _ByResourcesIds]) ["resource_packs"]

getResourcePacks_ByResourcesIds' :: (Array Int) -> ApiEff (Either ApiError ResourcePackResponses)
getResourcePacks_ByResourcesIds' _ByResourcesIds = handleError <$> getAt [ByResourcesIds _ByResourcesIds] ["resource_packs"]

getResourcePack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ResourcePackResponse)
getResourcePack params resource_id = handleError <$> getAt params ["resource_pack", show resource_id]

getResourcePack' :: Int -> ApiEff (Either ApiError ResourcePackResponse)
getResourcePack' resource_id = handleError <$> getAt ([] :: Array Boolean) ["resource_pack", show resource_id]

getLeuronPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError LeuronPackResponses)
getLeuronPacks params = handleError <$> getAt params ["leuron_packs"]

getLeuronPacks' :: ApiEff (Either ApiError LeuronPackResponses)
getLeuronPacks'  = handleError <$> getAt ([] :: Array Boolean) ["leuron_packs"]

getLeuronPacks_ByLeuronsIds :: forall qp. QueryParam qp => Array qp -> (Array Int) -> ApiEff (Either ApiError LeuronPackResponses)
getLeuronPacks_ByLeuronsIds params _ByLeuronsIds = handleError <$> getAt (map qp params ++ map qp [ByLeuronsIds _ByLeuronsIds]) ["leuron_packs"]

getLeuronPacks_ByLeuronsIds' :: (Array Int) -> ApiEff (Either ApiError LeuronPackResponses)
getLeuronPacks_ByLeuronsIds' _ByLeuronsIds = handleError <$> getAt [ByLeuronsIds _ByLeuronsIds] ["leuron_packs"]

getLeuronPacks_ByResourceId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError LeuronPackResponses)
getLeuronPacks_ByResourceId params _ByResourceId = handleError <$> getAt (map qp params ++ map qp [ByResourceId _ByResourceId]) ["leuron_packs"]

getLeuronPacks_ByResourceId' :: Int -> ApiEff (Either ApiError LeuronPackResponses)
getLeuronPacks_ByResourceId' _ByResourceId = handleError <$> getAt [ByResourceId _ByResourceId] ["leuron_packs"]

getLeuronPack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError LeuronPackResponse)
getLeuronPack params leuron_id = handleError <$> getAt params ["leuron_pack", show leuron_id]

getLeuronPack' :: Int -> ApiEff (Either ApiError LeuronPackResponse)
getLeuronPack' leuron_id = handleError <$> getAt ([] :: Array Boolean) ["leuron_pack", show leuron_id]

-- footer