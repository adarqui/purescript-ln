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

getForum_ByOrganizationName :: forall qp. QueryParam qp => Array qp -> String -> String -> ApiEff (Either ApiError ForumResponse)
getForum_ByOrganizationName params forum_name _ByOrganizationName = handleError <$> getAt (map qp params ++ map qp [ByOrganizationName _ByOrganizationName]) ["forum", forum_name]

getForum_ByOrganizationName' :: String -> String -> ApiEff (Either ApiError ForumResponse)
getForum_ByOrganizationName' forum_name _ByOrganizationName = handleError <$> getAt [ByOrganizationName _ByOrganizationName] ["forum", forum_name]

getBoard_ByForumId :: forall qp. QueryParam qp => Array qp -> String -> Int -> ApiEff (Either ApiError BoardResponse)
getBoard_ByForumId params board_name _ByForumId = handleError <$> getAt (map qp params ++ map qp [ByForumId _ByForumId]) ["board", board_name]

getBoard_ByForumId' :: String -> Int -> ApiEff (Either ApiError BoardResponse)
getBoard_ByForumId' board_name _ByForumId = handleError <$> getAt [ByForumId _ByForumId] ["board", board_name]

getThread_ByBoardId :: forall qp. QueryParam qp => Array qp -> String -> Int -> ApiEff (Either ApiError ThreadResponse)
getThread_ByBoardId params thread_name _ByBoardId = handleError <$> getAt (map qp params ++ map qp [ByBoardId _ByBoardId]) ["thread", thread_name]

getThread_ByBoardId' :: String -> Int -> ApiEff (Either ApiError ThreadResponse)
getThread_ByBoardId' thread_name _ByBoardId = handleError <$> getAt [ByBoardId _ByBoardId] ["thread", thread_name]

-- footer