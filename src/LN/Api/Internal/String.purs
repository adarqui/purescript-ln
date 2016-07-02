module LN.Api.Internal.String where


import Data.Either            (Either)
import Prelude                (map, (<$>), (<>))
import Purescript.Api.Helpers (class QueryParam, ApiError, ApiEff, getAt, handleError, qp)

import LN.T.Internal.Types

getUserSanitizedPack :: forall qp. QueryParam qp => Array qp -> String -> ApiEff (Either (ApiError ApplicationError) UserSanitizedPackResponse)
getUserSanitizedPack params user_nick = handleError <$> getAt params ["user_sanitized_pack", user_nick]

getUserSanitizedPack' :: String -> ApiEff (Either (ApiError ApplicationError) UserSanitizedPackResponse)
getUserSanitizedPack' user_nick = handleError <$> getAt ([] :: Array Boolean) ["user_sanitized_pack", user_nick]

getOrganization :: forall qp. QueryParam qp => Array qp -> String -> ApiEff (Either (ApiError ApplicationError) OrganizationResponse)
getOrganization params organization_name = handleError <$> getAt params ["organization", organization_name]

getOrganization' :: String -> ApiEff (Either (ApiError ApplicationError) OrganizationResponse)
getOrganization' organization_name = handleError <$> getAt ([] :: Array Boolean) ["organization", organization_name]

getOrganizationPack :: forall qp. QueryParam qp => Array qp -> String -> ApiEff (Either (ApiError ApplicationError) OrganizationPackResponse)
getOrganizationPack params organization_name = handleError <$> getAt params ["organization_pack", organization_name]

getOrganizationPack' :: String -> ApiEff (Either (ApiError ApplicationError) OrganizationPackResponse)
getOrganizationPack' organization_name = handleError <$> getAt ([] :: Array Boolean) ["organization_pack", organization_name]

getTeam_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> String -> Int -> ApiEff (Either (ApiError ApplicationError) TeamResponse)
getTeam_ByOrganizationId params team_name _ByOrganizationId = handleError <$> getAt (map qp params <> map qp [ByOrganizationId _ByOrganizationId]) ["team", team_name]

getTeam_ByOrganizationId' :: String -> Int -> ApiEff (Either (ApiError ApplicationError) TeamResponse)
getTeam_ByOrganizationId' team_name _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["team", team_name]

getTeamPack_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> String -> Int -> ApiEff (Either (ApiError ApplicationError) TeamPackResponse)
getTeamPack_ByOrganizationId params team_name _ByOrganizationId = handleError <$> getAt (map qp params <> map qp [ByOrganizationId _ByOrganizationId]) ["team_pack", team_name]

getTeamPack_ByOrganizationId' :: String -> Int -> ApiEff (Either (ApiError ApplicationError) TeamPackResponse)
getTeamPack_ByOrganizationId' team_name _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["team_pack", team_name]

getGlobalGroup_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> String -> Int -> ApiEff (Either (ApiError ApplicationError) GlobalGroupResponse)
getGlobalGroup_ByOrganizationId params global_group_name _ByOrganizationId = handleError <$> getAt (map qp params <> map qp [ByOrganizationId _ByOrganizationId]) ["global_group", global_group_name]

getGlobalGroup_ByOrganizationId' :: String -> Int -> ApiEff (Either (ApiError ApplicationError) GlobalGroupResponse)
getGlobalGroup_ByOrganizationId' global_group_name _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["global_group", global_group_name]

getGlobalGroupPack_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> String -> Int -> ApiEff (Either (ApiError ApplicationError) GlobalGroupPackResponse)
getGlobalGroupPack_ByOrganizationId params global_group_name _ByOrganizationId = handleError <$> getAt (map qp params <> map qp [ByOrganizationId _ByOrganizationId]) ["global_group_pack", global_group_name]

getGlobalGroupPack_ByOrganizationId' :: String -> Int -> ApiEff (Either (ApiError ApplicationError) GlobalGroupPackResponse)
getGlobalGroupPack_ByOrganizationId' global_group_name _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["global_group_pack", global_group_name]

getGroup_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> String -> Int -> ApiEff (Either (ApiError ApplicationError) GroupResponse)
getGroup_ByOrganizationId params group_name _ByOrganizationId = handleError <$> getAt (map qp params <> map qp [ByOrganizationId _ByOrganizationId]) ["group", group_name]

getGroup_ByOrganizationId' :: String -> Int -> ApiEff (Either (ApiError ApplicationError) GroupResponse)
getGroup_ByOrganizationId' group_name _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["group", group_name]

getGroupPack_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> String -> Int -> ApiEff (Either (ApiError ApplicationError) GroupPackResponse)
getGroupPack_ByOrganizationId params group_name _ByOrganizationId = handleError <$> getAt (map qp params <> map qp [ByOrganizationId _ByOrganizationId]) ["group_pack", group_name]

getGroupPack_ByOrganizationId' :: String -> Int -> ApiEff (Either (ApiError ApplicationError) GroupPackResponse)
getGroupPack_ByOrganizationId' group_name _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["group_pack", group_name]

getForum_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> String -> Int -> ApiEff (Either (ApiError ApplicationError) ForumResponse)
getForum_ByOrganizationId params forum_name _ByOrganizationId = handleError <$> getAt (map qp params <> map qp [ByOrganizationId _ByOrganizationId]) ["forum", forum_name]

getForum_ByOrganizationId' :: String -> Int -> ApiEff (Either (ApiError ApplicationError) ForumResponse)
getForum_ByOrganizationId' forum_name _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["forum", forum_name]

getForumPack_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> String -> Int -> ApiEff (Either (ApiError ApplicationError) ForumPackResponse)
getForumPack_ByOrganizationId params forum_name _ByOrganizationId = handleError <$> getAt (map qp params <> map qp [ByOrganizationId _ByOrganizationId]) ["forum_pack", forum_name]

getForumPack_ByOrganizationId' :: String -> Int -> ApiEff (Either (ApiError ApplicationError) ForumPackResponse)
getForumPack_ByOrganizationId' forum_name _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["forum_pack", forum_name]

getBoard_ByForumId :: forall qp. QueryParam qp => Array qp -> String -> Int -> ApiEff (Either (ApiError ApplicationError) BoardResponse)
getBoard_ByForumId params board_name _ByForumId = handleError <$> getAt (map qp params <> map qp [ByForumId _ByForumId]) ["board", board_name]

getBoard_ByForumId' :: String -> Int -> ApiEff (Either (ApiError ApplicationError) BoardResponse)
getBoard_ByForumId' board_name _ByForumId = handleError <$> getAt [ByForumId _ByForumId] ["board", board_name]

getBoardPack_ByForumId :: forall qp. QueryParam qp => Array qp -> String -> Int -> ApiEff (Either (ApiError ApplicationError) BoardPackResponse)
getBoardPack_ByForumId params board_name _ByForumId = handleError <$> getAt (map qp params <> map qp [ByForumId _ByForumId]) ["board_pack", board_name]

getBoardPack_ByForumId' :: String -> Int -> ApiEff (Either (ApiError ApplicationError) BoardPackResponse)
getBoardPack_ByForumId' board_name _ByForumId = handleError <$> getAt [ByForumId _ByForumId] ["board_pack", board_name]

getThread_ByBoardId :: forall qp. QueryParam qp => Array qp -> String -> Int -> ApiEff (Either (ApiError ApplicationError) ThreadResponse)
getThread_ByBoardId params thread_name _ByBoardId = handleError <$> getAt (map qp params <> map qp [ByBoardId _ByBoardId]) ["thread", thread_name]

getThread_ByBoardId' :: String -> Int -> ApiEff (Either (ApiError ApplicationError) ThreadResponse)
getThread_ByBoardId' thread_name _ByBoardId = handleError <$> getAt [ByBoardId _ByBoardId] ["thread", thread_name]

getThreadPack_ByBoardId :: forall qp. QueryParam qp => Array qp -> String -> Int -> ApiEff (Either (ApiError ApplicationError) ThreadPackResponse)
getThreadPack_ByBoardId params thread_name _ByBoardId = handleError <$> getAt (map qp params <> map qp [ByBoardId _ByBoardId]) ["thread_pack", thread_name]

getThreadPack_ByBoardId' :: String -> Int -> ApiEff (Either (ApiError ApplicationError) ThreadPackResponse)
getThreadPack_ByBoardId' thread_name _ByBoardId = handleError <$> getAt [ByBoardId _ByBoardId] ["thread_pack", thread_name]

-- footer