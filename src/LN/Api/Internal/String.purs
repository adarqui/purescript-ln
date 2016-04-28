module LN.Api.Internal.String where


import Purescript.Api.Helpers
import Prelude
import Data.Either
import Data.Tuple

import Prelude
import Data.Either
import LN.T.Internal.Types

getUserSanitizedPack :: forall qp. QueryParam qp => Array qp -> String -> ApiEff (Either ApiError UserSanitizedPackResponse)
getUserSanitizedPack params user_nick = handleError <$> getAt params ["user_sanitized_pack", show user_nick]

getUserSanitizedPack' :: String -> ApiEff (Either ApiError UserSanitizedPackResponse)
getUserSanitizedPack' user_nick = handleError <$> getAt ([] :: Array Boolean) ["user_sanitized_pack", show user_nick]

getOrganization :: forall qp. QueryParam qp => Array qp -> String -> ApiEff (Either ApiError OrganizationResponse)
getOrganization params organization_name = handleError <$> getAt params ["organization", show organization_name]

getOrganization' :: String -> ApiEff (Either ApiError OrganizationResponse)
getOrganization' organization_name = handleError <$> getAt ([] :: Array Boolean) ["organization", show organization_name]

getForum :: forall qp. QueryParam qp => Array qp -> String -> ApiEff (Either ApiError ForumResponse)
getForum params forum_name = handleError <$> getAt params ["forum", show forum_name]

getForum' :: String -> ApiEff (Either ApiError ForumResponse)
getForum' forum_name = handleError <$> getAt ([] :: Array Boolean) ["forum", show forum_name]

getForum_ByOrganizationName :: forall qp. QueryParam qp => Array qp -> String -> ApiEff (Either ApiError ForumResponse)
getForum_ByOrganizationName params _ByOrganizationName = handleError <$> getAt (map qp params ++ map qp [ByOrganizationName _ByOrganizationName]) ["forum"]

getForum_ByOrganizationName' :: String -> ApiEff (Either ApiError ForumResponse)
getForum_ByOrganizationName' _ByOrganizationName = handleError <$> getAt [ByOrganizationName _ByOrganizationName] ["forum"]

getBoard :: forall qp. QueryParam qp => Array qp -> String -> ApiEff (Either ApiError BoardResponse)
getBoard params board_name = handleError <$> getAt params ["board", show board_name]

getBoard' :: String -> ApiEff (Either ApiError BoardResponse)
getBoard' board_name = handleError <$> getAt ([] :: Array Boolean) ["board", show board_name]

getBoard_ByForumId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError BoardResponse)
getBoard_ByForumId params _ByForumId = handleError <$> getAt (map qp params ++ map qp [ByForumId _ByForumId]) ["board"]

getBoard_ByForumId' :: Int -> ApiEff (Either ApiError BoardResponse)
getBoard_ByForumId' _ByForumId = handleError <$> getAt [ByForumId _ByForumId] ["board"]

getThread :: forall qp. QueryParam qp => Array qp -> String -> ApiEff (Either ApiError ThreadResponse)
getThread params thread_name = handleError <$> getAt params ["thread", show thread_name]

getThread' :: String -> ApiEff (Either ApiError ThreadResponse)
getThread' thread_name = handleError <$> getAt ([] :: Array Boolean) ["thread", show thread_name]

getThread_ByBoardId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ThreadResponse)
getThread_ByBoardId params _ByBoardId = handleError <$> getAt (map qp params ++ map qp [ByBoardId _ByBoardId]) ["thread"]

getThread_ByBoardId' :: Int -> ApiEff (Either ApiError ThreadResponse)
getThread_ByBoardId' _ByBoardId = handleError <$> getAt [ByBoardId _ByBoardId] ["thread"]

-- footer