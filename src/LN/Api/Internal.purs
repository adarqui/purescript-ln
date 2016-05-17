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

getBoards_ByBoardsIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError BoardResponses)
getBoards_ByBoardsIds params _ByBoardsIds = handleError <$> getAt (map qp params ++ map qp [ByBoardsIds _ByBoardsIds]) ["boards"]

getBoards_ByBoardsIds' :: (Array  Int) -> ApiEff (Either ApiError BoardResponses)
getBoards_ByBoardsIds' _ByBoardsIds = handleError <$> getAt [ByBoardsIds _ByBoardsIds] ["boards"]

getBoards_ByForumId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError BoardResponses)
getBoards_ByForumId params _ByForumId = handleError <$> getAt (map qp params ++ map qp [ByForumId _ByForumId]) ["boards"]

getBoards_ByForumId' :: Int -> ApiEff (Either ApiError BoardResponses)
getBoards_ByForumId' _ByForumId = handleError <$> getAt [ByForumId _ByForumId] ["boards"]

postBoard :: forall qp. QueryParam qp => Array qp -> BoardRequest -> ApiEff (Either ApiError BoardResponse)
postBoard params board_request = handleError <$> postAt params ["board"] board_request

postBoard' :: BoardRequest -> ApiEff (Either ApiError BoardResponse)
postBoard' board_request = handleError <$> postAt ([] :: Array Boolean) ["board"] board_request

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

getForums_ByForumsIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError ForumResponses)
getForums_ByForumsIds params _ByForumsIds = handleError <$> getAt (map qp params ++ map qp [ByForumsIds _ByForumsIds]) ["forums"]

getForums_ByForumsIds' :: (Array  Int) -> ApiEff (Either ApiError ForumResponses)
getForums_ByForumsIds' _ByForumsIds = handleError <$> getAt [ByForumsIds _ByForumsIds] ["forums"]

getForums_ByOrganizationId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ForumResponses)
getForums_ByOrganizationId params _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["forums"]

getForums_ByOrganizationId' :: Int -> ApiEff (Either ApiError ForumResponses)
getForums_ByOrganizationId' _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["forums"]

postForum :: forall qp. QueryParam qp => Array qp -> ForumRequest -> ApiEff (Either ApiError ForumResponse)
postForum params forum_request = handleError <$> postAt params ["forum"] forum_request

postForum' :: ForumRequest -> ApiEff (Either ApiError ForumResponse)
postForum' forum_request = handleError <$> postAt ([] :: Array Boolean) ["forum"] forum_request

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

getLeurons :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError LeuronResponses)
getLeurons params = handleError <$> getAt params ["leurons"]

getLeurons' :: ApiEff (Either ApiError LeuronResponses)
getLeurons'  = handleError <$> getAt ([] :: Array Boolean) ["leurons"]

postLeuron :: forall qp. QueryParam qp => Array qp -> LeuronRequest -> ApiEff (Either ApiError LeuronResponse)
postLeuron params leuron_request = handleError <$> postAt params ["leuron"] leuron_request

postLeuron' :: LeuronRequest -> ApiEff (Either ApiError LeuronResponse)
postLeuron' leuron_request = handleError <$> postAt ([] :: Array Boolean) ["leuron"] leuron_request

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

getLeuronLikeStats_ByLeuronsIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError LikeStatResponses)
getLeuronLikeStats_ByLeuronsIds params _ByLeuronsIds = handleError <$> getAt (map qp params ++ map qp [ByLeuronsIds _ByLeuronsIds]) ["leuron_like_stats"]

getLeuronLikeStats_ByLeuronsIds' :: (Array  Int) -> ApiEff (Either ApiError LikeStatResponses)
getLeuronLikeStats_ByLeuronsIds' _ByLeuronsIds = handleError <$> getAt [ByLeuronsIds _ByLeuronsIds] ["leuron_like_stats"]

getLeuronLikeStat :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError LikeStatResponse)
getLeuronLikeStat params leuron_like_id = handleError <$> getAt params ["leuron_like_stat", show leuron_like_id]

getLeuronLikeStat' :: Int -> ApiEff (Either ApiError LikeStatResponse)
getLeuronLikeStat' leuron_like_id = handleError <$> getAt ([] :: Array Boolean) ["leuron_like_stat", show leuron_like_id]

getLeuronStars :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError StarResponses)
getLeuronStars params = handleError <$> getAt params ["leuron_stars"]

getLeuronStars' :: ApiEff (Either ApiError StarResponses)
getLeuronStars'  = handleError <$> getAt ([] :: Array Boolean) ["leuron_stars"]

getLeuronStars_ByLeuronsIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError StarResponses)
getLeuronStars_ByLeuronsIds params _ByLeuronsIds = handleError <$> getAt (map qp params ++ map qp [ByLeuronsIds _ByLeuronsIds]) ["leuron_stars"]

getLeuronStars_ByLeuronsIds' :: (Array  Int) -> ApiEff (Either ApiError StarResponses)
getLeuronStars_ByLeuronsIds' _ByLeuronsIds = handleError <$> getAt [ByLeuronsIds _ByLeuronsIds] ["leuron_stars"]

getLeuronStars_ByLeuronId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarResponses)
getLeuronStars_ByLeuronId params _ByLeuronId = handleError <$> getAt (map qp params ++ map qp [ByLeuronId _ByLeuronId]) ["leuron_stars"]

getLeuronStars_ByLeuronId' :: Int -> ApiEff (Either ApiError StarResponses)
getLeuronStars_ByLeuronId' _ByLeuronId = handleError <$> getAt [ByLeuronId _ByLeuronId] ["leuron_stars"]

postLeuronStar_ByLeuronId :: forall qp. QueryParam qp => Array qp -> Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
postLeuronStar_ByLeuronId params _ByLeuronId star_request = handleError <$> postAt (map qp params ++ map qp [ByLeuronId _ByLeuronId]) ["leuron_star"] star_request

postLeuronStar_ByLeuronId' :: Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
postLeuronStar_ByLeuronId' _ByLeuronId star_request = handleError <$> postAt [ByLeuronId _ByLeuronId] ["leuron_star"] star_request

getLeuronStar :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarResponse)
getLeuronStar params leuron_star_id = handleError <$> getAt params ["leuron_star", show leuron_star_id]

getLeuronStar' :: Int -> ApiEff (Either ApiError StarResponse)
getLeuronStar' leuron_star_id = handleError <$> getAt ([] :: Array Boolean) ["leuron_star", show leuron_star_id]

putLeuronStar :: forall qp. QueryParam qp => Array qp -> Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
putLeuronStar params leuron_star_id star_request = handleError <$> putAt params ["leuron_star", show leuron_star_id] star_request

putLeuronStar' :: Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
putLeuronStar' leuron_star_id star_request = handleError <$> putAt ([] :: Array Boolean) ["leuron_star", show leuron_star_id] star_request

deleteLeuronStar :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deleteLeuronStar params leuron_star_id = handleError <$> deleteAt params ["leuron_star", show leuron_star_id]

deleteLeuronStar' :: Int -> ApiEff (Either ApiError Unit)
deleteLeuronStar' leuron_star_id = handleError <$> deleteAt ([] :: Array Boolean) ["leuron_star", show leuron_star_id]

getLeuronStarStats_ByLeuronsIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError StarStatResponses)
getLeuronStarStats_ByLeuronsIds params _ByLeuronsIds = handleError <$> getAt (map qp params ++ map qp [ByLeuronsIds _ByLeuronsIds]) ["leuron_star_stats"]

getLeuronStarStats_ByLeuronsIds' :: (Array  Int) -> ApiEff (Either ApiError StarStatResponses)
getLeuronStarStats_ByLeuronsIds' _ByLeuronsIds = handleError <$> getAt [ByLeuronsIds _ByLeuronsIds] ["leuron_star_stats"]

getLeuronStarStat :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarStatResponse)
getLeuronStarStat params leuron_star_id = handleError <$> getAt params ["leuron_star_stat", show leuron_star_id]

getLeuronStarStat' :: Int -> ApiEff (Either ApiError StarStatResponse)
getLeuronStarStat' leuron_star_id = handleError <$> getAt ([] :: Array Boolean) ["leuron_star_stat", show leuron_star_id]

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

postPm :: forall qp. QueryParam qp => Array qp -> PmRequest -> ApiEff (Either ApiError PmResponse)
postPm params pm_request = handleError <$> postAt params ["pm"] pm_request

postPm' :: PmRequest -> ApiEff (Either ApiError PmResponse)
postPm' pm_request = handleError <$> postAt ([] :: Array Boolean) ["pm"] pm_request

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

getResourceStats_ByResourcesIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError ResourceStatResponses)
getResourceStats_ByResourcesIds params _ByResourcesIds = handleError <$> getAt (map qp params ++ map qp [ByResourcesIds _ByResourcesIds]) ["resource_stats"]

getResourceStats_ByResourcesIds' :: (Array  Int) -> ApiEff (Either ApiError ResourceStatResponses)
getResourceStats_ByResourcesIds' _ByResourcesIds = handleError <$> getAt [ByResourcesIds _ByResourcesIds] ["resource_stats"]

getResourceStat :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ResourceStatResponse)
getResourceStat params resource_id = handleError <$> getAt params ["resource_stat", show resource_id]

getResourceStat' :: Int -> ApiEff (Either ApiError ResourceStatResponse)
getResourceStat' resource_id = handleError <$> getAt ([] :: Array Boolean) ["resource_stat", show resource_id]

getResourceLikes :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError LikeResponses)
getResourceLikes params = handleError <$> getAt params ["resource_likes"]

getResourceLikes' :: ApiEff (Either ApiError LikeResponses)
getResourceLikes'  = handleError <$> getAt ([] :: Array Boolean) ["resource_likes"]

getResourceLikes_ByResourcesIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError LikeResponses)
getResourceLikes_ByResourcesIds params _ByResourcesIds = handleError <$> getAt (map qp params ++ map qp [ByResourcesIds _ByResourcesIds]) ["resource_likes"]

getResourceLikes_ByResourcesIds' :: (Array  Int) -> ApiEff (Either ApiError LikeResponses)
getResourceLikes_ByResourcesIds' _ByResourcesIds = handleError <$> getAt [ByResourcesIds _ByResourcesIds] ["resource_likes"]

getResourceLikes_ByResourceId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError LikeResponses)
getResourceLikes_ByResourceId params _ByResourceId = handleError <$> getAt (map qp params ++ map qp [ByResourceId _ByResourceId]) ["resource_likes"]

getResourceLikes_ByResourceId' :: Int -> ApiEff (Either ApiError LikeResponses)
getResourceLikes_ByResourceId' _ByResourceId = handleError <$> getAt [ByResourceId _ByResourceId] ["resource_likes"]

postResourceLike_ByResourceId :: forall qp. QueryParam qp => Array qp -> Int -> LikeRequest -> ApiEff (Either ApiError LikeResponse)
postResourceLike_ByResourceId params _ByResourceId like_request = handleError <$> postAt (map qp params ++ map qp [ByResourceId _ByResourceId]) ["resource_like"] like_request

postResourceLike_ByResourceId' :: Int -> LikeRequest -> ApiEff (Either ApiError LikeResponse)
postResourceLike_ByResourceId' _ByResourceId like_request = handleError <$> postAt [ByResourceId _ByResourceId] ["resource_like"] like_request

getResourceLike :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError LikeResponse)
getResourceLike params resource_like_id = handleError <$> getAt params ["resource_like", show resource_like_id]

getResourceLike' :: Int -> ApiEff (Either ApiError LikeResponse)
getResourceLike' resource_like_id = handleError <$> getAt ([] :: Array Boolean) ["resource_like", show resource_like_id]

putResourceLike :: forall qp. QueryParam qp => Array qp -> Int -> LikeRequest -> ApiEff (Either ApiError LikeResponse)
putResourceLike params resource_like_id like_request = handleError <$> putAt params ["resource_like", show resource_like_id] like_request

putResourceLike' :: Int -> LikeRequest -> ApiEff (Either ApiError LikeResponse)
putResourceLike' resource_like_id like_request = handleError <$> putAt ([] :: Array Boolean) ["resource_like", show resource_like_id] like_request

deleteResourceLike :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deleteResourceLike params resource_like_id = handleError <$> deleteAt params ["resource_like", show resource_like_id]

deleteResourceLike' :: Int -> ApiEff (Either ApiError Unit)
deleteResourceLike' resource_like_id = handleError <$> deleteAt ([] :: Array Boolean) ["resource_like", show resource_like_id]

getResourceLikeStats_ByResourcesIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError LikeStatResponses)
getResourceLikeStats_ByResourcesIds params _ByResourcesIds = handleError <$> getAt (map qp params ++ map qp [ByResourcesIds _ByResourcesIds]) ["resource_like_stats"]

getResourceLikeStats_ByResourcesIds' :: (Array  Int) -> ApiEff (Either ApiError LikeStatResponses)
getResourceLikeStats_ByResourcesIds' _ByResourcesIds = handleError <$> getAt [ByResourcesIds _ByResourcesIds] ["resource_like_stats"]

getResourceLikeStat :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError LikeStatResponse)
getResourceLikeStat params resource_like_id = handleError <$> getAt params ["resource_like_stat", show resource_like_id]

getResourceLikeStat' :: Int -> ApiEff (Either ApiError LikeStatResponse)
getResourceLikeStat' resource_like_id = handleError <$> getAt ([] :: Array Boolean) ["resource_like_stat", show resource_like_id]

getResourceStars :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError StarResponses)
getResourceStars params = handleError <$> getAt params ["resource_stars"]

getResourceStars' :: ApiEff (Either ApiError StarResponses)
getResourceStars'  = handleError <$> getAt ([] :: Array Boolean) ["resource_stars"]

getResourceStars_ByResourcesIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError StarResponses)
getResourceStars_ByResourcesIds params _ByResourcesIds = handleError <$> getAt (map qp params ++ map qp [ByResourcesIds _ByResourcesIds]) ["resource_stars"]

getResourceStars_ByResourcesIds' :: (Array  Int) -> ApiEff (Either ApiError StarResponses)
getResourceStars_ByResourcesIds' _ByResourcesIds = handleError <$> getAt [ByResourcesIds _ByResourcesIds] ["resource_stars"]

getResourceStars_ByResourceId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarResponses)
getResourceStars_ByResourceId params _ByResourceId = handleError <$> getAt (map qp params ++ map qp [ByResourceId _ByResourceId]) ["resource_stars"]

getResourceStars_ByResourceId' :: Int -> ApiEff (Either ApiError StarResponses)
getResourceStars_ByResourceId' _ByResourceId = handleError <$> getAt [ByResourceId _ByResourceId] ["resource_stars"]

postResourceStar_ByResourceId :: forall qp. QueryParam qp => Array qp -> Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
postResourceStar_ByResourceId params _ByResourceId star_request = handleError <$> postAt (map qp params ++ map qp [ByResourceId _ByResourceId]) ["resource_star"] star_request

postResourceStar_ByResourceId' :: Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
postResourceStar_ByResourceId' _ByResourceId star_request = handleError <$> postAt [ByResourceId _ByResourceId] ["resource_star"] star_request

getResourceStar :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarResponse)
getResourceStar params resource_star_id = handleError <$> getAt params ["resource_star", show resource_star_id]

getResourceStar' :: Int -> ApiEff (Either ApiError StarResponse)
getResourceStar' resource_star_id = handleError <$> getAt ([] :: Array Boolean) ["resource_star", show resource_star_id]

putResourceStar :: forall qp. QueryParam qp => Array qp -> Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
putResourceStar params resource_star_id star_request = handleError <$> putAt params ["resource_star", show resource_star_id] star_request

putResourceStar' :: Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
putResourceStar' resource_star_id star_request = handleError <$> putAt ([] :: Array Boolean) ["resource_star", show resource_star_id] star_request

deleteResourceStar :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deleteResourceStar params resource_star_id = handleError <$> deleteAt params ["resource_star", show resource_star_id]

deleteResourceStar' :: Int -> ApiEff (Either ApiError Unit)
deleteResourceStar' resource_star_id = handleError <$> deleteAt ([] :: Array Boolean) ["resource_star", show resource_star_id]

getResourceStarStats_ByResourcesIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError StarStatResponses)
getResourceStarStats_ByResourcesIds params _ByResourcesIds = handleError <$> getAt (map qp params ++ map qp [ByResourcesIds _ByResourcesIds]) ["resource_star_stats"]

getResourceStarStats_ByResourcesIds' :: (Array  Int) -> ApiEff (Either ApiError StarStatResponses)
getResourceStarStats_ByResourcesIds' _ByResourcesIds = handleError <$> getAt [ByResourcesIds _ByResourcesIds] ["resource_star_stats"]

getResourceStarStat :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarStatResponse)
getResourceStarStat params resource_star_id = handleError <$> getAt params ["resource_star_stat", show resource_star_id]

getResourceStarStat' :: Int -> ApiEff (Either ApiError StarStatResponse)
getResourceStarStat' resource_star_id = handleError <$> getAt ([] :: Array Boolean) ["resource_star_stat", show resource_star_id]

getTeams :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError TeamResponses)
getTeams params = handleError <$> getAt params ["teams"]

getTeams' :: ApiEff (Either ApiError TeamResponses)
getTeams'  = handleError <$> getAt ([] :: Array Boolean) ["teams"]

postTeam :: forall qp. QueryParam qp => Array qp -> TeamRequest -> ApiEff (Either ApiError TeamResponse)
postTeam params team_request = handleError <$> postAt params ["team"] team_request

postTeam' :: TeamRequest -> ApiEff (Either ApiError TeamResponse)
postTeam' team_request = handleError <$> postAt ([] :: Array Boolean) ["team"] team_request

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

getThreadPostStats_ByThreadPostsIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError ThreadPostStatResponses)
getThreadPostStats_ByThreadPostsIds params _ByThreadPostsIds = handleError <$> getAt (map qp params ++ map qp [ByThreadPostsIds _ByThreadPostsIds]) ["thread_post_stats"]

getThreadPostStats_ByThreadPostsIds' :: (Array  Int) -> ApiEff (Either ApiError ThreadPostStatResponses)
getThreadPostStats_ByThreadPostsIds' _ByThreadPostsIds = handleError <$> getAt [ByThreadPostsIds _ByThreadPostsIds] ["thread_post_stats"]

getThreadPostStat :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ThreadPostStatResponse)
getThreadPostStat params thread_post_id = handleError <$> getAt params ["thread_post_stat", show thread_post_id]

getThreadPostStat' :: Int -> ApiEff (Either ApiError ThreadPostStatResponse)
getThreadPostStat' thread_post_id = handleError <$> getAt ([] :: Array Boolean) ["thread_post_stat", show thread_post_id]

getThreadPostLikes :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError LikeResponses)
getThreadPostLikes params = handleError <$> getAt params ["thread_post_likes"]

getThreadPostLikes' :: ApiEff (Either ApiError LikeResponses)
getThreadPostLikes'  = handleError <$> getAt ([] :: Array Boolean) ["thread_post_likes"]

getThreadPostLikes_ByThreadPostLikesIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError LikeResponses)
getThreadPostLikes_ByThreadPostLikesIds params _ByThreadPostLikesIds = handleError <$> getAt (map qp params ++ map qp [ByThreadPostLikesIds _ByThreadPostLikesIds]) ["thread_post_likes"]

getThreadPostLikes_ByThreadPostLikesIds' :: (Array  Int) -> ApiEff (Either ApiError LikeResponses)
getThreadPostLikes_ByThreadPostLikesIds' _ByThreadPostLikesIds = handleError <$> getAt [ByThreadPostLikesIds _ByThreadPostLikesIds] ["thread_post_likes"]

getThreadPostLikes_ByThreadPostsIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError LikeResponses)
getThreadPostLikes_ByThreadPostsIds params _ByThreadPostsIds = handleError <$> getAt (map qp params ++ map qp [ByThreadPostsIds _ByThreadPostsIds]) ["thread_post_likes"]

getThreadPostLikes_ByThreadPostsIds' :: (Array  Int) -> ApiEff (Either ApiError LikeResponses)
getThreadPostLikes_ByThreadPostsIds' _ByThreadPostsIds = handleError <$> getAt [ByThreadPostsIds _ByThreadPostsIds] ["thread_post_likes"]

getThreadPostLikes_ByThreadPostId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError LikeResponses)
getThreadPostLikes_ByThreadPostId params _ByThreadPostId = handleError <$> getAt (map qp params ++ map qp [ByThreadPostId _ByThreadPostId]) ["thread_post_likes"]

getThreadPostLikes_ByThreadPostId' :: Int -> ApiEff (Either ApiError LikeResponses)
getThreadPostLikes_ByThreadPostId' _ByThreadPostId = handleError <$> getAt [ByThreadPostId _ByThreadPostId] ["thread_post_likes"]

postThreadPostLike_ByThreadPostId :: forall qp. QueryParam qp => Array qp -> Int -> LikeRequest -> ApiEff (Either ApiError LikeResponse)
postThreadPostLike_ByThreadPostId params _ByThreadPostId like_request = handleError <$> postAt (map qp params ++ map qp [ByThreadPostId _ByThreadPostId]) ["thread_post_like"] like_request

postThreadPostLike_ByThreadPostId' :: Int -> LikeRequest -> ApiEff (Either ApiError LikeResponse)
postThreadPostLike_ByThreadPostId' _ByThreadPostId like_request = handleError <$> postAt [ByThreadPostId _ByThreadPostId] ["thread_post_like"] like_request

getThreadPostLike :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError LikeResponse)
getThreadPostLike params thread_post_like_id = handleError <$> getAt params ["thread_post_like", show thread_post_like_id]

getThreadPostLike' :: Int -> ApiEff (Either ApiError LikeResponse)
getThreadPostLike' thread_post_like_id = handleError <$> getAt ([] :: Array Boolean) ["thread_post_like", show thread_post_like_id]

putThreadPostLike :: forall qp. QueryParam qp => Array qp -> Int -> LikeRequest -> ApiEff (Either ApiError LikeResponse)
putThreadPostLike params thread_post_like_id like_request = handleError <$> putAt params ["thread_post_like", show thread_post_like_id] like_request

putThreadPostLike' :: Int -> LikeRequest -> ApiEff (Either ApiError LikeResponse)
putThreadPostLike' thread_post_like_id like_request = handleError <$> putAt ([] :: Array Boolean) ["thread_post_like", show thread_post_like_id] like_request

deleteThreadPostLike :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deleteThreadPostLike params thread_post_like_id = handleError <$> deleteAt params ["thread_post_like", show thread_post_like_id]

deleteThreadPostLike' :: Int -> ApiEff (Either ApiError Unit)
deleteThreadPostLike' thread_post_like_id = handleError <$> deleteAt ([] :: Array Boolean) ["thread_post_like", show thread_post_like_id]

getThreadPostLikeStats_ByThreadPostsIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError LikeStatResponses)
getThreadPostLikeStats_ByThreadPostsIds params _ByThreadPostsIds = handleError <$> getAt (map qp params ++ map qp [ByThreadPostsIds _ByThreadPostsIds]) ["thread_post_like_stats"]

getThreadPostLikeStats_ByThreadPostsIds' :: (Array  Int) -> ApiEff (Either ApiError LikeStatResponses)
getThreadPostLikeStats_ByThreadPostsIds' _ByThreadPostsIds = handleError <$> getAt [ByThreadPostsIds _ByThreadPostsIds] ["thread_post_like_stats"]

getThreadPostLikeStats_ByThreadPostLikesIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError LikeStatResponses)
getThreadPostLikeStats_ByThreadPostLikesIds params _ByThreadPostLikesIds = handleError <$> getAt (map qp params ++ map qp [ByThreadPostLikesIds _ByThreadPostLikesIds]) ["thread_post_like_stats"]

getThreadPostLikeStats_ByThreadPostLikesIds' :: (Array  Int) -> ApiEff (Either ApiError LikeStatResponses)
getThreadPostLikeStats_ByThreadPostLikesIds' _ByThreadPostLikesIds = handleError <$> getAt [ByThreadPostLikesIds _ByThreadPostLikesIds] ["thread_post_like_stats"]

getThreadPostLikeStat :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError LikeStatResponse)
getThreadPostLikeStat params thread_post_like_id = handleError <$> getAt params ["thread_post_like_stat", show thread_post_like_id]

getThreadPostLikeStat' :: Int -> ApiEff (Either ApiError LikeStatResponse)
getThreadPostLikeStat' thread_post_like_id = handleError <$> getAt ([] :: Array Boolean) ["thread_post_like_stat", show thread_post_like_id]

getThreadPostStars :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError StarResponses)
getThreadPostStars params = handleError <$> getAt params ["thread_post_stars"]

getThreadPostStars' :: ApiEff (Either ApiError StarResponses)
getThreadPostStars'  = handleError <$> getAt ([] :: Array Boolean) ["thread_post_stars"]

getThreadPostStars_ByThreadPostStarsIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError StarResponses)
getThreadPostStars_ByThreadPostStarsIds params _ByThreadPostStarsIds = handleError <$> getAt (map qp params ++ map qp [ByThreadPostStarsIds _ByThreadPostStarsIds]) ["thread_post_stars"]

getThreadPostStars_ByThreadPostStarsIds' :: (Array  Int) -> ApiEff (Either ApiError StarResponses)
getThreadPostStars_ByThreadPostStarsIds' _ByThreadPostStarsIds = handleError <$> getAt [ByThreadPostStarsIds _ByThreadPostStarsIds] ["thread_post_stars"]

getThreadPostStars_ByThreadPostsIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError StarResponses)
getThreadPostStars_ByThreadPostsIds params _ByThreadPostsIds = handleError <$> getAt (map qp params ++ map qp [ByThreadPostsIds _ByThreadPostsIds]) ["thread_post_stars"]

getThreadPostStars_ByThreadPostsIds' :: (Array  Int) -> ApiEff (Either ApiError StarResponses)
getThreadPostStars_ByThreadPostsIds' _ByThreadPostsIds = handleError <$> getAt [ByThreadPostsIds _ByThreadPostsIds] ["thread_post_stars"]

getThreadPostStars_ByThreadPostId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarResponses)
getThreadPostStars_ByThreadPostId params _ByThreadPostId = handleError <$> getAt (map qp params ++ map qp [ByThreadPostId _ByThreadPostId]) ["thread_post_stars"]

getThreadPostStars_ByThreadPostId' :: Int -> ApiEff (Either ApiError StarResponses)
getThreadPostStars_ByThreadPostId' _ByThreadPostId = handleError <$> getAt [ByThreadPostId _ByThreadPostId] ["thread_post_stars"]

postThreadPostStar_ByThreadPostId :: forall qp. QueryParam qp => Array qp -> Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
postThreadPostStar_ByThreadPostId params _ByThreadPostId star_request = handleError <$> postAt (map qp params ++ map qp [ByThreadPostId _ByThreadPostId]) ["thread_post_star"] star_request

postThreadPostStar_ByThreadPostId' :: Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
postThreadPostStar_ByThreadPostId' _ByThreadPostId star_request = handleError <$> postAt [ByThreadPostId _ByThreadPostId] ["thread_post_star"] star_request

getThreadPostStar :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarResponse)
getThreadPostStar params thread_post_star_id = handleError <$> getAt params ["thread_post_star", show thread_post_star_id]

getThreadPostStar' :: Int -> ApiEff (Either ApiError StarResponse)
getThreadPostStar' thread_post_star_id = handleError <$> getAt ([] :: Array Boolean) ["thread_post_star", show thread_post_star_id]

putThreadPostStar :: forall qp. QueryParam qp => Array qp -> Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
putThreadPostStar params thread_post_star_id star_request = handleError <$> putAt params ["thread_post_star", show thread_post_star_id] star_request

putThreadPostStar' :: Int -> StarRequest -> ApiEff (Either ApiError StarResponse)
putThreadPostStar' thread_post_star_id star_request = handleError <$> putAt ([] :: Array Boolean) ["thread_post_star", show thread_post_star_id] star_request

deleteThreadPostStar :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError Unit)
deleteThreadPostStar params thread_post_star_id = handleError <$> deleteAt params ["thread_post_star", show thread_post_star_id]

deleteThreadPostStar' :: Int -> ApiEff (Either ApiError Unit)
deleteThreadPostStar' thread_post_star_id = handleError <$> deleteAt ([] :: Array Boolean) ["thread_post_star", show thread_post_star_id]

getThreadPostStarStats_ByThreadPostsIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError StarStatResponses)
getThreadPostStarStats_ByThreadPostsIds params _ByThreadPostsIds = handleError <$> getAt (map qp params ++ map qp [ByThreadPostsIds _ByThreadPostsIds]) ["thread_post_star_stats"]

getThreadPostStarStats_ByThreadPostsIds' :: (Array  Int) -> ApiEff (Either ApiError StarStatResponses)
getThreadPostStarStats_ByThreadPostsIds' _ByThreadPostsIds = handleError <$> getAt [ByThreadPostsIds _ByThreadPostsIds] ["thread_post_star_stats"]

getThreadPostStarStats_ByThreadPostStarsIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError StarStatResponses)
getThreadPostStarStats_ByThreadPostStarsIds params _ByThreadPostStarsIds = handleError <$> getAt (map qp params ++ map qp [ByThreadPostStarsIds _ByThreadPostStarsIds]) ["thread_post_star_stats"]

getThreadPostStarStats_ByThreadPostStarsIds' :: (Array  Int) -> ApiEff (Either ApiError StarStatResponses)
getThreadPostStarStats_ByThreadPostStarsIds' _ByThreadPostStarsIds = handleError <$> getAt [ByThreadPostStarsIds _ByThreadPostStarsIds] ["thread_post_star_stats"]

getThreadPostStarStat :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError StarStatResponse)
getThreadPostStarStat params thread_post_star_id = handleError <$> getAt params ["thread_post_star_stat", show thread_post_star_id]

getThreadPostStarStat' :: Int -> ApiEff (Either ApiError StarStatResponse)
getThreadPostStarStat' thread_post_star_id = handleError <$> getAt ([] :: Array Boolean) ["thread_post_star_stat", show thread_post_star_id]

getUsers :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError UserResponses)
getUsers params = handleError <$> getAt params ["users"]

getUsers' :: ApiEff (Either ApiError UserResponses)
getUsers'  = handleError <$> getAt ([] :: Array Boolean) ["users"]

getUsers_ByUsersIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError UserResponses)
getUsers_ByUsersIds params _ByUsersIds = handleError <$> getAt (map qp params ++ map qp [ByUsersIds _ByUsersIds]) ["users"]

getUsers_ByUsersIds' :: (Array  Int) -> ApiEff (Either ApiError UserResponses)
getUsers_ByUsersIds' _ByUsersIds = handleError <$> getAt [ByUsersIds _ByUsersIds] ["users"]

getUsers_ByUsersNicks :: forall qp. QueryParam qp => Array qp -> (Array  String) -> ApiEff (Either ApiError UserResponses)
getUsers_ByUsersNicks params _ByUsersNicks = handleError <$> getAt (map qp params ++ map qp [ByUsersNicks _ByUsersNicks]) ["users"]

getUsers_ByUsersNicks' :: (Array  String) -> ApiEff (Either ApiError UserResponses)
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

getUserProfiles_ByUsersIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError ProfileResponses)
getUserProfiles_ByUsersIds params _ByUsersIds = handleError <$> getAt (map qp params ++ map qp [ByUsersIds _ByUsersIds]) ["user_profiles"]

getUserProfiles_ByUsersIds' :: (Array  Int) -> ApiEff (Either ApiError ProfileResponses)
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

getUsersSanitized_ByUsersIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError UserSanitizedResponses)
getUsersSanitized_ByUsersIds params _ByUsersIds = handleError <$> getAt (map qp params ++ map qp [ByUsersIds _ByUsersIds]) ["users_sanitized"]

getUsersSanitized_ByUsersIds' :: (Array  Int) -> ApiEff (Either ApiError UserSanitizedResponses)
getUsersSanitized_ByUsersIds' _ByUsersIds = handleError <$> getAt [ByUsersIds _ByUsersIds] ["users_sanitized"]

getUsersSanitized_ByUsersNicks :: forall qp. QueryParam qp => Array qp -> (Array  String) -> ApiEff (Either ApiError UserSanitizedResponses)
getUsersSanitized_ByUsersNicks params _ByUsersNicks = handleError <$> getAt (map qp params ++ map qp [ByUsersNicks _ByUsersNicks]) ["users_sanitized"]

getUsersSanitized_ByUsersNicks' :: (Array  String) -> ApiEff (Either ApiError UserSanitizedResponses)
getUsersSanitized_ByUsersNicks' _ByUsersNicks = handleError <$> getAt [ByUsersNicks _ByUsersNicks] ["users_sanitized"]

getUserSanitized :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError UserSanitizedResponse)
getUserSanitized params user_id = handleError <$> getAt params ["user_sanitized", show user_id]

getUserSanitized' :: Int -> ApiEff (Either ApiError UserSanitizedResponse)
getUserSanitized' user_id = handleError <$> getAt ([] :: Array Boolean) ["user_sanitized", show user_id]

getUserSanitizedStats :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError UserSanitizedStatResponse)
getUserSanitizedStats params = handleError <$> getAt params ["user_sanitized_stats"]

getUserSanitizedStats' :: ApiEff (Either ApiError UserSanitizedStatResponse)
getUserSanitizedStats'  = handleError <$> getAt ([] :: Array Boolean) ["user_sanitized_stats"]

getUserSanitizedStats_ByUsersIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError UserSanitizedStatResponse)
getUserSanitizedStats_ByUsersIds params _ByUsersIds = handleError <$> getAt (map qp params ++ map qp [ByUsersIds _ByUsersIds]) ["user_sanitized_stats"]

getUserSanitizedStats_ByUsersIds' :: (Array  Int) -> ApiEff (Either ApiError UserSanitizedStatResponse)
getUserSanitizedStats_ByUsersIds' _ByUsersIds = handleError <$> getAt [ByUsersIds _ByUsersIds] ["user_sanitized_stats"]

getUserSanitizedStat :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError UserSanitizedStatResponse)
getUserSanitizedStat params user_id = handleError <$> getAt params ["user_sanitized_stat", show user_id]

getUserSanitizedStat' :: Int -> ApiEff (Either ApiError UserSanitizedStatResponse)
getUserSanitizedStat' user_id = handleError <$> getAt ([] :: Array Boolean) ["user_sanitized_stat", show user_id]

getOrganizationPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError OrganizationPackResponses)
getOrganizationPacks params = handleError <$> getAt params ["organization_packs"]

getOrganizationPacks' :: ApiEff (Either ApiError OrganizationPackResponses)
getOrganizationPacks'  = handleError <$> getAt ([] :: Array Boolean) ["organization_packs"]

getOrganizationPacks_ByOrganizationsIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError OrganizationPackResponses)
getOrganizationPacks_ByOrganizationsIds params _ByOrganizationsIds = handleError <$> getAt (map qp params ++ map qp [ByOrganizationsIds _ByOrganizationsIds]) ["organization_packs"]

getOrganizationPacks_ByOrganizationsIds' :: (Array  Int) -> ApiEff (Either ApiError OrganizationPackResponses)
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

getUserPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError UserPackResponses)
getUserPacks params = handleError <$> getAt params ["user_packs"]

getUserPacks' :: ApiEff (Either ApiError UserPackResponses)
getUserPacks'  = handleError <$> getAt ([] :: Array Boolean) ["user_packs"]

getUserPacks_ByUsersIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError UserPackResponses)
getUserPacks_ByUsersIds params _ByUsersIds = handleError <$> getAt (map qp params ++ map qp [ByUsersIds _ByUsersIds]) ["user_packs"]

getUserPacks_ByUsersIds' :: (Array  Int) -> ApiEff (Either ApiError UserPackResponses)
getUserPacks_ByUsersIds' _ByUsersIds = handleError <$> getAt [ByUsersIds _ByUsersIds] ["user_packs"]

getUserPack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError UserPackResponse)
getUserPack params user_id = handleError <$> getAt params ["user_pack", show user_id]

getUserPack' :: Int -> ApiEff (Either ApiError UserPackResponse)
getUserPack' user_id = handleError <$> getAt ([] :: Array Boolean) ["user_pack", show user_id]

getUserSanitizedPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError UserSanitizedPackResponses)
getUserSanitizedPacks params = handleError <$> getAt params ["user_sanitized_packs"]

getUserSanitizedPacks' :: ApiEff (Either ApiError UserSanitizedPackResponses)
getUserSanitizedPacks'  = handleError <$> getAt ([] :: Array Boolean) ["user_sanitized_packs"]

getUserSanitizedPacks_ByUsersIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError UserSanitizedPackResponses)
getUserSanitizedPacks_ByUsersIds params _ByUsersIds = handleError <$> getAt (map qp params ++ map qp [ByUsersIds _ByUsersIds]) ["user_sanitized_packs"]

getUserSanitizedPacks_ByUsersIds' :: (Array  Int) -> ApiEff (Either ApiError UserSanitizedPackResponses)
getUserSanitizedPacks_ByUsersIds' _ByUsersIds = handleError <$> getAt [ByUsersIds _ByUsersIds] ["user_sanitized_packs"]

getUserSanitizedPack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError UserSanitizedPackResponse)
getUserSanitizedPack params user_id = handleError <$> getAt params ["user_sanitized_pack", show user_id]

getUserSanitizedPack' :: Int -> ApiEff (Either ApiError UserSanitizedPackResponse)
getUserSanitizedPack' user_id = handleError <$> getAt ([] :: Array Boolean) ["user_sanitized_pack", show user_id]

getForumPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError ForumPackResponses)
getForumPacks params = handleError <$> getAt params ["forum_packs"]

getForumPacks' :: ApiEff (Either ApiError ForumPackResponses)
getForumPacks'  = handleError <$> getAt ([] :: Array Boolean) ["forum_packs"]

getForumPacks_ByForumId :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ForumPackResponses)
getForumPacks_ByForumId params _ByForumId = handleError <$> getAt (map qp params ++ map qp [ByForumId _ByForumId]) ["forum_packs"]

getForumPacks_ByForumId' :: Int -> ApiEff (Either ApiError ForumPackResponses)
getForumPacks_ByForumId' _ByForumId = handleError <$> getAt [ByForumId _ByForumId] ["forum_packs"]

getForumPacks_ByForumsIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError ForumPackResponses)
getForumPacks_ByForumsIds params _ByForumsIds = handleError <$> getAt (map qp params ++ map qp [ByForumsIds _ByForumsIds]) ["forum_packs"]

getForumPacks_ByForumsIds' :: (Array  Int) -> ApiEff (Either ApiError ForumPackResponses)
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

getBoardPacks_ByBoardsIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError BoardPackResponses)
getBoardPacks_ByBoardsIds params _ByBoardsIds = handleError <$> getAt (map qp params ++ map qp [ByBoardsIds _ByBoardsIds]) ["board_packs"]

getBoardPacks_ByBoardsIds' :: (Array  Int) -> ApiEff (Either ApiError BoardPackResponses)
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

getThreadPacks_ByThreadsIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError ThreadPackResponses)
getThreadPacks_ByThreadsIds params _ByThreadsIds = handleError <$> getAt (map qp params ++ map qp [ByThreadsIds _ByThreadsIds]) ["thread_packs"]

getThreadPacks_ByThreadsIds' :: (Array  Int) -> ApiEff (Either ApiError ThreadPackResponses)
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

getThreadPostPacks_ByThreadPostsIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError ThreadPostPackResponses)
getThreadPostPacks_ByThreadPostsIds params _ByThreadPostsIds = handleError <$> getAt (map qp params ++ map qp [ByThreadPostsIds _ByThreadPostsIds]) ["thread_post_packs"]

getThreadPostPacks_ByThreadPostsIds' :: (Array  Int) -> ApiEff (Either ApiError ThreadPostPackResponses)
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

getResourcePacks_ByResourcesIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError ResourcePackResponses)
getResourcePacks_ByResourcesIds params _ByResourcesIds = handleError <$> getAt (map qp params ++ map qp [ByResourcesIds _ByResourcesIds]) ["resource_packs"]

getResourcePacks_ByResourcesIds' :: (Array  Int) -> ApiEff (Either ApiError ResourcePackResponses)
getResourcePacks_ByResourcesIds' _ByResourcesIds = handleError <$> getAt [ByResourcesIds _ByResourcesIds] ["resource_packs"]

getResourcePack :: forall qp. QueryParam qp => Array qp -> Int -> ApiEff (Either ApiError ResourcePackResponse)
getResourcePack params resource_id = handleError <$> getAt params ["resource_pack", show resource_id]

getResourcePack' :: Int -> ApiEff (Either ApiError ResourcePackResponse)
getResourcePack' resource_id = handleError <$> getAt ([] :: Array Boolean) ["resource_pack", show resource_id]

getLeuronPacks :: forall qp. QueryParam qp => Array qp -> ApiEff (Either ApiError LeuronPackResponses)
getLeuronPacks params = handleError <$> getAt params ["leuron_packs"]

getLeuronPacks' :: ApiEff (Either ApiError LeuronPackResponses)
getLeuronPacks'  = handleError <$> getAt ([] :: Array Boolean) ["leuron_packs"]

getLeuronPacks_ByLeuronsIds :: forall qp. QueryParam qp => Array qp -> (Array  Int) -> ApiEff (Either ApiError LeuronPackResponses)
getLeuronPacks_ByLeuronsIds params _ByLeuronsIds = handleError <$> getAt (map qp params ++ map qp [ByLeuronsIds _ByLeuronsIds]) ["leuron_packs"]

getLeuronPacks_ByLeuronsIds' :: (Array  Int) -> ApiEff (Either ApiError LeuronPackResponses)
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