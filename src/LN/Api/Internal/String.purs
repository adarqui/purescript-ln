module LN.Api.Internal.String where


import Purescript.Api.Helpers
import Prelude
import Data.Either
import Data.Tuple

import Prelude
import Data.Either
import LN.T.Internal.Types

getUserSanitizedPack :: forall qp. QueryParam qp => Array qp -> String -> ApiEff (Either ApiError UserSanitizedPackResponse)
getUserSanitizedPack params user_nick = handleError <$> getAt params ["user_sanitized_pack", user_nick]

getUserSanitizedPack' :: String -> ApiEff (Either ApiError UserSanitizedPackResponse)
getUserSanitizedPack' user_nick = handleError <$> getAt ([] :: Array Boolean) ["user_sanitized_pack", user_nick]

getOrganization :: forall qp. QueryParam qp => Array qp -> String -> ApiEff (Either ApiError OrganizationResponse)
getOrganization params organization_name = handleError <$> getAt params ["organization", organization_name]

getOrganization' :: String -> ApiEff (Either ApiError OrganizationResponse)
getOrganization' organization_name = handleError <$> getAt ([] :: Array Boolean) ["organization", organization_name]

getOrganizationPack :: forall qp. QueryParam qp => Array qp -> String -> ApiEff (Either ApiError OrganizationPackResponse)
getOrganizationPack params organization_name = handleError <$> getAt params ["organization_pack", organization_name]

getOrganizationPack' :: String -> ApiEff (Either ApiError OrganizationPackResponse)
getOrganizationPack' organization_name = handleError <$> getAt ([] :: Array Boolean) ["organization_pack", organization_name]

getForum_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> String -> Int -> ApiEff (Either ApiError ForumResponse)
getForum_ByOrganizationId params forum_name _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["forum", forum_name]

getForum_ByOrganizationId' :: String -> Int -> ApiEff (Either ApiError ForumResponse)
getForum_ByOrganizationId' forum_name _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["forum", forum_name]

getForumPack_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> String -> Int -> ApiEff (Either ApiError ForumPackResponse)
getForumPack_ByOrganizationId params forum_name _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["forum_pack", forum_name]

getForumPack_ByOrganizationId' :: String -> Int -> ApiEff (Either ApiError ForumPackResponse)
getForumPack_ByOrganizationId' forum_name _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["forum_pack", forum_name]

getBoard_ByForumId :: forall qp. QueryParam qp => Array qp -> String -> Int -> ApiEff (Either ApiError BoardResponse)
getBoard_ByForumId params board_name _ByForumId = handleError <$> getAt (map qp params ++ map qp [ByForumId _ByForumId]) ["board", board_name]

getBoard_ByForumId' :: String -> Int -> ApiEff (Either ApiError BoardResponse)
getBoard_ByForumId' board_name _ByForumId = handleError <$> getAt [ByForumId _ByForumId] ["board", board_name]

getBoardPack_ByForumId :: forall qp. QueryParam qp => Array qp -> String -> Int -> ApiEff (Either ApiError BoardPackResponse)
getBoardPack_ByForumId params board_name _ByForumId = handleError <$> getAt (map qp params ++ map qp [ByForumId _ByForumId]) ["board_pack", board_name]

getBoardPack_ByForumId' :: String -> Int -> ApiEff (Either ApiError BoardPackResponse)
getBoardPack_ByForumId' board_name _ByForumId = handleError <$> getAt [ByForumId _ByForumId] ["board_pack", board_name]

getThread_ByBoardId :: forall qp. QueryParam qp => Array qp -> String -> Int -> ApiEff (Either ApiError ThreadResponse)
getThread_ByBoardId params thread_name _ByBoardId = handleError <$> getAt (map qp params ++ map qp [ByBoardId _ByBoardId]) ["thread", thread_name]

getThread_ByBoardId' :: String -> Int -> ApiEff (Either ApiError ThreadResponse)
getThread_ByBoardId' thread_name _ByBoardId = handleError <$> getAt [ByBoardId _ByBoardId] ["thread", thread_name]

getThreadPack_ByBoardId :: forall qp. QueryParam qp => Array qp -> String -> Int -> ApiEff (Either ApiError ThreadPackResponse)
getThreadPack_ByBoardId params thread_name _ByBoardId = handleError <$> getAt (map qp params ++ map qp [ByBoardId _ByBoardId]) ["thread_pack", thread_name]

getThreadPack_ByBoardId' :: String -> Int -> ApiEff (Either ApiError ThreadPackResponse)
getThreadPack_ByBoardId' thread_name _ByBoardId = handleError <$> getAt [ByBoardId _ByBoardId] ["thread_pack", thread_name]

-- footer